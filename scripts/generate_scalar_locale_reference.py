"""Complete original ScalarFormatter locale method + fixed stdlib locale.py.

localeconv fields are explicit caller fixtures; regex/_format/_localize/_group/
final native string-tuple-percent stages execute unchanged in CPython.
"""
from pathlib import Path
import argparse,hashlib,json,locale,sys,warnings
import numpy as np
from formatter_reference_source import load_scalar_formatter
from generate_auto_date_reference import formatted,moon
ROOT=Path(__file__).resolve().parents[1]
LOCALE_SHA='3988c5419552d5b9f0bef3695102376f79357f0f440e9cd1f32c501f966e6ef3'
QUERY_GROUP_SIZE=32

def clean_number(value):
    if isinstance(value,(float,np.floating)):
        return dict(type=type(value).__name__,hex=float(value).hex())
    if isinstance(value,np.integer):return dict(type=type(value).__name__,value=str(value))
    if isinstance(value,(bool,np.bool_)):return dict(type=type(value).__name__,value=bool(value))
    return dict(type='int',value=str(value))

def python_value(spec):
    kind=spec['kind'];value=spec['value']
    if kind in ['Number','NumpyFloat64']:
        value=float.fromhex(value)if isinstance(value,str)else float(value)
        return np.float64(value)if kind=='NumpyFloat64'else value
    if kind=='NumpyInt64':return np.int64(value)
    if kind=='Integer':return int(value)
    if kind=='NumpyBool':return np.bool_(value)
    return bool(value)

def collect(path):
    if hashlib.sha256(Path(locale.__file__).read_bytes()).hexdigest()!=LOCALE_SHA:raise ValueError('fixed locale.py differs')
    if locale.CHAR_MAX!=127:raise ValueError('fixed CHAR_MAX differs')
    ns=load_scalar_formatter(path);F=ns['ScalarFormatter'];rows=[]
    profiles=[
      dict(name='C',decimal_point='.',thousands_sep='',grouping=[]),
      dict(name='US',decimal_point='.',thousands_sep=',',grouping=[3,0]),
      dict(name='decimal-comma',decimal_point=',',thousands_sep='.',grouping=[3,0]),
      dict(name='Indian',decimal_point='.',thousands_sep=',',grouping=[3,2,0]),
      dict(name='stop',decimal_point='.',thousands_sep=',',grouping=[3,127]),
      dict(name='one-only',decimal_point='.',thousands_sep=',',grouping=[3]),
      dict(name='never',decimal_point='.',thousands_sep=',',grouping=[127,0]),
      dict(name='invalid-zero',decimal_point='.',thousands_sep=',',grouping=[0]),
      dict(name='finite-negative',decimal_point='.',thousands_sep=',',grouping=[-1]),
      dict(name='finite-mixed',decimal_point='.',thousands_sep='|',grouping=[-2,-1,127]),
      dict(name='astral-separator',decimal_point=',',thousands_sep='🐍',grouping=[3,0]),
      dict(name='arabic',decimal_point='٫',thousands_sep='\u202f',grouping=[3,0]),
      dict(name='multiple-units',decimal_point=',,',thousands_sep='--',grouping=[1,0]),
      dict(name='no-decimal',decimal_point='',thousands_sep='',grouping=[3,0]),
      dict(name='finite-stop',decimal_point='.',thousands_sep=',',grouping=[1,2]),
    ]
    formats=['%1.0f','%1.2f','%12.2f','%-12.2f','%012.2f','%+12.0f','% 12.0f','%.0e','%g','%12g','%d','%+12d','%012d','%#x','%s','%r','%a']
    numbers=[dict(kind='Number',value=-1234567.89),dict(kind='Number',value=0.),dict(kind='Number',value='-0x0.0p+0'),dict(kind='Number',value='inf'),dict(kind='Number',value='nan'),dict(kind='NumpyFloat64',value=1234567.89),dict(kind='NumpyInt64',value='9223372036854775807'),dict(kind='Integer',value='123456789012345678901234567890'),dict(kind='Boolean',value=True),dict(kind='NumpyBool',value=False)]
    saved=locale._override_localeconv.copy()
    def run(fmt,spec,profile,use_locale=True,use_math=False,minus=True,label='numeric locale complete stages'):
        locale._override_localeconv.clear();locale._override_localeconv.update({k:v for k,v in profile.items()if k!='name'})
        ns['mpl'].rcParams['axes.unicode_minus']=minus
        f=F(useOffset=False,useMathText=use_math,useLocale=use_locale,usetex=False)
        with warnings.catch_warnings(record=True)as captured:
            warnings.simplefilter('always')
            try:value=f._format_maybe_minus_and_locale(fmt,python_value(spec));error=None;message=None
            except Exception as exc:value=None;error=type(exc).__name__;message=str(exc)
        rows.append(dict(label=label,format=fmt,number=spec,locale=profile,use_locale=use_locale,use_math_text=use_math,unicode_minus=minus,value=value,error=error,message=message,runtime_warnings=[str(w.message)for w in captured if issubclass(w.category,RuntimeWarning)]))
    try:
      for profile in profiles:
        for fmt in formats:
          for spec in numbers:run(fmt,spec,profile)
      raw=['literal','', '%%','%5%','%*%','%.*%','%%%f','%f%%','%f%f','%f,%f','%f,,%f','%s %s','%q','%','%f%q','%q%f','%q%q%f','%*q%f','%*f','%.*f','%*.*f','%(x)f','%(x)s','%(x)q%f','%(\nx)f','%(a(b)c)f','%(x)%','%llf','%hf','%Lr','%٢f','%.٢f','%-#0 +12.4f','%999999999999999999999999q','%.99999999999999999999999q','%f tail%','%f %a','%s%q','%f,raw-hyphen-','a%q,%f']
      raw += ['%a%f','%a%%','%a%f%q','%a%s','%a%q%f','%5a%%','%.2a%%','%-12.5a%%','%a%q%%%%']
      for profile in [profiles[1],profiles[2],profiles[10]]:
        for fmt in raw:
          for mathmode in [False,True]:
            for spec in [numbers[0],numbers[6]]:run(fmt,spec,profile,use_math=mathmode,label='raw regex then tuple percent/error ordering')
      for profile in [profiles[1],profiles[2],profiles[10],profiles[12]]:
        for fmt in ['%12.2f','%-12.2f','%012.2f','%f,%f','literal-','%s']:
          for use_locale in [False,True]:
            for mathmode in [False,True]:run(fmt,numbers[0],profile,use_locale=use_locale,use_math=mathmode,minus=False,label='locale and math flags are independent')
      for fmt in ['%.101f','%.1100f','%1001.2f','%01001d']:
        for mathmode in [False,True]:run(fmt,numbers[6],profiles[10],use_math=mathmode,label='valid output beyond legacy convenience caps')
      for profile in [profiles[1],profiles[2]]:
        for fmt in ['%x','%r','%*f','%*s','%f%f','%f,%f','%s %q']:
          for mathmode in [False,True]:run(fmt,dict(kind='Integer',value='0'),profile,use_math=mathmode,label='raw deadzone Python integer zero and tuple stages')
      # The real source body is interrupted externally, not rewritten to error.
      budgets=[]
      for grouping in [[-1,0],[-3,0],[3,-1,0]]:
        locale._override_localeconv.update(decimal_point='.',thousands_sep=',',grouping=grouping)
        f=F(useOffset=False,useMathText=False,useLocale=True,usetex=False);steps=0
        class SourceTraceBudget(Exception):pass
        def tracer(frame,event,arg):
          nonlocal steps
          if event=='line'and frame.f_code.co_filename==locale.__file__:
            steps+=1
            if steps>2000:raise SourceTraceBudget()
          return tracer
        sys.settrace(tracer)
        try:
          f._format_maybe_minus_and_locale('%d',12345)
          raise AssertionError('expected negative repeat source cycle')
        except SourceTraceBudget:pass
        finally:sys.settrace(None)
        budgets.append(dict(grouping=grouping,line_budget=2000,observed_lines=steps,source_error=None,classification='external trace budget; proven negative-repeat nontermination',port_boundary='Unsupported: locale negative repeated grouping does not terminate in CPython'))
    finally:
      locale._override_localeconv.clear();locale._override_localeconv.update(saved)
    return dict(source_hashes={**ns['source_hashes'],'stdlib/locale.py':LOCALE_SHA},runtime=dict(python=sys.version.split()[0],numpy=np.__version__,CHAR_MAX=locale.CHAR_MAX),scope='Complete original ScalarFormatter._format_maybe_minus_and_locale and unchanged native stdlib locale.format_string/_format/_localize/_group/_strip_padding/_grouping_intervals; controlled localeconv numeric fields. Native regex/native scalar and final String-tuple percent operations, not a port-algorithm oracle. Font profile inherited from real shared loader. Dynamic locale OS discovery, arbitrary custom mappings/operators and monetary formatting are outside this helper.',cases=rows,negative_repeat_boundaries=budgets)

def quote(s):return json.dumps(s,ensure_ascii=False)
def scalar(spec):
    kind=spec['kind'];v=spec['value']
    if kind in ['Number','NumpyFloat64']:
        x=float.fromhex(v)if isinstance(v,str)else float(v)
        return '@ticker.ScalarNumber::'+kind+'('+moon(x)+')'
    if kind=='Integer':return '@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string('+quote(v)+'))'
    if kind=='NumpyInt64':return '@ticker.ScalarNumber::NumpyInt64('+v+'L)'
    return '@ticker.ScalarNumber::'+kind+'('+str(v).lower()+')'

def emit(payload):
    code='// Generated from complete original ScalarFormatter and fixed stdlib locale.\n\n///|\nfn scalar_locale_case_failure(index : Int32, error : Error) -> Unit raise {\n  fail("Scalar original locale case " + index.to_string() + " failed: " + error.to_string())\n}\n\n'
    for i,row in enumerate(payload['cases']):
        p=row['locale'];code+='///|\n// Original case '+str(i)+': '+row['label']+'\nfn scalar_original_locale_case_'+str(i)+'() -> Unit raise {\n  let saved_locale = @config.numeric_locale()\n  defer @config.set_numeric_locale(saved_locale)\n  let saved_minus = @config.unicode_minus()\n  defer @config.set_unicode_minus(saved_minus)\n  @config.set_unicode_minus('+str(row['unicode_minus']).lower()+')\n  @config.set_numeric_locale(@config.NumericLocale::new(decimal_point='+quote(p['decimal_point'])+', thousands_sep='+quote(p['thousands_sep'])+', grouping='+json.dumps(p['grouping'])+'))\n'
        expr='scalar_named_format('+quote(row['format'])+', '+scalar(row['number'])+', '+str(row['use_locale']).lower()+', '+str(row['use_math_text']).lower()+')'
        if row['error']:
            code+='  let failed = try { ignore('+expr+'); false } catch {\n    @core.DataError::InvalidTicks(message~) => { assert_eq(message, '+quote(row['error']+': '+row['message'])+'); true }\n    _ => false\n  }\n  assert_true(failed)\n'
        else:code+='  assert_eq('+expr+', '+quote(row['value'])+')\n'
        code+='}\n\n'
    # Each source body remains a separate function so its defers run before the
    # next source case. Register fewer test closures: the Wasm test initializer
    # otherwise exceeds V8's local-variable limit before any test can execute.
    for start in range(0,len(payload['cases']),QUERY_GROUP_SIZE):
        end=min(start+QUERY_GROUP_SIZE,len(payload['cases']))
        code+='///|\ntest '+quote('Scalar original locale cases '+str(start)+'..'+str(end-1))+' {\n'
        for i in range(start,end):
            code+='  try { scalar_original_locale_case_'+str(i)+'() } catch { error => scalar_locale_case_failure('+str(i)+', error) }\n'
        code+='}\n\n'
    for i,row in enumerate(payload['negative_repeat_boundaries']):
        code+='///|\ntest '+quote('Scalar locale proven negative repeat boundary '+str(i))+' {\n  let saved = @config.numeric_locale()\n  defer @config.set_numeric_locale(saved)\n  @config.set_numeric_locale(@config.NumericLocale::new(thousands_sep=",", grouping='+json.dumps(row['grouping'])+'))\n  let failed = try { ignore(scalar_named_format("%d", @ticker.ScalarNumber::Integer(@bigint.BigInt::from_int(12345)), true, false)); false } catch {\n    @core.DataError::InvalidTicks(message~) => { assert_eq(message, '+quote(row['port_boundary'])+'); true }\n    _ => false\n  }\n  assert_true(failed)\n}\n\n'
    # This is a ticker whitebox file; its own package values are unqualified.
    return code.replace('@ticker.ScalarNumber::','ScalarNumber::')

def main():
    ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('ticker',type=Path);ap.add_argument('--check',action='store_true');a=ap.parse_args()
    p=collect(a.ticker);query_groups=(len(p['cases'])+QUERY_GROUP_SIZE-1)//QUERY_GROUP_SIZE
    p['counts']=dict(original_queries=len(p['cases']),successes=sum(r['error']is None for r in p['cases']),errors=sum(r['error']is not None for r in p['cases']),negative_repeat_boundaries=len(p['negative_repeat_boundaries']),query_group_size=QUERY_GROUP_SIZE,registered_query_groups=query_groups,registered_test_count=query_groups+len(p['negative_repeat_boundaries']),separate_hand_tests=4,total_registered_with_hand=query_groups+len(p['negative_repeat_boundaries'])+4)
    outputs={ROOT/'testdata/scalar_locale_reference.json':json.dumps(p,ensure_ascii=False,indent=2)+'\n',ROOT/'ticker/scalar_locale_reference_wbtest.mbt':formatted(emit(p))}
    for path,value in outputs.items():
      if a.check:
        if not path.exists()or path.read_text()!=value:raise SystemExit('stale reference '+str(path))
      else:path.write_text(value)
    print(p['counts'], 'checked'if a.check else'generated')
if __name__=='__main__':main()
