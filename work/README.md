# Work Artifacts

This directory keeps the reproducible solve artifacts.

## Main Entry Point

- `verify.py` runs the complete submission verification gate.

## Source Layout

- `extraction/` extracts GDS connectivity and constructs checked netlists.
- `pipeline/` compiles the checked netlist and simulates the protocol.
- `verification/` contains the lowering, simulation, uniqueness, and puzzle
  checks.
- `tests/` contains recovered-artifact regression tests.
- `figures/` validates and regenerates the write-up figures.

## Checked Data

- `netlist.json` is the checked compiler input.
- `puzzle_sky130.mlir` and `puzzle_silicon.mlir` are the main serialized IRs.
- `ind1_evidence.json` and `puzzle_evidence.json` are checked evidence reports.
- `regions.json` is the recovered region artifact.
- `solution_bits.txt` is the accepted bit stream used by the checks.

## Support Outputs

- `generated/verilog/` contains non-canonical generated Verilog snapshots.
- `generated/roundtrip/` contains non-canonical parser and roundtrip MLIR
  snapshots.

Python caches, LaTeX build directories, preview copies, `.vvp` blobs, and large
raw pickle scratch files are intentionally omitted from the submission copy.
