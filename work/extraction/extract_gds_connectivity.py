import gdstk, pickle
from collections import defaultdict
from shapely.geometry import Polygon as SPoly
from shapely.strtree import STRtree

lib = gdstk.read_gds('puzzle.gds')
top = lib.top_level()[0]
cells = {c.name: c for c in lib.cells}

insts = []
for r in top.references:
    insts.append(dict(cell=r.cell.name, x=r.origin[0], y=r.origin[1],
                      rot=r.rotation or 0.0, refl=bool(r.x_reflection),
                      mag=r.magnification or 1.0))

def xf(p, t):
    q = p.copy()
    q.transform(t['mag'], t['refl'], t['rot'], (t['x'], t['y']))
    return q

shapes, meta, via_groups, inst_abut_groups = [], [], [], []
for iid, t in enumerate(insts):
    cn = t['cell']
    if cn.startswith('sky130'):
        c = cells[cn]
        # internal cell routing (dt20) and implicit contact CUTS (dt44).
        # NOTE: datatype 44 must be checked FIRST — 67/44 is MCON, 68/44 is VIA1.
        inst_shape_ids = []
        for p in c.polygons:
            if p.datatype == 44 and 67 <= p.layer <= 72:
                shapes.append(('cut%d' % p.layer, xf(p, t))); meta.append(('conn',))
            elif p.layer in (67, 68) and p.datatype == 20:
                shapes.append((p.layer, xf(p, t))); meta.append(('conn',))
                inst_shape_ids.append(len(shapes)-1)
        # intra-instance same-layer ABUTMENT merge: shapes drawn by the same cell
        # that touch (even with zero-area edge contact) are the same net.
        byl = defaultdict(list)
        for i in inst_shape_ids:
            byl[shapes[i][0]].append(i)
        for lay, idxs in byl.items():
            inst_abut_groups.append(idxs)
        pinpolys = [p for p in c.polygons if p.datatype == 16 and p.layer in (67,68)]
        bbs = [p.bounding_box() for p in pinpolys]
        assigned = set()
        for l in c.labels:
            if l.texttype != 5 or l.layer not in (67,68): continue
            ox, oy = l.origin
            for p, bb in zip(pinpolys, bbs):
                if bb[0][0]-1e-6 <= ox <= bb[1][0]+1e-6 and bb[0][1]-1e-6 <= oy <= bb[1][1]+1e-6 and id(p) not in assigned:
                    shapes.append((p.layer, xf(p, t))); meta.append(('pin', iid, l.text)); assigned.add(id(p))
    elif cn.startswith('VIA'):
        start=len(shapes)
        for p in cells[cn].polygons:
            if p.datatype == 20 and 64 <= p.layer <= 72:
                shapes.append((p.layer, xf(p, t))); meta.append(('conn',))
        via_groups.append(list(range(start,len(shapes))))
for p in top.paths:
    for pl in p.to_polygons():
        shapes.append((p.layers[0], pl)); meta.append(('conn',))
for p in top.polygons:
    if 67 <= p.layer <= 72 and p.datatype == 20:
        shapes.append((p.layer, p)); meta.append(('conn',))
print('shapes:', len(shapes))

sps, by_layer = {}, defaultdict(list)
for i,(lay,poly) in enumerate(shapes):
    sp = SPoly([(x,y) for x,y in poly.points])
    if not sp.is_valid: sp = sp.buffer(0)
    sps[i] = sp; by_layer[lay].append(i)

parent = list(range(len(shapes)))
def find(a):
    r=a
    while parent[r]!=r: r=parent[r]
    while parent[a]!=r: parent[a],a=r,parent[a]
    return r
def union(a,b):
    ra,rb=find(a),find(b)
    if ra!=rb: parent[ra]=rb

EPS=1e-9
nbrs=defaultdict(set)
for grp in via_groups:
    for k in grp[1:]:
        union(grp[0],k)
# intra-instance same-layer abutment (zero-area edge contact = same net inside a cell)
for idxs in inst_abut_groups:
    geoms=[sps[i] for i in idxs]; tr=STRtree(geoms)
    for i in idxs:
        for h in tr.query(sps[i]):
            j=idxs[h]
            if j!=i and sps[i].intersection(sps[j]).length>0:
                union(i,j)
# implicit in-cell cuts: key 'cutL' bridges layers L and L+1 through overlap with the cut
cut_idx=[]
for k,(lay,poly) in enumerate(shapes):
    if isinstance(lay,str) and lay.startswith('cut'):
        cut_idx.append((k,int(lay[3:])))
normal_layers=defaultdict(list)
for i,(lay,poly) in enumerate(shapes):
    if not isinstance(lay,str):
        normal_layers[lay].append(i)

def merge_layer(idxs):
    geoms=[sps[i] for i in idxs]; tree=STRtree(geoms)
    for i in idxs:
        for h in tree.query(sps[i]):
            j=idxs[h]
            if j!=i and sps[i].intersection(sps[j]).area>EPS:
                union(i,j); nbrs[i].add(j); nbrs[j].add(i)

for lay,idxs in normal_layers.items():
    merge_layer(idxs)
# cut landing diagnostics (Codex spec): per cut layer, count total/bridged/
# missing-lower/missing-upper/missing-both — using STRtree per layer
trees = {lay: STRtree([sps[i] for i in idxs]) for lay, idxs in normal_layers.items()}
tidx = dict(normal_layers)
cut_stats = defaultdict(lambda: dict(total=0, bridged=0, miss_lo=0, miss_hi=0, miss_both=0))
for ci,L in cut_idx:
    st = cut_stats['L%d->L%d' % (L, L+1)]
    st['total'] += 1
    lo = hi = False
    for lay, flag in ((L,'lo'), (L+1,'hi')):
        if lay not in trees: continue
        for h in trees[lay].query(sps[ci]):
            j = tidx[lay][h]
            if sps[ci].intersection(sps[j]).area > EPS:
                union(ci,j); nbrs[ci].add(j); nbrs[j].add(ci)
                if flag=='lo': lo=True
                else: hi=True
    if lo and hi: st['bridged'] += 1
    elif not lo and not hi: st['miss_both'] += 1
    elif not lo: st['miss_lo'] += 1
    else: st['miss_hi'] += 1
for k in sorted(cut_stats):
    print('CUTS', k, cut_stats[k])
comps=defaultdict(list)
for i in range(len(shapes)): comps[find(i)].append(i)
print('nets:', len(comps))

comp_pins={}
def get_comp_pins(r):
    if r not in comp_pins:
        comp_pins[r]={(meta[i][1],meta[i][2]) for i in comps[r] if meta[i][0]=='pin'}
    return comp_pins[r]

pin_comps=defaultdict(lambda: defaultdict(set))
for i,m in enumerate(meta):
    if m[0]=='pin': pin_comps[m[1]][m[2]].add(find(i))

# classify pins
dangling=0
conflicted=[]
pin_nets={}
for iid,pd in pin_comps.items():
    pin_nets[iid]={}
    for pn,roots in pd.items():
        live=set()
        for r in roots:
            cp=get_comp_pins(r)
            if cp=={(iid,pn)} and len(comps[r])==1:
                dangling+=1          # lone unconnected pin square
                continue
            live.add(r)
        if len(live)>1:
            conflicted.append((iid,pn,live))
            pin_nets[iid][pn]=max(live,key=lambda r:len(comps[r]))
        elif live:
            pin_nets[iid][pn]=next(iter(live))
        else:
            pin_nets[iid][pn]=None
print('dangling dropped:', dangling, 'conflicted:', len(conflicted))

# surgical resolution: merge roots connected through touch-only paths avoiding foreign-pin comps
dbg_conf = []
resolved=0
unresolved=[]
for iid,pn,roots in sorted(conflicted):
    dbg_conf.append((iid,pn,[(r, [(shapes[i][0], shapes[i][1].bounding_box()) for i in comps[r]]) for r in roots]))
    key={(iid,pn)}
    regions=[]
    for r in roots:
        stack=[r]; seen={r}
        while stack:
            cur=stack.pop()
            if get_comp_pins(cur)-key: continue  # blocked: foreign pins
            for s in comps[cur]:
                for nb in nbrs[s]:
                    rr=find(nb)
                    if rr not in seen:
                        seen.add(rr); stack.append(rr)
        # trim: keep only comps reachable without entering foreign territory
        good=set()
        for r2 in seen:
            if not (get_comp_pins(r2)-key): good.add(r2)
        regions.append(frozenset(good))
    # merge overlapping regions
    merged=[]
    for g in regions:
        hit=[m for m in merged if m & g]
        g2=frozenset(set().union(*hit)|g) if hit else g
        for h in hit: merged.remove(h)
        merged.append(g2)
    if len(merged)==1:
        resolved+=1
        tgt=next(iter(merged))
        for iid2,pd2 in pin_nets.items(): pass
        pin_nets[iid][pn]=tgt
        # also reassign other instances' pins living in absorbed roots? absorbed roots only had our pin
    else:
        unresolved.append((iid,pn,[sorted(len(comps[r]) for r in g) for g in merged]))
print('surgically resolved:', resolved, '/', len(conflicted))
for u in unresolved[:30]: print(' UNRESOLVED', insts[u[0]]['cell'], u[1], u[2])

# top-level IO label -> net
io_nets = {}
from shapely.geometry import Point
for l in top.labels:
    if l.texttype != 5: continue
    pt = Point(l.origin)
    best=None
    for i in by_layer.get(l.layer, []):
        b=sps[i].bounds
        if b[0]-0.6<=l.origin[0]<=b[2]+0.6 and b[1]-0.6<=l.origin[1]<=b[3]+0.6 and sps[i].distance(pt)<0.6:
            best=find(i); break
    if best is not None: io_nets[l.text]=best
print('IO:', {k:v for k,v in sorted(io_nets.items())})

with open('work/netlist_raw.pkl','wb') as f:
    pickle.dump(dict(insts=insts, pin_nets={k:dict(v) for k,v in pin_nets.items()},
                     comps={k:v for k,v in comps.items()}, nshapes=len(shapes),
                     dbg_conf=dbg_conf, io_nets=io_nets), f)
print('saved.')
