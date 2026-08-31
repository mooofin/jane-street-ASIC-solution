import pickle, json
from collections import defaultdict

d = pickle.load(open('work/netlist_raw.pkl','rb'))
insts, pin_nets, io_nets = d['insts'], d['pin_nets'], d['io_nets']

IGNORE = {'sky130_fd_sc_hd__decap_3','sky130_fd_sc_hd__tapvpwrvgnd_1',
          'sky130_fd_sc_hd__diode_2','INTERNAL_3','INTERNAL_7'}
OUTPIN = {'X','Y','Q','HI','LO'}
PWR = {'VPWR':1,'VGND':0,'VPB':None,'VNB':None}

cells_out = []
for iid, t in enumerate(insts):
    cn = t['cell']
    if cn in IGNORE or not cn.startswith('sky130'):
        continue
    conns = {}
    for pn, net in pin_nets.get(iid, {}).items():
        if pn in PWR: continue
        if net is None: continue
        conns[pn] = int(net)
    cells_out.append({'id': iid, 'cell': cn.replace('sky130_fd_sc_hd__',''), 'conns': conns})

# net user census
uses = defaultdict(lambda: {'drv': [], 'use': []})
for c in cells_out:
    for pn, net in c['conns'].items():
        if pn in OUTPIN: uses[net]['drv'].append((c['id'], c['cell'], pn))
        else: uses[net]['use'].append((c['id'], c['cell'], pn))

top_in = {}
top_out = {}
for name, net in io_nets.items():
    if name in ('VGND','VPWR'): continue
    net = int(net)
    top_in.setdefault(name, net)
    uses[net].setdefault('is_io', []).append(name)

consts = {}   # net -> 0/1 from conb_1
for c in cells_out:
    if c['cell'] == 'conb_1':
        for pn, net in c['conns'].items():
            if pn == 'HI': consts[net] = 1
            elif pn == 'LO': consts[net] = 0

# power ties: nets whose component carries VPWR/VGND pins of some instance
pwr_of_net = {}
for iid, pd in pin_nets.items():
    for pn, net in pd.items():
        if pn == 'VPWR': pwr_of_net[int(net)] = 1
        elif pn == 'VGND': pwr_of_net[int(net)] = 0

undriven = []
for net, u in uses.items():
    if u['drv']: continue
    if net in consts: continue
    ionames = u.get('is_io', [])
    if any(n in ('I','clk','enable','rst_n') for n in ionames): continue
    if net in pwr_of_net:
        consts[net] = pwr_of_net[net]   # tied to power/ground rail
        continue
    undriven.append((net, u))

print('cells:', len(cells_out), 'nets:', len(uses), 'consts:', len(consts))
print('UNDRIVEN non-IO nets:', len(undriven))
for n,u in undriven[:10]:
    print(' ', n, u['use'][:4], u.get('is_io'))

ffs = [c for c in cells_out if c['cell'].startswith('df')]
muxes = [c for c in cells_out if c['cell']=='mux2_1']
print('FFs:', len(ffs), [c['cell'] for c in ffs][:5], '...')
from collections import Counter
print('cell histogram:', Counter(c['cell'] for c in cells_out).most_common(15))

out = {
  'schema': 'silicon-lift.netlist.v1',
  'module': 'puzzle',
  'profile': 'IND-1',
  'clock': {'port': 'clk', 'edge': 'posedge'},
  'inputs': ({n:int(io_nets[n]) for n in ('I','clk','enable','rst_n')} |
             {'undriven_%d' % n: int(n) for n, _u in undriven}),
  'outputs': {n:int(io_nets[n]) for n in ['success']+['O[%d]'%i for i in range(8)]},
  'consts': consts,
  'cells': cells_out,
}
with open('work/netlist.json', 'w', encoding='utf-8', newline='\n') as handle:
    json.dump(out, handle, indent=1)
    handle.write('\n')
print('saved work/netlist.json')
