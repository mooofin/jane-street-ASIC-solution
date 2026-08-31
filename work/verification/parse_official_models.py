"""Parse official SkyWater functional Verilog files into evaluatable models."""
import re, os
from collections import defaultdict

_REPO = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
CELLS_DIR = os.path.join(_REPO, 'refs', 'sky130_models', 'cells')

import z3

def _AND(a):
    r = a[0]
    for x in a[1:]: r = r & x
    return r
def _OR(a):
    r = a[0]
    for x in a[1:]: r = r | x
    return r
def _XOR(a):
    r = a[0]
    for x in a[1:]: r = r ^ x
    return r
def _NOT(x):
    if isinstance(x, int): return 1 - x
    return z3.Not(x)

PRIMS = {
    'and': _AND,
    'or': _OR,
    'nand': lambda a: _NOT(_AND(a)),
    'nor': lambda a: _NOT(_OR(a)),
    'xor': _XOR,
    'xnor': lambda a: _NOT(_XOR(a)),
    'not': lambda a: _NOT(a[0]),
    'buf': lambda a: a[0],
    'udp_mux': lambda a: z3.If(a[2], a[1], a[0]) if not isinstance(a[2], int) else (a[1] if a[2] else a[0]),
}

def parse_cell(path):
    """returns (ports_out, ports_in, gates) where gates = [(prim, out, [ins])]"""
    txt = open(path, encoding='utf-8').read()
    body = txt[txt.index('module '):]
    # strip comments
    body = re.sub(r'/\*.*?\*/', '', body, flags=re.S)
    body = re.sub(r'//[^\n]*', '', body)
    outs, ins = [], []
    for m in re.finditer(r'\b(output|input)\s+(\w+)\s*;', body):
        (outs if m.group(1) == 'output' else ins).append(m.group(2))
    gates = []
    # gate primitives
    for m in re.finditer(r'\b(and|or|nand|nor|xor|xnor|not|buf)\s+(\w+)\s*\(([^)]*)\)', body, re.S):
        prim, name, args = m.group(1), m.group(2), m.group(3)
        args = [a.strip() for a in args.split(',') if a.strip()]
        gates.append((prim, args[0], args[1:]))
    # UDP instances (e.g. mux)
    for m in re.finditer(r'sky130_fd_sc_hd__udp_(\w+)[^(\n]*\w+\s*\(([^)]*)\)', body, re.S):
        udp, args = m.group(1), m.group(2)
        args = [a.strip() for a in args.split(',') if a.strip()]
        if udp == 'mux_2to1':
            gates.append(('udp_mux', args[0], args[1:]))   # (out, A0, A1, S)
    return outs, ins, gates

class CellModel:
    def __init__(self, name, outs, ins, gates):
        self.name = name
        self.outs = outs
        self.ins = ins
        self.gates = gates
        # evaluation order via simple dependency resolution
        self.order = []
        done = set(ins)
        pending = list(gates)
        while pending:
            prog = False
            rem = []
            for g in pending:
                if all(w in done for w in g[2]):
                    self.order.append(g)
                    done.add(g[1]); prog = True
                else:
                    rem.append(g)
            pending = rem
            if not prog:
                raise RuntimeError('unresolvable gates in %s' % name)

    def eval(self, inputs):
        val = dict(inputs)
        for prim, out, ins_ in self.order:
            val[out] = PRIMS[prim]([val[w] for w in ins_])
        return {o: val[o] for o in self.outs}

def load_all():
    models = {}
    for f in sorted(os.listdir(CELLS_DIR)):
        if not f.endswith('.functional.v'): continue
        base = re.sub(r'^sky130_fd_sc_hd__|\.functional\.v$', '', f)
        outs, ins, gates = parse_cell(os.path.join(CELLS_DIR, f))
        if base in ('dfrtp', 'dfstp', 'dfxtp'):
            models[base] = ('FF', base)     # handled by Sim via UDP semantics
            continue
        if base == 'conb':
            models[base] = ('CONST', {'HI': 1, 'LO': 0})
            continue
        models[base] = CellModel(base, outs, ins, gates)
    return models

if __name__ == '__main__':
    ms = load_all()
    print('loaded', len(ms), 'cell models')
    m = ms['and4bb']
    print('and4bb ins:', m.ins, '-> X =', m.eval({'A_N': 0, 'B_N': 1, 'C': 1, 'D': 1})['X'])
    m = ms['mux2']
    print('mux2 S=1:', m.eval({'A0': 0, 'A1': 1, 'S': 1})['X'], ' S=0:', m.eval({'A0': 0, 'A1': 1, 'S': 0})['X'])
