"""Validate and render the write-up's standalone TikZ diagrams.

The editable sources live in figures/*.tex.  This script checks selected
artifact-backed values represented by those diagrams, compiles each source
with pdflatex, and rasterizes the resulting one-page PDF to a publication PNG.
"""

from __future__ import annotations

import argparse
import json
import os
import re
import shutil
import struct
import subprocess
import tempfile
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
FIGURES = ROOT / "figures"
DPI = 300
NAMES = (
    "extraction-pipeline",
    "cell-semantics",
    "protocol-and-unrolling",
    "solution-grid",
    "supports-and-covers",
    "streaming-checker",
    "verdict-and-message",
    "lowering-and-miter",
)


def require(condition: bool, message: str) -> None:
    if not condition:
        raise ValueError(message)


def read_json(relative_path: str) -> dict:
    path = ROOT / relative_path
    return json.loads(path.read_text(encoding="utf-8"))


def count_ir_ops(relative_path: str, prefix: str) -> int:
    text = (ROOT / relative_path).read_text(encoding="utf-8")
    return text.count('"%s.' % prefix)


def validate_artifact_facts() -> None:
    raw_bits = (ROOT / "work" / "solution_bits.txt").read_text(
        encoding="ascii").strip()
    require(re.fullmatch(r"[01]{129}", raw_bits) is not None,
            "solution_bits.txt must contain exactly 129 binary digits")
    require(raw_bits[121:] == "0" * 8,
            "solution_bits.txt must end in eight zero tail bits")
    key = raw_bits[:121]
    require(key.count("1") == 22,
            "the 121-bit key must contain exactly 22 stars")

    expected_stars = {
        7, 9, 11, 16, 29, 31, 33, 35, 48, 50, 57,
        63, 70, 76, 78, 83, 91, 98, 104, 107, 111, 113,
    }
    actual_stars = {index for index, bit in enumerate(key) if bit == "1"}
    require(actual_stars == expected_stars,
            "solution-grid.tex star coordinates no longer match the key")

    regions = read_json("work/regions.json")
    require(regions.get("schema") == "starbattle.regions.v1",
            "unexpected regions.json schema")
    require(regions.get("grid_size") == 11 and
            len(regions.get("regions", [])) == 11,
            "regions.json must describe eleven regions on an 11x11 grid")
    require(all(len(region["cells"]) > 0 for region in regions["regions"]),
            "regions.json contains an empty selected region")
    require(sorted(cell for region in regions["regions"]
                   for cell in region["cells"]) == list(range(121)),
            "selected regions must partition all 121 cells")

    provenance = regions["provenance"]
    cover = provenance["exact_cover"]
    selection = provenance["selection"]
    require((cover["connected_unique_support_count"],
             cover["candidate_count"]) == (35, 2),
            "support or exact-cover counts changed")
    require(selection["key_consulted_during_selection"] is False,
            "region-cover selection is no longer recorded as keyless")

    active = {
        item["state_id"]: item
        for item in provenance["probe"]["active_state_supports"]
    }
    require(len(active) == 43, "active support count changed")
    for region_index, state_id in ((0, 8219), (4, 2542), (10, 8095)):
        require(active[state_id]["cells"] ==
                regions["regions"][region_index]["cells"],
                "representative support mask changed")

    evidence = read_json("work/ind1_evidence.json")
    validation = evidence["translation_validation"]
    require((validation["variables"], validation["results"],
             validation["result"]) == (96, 101, "unsat"),
            "translation-miter values changed")
    require(count_ir_ops("work/puzzle_sky130.mlir", "sky130") == 729,
            "SKY130 IR operation count changed")
    require(count_ir_ops("work/puzzle_silicon.mlir", "silicon") == 1541,
            "Silicon IR operation count changed")
    require(len(evidence["design_contract"]["state_ids"]) == 92,
            "checked state count changed")
    require(evidence["fixtures"]["negative_contracts"] == 19,
            "negative contract count changed")
    require(evidence["fixtures"]["generated_micro_netlists"] == 10 and
            evidence["fixtures"]["generated_micro_transitions"] == 1280,
            "generated micro-netlist evidence changed")

    netlist = read_json("work/netlist.json")
    require(len(netlist.get("cells", [])) == 728,
            "checked functional-cell count changed")
    require(any(cell.get("cell") == "a21bo_2"
                for cell in netlist["cells"]),
            "checked netlist has no a21bo_2 cell")

    manifest = read_json("models/cells.json")
    a21bo = manifest.get("models", manifest).get("a21bo")
    expected_a21bo_gates = [
        ["nand", "nand0_out", ["A2", "A1"]],
        ["nand", "nand1_out_X", ["B1_N", "nand0_out"]],
        ["buf", "X", ["nand1_out_X"]],
    ]
    require(a21bo is not None and a21bo.get("gates") == expected_a21bo_gates,
            "serialized a21bo primitive graph changed")

    mutation_score = evidence["mutation_score"]
    require((mutation_score["structural_mutations_rejected"],
             mutation_score["semantic_sat_counterexamples"]) == (16, 5),
            "mutation evidence changed")

    source_checks = {
        "extraction-pipeline": ("33{,}323", "16{,}255", "17{,}068",
                                "14{,}452", "2{,}616", "8{,}221",
                                "728", "$729$ project-local"),
        "cell-semantics": ("a21bo\\_2",
                           "operatorname{nand}(\\texttt{A2},\\texttt{A1})",
                           "operatorname{nand}(\\texttt{B1\\_N},n_1)",
                           "operatorname{buf}(n_2)",
                           "(\\texttt{A1},\\texttt{A2},\\texttt{B1\\_N})=(0,0,0)",
                           "(n_1,n_2,\\texttt{X})=(1,1,1)",
                           "(\\texttt{A1},\\texttt{A2},\\texttt{B1\\_N})=(0,0,1)",
                           "(n_1,n_2,\\texttt{X})=(1,0,0)"),
        "protocol-and-unrolling": ("121\\times", "S_{122}",
                                    "low after initial settle",
                                    "first disabled"),
        "solution-grid": ("22 stars total", "8/1,10/1", "2/11,4/11"),
        "supports-and-covers": ("$43$ nonempty", "$35$ connected",
                                "unique supports", "$2$ exact", "key not used"),
        "streaming-checker": ("t-1", "t-10", "t-11", "t-12",
                               "H_1,H_{10},H_{11},H_{12}",
                               "mathtt{touch\\_error}",
                               "q_{\\rm row}", "C_j=01", "R_k=01",
                               "c\\ne0", "c\\ne10",
                               "mathtt{row\\_error}", "mathtt{complete}=1",
                               "mathtt{message\\_active}=0",
                               "(00010110)_2", "no shared overflow latch",
                               "no general \\texttt{X}/\\texttt{Z}"),
        "verdict-and-message": ("(q_{235},q_{236},q_{234},q_{237})",
                                 "\\messagestate{15}", "1111", "NUL"),
        "lowering-and-miter": ("729-op project-local", "1,541-op",
                                "\\textbf{101} pairwise XORs", "96"),
    }
    for name, snippets in source_checks.items():
        text = (FIGURES / (name + ".tex")).read_text(encoding="ascii")
        for snippet in snippets:
            require(snippet in text,
                    "%s.tex is missing checked text: %s" % (name, snippet))

    cell_text = (FIGURES / "cell-semantics.tex").read_text(encoding="ascii")
    require("\\textbf{NOR}" not in cell_text and
            "\\textbf{INV}" not in cell_text,
            "cell-semantics.tex contains the wrong a21bo primitive graph")

    checker_text = (FIGURES / "streaming-checker.tex").read_text(
        encoding="ascii")
    for stale_offset in ("t-34", "t-80"):
        require(stale_offset not in checker_text,
                "streaming-checker.tex contains a nonexistent history offset")
    solution_text = (FIGURES / "solution-grid.tex").read_text(encoding="ascii")
    star_block = re.search(
        r"Exact row-major placement.*?\\foreach \\c/\\r in \{(.*?)\}\s*\{",
        solution_text,
        flags=re.DOTALL,
    )
    require(star_block is not None,
            "could not parse solution-grid.tex star coordinates")
    tex_stars = {
        (int(row) - 1) * 11 + int(column) - 1
        for column, row in re.findall(r"(\d+)/(\d+)", star_block.group(1))
    }
    require(tex_stars == actual_stars,
            "solution-grid.tex does not contain the canonical 22 stars")
    require("draw[region boundary]" not in solution_text.lower(),
            "solution-grid.tex reveals region boundaries before recovery")

    support_text = (FIGURES / "supports-and-covers.tex").read_text(
        encoding="ascii")
    tex_masks = [
        [int(value) for value in raw.split(",")]
        for raw in re.findall(
            r"\\supportprint\{[^{}]+\}\{([0-9,]+)\}", support_text)
    ]
    expected_masks = [active[state_id]["cells"]
                      for state_id in (8219, 2542, 8095)]
    require(tex_masks == expected_masks,
            "supports-and-covers.tex representative masks changed")
    region_matches = re.findall(
        r"\\paintcells\{([A-K])\}\{([0-9,]+)\}\{[^{}]+\}", support_text)
    tex_regions = {
        letter: [int(value) for value in raw.split(",")]
        for letter, raw in region_matches
    }
    expected_regions = {
        letter: region["cells"]
        for letter, region in zip(regions["region_letters"], regions["regions"])
    }
    require(tex_regions == expected_regions,
            "supports-and-covers.tex selected cover changed")

    verdict_text = (FIGURES / "verdict-and-message.tex").read_text(
        encoding="ascii")
    tuple_matches = re.findall(
        r"\\messagestate\{(\d+)\}\{[^{}]+\}\{[^{}]+\}\{([01]{4})\}",
        verdict_text,
    )
    parsed_tuples = [None] * 16
    for raw_index, raw_bits_tuple in tuple_matches:
        index = int(raw_index)
        if index < len(parsed_tuples):
            parsed_tuples[index] = tuple(int(bit) for bit in raw_bits_tuple)
    expected_tuples = [
        (index & 1, (index >> 1) & 1, (index >> 2) & 1,
         (index >> 3) & 1)
        for index in range(16)
    ]
    require(parsed_tuples == expected_tuples,
            "verdict-and-message.tex tuple sequence changed")

    writeup = (ROOT / "writeup.md").read_text(encoding="utf-8")
    image_pairs = re.findall(r"!\[([^]]*)\]\(([^)]+)\)", writeup)
    image_refs = [path for _alt, path in image_pairs]
    require(len(image_refs) == 9 and
            all(not path.lower().endswith(".svg") for path in image_refs),
            "writeup.md must contain nine non-SVG image references")
    alt_by_path = {path: alt for alt, path in image_pairs}
    expected_alt_fragments = {
        "figures/extraction-pipeline.png": "checked cut census",
        "figures/cell-semantics.png": "pinned primitive graph",
        "figures/solution-grid.png": "accepted 121-bit stream",
    }
    for path, fragment in expected_alt_fragments.items():
        require(fragment in alt_by_path.get(path, "").lower(),
                "writeup.md has stale alt text for " + path)
    caption_fragments = (
        "*Figure 2. The extraction pipeline resolves datatype-44 cut ownership",
        "*Figure 3. A recovered strength-qualified cell maps to a pinned base wrapper.",
        "Region boundaries are still absent.",
    )
    normalized_writeup = re.sub(r"\s+", " ", writeup)
    require(all(fragment in normalized_writeup
                for fragment in caption_fragments),
            "writeup.md figure captions no longer match the diagrams")
    require(not list(FIGURES.glob("*.svg")),
            "figures/ still contains an SVG asset")


def tool(name: str) -> str:
    executable = shutil.which(name)
    if executable is None:
        raise RuntimeError("required figure-rendering tool not found: " + name)
    return executable


def png_dimensions(path: Path) -> tuple[int, int]:
    header = path.read_bytes()[:24]
    require(header[:8] == b"\x89PNG\r\n\x1a\n" and
            header[12:16] == b"IHDR",
            "%s is not a valid PNG" % path)
    return struct.unpack(">II", header[16:24])


def run(command: list[str], env: dict[str, str] | None = None) -> str:
    result = subprocess.run(
        command,
        cwd=ROOT,
        env=env,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        text=True,
        check=False,
    )
    if result.returncode:
        raise RuntimeError("command failed:\n%s\n\n%s" %
                           (subprocess.list2cmdline(command), result.stdout))
    return result.stdout


def render_one(name: str, pdflatex: str, pdftoppm: str,
               temporary: Path, env: dict[str, str]) -> tuple[int, int]:
    source = FIGURES / (name + ".tex")
    require(source.is_file(), "missing TikZ source: %s" % source)

    latex_output = run([
        pdflatex,
        "--disable-installer",
        "-interaction=nonstopmode",
        "-halt-on-error",
        "-file-line-error",
        "-output-directory=" + str(temporary),
        str(source.relative_to(ROOT)),
    ], env=env)
    bad_diagnostics = ("Overfull \\hbox", "Overfull \\vbox")
    require(not any(item in latex_output for item in bad_diagnostics),
            "%s.tex produced an overfull box" % name)

    pdf = temporary / (name + ".pdf")
    output_prefix = temporary / name
    run([
        pdftoppm,
        "-png",
        "-singlefile",
        "-r",
        str(DPI),
        str(pdf),
        str(output_prefix),
    ], env=env)
    rendered = output_prefix.with_suffix(".png")
    destination = FIGURES / (name + ".png")
    os.replace(rendered, destination)
    return png_dimensions(destination)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--validate-only",
        action="store_true",
        help="check artifact-backed figure facts without writing PNGs",
    )
    args = parser.parse_args()

    validate_artifact_facts()
    if args.validate_only:
        print("validated artifact-backed figure facts")
        return

    pdflatex = tool("pdflatex")
    pdftoppm = tool("pdftoppm")
    env = os.environ.copy()
    env["SOURCE_DATE_EPOCH"] = "1787616000"
    env["FORCE_SOURCE_DATE"] = "1"

    with tempfile.TemporaryDirectory(prefix="asic-puzzle-figures-") as raw:
        temporary = Path(raw)
        for name in NAMES:
            width, height = render_one(
                name, pdflatex, pdftoppm, temporary, env)
            print("wrote figures/%s.png (%dx%d)" % (name, width, height))


if __name__ == "__main__":
    main()
