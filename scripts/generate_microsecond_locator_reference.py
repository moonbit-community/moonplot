"""Execute original pinned MicrosecondLocator/MultipleLocator/Edge across fractional grids."""
from pathlib import Path
import argparse,datetime as dt,hashlib,inspect,json,math,os,sys,time,struct,warnings
import dateutil,dateutil.rrule as rr,numpy as np
from dateutil import tz
from generate_named_locator_reference import load
from generate_auto_locator_reference import TICKER_SHA
from generate_auto_date_reference import moon,formatted
from generate_rrule_wrapper_reference import DATES_SHA,RULE_SHA,TZ_SHA,COMMON_SHA,NOW,naive,aware
ROOT=Path(__file__).resolve().parents[1]
FLOAT_SHA='d558f168de7ec864b64ffad7ee2b056bda4efca1ee68ca690189354b893ccc76'


def clean(value):
    if isinstance(value,float) and not math.isfinite(value):return repr(value)
    if isinstance(value,list):return [clean(v) for v in value]
    if isinstance(value,dict):return {k:clean(v) for k,v in value.items()}
    return value


def generate(path):
    if sys.version_info[:3]!=(3,12,14) or dateutil.__version__!='2.9.0.post0' or np.__version__!='2.3.5':raise ValueError('fixed runtime required')
    for source,sha in [(path,DATES_SHA),(Path(inspect.getfile(rr.rrule)),RULE_SHA),(Path(inspect.getfile(tz.tzfile)),TZ_SHA),(Path(inspect.getfile(tz.tzrange.__mro__[1])),COMMON_SHA),(ROOT/'.moonagent/upstream/cpython-v3.12.14/Objects/floatobject.c',FLOAT_SHA)]:
        if hashlib.sha256(source.read_bytes()).hexdigest()!=sha:raise ValueError('fixed source differs: '+str(source))
    manifest=json.loads((ROOT/'testdata/tzif/manifest.json').read_text())
    for name in ['new_york','lord_howe']:
        if hashlib.sha256((ROOT/'testdata/tzif'/(name+'.tzif')).read_bytes()).hexdigest()!=manifest[name]['sha256']:raise ValueError('fixture differs')
    ref=load(path);specs=[]
    def bounded_arange(stop):
        if math.isfinite(stop) and stop>100000:raise RuntimeError('reference fixture requests '+str(stop)+' ticks')
        return np.arange(stop)
    class ReferenceNumpy:
        arange=staticmethod(bounded_arange)
        def __getattr__(self,name):return getattr(np,name)
    ref['np']=ReferenceNumpy()
    def add(label,step,first,last,zone='UTC',host='UTC0',rc='UTC'):
        specs.append(dict(label=label,step=step,first=first,last=last,zone=zone,host=host,rc=rc))
    for year in [1,1970,2000,2400,9999]:
        for micro in [0,1,123456,999995]:
            for step in [.1,.25,.5,1.,2.5,7.]:
                a=dt.datetime(year,1,1,microsecond=micro);b=a+dt.timedelta(microseconds=3)
                add('year/micro grid '+str(year)+'/'+str(micro),step,naive(a.isoformat()),naive(b.isoformat()))
    for step in [.1,.5,7.,250.,1e10]:
        for a,b in [('1970-01-01T00:00:00.000001','1969-12-31T23:59:59.999999'),('2024-01-01T00:00:00.000001','2023-12-31T23:59:59.999999'),('0001-01-01','0001-01-01'),('9999-12-31T23:59:59.999999','9999-12-31T23:59:59.999999')]:add('reverse/day/year boundary',step,naive(a),naive(b))
    for step in [5e-324,1e-300,1e300,1e308]:
        for text in (['1970-01-01'] if step==1e-300 else ['1970-01-01','1970-01-01T00:00:00.000001']):
            add('extreme finite interval',step,naive(text),naive(text))
    for zone,text,fold in [('NY','2024-03-10T02:30:00',0),('NY','2024-11-03T01:30:00',1),('LH','2024-10-06T02:15:00',0),('NEG','2024-10-27T01:00:00',0),('FIX','1900-01-01T00:00:00',0)]:
        for step in [.5,7.]:
            a=dt.datetime.fromisoformat(text);b=a+dt.timedelta(microseconds=3)
            add('zone attach '+zone+' '+text,step,aware(a.isoformat(),zone,fold),aware(b.isoformat(),zone,fold),zone)
    mixed=[(aware('1970-01-01T00:00:00+00:00'),naive('1970-01-01T00:00:00.000003'),.5,'UTC0'),
           (naive('1970-01-01'),aware('1970-01-01T00:09:21.000003+00:09:21'),1e6,'UTC0'),
           (aware('1970-01-01T00:09:21+00:09:21'),naive('1970-01-01T00:00:00.000003'),1e6,'UTC0'),
           (aware('1970-01-01T00:00:00+00:00'),naive('1970-01-01T05:45:00.000003'),1e9,'XST-5:45'),
           (naive('0001-01-01'),aware('0001-01-01T00:00:00+23:00'),1e10,'UTC0'),
           (aware('0002-01-01T00:00:00+00:00'),naive('0001-01-01'),1e12,'UTC0'),
           (aware('9999-12-31T00:00:00+00:00'),naive('9999-12-31'),1e10,'UTC0')]
    for offset in [-561,-61,-59,59,61]:
        value=dt.datetime(1970,1,1,tzinfo=dt.timezone(dt.timedelta(seconds=offset)))
        mixed.append((naive('1970-01-01'),aware(value.isoformat()),1e6,'UTC0'))
    for a,b,step,host in mixed:add('mixed awareness batch',step,a,b,host=host)
    for step in [0.,-1.]:
        add('invalid interval after display capture',step,naive('1970-01-01'),naive('1970-01-01'))
    add('invalid display before interval',0.,naive('1970-01-01'),naive('1970-01-01'),zone='INVALID')
    add('capture default rc',.5,naive('1970-01-01'),naive('1970-01-01T00:00:00.000003'),zone=None,rc='XST-5:45')
    old_tz=os.environ.get('TZ');code='// Generated original MicrosecondLocator, MultipleLocator and Edge.\n';rows=[]
    try:
        for index,case in enumerate(specs):
            os.environ['TZ']=case['host'];time.tzset();ref['mpl'].rcParams['timezone']=case['rc']
            zones=dict(UTC=dt.timezone.utc,NY=tz.tzfile(str(ROOT/'testdata/tzif/new_york.tzif')),LH=tz.tzfile(str(ROOT/'testdata/tzif/lord_howe.tzif')),NEG=tz.tzstr('IST-1GMT0,M10.5.0/2,M3.5.0/1'),FIX=dt.timezone(dt.timedelta(seconds=561)),INVALID='invalid/D19-reference')
            moonzones=dict(UTC='@date.get_timezone(name="UTC")',NY='@date.get_timezone(name="D19/reference-NY")',LH='@date.get_timezone(name="D19/reference-LH")',NEG='@date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")',FIX='@date.fixed_timezone_seconds(561)')
            def pydate(spec):
                value=dt.datetime.fromisoformat(spec['text'])
                if spec['kind']=='naive':return value.replace(tzinfo=None)
                return value.replace(tzinfo=zones[spec['zone']],fold=spec.get('fold',0)) if spec.get('zone') else value
            def moondate(spec):
                value='@date.parse_iso('+moon(spec['text'])+')'
                if spec['kind']=='naive':return '@date.RRuleDateTime::naive('+value+')'
                if spec.get('zone'):return '@date.RRuleDateTime::from_local('+value+', zone_'+spec['zone'].lower()+', fold='+moon(bool(spec.get('fold',0)))+')'
                return '@date.RRuleDateTime::aware('+value+')'
            def call(fn):
                try:return fn(),None
                except (ValueError,TypeError,AttributeError,OverflowError,MemoryError) as exc:return None,type(exc).__name__
            code+='\n///|\ntest '+moon('MicrosecondLocator original '+str(index)+' '+case['label']+' step '+repr(case['step']))+' {\n'
            code+='  let previous_rc = @config.timezone()\n  defer @config.set_timezone(previous_rc)\n  @config.set_timezone('+moon(case['rc'])+')\n'
            used={case['zone'],case['first'].get('zone'),case['last'].get('zone')}-{None,'INVALID'}
            for name in sorted(used):
                if name in ['NY','LH']:
                    short=dict(NY='new_york',LH='lord_howe')[name]
                    code+='  @date.register_timezone("D19/reference-'+name+'", tzif_'+short+')\n  defer @date.unregister_timezone("D19/reference-'+name+'")\n'
                code+='  let zone_'+name.lower()+' = '+moonzones[name]+'\n'
            code+='  let calls = Ref(0)\n  let context = @date.DateParserContext::from_posix('+moon(case['host'])+', clock=fn() { calls.val += 1; '+str(NOW)+'L })\n'
            margs='interval='+moon(case['step'])+', context~'
            if case['zone']=='INVALID':margs+=', tz="invalid/D19-reference"'
            elif case['zone'] is not None:margs+=', timezone=zone_'+case['zone'].lower()
            expr='@date.MicrosecondLocator::new('+margs+')'
            locator,error=call(lambda:ref['MicrosecondLocator'](interval=case['step'],tz=zones.get(case['zone'])))
            if error:
                for name in sorted(used):code+='  ignore(zone_'+name.lower()+')\n'
                code+='  assert_true(try { ignore('+expr+'); false } catch { _ => true })\n  assert_eq(calls.val, 0)\n}\n'
                rows.append(dict(case=case,constructor_error=error));continue
            code+='  let locator = '+expr+'\n  let adapter = locator.as_locator()\n  let copy = adapter.copy()\n  @config.set_timezone("UTC")\n'
            ref['mpl'].rcParams['timezone']='UTC'
            code+='  assert_eq(locator.interval(), '+moon(float(locator._get_interval()))+')\n  assert_eq(copy.interval_value(), '+moon(float(locator._get_interval()))+')\n  assert_eq(copy.interval(), '+str(min(2147483647,int(case['step'])))+')\n  assert_eq(copy.unit_scale(), '+moon(float(locator._get_unit()))+')\n  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())\n'
            observations=[]
            for reverse in [False,True]:
                a,b=(case['last'],case['first']) if reverse else (case['first'],case['last'])
                ticks,error=call(lambda:[float(v) for v in locator.tick_values(pydate(a),pydate(b))])
                code+='  assert_eq(try { Some(locator.tick_values('+moondate(a)+', '+moondate(b)+')) } catch { _ => None }, '+('None' if error else 'Some('+moon(ticks)+')')+')\n'
                observations.append(dict(reverse=reverse,error=error,ticks=ticks))
            numbers,invalid=call(lambda:[float(v) for v in ref['date2num']([pydate(case['first']),pydate(case['last'])])])
            numeric=None
            if not invalid:
                a,b=numbers;lo,hi=sorted(numbers)
                ticks,error=call(lambda:[float(v) for v in locator.tick_values(ref['num2date'](lo,locator.tz),ref['num2date'](hi,locator.tz))])
                expected=[] if error else ticks if a<=b else ticks[::-1]
                code+='  assert_eq(adapter.tick_values('+moon(a)+', '+moon(b)+'), '+moon(expected)+')\n'
                numeric=dict(bounds=numbers,error=error,ticks=expected)
            bounds_rows=[]
            for a,b in [(0.,0.),(12.,12.+1e-7),(5.,3.),(math.nan,math.inf)]:
                limits=locator.nonsingular(a,b)
                code+='  assert_eq(locator.nonsingular('+moon(a)+', '+moon(b)+'), ('+moon(float(limits[0]))+', '+moon(float(limits[1]))+'))\n'
                code+='  assert_eq(copy.nonsingular('+moon(a)+', '+moon(b)+'), ('+moon(float(limits[0]))+', '+moon(float(limits[1]))+'))\n'
                bounds_rows.append(dict(input=[repr(a),repr(b)],output=[float(v) for v in limits]))
            code+='  assert_eq(calls.val, 0)\n}\n'
            rows.append(dict(case=case,constructor_error=None,direct=observations,numeric=numeric,nonsingular=bounds_rows))
    finally:
        if old_tz is None:os.environ.pop('TZ',None)
        else:os.environ['TZ']=old_tz
        time.tzset()
    bits=lambda value:struct.unpack('>Q',struct.pack('>d',value))[0]
    divmod_rows=[];whitebox='// Original CPython divmod, confirmed against NumPy scalar divmod.\n'
    for value in [0.,-0.,1.,-1.,.3,-.3,5e-324,-5e-324,1e-300,-1e-300,1e308,-1e308]:
        for step in [5e-324,.1,1.,7.,1e300,1e308]:
            q,r=divmod(value,step)
            nq,nr=divmod(np.float64(value),np.float64(step))
            if bits(q)!=bits(float(nq)) or bits(r)!=bits(float(nr)):raise ValueError('float / NumPy divmod differs')
            whitebox+='\n///|\ntest '+moon('CPython microsecond divmod '+repr(value)+' / '+repr(step))+' {\n'
            whitebox+='  let (q, r) = microsecond_divmod('+moon(value)+', '+moon(step)+')\n  assert_eq(q.reinterpret_as_uint64(), '+str(bits(q))+'UL)\n  assert_eq(r.reinterpret_as_uint64(), '+str(bits(r))+'UL)\n}\n'
            divmod_rows.append(dict(value=repr(value),step=repr(step),quotient_bits=bits(q),remainder_bits=bits(r)))
    extras={ROOT/'ticker/date/microsecond_divmod_reference_wbtest.mbt':formatted(whitebox)}
    epoch_rows=[]
    for name,epoch,year in [('fraction','2000-01-01T00:00:00.123456',2000),('2400','2400-01-01T00:00:00',2400)]:
        selected=load(path,epoch)
        extra='// Original MicrosecondLocator and AutoDateLocator with custom epoch.\n\n///|\nfn verify_microsecond_locator_epoch_reference() -> Unit raise {\n'
        for micro in [0,1,123456,999995]:
            first=dt.datetime(year,1,1,microsecond=micro);last=first+dt.timedelta(microseconds=3)
            bounds=[float(x) for x in selected['date2num']([first,last])]
            def expr(value):return '@date.RRuleDateTime::naive(@date.datetime('+str(year)+', 1, 1, microsecond='+str(value.microsecond)+'))'
            for step in [.1,.5,1.,2.5,7.]:
                locator=selected['MicrosecondLocator'](interval=step,tz=dt.timezone.utc)
                direct=[float(x) for x in locator.tick_values(first,last)]
                numeric=[float(x) for x in locator.tick_values(selected['num2date'](bounds[0],dt.timezone.utc),selected['num2date'](bounds[1],dt.timezone.utc))]
                extra+='  {\n    let locator = @date.MicrosecondLocator::new(interval='+moon(step)+', tz="UTC")\n    assert_eq(locator.tick_values('+expr(first)+', '+expr(last)+'), '+moon(direct)+')\n'
                extra+='    assert_eq(locator.as_locator().tick_values('+moon(bounds[1])+', '+moon(bounds[0])+'), '+moon(numeric[::-1])+')\n  }\n'
                epoch_rows.append(dict(epoch=epoch,microsecond=micro,step=step,bounds=bounds,direct=direct,numeric=numeric))
            auto=selected['AutoDateLocator'](tz=dt.timezone.utc)
            decoded=[selected['num2date'](x,dt.timezone.utc) for x in bounds]
            chosen=auto.get_locator(*decoded)
            ticks=[float(x) for x in chosen.tick_values(*decoded)]
            extra+='  {\n    let auto = @date.AutoDateLocator::new(tz="UTC")\n    assert_eq(auto.tick_values('+moon(bounds[0])+', '+moon(bounds[1])+'), '+moon(ticks)+')\n  }\n'
            epoch_rows.append(dict(epoch=epoch,microsecond=micro,auto_bounds=bounds,auto_ticks=ticks))
        extra+='}\n'
        extras[ROOT/'integration'/('epoch_'+name)/'microsecond_locator_reference_test.mbt']=formatted(extra)
    payload=dict(ticker_source_sha256=TICKER_SHA,divmod_cases=divmod_rows,epoch_cases=epoch_rows,dates_source_sha256=DATES_SHA,rrule_source_sha256=RULE_SHA,tz_source_sha256=TZ_SHA,tz_common_source_sha256=COMMON_SHA,floatobject_sha256=FLOAT_SHA,python=sys.version.split()[0],numpy=np.__version__,dateutil=dateutil.__version__,epoch='1970-01-01T00:00:00',cases=rows)
    return clean(payload),formatted(code),extras


def main():
    parser=argparse.ArgumentParser();parser.add_argument('dates',type=Path);parser.add_argument('--check',action='store_true');args=parser.parse_args()
    with warnings.catch_warnings():
        warnings.simplefilter('ignore',Warning);payload,code,extras=generate(args.dates)
    for path,text in {ROOT/'testdata/microsecond_locator_reference.json':json.dumps(payload,indent=2,allow_nan=False)+'\n',ROOT/'ticker/date/microsecond_locator_reference_test.mbt':code,**extras}.items():
        if args.check:
            if not path.exists() or path.read_text()!=text:raise SystemExit('reference differs: '+str(path))
        else:path.write_text(text)
    print('MicrosecondLocator reference:',len(payload['cases']),'named')
if __name__=='__main__':main()
