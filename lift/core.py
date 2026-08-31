"""This is a MLIR-inspired textual-IR core for silicon-lifting to solve the jane street challenge 

The parser gets the syntax emitted by this
repo. 

For thay we need the module to be able to parse the syntax and generate the corresponding IR. 


Dialect-level operations verification lives in :mod:`lift.verify`. 
TODO add a lean verification baked into the compiler itself

Supported grammar (subset):

    // comment ur operation here for the dialect
    module {
      func.func @name(%a: i1, %b: i1) -> (i1, i1) {
        %x = "dialect.op"(%a, %b) {k = v, s = "str"} : (i1, i1) -> i1
        "dialect.meta"() {profile = "IND-1"} : () -> ()
        %y = "dialect.op"() : () -> i1
        return %x, %y : i1, i1
      }
    }
"""

import json
import re
from dataclasses import dataclass, field


class ParseError(ValueError):
    

    code = 'E_PARSE_INCOMPLETE'
    severity = 'error'

    def __init__(self, message):
        self.message = message
        super().__init__('%s: %s' % (self.code, message))

    def as_dict(self):
        return {'code': self.code, 'message': self.message,
                'severity': self.severity}


# ---------------------------------------------------------------------------
# IR data structures
# ---------------------------------------------------------------------------

@dataclass
class Op:
    #  results = "opname"(operands) {attrs} : sig
    name: str                       # e.g. 'sky130.nand2'  (without quotes)
    operands: list                  # SSA value names, without '%'
    attrs_raw: str                  # raw attribute-dict text ('' if none)
    sig: str                        # raw signature text, e.g. '(i1, i1) -> i1'
    results: list                   # result value names, without '%'
    loc: int = -1                   # source line for diagnostics

    def __eq__(self, other):
        return (isinstance(other, Op)
                and self.name == other.name
                and self.operands == other.operands
                and self.attrs_raw == other.attrs_raw
                and self.sig == other.sig
                and self.results == other.results)

    def __hash__(self):
        return hash((self.name, tuple(self.operands), self.attrs_raw,
                     self.sig, tuple(self.results)))


@dataclass
class ReturnOp:
    #  func.return with optional type suffix.
    operands: list
    types_raw: str = ''             
    loc: int = -1

    def __eq__(self, other):
        return (isinstance(other, ReturnOp)
                and self.operands == other.operands
                and self.types_raw == other.types_raw)


@dataclass
class Func:
    name: str
    args: list                      # [(name, type_str)]
    ret_types: list                 # [type_str]
    body: list                      # list[Op | ReturnOp]
    loc: int = -1

    def __eq__(self, other):
        return (isinstance(other, Func)
                and self.name == other.name
                and self.args == other.args
                and self.ret_types == other.ret_types
                and self.body == other.body)


@dataclass
class Module:
    funcs: dict = field(default_factory=dict)   # name -> Func
    order: list = field(default_factory=list)   # func names in source order

    def __eq__(self, other):
        return (isinstance(other, Module)
                and self.order == other.order
                and all(self.funcs[f] == other.funcs[f] for f in self.order))


# /////////
# shitty Parser  /  
# /////////

_FUNC_RE = re.compile(
    r'^\s*func\.func\s+@(?P<name>[A-Za-z0-9_]+)\s*'
    r'\((?P<args>[^)]*)\)\s*->\s*\((?P<returns>[^)]*)\)\s*\{\s*$')
_ARG_RE = re.compile(r'^%([A-Za-z0-9_]+)\s*:\s*([^,()]+)$')
_VALUE_RE = re.compile(r'^%([A-Za-z0-9_]+)$')
_OP_RE = re.compile(
    r'^\s*(?:(?P<results>%[A-Za-z0-9_]+(?:\s*,\s*%[A-Za-z0-9_]+)*)\s*=\s*)?'
    r'"(?P<name>[^"]+)"'
    r'\s*\((?P<operands>[^)]*)\)'
    r'(?:\s*\{(?P<attrs>[^}]*)\})?'
    r'\s*:\s*(?P<sig>.+?)\s*$')
_RETURN_RE = re.compile(
    r'^\s*return\b(?P<rest>.*)$')


def _split_top(s, sep=','):
    #Split on `sep` at nesting depth zero 
    parts, depth, cur, i = [], 0, '', 0
    in_str = False
    while i < len(s):
        ch = s[i]
        if in_str:
            cur += ch
            if ch == '"':
                in_str = False
        else:
            if ch == '"':
                in_str = True; cur += ch
            elif ch in '([{': depth += 1; cur += ch
            elif ch in ')]}': depth -= 1; cur += ch
            elif ch == sep and depth == 0:
                parts.append(cur.strip()); cur = ''
            else:
                cur += ch
        i += 1
    if cur.strip(): parts.append(cur.strip())
    return parts


def parse_attrs(raw):
    #
    #Return a mapping of attribute names to values. Values are strings, ints, or
    
    attrs = {}
    if not raw.strip():
        return attrs
    for part in _split_top(raw):
        if '=' not in part:
            raise ValueError('malformed attribute: %r' % part)
        key, value = (x.strip() for x in part.split('=', 1))
        if not re.fullmatch(r'[A-Za-z_][A-Za-z0-9_]*', key):
            raise ValueError('invalid attribute name: %r' % key)
        if key in attrs:
            raise ValueError('duplicate attribute: %s' % key)
        if value.startswith('"'):
            try:
                parsed = json.loads(value)
            except json.JSONDecodeError as exc:
                raise ValueError('invalid quoted attribute %s: %s' %
                                 (key, exc)) from exc
            if not isinstance(parsed, str):
                raise ValueError('attribute %s must be a string' % key)
        elif value in ('true', 'false'):
            parsed = value == 'true'
        elif re.fullmatch(r'-?[0-9]+', value):
            parsed = int(value)
        else:
            raise ValueError('unsupported attribute value for %s: %r' %
                             (key, value))
        attrs[key] = parsed
    return attrs


def format_attrs(attrs):
    # have a return because for a deterministic mapping 
  
    parts = []
    for key in sorted(attrs):
        value = attrs[key]
        if isinstance(value, bool):
            text = 'true' if value else 'false'
        elif isinstance(value, int):
            text = str(value)
        elif isinstance(value, str):
            text = json.dumps(value, ensure_ascii=True)
        else:
            raise TypeError('unsupported attribute type for %s: %s' %
                            (key, type(value).__name__))
        parts.append('%s = %s' % (key, text))
    return ', '.join(parts)


def parse_signature(sig):
   # Parse ``(operand types) -> result types`` into two type lists (TODO fx bugs)
   
    if '->' not in sig:
        raise ValueError('signature has no ->: %r' % sig)
    lhs, rhs = (x.strip() for x in sig.split('->', 1))
    if not (lhs.startswith('(') and lhs.endswith(')')):
        raise ValueError('operand signature must be parenthesized: %r' % sig)
    operands = _split_top(lhs[1:-1]) if lhs[1:-1].strip() else []
    if rhs.startswith('('):
        if not rhs.endswith(')'):
            raise ValueError('unterminated result signature: %r' % sig)
        results = _split_top(rhs[1:-1]) if rhs[1:-1].strip() else []
    elif rhs:
        results = [rhs]
    else:
        raise ValueError('empty result signature: %r' % sig)
    return operands, results


def _strip_comment(line):
   
    out, in_str = '', False
    i = 0
    while i < len(line):
        ch = line[i]
        if in_str:
            out += ch
            if ch == '\\' and i + 1 < len(line):
                out += line[i+1]; i += 1
            elif ch == '"':
                in_str = False
        else:
            if ch == '"':
                in_str = True; out += ch
            elif ch == '/' and i + 1 < len(line) and line[i+1] == '/':
                break
            else:
                out += ch
        i += 1
    return out


def parse_mlir(text, source='<string>'):
    #Parse one complete module in the supported subset
    mod = Module()
    cur_func = None
    module_open = False
    module_closed = False

    for lineno, raw in enumerate(text.splitlines(), start=1):
        line = _strip_comment(raw).rstrip()
        stripped = line.strip()
        if not stripped or stripped.startswith('//'):
            continue

        if stripped == 'module {':
            if module_open or module_closed or cur_func is not None:
                raise ParseError('%s:%d: duplicate or nested module' %
                                 (source, lineno))
            module_open = True
            continue

        m = _FUNC_RE.match(line)
        if m:
            if not module_open or module_closed or cur_func is not None:
                raise ParseError('%s:%d: function outside module' %
                                 (source, lineno))
            fname = m.group('name')
            if fname in mod.funcs or fname in mod.order:
                raise ParseError('%s:%d: duplicate function @%s' %
                                 (source, lineno, fname))
            args = []
            for raw_arg in _split_top(m.group('args')):
                match = _ARG_RE.fullmatch(raw_arg)
                if match is None:
                    raise ParseError('%s:%d: malformed function argument: %r' %
                                     (source, lineno, raw_arg))
                args.append(('%' + match.group(1), match.group(2).strip()))
            ret_types = [item.strip() for item in
                         _split_top(m.group('returns'))]
            cur_func = Func(name=fname, args=args, ret_types=ret_types,
                            body=[], loc=lineno)
            continue

        if stripped == '}':
            if cur_func is not None:
                mod.funcs[cur_func.name] = cur_func
                mod.order.append(cur_func.name)
                cur_func = None
                continue
            if module_open and not module_closed:
                module_closed = True
                continue
            raise ParseError('%s:%d: unmatched closing brace' %
                             (source, lineno))

        if cur_func is None:
            raise ParseError('%s:%d: unexpected text outside function: %r' %
                             (source, lineno, stripped[:80]))

        rm = _RETURN_RE.match(line)
        if rm and not rm.group('rest').strip().startswith('='):
            rest = rm.group('rest').strip()
            ops_part, types_part = rest, ''
            if ':' in rest:
                idx = rest.rindex(':')
                ops_part = rest[:idx].strip()
                types_part = rest[idx+1:].strip()
            operands = []
            for raw_operand in _split_top(ops_part) if ops_part else []:
                match = _VALUE_RE.fullmatch(raw_operand.strip())
                if match is None:
                    raise ParseError('%s:%d: malformed return operand: %r' %
                                     (source, lineno, raw_operand))
                operands.append(match.group(1))
            cur_func.body.append(ReturnOp(operands=operands,
                                          types_raw=types_part, loc=lineno))
            continue

        om = _OP_RE.match(line)
        if om:
            results = ([r.strip().lstrip('%')
                        for r in om.group('results').split(',')]
                       if om.group('results') else [])
            operands = []
            for raw_operand in (_split_top(om.group('operands'))
                                if om.group('operands') else []):
                match = _VALUE_RE.fullmatch(raw_operand.strip())
                if match is None:
                    raise ParseError('%s:%d: malformed operation operand: %r' %
                                     (source, lineno, raw_operand))
                operands.append(match.group(1))
            cur_func.body.append(Op(
                name=om.group('name'),
                operands=operands,
                attrs_raw=(om.group('attrs') or '').strip(),
                sig=om.group('sig'),
                results=results,
                loc=lineno))
            continue

        raise ParseError('%s:%d: unparsable line: %r'
                         % (source, lineno, stripped[:80]))

    if cur_func is not None:
        raise ParseError('%s: unterminated function @%s' %
                         (source, cur_func.name))
    if not module_open:
        raise ParseError('%s: missing module' % source)
    if not module_closed:
        raise ParseError('%s: unterminated module' % source)
    if not mod.order:
        raise ParseError('%s: module has no functions' % source)
    return mod



def print_mlir(mod):
    out = ['module {']
    for fname in mod.order:
        f = mod.funcs[fname]
        argstr = ', '.join('%s: %s' % (a, t) for a, t in f.args)
        rtstr = ', '.join(f.ret_types)
        out.append('  func.func @%s(%s) -> (%s) {' % (f.name, argstr, rtstr))
        for item in f.body:
            if isinstance(item, Op):
                operands = ', '.join('%' + o for o in item.operands)
                attrs = (' {%s}' % item.attrs_raw) if item.attrs_raw else ''
                res_str = ', '.join('%' + r for r in item.results)
                assign = (res_str + ' = ') if res_str else ''
                out.append('    %s"%s"(%s)%s : %s'
                           % (assign, item.name, operands, attrs, item.sig))
            else:  # ReturnOp
                ops_ = ', '.join('%' + o for o in item.operands)
                suffix = (' : ' + item.types_raw) if item.types_raw else ''
                out.append('    return %s%s' % (ops_, suffix))
        out.append('  }')
    out.append('}')
    out.append('')
    return '\n'.join(out)
