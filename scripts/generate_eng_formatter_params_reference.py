"""Generate engineering object and numeric-dictionary references from pinned AST.

Each original operation executes the complete EngFormatter with real Scalar,
deprecation and RcParams dependencies. Builtin hash/dict probes are separately
identified; no MoonBit formatting/hash result creates an expected value.
"""
from pathlib import Path
import argparse
import copy
import json
import math
import sys
import warnings

import numpy as np

from formatter_reference_source import load_eng_formatter
from generate_auto_date_reference import formatted, moon
from generate_basic_formatter_params_reference import clean
from generate_scalar_formatter_params_reference import DEFAULTS, config_prefix

ROOT = Path(__file__).resolve().parents[1]
P = 2**61 - 1


def number(value):
    if isinstance(value, np.bool_): return dict(kind='NumpyBool', value=bool(value))
    if isinstance(value, np.float64): return dict(kind='NumpyFloat64', value=float(value))
    if isinstance(value, np.int64): return dict(kind='NumpyInt64', value=int(value))
    if isinstance(value, bool): return dict(kind='Boolean', value=value)
    if isinstance(value, int):
        if abs(value) == 10**4300:
            return dict(kind='Integer', decimal_power=4300, negative=value < 0)
        return dict(kind='Integer', value=str(value))
    if isinstance(value, float): return dict(kind='Number', value=value)
    raise TypeError('not a typed numeric scalar')


def number_code(value):
    item = value if isinstance(value, dict) else number(value)
    kind = item['kind']
    if 'decimal_power' in item:
        code = 'decimal_power(' + str(item['decimal_power']) + ')'
        if item['negative']: code += '.neg()'
    elif kind == 'Integer': code = '@bigint.BigInt::from_string(' + moon(item['value']) + ')'
    elif kind == 'NumpyInt64': code = str(item['value']) + 'L'
    else: code = moon(item['value'])
    return 'ScalarNumber::' + kind + '(' + code + ')'


def optional(value):
    return 'None' if value is None else 'Some(' + number_code(value) + ')'


def generate(path):
    ns = load_eng_formatter(path)
    source, rc = ns['EngFormatter'], ns['mpl'].rcParams
    initial_prefixes = source.ENG_PREFIXES
    observations, cases, source_only = [], [], []
    code = '''// Complete pinned EngFormatter and actual builtin numeric hash/dict.

///|
fn eng_params_number(actual : ScalarNumber, expected : ScalarNumber) -> Unit raise {
  match (actual, expected) {
    (ScalarNumber::Number(a), ScalarNumber::Number(b))
    | (ScalarNumber::NumpyFloat64(a), ScalarNumber::NumpyFloat64(b)) => {
      if b.is_nan() { assert_true(a.is_nan()) }
      else { assert_eq(a.reinterpret_as_uint64(), b.reinterpret_as_uint64()) }
    }
    _ => assert_eq(actual, expected)
  }
}

///|
fn eng_params_optional(actual : ScalarNumber?, expected : ScalarNumber?) -> Unit raise {
  match (actual, expected) {
    (Some(a), Some(b)) => eng_params_number(a,b)
    (None,None) => ()
    _ => fail("different optional numeric slot")
  }
}
'''

    def reset():
        source.ENG_PREFIXES = initial_prefixes.copy()
        for key, value in DEFAULTS.items(): rc[key] = copy.copy(value)

    def observe(label, action, origin='complete EngFormatter AST'):
        ns['warning_records'].clear()
        with warnings.catch_warnings(record=True) as captured:
            warnings.simplefilter('always')
            try: result = dict(value=action(), source_error=None)
            except (TypeError, ValueError, ZeroDivisionError, OverflowError, IndexError, KeyError, AttributeError) as exc:
                result = dict(value=None, source_error=type(exc).__name__, message=str(exc))
        item = dict(label=label, origin=origin, **result,
                    warnings=list(ns['warning_records']),
                    runtime_warnings=[dict(category=type(w.message).__name__, message=str(w.message)) for w in captured])
        observations.append(item)
        return item

    def assertion(expression, result):
        if result['source_error']:
            return ('  let message = try { ignore(' + expression + '); "unexpected success" } catch { '
                    '@core.DataError::InvalidTicks(message~) => message; _ => "unexpected error" }\n'
                    '  assert_eq(message, ' + moon(result['source_error'] + ': ' + result['message']) + ')\n')
        return '  assert_eq(' + expression + ', ' + moon(result['value']) + ')\n'

    def add(label, body, records):
        nonlocal code
        index = len(cases)
        prefix = config_prefix().replace('@ticker.', '')
        prefix += '''  let previous_prefixes = EngFormatter::class_prefixes()
  defer { EngFormatter::set_class_prefixes(previous_prefixes) }
  EngFormatter::set_class_prefixes(EngPrefixes::si())
'''
        code += '\n///|\nfn eng_params_case_' + str(index) + '() -> Unit raise {\n' + prefix + body + '}\n'
        cases.append(dict(label=label, observations=records))

    def state(formatter):
        return dict(unit=formatter.unit, places=None if formatter.places is None else number(formatter.places), sep=formatter.sep,
                    offset=None if formatter.offset is None else number(formatter.offset), use_offset=formatter.get_useOffset(),
                    usetex=formatter.get_usetex(), use_math_text=formatter.get_useMathText(), use_locale=formatter.get_useLocale(),
                    order=number(formatter._orderOfMagnitude), format=formatter._format, scientific=formatter._scientific,
                    limits=[number(x) for x in formatter._powerlimits], threshold=str(formatter._offset_threshold))

    def assert_state(name, result):
        value = result['value']; body = ''
        for field in ['unit', 'sep']:
            body += '  assert_eq(' + name + '.' + field + '(), ' + moon(value[field]) + ')\n'
        body += '  eng_params_optional(' + name + '.places(), ' + ('None' if value['places'] is None else 'Some(' + number_code(value['places']) + ')') + ')\n'
        scalar = name + '.as_scalar_formatter()'
        body += '  eng_params_optional(' + scalar + '.offset(), ' + ('None' if value['offset'] is None else 'Some(' + number_code(value['offset']) + ')') + ')\n'
        for field in ['use_offset','usetex','use_math_text','use_locale']:
            body += '  assert_eq(' + scalar + '.get_' + field + '(), ' + moon(value[field]) + ')\n'
        body += '  eng_params_number(' + scalar + '.order_of_magnitude(), ' + number_code(value['order']) + ')\n'
        body += '  assert_eq(' + scalar + '.format_pattern(), ' + moon(value['format']) + ')\n'
        body += '  assert_eq(' + scalar + '.scientific(), ' + moon(value['scientific']) + ')\n'
        body += '  assert_eq(' + scalar + '.offset_threshold(), @bigint.BigInt::from_string(' + moon(value['threshold']) + '))\n'
        return body

    reset(); f = source()
    result = observe('original defaults', lambda: state(f))
    add('constructor defaults', '  let formatter = EngFormatter::new()\n' + assert_state('formatter', result), [result])
    for explicit_none in [False, True]:
        reset()
        for key in ['axes.formatter.useoffset','axes.formatter.use_locale','axes.formatter.use_mathtext','text.usetex']: rc[key] = True
        f = source(**({'useOffset': None} if explicit_none else {}))
        result = observe('constructor rc true / explicitNone=' + str(explicit_none), lambda: state(f))
        body = ''.join('  @config.' + name + '(true)\n' for name in ['set_formatter_use_offset','set_formatter_use_locale','set_formatter_use_math_text','set_text_usetex'])
        body += '  let formatter = EngFormatter::new(' + ('use_offset=None' if explicit_none else '') + ')\n'
        add('rc constructor ' + str(explicit_none), body + assert_state('formatter',result), [result])

    slots = [None,2,-1,False,True,2.0,np.float64(2),np.int64(2),np.bool_(True),np.bool_(False),10**4300,-10**4300,float('nan'),float('inf')]
    for value in slots:
        reset(); f = source(places=value)
        result = observe('places constructor ' + str(number(value) if value is not None else None), lambda: state(f))
        add('raw places stored', '  let formatter = EngFormatter::new(places=' + optional(value) + ')\n' + assert_state('formatter', result), [result])
        for x in [1.0,float('nan'),float('inf')]:
            result = observe('places consume', lambda f=f,x=x:f.format_data(x))
            body = '  let formatter = EngFormatter::new(places=' + optional(value) + ')\n'
            add('places delayed error or data', body + assertion('formatter.format_data(' + moon(x) + ')', result), [result])

    offsets = [None,False,True,2,2.,np.float64(2),np.int64(2),np.bool_(False),np.bool_(True)]
    for value in offsets:
        for setter in [False,True]:
            reset(); f = source() if setter else source(useOffset=value)
            if setter: f.set_useOffset(value)
            result=observe('offset constructor/setter None distinction', lambda:state(f))
            body='  let formatter = EngFormatter::new(' + ('' if setter else 'use_offset='+optional(value)) + ')\n'
            if setter: body += '  formatter.as_scalar_formatter().set_use_offset(' + optional(value) + ')\n'
            add('offset raw/capture '+str(setter),body+assert_state('formatter',result),[result])

    for unit in ['', 'Hz', '-V', '$%_{}\\']:
        for sep in ['', ' ', '\u2009', '\u202f']:
            for tex in [False,True]:
                reset(); f=source(unit=unit,sep=sep,places=2,usetex=tex)
                result=observe('raw string unit/sep no TeX escaping',lambda:f(-1000.))
                body='  let formatter = EngFormatter::new(unit='+moon(unit)+',sep='+moon(sep)+',places=Some(ScalarNumber::Integer(@bigint.BigInt::from_int(2))),usetex=Some('+moon(tex)+'))\n'
                add('string slots and call fixminus',body+assertion('formatter.call(-1000.0)',result),[result])

    # Exact places :d is a builtin consumer dependency, prior to original math.
    for value in slots:
        reset()
        result=observe('builtin early places fmt',lambda value=value:'g' if value is None else f'.{value:d}f',origin='Python builtin :d used verbatim by original format_data')
        add('early places fmt helper',assertion('eng_places_format('+optional(value)+')',result),[result])

    maps=[('empty',{}),('zero only',{0:''}),('missingzero',{-3:'m',3:'k'}),('missing3',{0:'',6:'M'}),
          ('step1',{0:'',1:'one'}),('step2',{0:'',2:'two'}),('step4',{0:'',4:'four'}),
          ('fraction end',{0:'',2.5:'frac'}),('fraction start',{-2.5:'frac',0:''}),('fraction lookup',{0:'',2:'two',2.5:'frac'}),
          ('float integer',{0.0:'',3.0:'K'}),('bool',{False:'false',True:'true'}),('npint',{np.int64(0):'',np.int64(3):'N'}),
          ('npfloat',{np.float64(0):'',np.float64(3):'F'}),('ninf first',{float('-inf'):'lo',0:'',3:'k'}),
          ('pinf end',{0:'',3:'k',float('inf'):'hi'}),('pinf only',{float('inf'):'hi'}),('ninf only',{float('-inf'):'lo'}),
          ('nan first',{float('nan'):'N',0:'',3:'k'}),('nan last',{0:'',3:'k',float('nan'):'N'}),('nan middle',{0:'',float('nan'):'N',3:'k'}),
          ('huge end',{0:'',10**400:'H'}),('huge start',{-10**400:'H',0:''}),('extreme float',{0:'',1e300:'H'})]
    for label,mapping in maps:
        for x in [0.,1000.,1e9]:
            reset();f=source();f.ENG_PREFIXES=mapping.copy()
            result=observe('numeric map '+label,lambda:f.format_data(x))
            body='  let prefixes = EngPrefixes::new()\n'
            for k,v in mapping.items(): body+='  prefixes.set('+number_code(k)+','+moon(v)+')\n'
            body+='  let formatter = EngFormatter::new()\n  formatter.set_prefixes(prefixes)\n'
            add('prefix format '+label,body+assertion('formatter.format_data('+moon(x)+')',result),[result])

    # Actual dictionary hash probes do not execute or restate a Moon hash.
    hash_values=[0.,-0.,1.5,-1.,float('inf'),float('-inf'),1e-300,1e300,np.float64(1.5),np.float64(float('inf')),
                 np.int64(-1),np.bool_(True),True,False,2**53+1,-2**63,2**120,10**400,-10**400]
    hash_values += [math.ldexp(1.23456789012345,k) for k in [-1070,-1000,-61,-60,-1,0,1,60,61,500,1000]]
    for value in hash_values:
        result=observe('numeric Python hash',lambda value=value:hash(value),origin='actual Python builtin hash')
        add('hash61 numeric', '  assert_eq(eng_prefix_hash('+number_code(value)+'), '+str(result['value'])+'L)\n',[result])

    pairs=[(np.float64(2**53),2**53+1),(np.float64(2**53),np.int64(2**53+1)),(float(2**53),np.int64(2**53+1)),
           (np.float64(2**63),np.int64(2**63-1)),(float(2**63),np.int64(2**63-1)),(np.float64(-2**63),np.int64(-2**63+1)),
           (np.float64(2**113),2**113+P),(float(2**113),2**113+P),(np.float64(-2**113),-2**113-P),
           (np.float64(2**120),2**120+13*P),(np.int64(1),1+P),(1,1+P),
           (np.float64(1e100),int(float(1e100))+P),(float(1e100),int(float(1e100))+P)]
    pairs += [(first, value) for first in [0,0.,False,np.int64(0),np.float64(0),np.bool_(False)] for value in [0,0.,False,np.int64(0),np.float64(0),np.bool_(False)]]
    for pair in pairs:
        for first,last in [pair,pair[::-1]]:
            d={first:'first'}
            result=observe('actual dict set/replacement',lambda:(d.__setitem__(last,'last'),dict(length=len(d),keys=[number(k) for k in d],values=list(d.values()),hashes=[hash(first),hash(last)],equality=bool(first==last)))[1],origin='actual Python builtin dict/hash and scalar rich equality')
            body='  let prefixes = EngPrefixes::new()\n  let first = EngPrefixKey::new('+number_code(first)+')\n  let last = EngPrefixKey::new('+number_code(last)+')\n  prefixes.set_key(first,"first")\n  prefixes.set_key(last,"last")\n'
            value=result['value'];body+='  assert_eq(prefixes.length(),'+str(value['length'])+')\n  let keys = prefixes.keys()\n'
            for i,(key,label) in enumerate(zip(value['keys'],value['values'])):
                body+='  eng_params_number(keys['+str(i)+'].value(),'+number_code(key)+')\n  assert_eq(prefixes.get_key(keys['+str(i)+']),Some('+moon(label)+'))\n'
            body+='  assert_true(physical_equal(keys[0],first))\n  assert_eq(prefixes.get_key(last),Some("last"))\n  assert_true(prefixes.remove_key(last))\n  assert_eq(prefixes.length(),'+str(value['length']-1)+')\n'
            add('ordered dictionary hashgate',body,[result])

    for key in [np.float64(1.),np.float64(float('inf')),np.float64(float('-inf')),np.bool_(True)]:
        # Choose a signed huge integer with exactly the scalar key's hash.
        h=hash(key);huge=(10**400//P)*P+abs(h);huge=huge if h>=0 else -huge
        for first,last in [(key,huge),(huge,key)]:
            for method in ['set','get','remove']:
                d={first:'first'}
                def operation():
                    if method=='set': d[last]='last';return None
                    if method=='get': return d.get(last)
                    return d.pop(last,None) is not None
                result=observe('huge hash collision '+method,operation,origin='actual Python builtin dict; source rich-comparison error')
                body='  let prefixes=EngPrefixes::new()\n  prefixes.set('+number_code(first)+',"first")\n'
                expression='prefixes.'+method+'('+number_code(last)+(','+moon('last') if method=='set' else '')+')'
                body+=assertion(expression,result)+'  assert_eq(prefixes.length(),1)\n'
                add('huge NP collision source error',body,[result])

    # Same/different NaN objects are stable identity facts, never address hashes.
    reset();a=float('nan');b=float('nan');d={a:'first'};d[a]='same';d[b]='different'
    result=observe('NaN dictionary identity',lambda:dict(length=len(d),same=d[a],different=d[b],copy_keys_shared=all(x is y for x,y in zip(d,d.copy()))),origin='actual Python builtin dict/copy')
    body='''  let a=EngPrefixKey::new(ScalarNumber::Number(0.0/0.0))
  let b=EngPrefixKey::new(ScalarNumber::Number(0.0/0.0))
  let prefixes=EngPrefixes::new()
  prefixes.set_key(a,"first")
  prefixes.set_key(a,"same")
  prefixes.set_key(b,"different")
  assert_eq(prefixes.length(),2)
  assert_eq(prefixes.get_key(a),Some("same"))
  assert_eq(prefixes.get_key(b),Some("different"))
  assert_eq(prefixes.get(ScalarNumber::Number(0.0/0.0)),None)
  let copied=prefixes.copy()
  assert_true(physical_equal(prefixes.keys()[0],copied.keys()[0]))
  prefixes.set_key(a,"changed")
  assert_eq(copied.get_key(a),Some("same"))
  assert_true(copied.remove_key(a))
  assert_eq(prefixes.length(),2)
  assert_eq(copied.length(),1)
'''
    add('NaN identity and dictionary shallow copy',body,[result])

    # Shared class lookup, instance override/reset and copy alias are public state.
    reset();f=source();g=source();h=copy.copy(f);f.ENG_PREFIXES[3]='K!'
    records=[observe('class map mutate',lambda:[f(1000.),g(1000.),h(1000.)])]
    source.ENG_PREFIXES={0:'C',3:'CLASS'};records.append(observe('class map rebind',lambda:[f(1000.),g(1000.),h(1000.)]))
    f.ENG_PREFIXES={0:'',3:'INSTANCE'};j=copy.copy(f);f.ENG_PREFIXES[3]='MUT';records.append(observe('instance map copy alias',lambda:[f(1000.),j(1000.)]))
    f.ENG_PREFIXES={0:'',3:'REBOUND'};records.append(observe('instance map rebind',lambda:[f(1000.),j(1000.)]))
    del f.ENG_PREFIXES;records.append(observe('instance map clear override',lambda:[f(1000.),j(1000.)]))
    body='''  let formatter=EngFormatter::new()
  let other=EngFormatter::new()
  let copied=formatter.copy()
  formatter.prefixes().set(ScalarNumber::Integer(@bigint.BigInt::from_int(3)),"K!")
'''+assertion('[formatter.call(1000.0),other.call(1000.0),copied.call(1000.0)]',records[0])+'''
  let class_map=EngPrefixes::new()
  class_map.set(ScalarNumber::Integer(@bigint.BigInt::from_int(0)),"C")
  class_map.set(ScalarNumber::Integer(@bigint.BigInt::from_int(3)),"CLASS")
  EngFormatter::set_class_prefixes(class_map)
'''+assertion('[formatter.call(1000.0),other.call(1000.0),copied.call(1000.0)]',records[1])+'''
  let instance=EngPrefixes::new()
  instance.set(ScalarNumber::Integer(@bigint.BigInt::from_int(0)),"")
  instance.set(ScalarNumber::Integer(@bigint.BigInt::from_int(3)),"INSTANCE")
  formatter.set_prefixes(instance)
  let local_copy=formatter.copy()
  instance.set(ScalarNumber::Integer(@bigint.BigInt::from_int(3)),"MUT")
'''+assertion('[formatter.call(1000.0),local_copy.call(1000.0)]',records[2])+'''
  let rebound=EngPrefixes::new()
  rebound.set(ScalarNumber::Integer(@bigint.BigInt::from_int(0)),"")
  rebound.set(ScalarNumber::Integer(@bigint.BigInt::from_int(3)),"REBOUND")
  formatter.set_prefixes(rebound)
'''+assertion('[formatter.call(1000.0),local_copy.call(1000.0)]',records[3])+'''
  formatter.clear_prefixes()
'''+assertion('[formatter.call(1000.0),local_copy.call(1000.0)]',records[4])
    add('class/instance/copy prefixes',body,records)

    # Dictionary tombstones affect non-transitive NP equality, beyond iteration.
    reset(); n=2**120; a=n; b=n+P; dkey=n-P; probe=np.float64(n)
    d={a:'A',b:'B'};del d[a];d[dkey]='D'
    result=observe('dict dummy-slot reuse lookup and fastcopy',lambda:dict(values=list(d.values()),query=d[probe],copy_query=d.copy()[probe]),origin='actual CPython builtin dict/copy')
    body='  let prefixes=EngPrefixes::new()\n'
    body+='  prefixes.set('+number_code(a)+',"A")\n  prefixes.set('+number_code(b)+',"B")\n'
    body+='  assert_true(prefixes.remove('+number_code(a)+'))\n  prefixes.set('+number_code(dkey)+',"D")\n'
    body+='  let keys=prefixes.keys()\n  assert_eq([prefixes.get_key(keys[0]),prefixes.get_key(keys[1])],[Some("B"),Some("D")])\n'
    body+=assertion('prefixes.get('+number_code(probe)+').unwrap()',dict(value=result['value']['query'],source_error=None))
    body+=assertion('prefixes.copy().get('+number_code(probe)+').unwrap()',dict(value=result['value']['copy_query'],source_error=None))
    add('physical dummy slots and dictionary copy',body,[result])

    for method,getter,key in [('set_usetex','get_usetex','text.usetex'),('set_useMathText','get_useMathText','axes.formatter.use_mathtext'),('set_useLocale','get_useLocale','axes.formatter.use_locale')]:
        reset();f=source();getattr(f,method)(None);first=getattr(f,getter)();rc[key]=True;before=getattr(f,getter)();getattr(f,method)(None);after=getattr(f,getter)()
        result=observe('inherited setter None captures rc',lambda:[first,before,after])
        api={'set_usetex':'usetex','set_useMathText':'use_math_text','set_useLocale':'use_locale'}[method]
        config={'text.usetex':'set_text_usetex','axes.formatter.use_mathtext':'set_formatter_use_math_text','axes.formatter.use_locale':'set_formatter_use_locale'}[key]
        body='  let formatter=EngFormatter::new()\n  let scalar=formatter.as_scalar_formatter()\n  scalar.set_'+api+'(None)\n  let first=scalar.get_'+api+'()\n  @config.'+config+'(true)\n  let before=scalar.get_'+api+'()\n  scalar.set_'+api+'(None)\n'
        body+=assertion('[first,before,scalar.get_'+api+'()]',result)
        add('inherited rc capture '+api,body,[result])

    reset();f=source(unit='V',places=1,sep=':');f.create_dummy_axis();locations=[1.];f.set_locs(locations)
    f._format='%.1f';f._orderOfMagnitude=3;f.set_scientific(False);limits=[4,4];f.set_powerlimits(limits)
    g=copy.copy(f);g.unit='copy';g.places=None;g.sep='~';g.set_useOffset(12);g._format='%g';g._locs.append(2);limits[0]=9
    records=[observe('shallow original cached slots',lambda:state(f)),observe('shallow copy cached slots',lambda:state(g)),
             observe('shallow axis/locations/limits identity',lambda:[f.axis is g.axis,f._locs is g._locs,f._powerlimits is g._powerlimits])]
    body='''  let formatter=EngFormatter::new(unit="V",places=Some(ScalarNumber::Integer(@bigint.BigInt::from_int(1))),sep=":")
  formatter.create_dummy_axis()
  let locations=[1.0]
  formatter.set_locs(locations)
  let scalar=formatter.as_scalar_formatter()
  scalar.set_format_pattern("%.1f")
  scalar.set_order_of_magnitude(ScalarNumber::Integer(@bigint.BigInt::from_int(3)))
  scalar.set_scientific(false)
  let limits=[@bigint.BigInt::from_int(4),@bigint.BigInt::from_int(4)]
  scalar.set_power_limits(ScalarPowerLimits::Integers(limits))
  let copied=formatter.copy()
  copied.set_unit("copy")
  copied.set_places(None)
  copied.set_sep("~")
  copied.as_scalar_formatter().set_use_offset(Some(ScalarNumber::Integer(@bigint.BigInt::from_int(12))))
  copied.as_scalar_formatter().set_format_pattern("%g")
  locations.push(2.0)
  limits[0]=@bigint.BigInt::from_int(9)
  assert_true(physical_equal(formatter.as_base_formatter(),scalar.as_base_formatter()))
  assert_true(!physical_equal(formatter.as_base_formatter(),copied.as_base_formatter()))
  assert_eq(formatter.axis(),copied.axis())
  assert_eq(copied.locations().get(1),2.0)
  match copied.as_scalar_formatter().power_limits() {
    Integers(values) => assert_eq(values[0],@bigint.BigInt::from_int(9))
    _ => fail("lost shared inherited limits")
  }
'''+assert_state('formatter',records[0])+assert_state('copied',records[1])
    add('shallow Eng and inherited state with same Base views',body,records)

    for locations,offset in [([],3),([1.],0),([1.],3),([],None),([1.],None)]:
        reset();f=source();f.create_dummy_axis();f.set_locs(locations);f.offset=offset;f._format='%.2f';f._orderOfMagnitude=0
        records=[observe('cached direct call with empty/forced offset',lambda:f(1.)),observe('cached offset output',lambda:f.get_offset())]
        body='  let formatter=EngFormatter::new()\n  formatter.create_dummy_axis()\n  formatter.set_locs('+moon(locations)+')\n  let scalar=formatter.as_scalar_formatter()\n  scalar.set_offset('+optional(offset)+')\n  scalar.set_format_pattern("%.2f")\n  scalar.set_order_of_magnitude(ScalarNumber::Integer(@bigint.BigInt::from_int(0)))\n'
        body+=assertion('formatter.call(1.0)',records[0])+assertion('formatter.get_offset()',records[1])
        add('empty locations and forced offset source branches',body,records)

    for value in [1000,np.int64(1000),1000.]:
        reset();f=source(unit='V');f.create_dummy_axis()
        result=observe('inherited short remains Scalar',lambda:f.format_data_short(value))
        body='  let formatter=EngFormatter::new(unit="V")\n  formatter.create_dummy_axis()\n'
        add('inherited short retains origin',body+assertion('formatter.format_data_short_value('+number_code(value)+')',result),[result])

    # The accepted portable NaN-key hash is 0, unlike address-derived native hash.
    # Keep BOTH actual source dict and actual native rich-equality observations.
    reset();np_nan=np.float64(float('nan'));huge=(10**400//P)*P
    d={np_nan:'nan'}
    native=observe('native NumPy NaN address hash avoids zero collision',lambda:dict(length_after_set=(d.__setitem__(huge,'huge'),len(d))[1],nan_hash_is_zero=hash(np_nan)==0),origin='actual original NumPy float64 key and builtin dict; native NaN hash is not serialized')
    compared=observe('portable zero-hash profile invokes native NumPy rich equality',lambda:bool(np_nan==huge),origin='actual NumPy scalar equality dependency; portable hash0 profile, NOT original dict result')
    body='  let prefixes=EngPrefixes::new()\n  let key=EngPrefixKey::new('+number_code(np_nan)+')\n  assert_eq(key.numeric_hash,0L)\n  prefixes.set_key(key,"nan")\n'
    body+=assertion('prefixes.set('+number_code(huge)+',"huge")',compared)+'  assert_eq(prefixes.length(),1)\n'
    body+='  assert_true(prefixes.length() != '+str(native['value']['length_after_set'])+')\n'
    add('explicit portable NaN hash profile difference',body,[native,compared])

    # Source-only dynamic domains stay evidence, never port error expectations.
    for field in ['unit','sep']:
        for value in [None,0,2,False,[],[1],np.array([1,2])]:
            for x in [1.,1000.]:
                reset();f=source(**{field:value});result=observe('dynamic '+field,lambda:f.format_data(x))
                source_only.append(dict(reason='unit/sep typed String domain; dynamic truth/string protocol not represented',field=field,raw_type=type(value).__name__,input=x,observation=result))
    for mapping in [{'0':'Z','3':'K'},{0:'','3':'K'},{None:'N'}]:
        for x in [0.,1000.,1e9]:
            reset();f=source();f.ENG_PREFIXES=mapping;result=observe('nonnumeric prefix keys',lambda:f.format_data(x))
            source_only.append(dict(reason='prefix keys restricted to six numeric scalar origins',input=x,observation=result))
    for value in [None,False,0,1,[],[1],np.array([1,2])]:
        for x in [1.,1000.]:
            reset();f=source();f.ENG_PREFIXES={0:value,3:value};result=observe('nonstring prefix values',lambda:f.format_data(x))
            source_only.append(dict(reason='prefix values typed String; dynamic truth/string protocol not represented',raw_type=type(value).__name__,input=x,observation=result))
    for value in ['2',[],np.array([1,2])]:
        reset();f=source(places=value);result=observe('nonnumeric places',lambda:f.format_data(float('nan')))
        source_only.append(dict(reason='optional six numeric scalar places; arbitrary :d objects not represented',raw_type=type(value).__name__,observation=result))

    for start in range(0,len(cases),32):
        code+='\n///|\ntest "Eng params original group '+str(start//32)+'" {\n'
        code+=''.join('  eng_params_case_'+str(i)+'()\n' for i in range(start,min(start+32,len(cases))))+'}\n'
    payload=dict(source_hashes=ns['source_hashes'],python=sys.version.split()[0],numpy=np.__version__,
                 host_profile=ns['scalar_host_profile'],
                 scope='Complete original EngFormatter and real Scalar/deprecation/RcParams dependencies; six raw numeric origins and optional places, String unit/sep/prefix values; insertion-ordered mutable class/instance dictionaries with numeric hash61 gate, stored-key equality, NaN key identity, shallow copies and checked collision errors. Builtin hash/dict dependencies separately identified. Dynamic nonnumeric keys/places/unit/sep/prefix values are source-only; no address-based NaN hash expectation.',
                 observation_count=len(observations),generated_case_count=len(cases),registered_test_count=(len(cases)+31)//32,
                 portable_nan_hash_profile='NaN key handles retain identity and deterministic numeric_hash=0. Original CPython/NumPy NaN hashes derive from object addresses. Mixed NaN/nontransitive-key physical-slot traces and hash0 collision errors can differ; explicit source/profile pair retained, never called a native hash clone. No numeric tolerance or source expectation replacement.',
                 cpython_dict_source=dict(url='https://raw.githubusercontent.com/python/cpython/v3.12.14/Objects/dictobject.c',sha256='2139caefe57c6659db766fdda5e53c57f0e42e9335227875756307acfcdb51dd',scope='general combined numeric-key table: perturb lookup, EMPTY/DUMMY, used*3 resize, ordered tombstones, PyDict_Copy fastclone/compact'),
                 cases=cases,source_only=source_only)
    return json.dumps(clean(payload),indent=2,allow_nan=False)+'\n',formatted(code)


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('ticker',type=Path);parser.add_argument('--check',action='store_true')
    args=parser.parse_args();outputs=generate(args.ticker)
    for name,content in zip(['testdata/eng_formatter_params_reference.json','ticker/eng_formatter_params_reference_wbtest.mbt'],outputs):
        target=ROOT/name
        if args.check:
            if not target.exists() or target.read_text()!=content: raise SystemExit('reference differs: '+name)
        else:target.write_text(content)
    payload=json.loads(outputs[0])
    print('Eng params:',payload['observation_count'],'observations;',payload['generated_case_count'],'private cases;',payload['registered_test_count'],'registered groups;',len(payload['source_only']),'source-only records')


if __name__=='__main__': main()
