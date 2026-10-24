"""Original pinned YearLocator/_Edge_integer with controlled local clock and keyword forms."""
from pathlib import Path
import argparse,datetime as dt,hashlib,inspect,json,os,sys,time,types,warnings
import dateutil,dateutil.rrule as rr
from dateutil import tz
from generate_auto_locator_reference import load_reference
from generate_auto_date_reference import moon,formatted
from generate_rrule_wrapper_reference import DATES_SHA,RULE_SHA,TZ_SHA,COMMON_SHA,NAMES,NOW,fields,naive,aware
ROOT=Path(__file__).resolve().parents[1]
CPYTHON_SHA='cd11d1f38e9e637c7404c98ff45e355053b7f7e8251015d58a4c1f17e6d5f8a8'


def generate(path):
    if sys.version_info[:3]!=(3,12,14) or dateutil.__version__!='2.9.0.post0':raise ValueError('fixed runtime required')
    for source,sha in [(path,DATES_SHA),(Path(inspect.getfile(rr.rrule)),RULE_SHA),(Path(inspect.getfile(tz.tzfile)),TZ_SHA),(Path(inspect.getfile(tz.tzrange.__mro__[1])),COMMON_SHA),(ROOT/'.moonagent/upstream/cpython-v3.12.14/Modules/_datetimemodule.c',CPYTHON_SHA)]:
        if hashlib.sha256(source.read_bytes()).hexdigest()!=sha:raise ValueError('fixed source differs: '+str(source))
    manifest=json.loads((ROOT/'testdata/tzif/manifest.json').read_text())
    for name in ['new_york','lord_howe']:
        if hashlib.sha256((ROOT/'testdata/tzif'/(name+'.tzif')).read_bytes()).hexdigest()!=manifest[name]['sha256']:raise ValueError('fixture differs')
    ref=load_reference(path);scenarios=[]
    def add(label,first,last,base=1,month=1,day=1,display='UTC',steps=None):scenarios.append(dict(label=label,first=first,last=last,base=base,month=month,day=day,display=display,steps=steps or []))
    for base in [1,2,5,10,100,1000,2147483647]:
        for aware_flag in [False,True]:
            for micro in [0,123456,999999]:
                maker=aware if aware_flag else naive;suffix='+00:00' if aware_flag else ''
                add('base '+str(base)+' aware '+str(aware_flag)+' micro '+str(micro),maker('2021-05-08T12:34:56.'+str(micro).zfill(6)+suffix),maker('2028-02-08T03:04:05'+suffix),base=base)
    for month,day in [(2,29),(2,30),(2,-1),(4,31),(12,31),(1,1)]:
        for a,b in [('2020-05-01','2024-03-02'),('2024-05-01','2024-05-01'),('2024-05-01','2023-05-01'),('0001-01-01','0002-01-01'),('9998-01-01','9999-12-31')]:
            add('calendar '+str(month)+'/'+str(day)+' '+a+'/'+b,naive(a),naive(b),month=month,day=day)
    for zone in ['NY','LH','FIX','E23','W23','NEG','MID']:
        for a,b in [('1900-01-01','1903-01-01'),('2023-07-01T00:00:00.123456','2025-07-01'),('0001-01-01','0002-01-01'),('9998-01-01','9999-12-31')]:
            add('zones '+zone+' '+a,aware(a,zone,fold=1),aware(b,zone),base=2,display=zone)
    for first,last in [(naive('2024-01-01'),aware('2023-01-01T00:00:00+02:00')),(aware('2024-01-01T00:00:00+02:00'),naive('2023-01-01')),(naive('0002-01-01'),aware('0001-01-01T00:00:00+23:00')),(aware('0002-01-01T00:00:00+23:00'),naive('0001-01-01'))]:
        add('mixed '+first['kind']+' '+first['text'],first,last)
    steps=[dict(interval=3),dict(frequency=1),dict(frequency=0,bymonth_value=7,bymonthday_value=4),dict(bymonth=[7]),dict(bymonth_value=7),dict(null=['bymonthday']),dict(bymonthday_value=4),dict(bymonthday_value=-1),dict(bymonthday_value=1),dict(byhour=[12]),dict(count=0),dict(null=['count'],bysetpos=[0]),dict(null=['bysetpos'])]
    for is_aware in [False,True]:
        f=aware if is_aware else naive;suffix='+00:00' if is_aware else ''
        add('mutable forms '+str(is_aware),f('2021-05-01'+('T00:00:00'+suffix if is_aware else '')),f('2028-05-01'+('T00:00:00'+suffix if is_aware else '')),base=5,steps=steps)
    # No tick occurs before these updates: omitted DTSTART must resample now.
    add('constructor date and until mutators',naive('2021-01-01'),naive('2025-01-01'),steps=[dict(bymonth_value=2),dict(bymonthday_value=29),dict(bymonthday_value=1)])
    scenarios[-1]['pre_steps']=[dict(bymonth_value=2),dict(bymonthday_value=29),dict(bymonthday_value=1)]
    for first,last in [(aware('9999-12-31T00:00:00+00:00'),naive('9999-12-31')),(naive('9999-12-31'),aware('9999-12-31T23:59:59-23:00'))]:
        add('mixed max '+first['kind'],first,last)
        scenarios[-1]['pre_steps']=[dict(count=0)]
    real_datetime=dt.datetime;clock=dict(calls=0)
    class DateMeta(type):
        def __instancecheck__(cls,value):return isinstance(value,real_datetime)
    class ControlledDateTime(real_datetime,metaclass=DateMeta):
        @classmethod
        def now(cls,tz=None):
            clock['calls']+=1;return real_datetime.fromtimestamp((NOW+(clock['calls']-1)*86400000)/1000,tz=tz)
    old_datetime=rr.datetime;old_tz=os.environ.get('TZ');os.environ['TZ']='UTC0';time.tzset()
    rr.datetime=types.SimpleNamespace(**{**vars(dt),'datetime':ControlledDateTime})
    code='// Generated original pinned YearLocator and _Edge_integer.\n';rows=[]
    try:
        for index,case in enumerate(scenarios):
            clock['calls']=0
            zones=dict(UTC=dt.timezone.utc,NY=tz.tzfile(str(ROOT/'testdata/tzif/new_york.tzif')),LH=tz.tzfile(str(ROOT/'testdata/tzif/lord_howe.tzif')),FIX=dt.timezone(dt.timedelta(seconds=561)),E23=dt.timezone(dt.timedelta(hours=23)),W23=dt.timezone(dt.timedelta(hours=-23)),NEG=tz.tzstr('IST-1GMT0,M10.5.0/2,M3.5.0/1'),MID=tz.tzstr('STD0DST,M6.1.0/0,M1.1.0/1'))
            moonzones=dict(UTC='@date.get_timezone(name="UTC")',NY='@date.get_timezone(name="D16/reference-NY")',LH='@date.get_timezone(name="D16/reference-LH")',FIX='@date.fixed_timezone_seconds(561)',E23='@date.fixed_timezone_seconds(82800)',W23='@date.fixed_timezone_seconds(-82800)',NEG='@date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")',MID='@date.get_timezone(name="STD0DST,M6.1.0/0,M1.1.0/1")')
            def pydate(spec):
                value=real_datetime.fromisoformat(spec['text'])
                if spec['kind']=='naive':return value.replace(tzinfo=None)
                return value.replace(tzinfo=zones[spec['zone']],fold=spec.get('fold',0)) if spec.get('zone') else value
            def moondate(spec):
                value='@date.parse_iso('+moon(spec['text'])+')'
                if spec['kind']=='naive':return '@date.RRuleDateTime::naive('+value+')'
                if spec.get('zone'):return '@date.RRuleDateTime::from_local('+value+', zone_'+spec['zone'].lower()+', fold='+moon(bool(spec.get('fold',0)))+')'
                return '@date.RRuleDateTime::aware('+value+')'
            def pyargs(opts):
                result={dict(frequency='freq',bymonth_value='bymonth',bymonthday_value='bymonthday').get(key,key):value for key,value in opts.items() if key!='null'}
                for name in opts.get('null',[]):result[name]=None
                return result
            def moonargs(opts):return ', '.join(key+'='+('@date.'+NAMES[value] if key=='frequency' else moon(value)) for key,value in opts.items())
            def call(fn):
                try:return fn(),False
                except (ValueError,TypeError,AttributeError,OverflowError):return None,True
            locator=ref['YearLocator'](case['base'],month=case['month'],day=case['day'],tz=zones[case['display']])
            code+='\n///|\ntest '+moon('YearLocator original '+str(index)+' '+case['label'])+' {\n'
            used={case['display'],case['first'].get('zone'),case['last'].get('zone')}-{None}
            for name in sorted(used):
                if name in ['NY','LH']:
                    code+='  @date.register_timezone("D16/reference-'+name+'", tzif_'+dict(NY='new_york',LH='lord_howe')[name]+')\n  defer @date.unregister_timezone("D16/reference-'+name+'")\n'
                code+='  let zone_'+name.lower()+' = '+moonzones[name]+'\n'
            code+='  let calls = Ref(0)\n  let context = @date.DateParserContext::utc(clock=fn() { let now = '+str(NOW)+'L + Int64::from_int(calls.val) * 86400000L; calls.val += 1; now })\n'
            code+='  let locator = @date.YearLocator::new(base='+str(case['base'])+', month='+str(case['month'])+', day='+str(case['day'])+', timezone=zone_'+case['display'].lower()+', context~)\n  let wrapper = locator.rule()\n  let adapter = locator.as_locator()\n  let copy = adapter.copy()\n'
            states=[]
            def meta():
                nonlocal code
                rule=locator.rule._rrule
                row=dict(clock_calls=clock['calls'],base=locator.base.step,frequency=rule._freq,interval=rule._interval,unit=locator._get_unit(),effective=locator.rule._tzinfo is not None,start=fields(rule._dtstart),until=fields(rule._until))
                code+='  assert_eq(calls.val, '+str(row['clock_calls'])+')\n  assert_eq(locator.base(), '+str(row['base'])+')\n  assert_true(wrapper.frequency() is @date.'+NAMES[row['frequency']]+')\n  assert_eq(locator.interval(), '+str(row['interval'])+')\n  assert_eq(copy.interval(), '+str(row['interval'])+')\n  assert_eq(copy.unit_scale(), '+moon(float(row['unit']))+')\n  assert_eq(wrapper.timezone() is Some(_), '+moon(row['effective'])+')\n  assert_eq(wrapper_reference_fields(wrapper.dtstart()), '+moon(row['start'])+')\n  assert_eq(wrapper.until().map(wrapper_reference_fields), '+('None' if row['until'] is None else 'Some('+moon(row['until'])+')')+')\n'
                return row
            for action in case.get('pre_steps',[]):
                _,error=call(lambda:locator.rule.set(**pyargs(action)))
                code+='  assert_eq(try { wrapper.set('+moonargs(action)+'); false } catch { _ => true }, '+moon(error)+')\n'
            for action in [None,*case['steps']]:
                if action is not None:
                    _,error=call(lambda:locator.rule.set(**pyargs(action)))
                    code+='  assert_eq(try { wrapper.set('+moonargs(action)+'); false } catch { _ => true }, '+moon(error)+')\n'
                before=meta()
                ticks,error=call(lambda:[float(x) for x in locator.tick_values(pydate(case['first']),pydate(case['last']))])
                expected='None' if error else 'Some('+moon(ticks)+')'
                code+='  assert_eq(try { Some(locator.tick_values('+moondate(case['first'])+', '+moondate(case['last'])+')) } catch { _ => None }, '+expected+')\n'
                after=meta();row=dict(action=action,before=before,ticks=ticks,error=error,after=after)
                numbers,invalid=call(lambda:[float(x) for x in ref['date2num']([pydate(case['first']),pydate(case['last'])])])
                if not invalid:
                    a,b=numbers;lo,hi=sorted(numbers)
                    vals,error=call(lambda:[float(x) for x in locator.tick_values(ref['num2date'](lo,zones[case['display']]),ref['num2date'](hi,zones[case['display']]))])
                    expected=[] if error else vals if a<=b else vals[::-1]
                    code+='  assert_eq(adapter.tick_values('+moon(a)+', '+moon(b)+'), '+moon(expected)+')\n'
                    row['numeric']=dict(bounds=numbers,error=error,ticks=expected,after=meta())
                states.append(row)
            code+='}\n';rows.append(dict(case=case,states=states))
    finally:
        rr.datetime=old_datetime
        if old_tz is None:os.environ.pop('TZ',None)
        else:os.environ['TZ']=old_tz
        time.tzset()
    epoch_outputs={};epoch_rows=[]
    for name,epoch,year in [('fraction','2000-01-01T00:00:00.123456',2000),('2400','2400-01-01T00:00:00',2400)]:
        selected=load_reference(path,epoch)
        locator=selected['YearLocator'](5,tz=dt.timezone.utc)
        first=dt.datetime(year,1,1,microsecond=123456);last=dt.datetime(year+12,1,10)
        direct=[float(x) for x in locator.tick_values(first,last)]
        bounds=[float(x) for x in selected['date2num']([dt.datetime(year,1,1),last])]
        auto=selected['AutoDateLocator'](tz=dt.timezone.utc)
        auto.set_axis(types.SimpleNamespace(get_view_interval=lambda:bounds))
        automatic=[float(x) for x in auto()]
        extra='// Generated fixed YearLocator and automatic year branch with custom epoch.\n\n///|\nfn verify_year_locator_epoch_reference() -> Unit raise {\n'
        extra+='  let context = @date.DateParserContext::utc(clock=fn() { '+str(NOW)+'L })\n  let locator = @date.YearLocator::new(base=5, tz="UTC", context~)\n'
        extra+='  assert_eq(locator.tick_values(@date.RRuleDateTime::naive(@date.datetime('+str(year)+', 1, 1, microsecond=123456)), @date.RRuleDateTime::naive(@date.datetime('+str(year+12)+', 1, 10))), '+moon(direct)+')\n'
        extra+='  let auto = @date.AutoDateLocator::new(tz="UTC", context~)\n  let values = auto.tick_values('+moon(bounds[0])+', '+moon(bounds[1])+')\n  assert_eq(values, '+moon(automatic)+')\n  assert_eq(auto.frequency(), @date.Year)\n  assert_eq(auto.as_locator().tick_values('+moon(bounds[1])+', '+moon(bounds[0])+'), values.rev())\n}\n'
        epoch_outputs[ROOT/'tests/integration'/('epoch_'+name)/'year_locator_reference_test.mbt']=formatted(extra)
        epoch_rows.append(dict(epoch=epoch,bounds=bounds,direct=direct,automatic=automatic))
    payload=dict(dates_source_sha256=DATES_SHA,rrule_source_sha256=RULE_SHA,tz_source_sha256=TZ_SHA,tz_common_source_sha256=COMMON_SHA,python=sys.version.split()[0],dateutil=dateutil.__version__,cpython_datetime_sha256=CPYTHON_SHA,host_timezone='UTC0',now_milliseconds=NOW,cases=rows,epoch_cases=epoch_rows)
    return payload,formatted(code),epoch_outputs


def main():
    parser=argparse.ArgumentParser();parser.add_argument('dates',type=Path);parser.add_argument('--check',action='store_true');args=parser.parse_args()
    with warnings.catch_warnings():
        warnings.simplefilter('ignore',DeprecationWarning);warnings.simplefilter('ignore',UserWarning);payload,code,epoch_outputs=generate(args.dates)
    for path,text in {ROOT/'testdata/year_locator_reference.json':json.dumps(payload,indent=2)+'\n',ROOT/'ticker/date/year_locator_reference_test.mbt':code,**epoch_outputs}.items():
        if args.check:
            if not path.exists() or path.read_text()!=text:raise SystemExit('reference differs: '+str(path))
        else:path.write_text(text)
    print('YearLocator reference:',len(payload['cases']),'named,',sum(len(c['states']) for c in payload['cases']),'states')
if __name__=='__main__':main()
