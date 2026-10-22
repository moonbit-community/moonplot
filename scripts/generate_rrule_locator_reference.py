"""Execute original pinned RRuleLocator + rrulewrapper; compare direct and axis paths."""
from pathlib import Path
import argparse,datetime as dt,hashlib,inspect,json,sys,warnings
import dateutil,dateutil.rrule as rr
from dateutil import tz
from dateutil._common import weekday
from dateutil.relativedelta import relativedelta
from generate_auto_locator_reference import load_reference
from generate_rrule_wrapper_reference import DATES_SHA,RULE_SHA,TZ_SHA,COMMON_SHA,fields,naive,aware,NAMES
from generate_auto_date_reference import moon,formatted
ROOT=Path(__file__).resolve().parents[1]
REL_SHA='218fe6825323a196d87ebbe5a1363671ed366a25633c892265faa03536517ee0'


def generate(path):
    if sys.version_info[:3]!=(3,12,14) or dateutil.__version__!='2.9.0.post0':raise ValueError('requires fixed runtime')
    for source,sha in [(path,DATES_SHA),(Path(inspect.getfile(rr.rrule)),RULE_SHA),(Path(inspect.getfile(tz.tzfile)),TZ_SHA),(Path(inspect.getfile(relativedelta)),REL_SHA),(Path(inspect.getfile(tz.tzrange.__mro__[1])),COMMON_SHA)]:
        if hashlib.sha256(source.read_bytes()).hexdigest()!=sha:raise ValueError('fixed source differs: '+str(source))
    manifest=json.loads((ROOT/'testdata/tzif/manifest.json').read_text())
    for name in ['new_york','lord_howe']:
        if hashlib.sha256((ROOT/'testdata/tzif'/(name+'.tzif')).read_bytes()).hexdigest()!=manifest[name]['sha256']:raise ValueError('fixture differs')
    ref=load_reference(path)
    specs=[]
    def add(label,first,last,*,freq=3,base=None,display='UTC',options=None,start=None,steps=None):
        specs.append(dict(label=label,first=first,last=last,freq=freq,base=base,display=display,options=options or {},start=start or naive('2024-01-01T00:00:00'),steps=steps or []))
    for freq,span in enumerate([dt.timedelta(days=365*12),dt.timedelta(days=300),dt.timedelta(days=60),dt.timedelta(days=14),dt.timedelta(hours=11),dt.timedelta(minutes=11),dt.timedelta(seconds=11)]):
        for is_aware in [False,True]:
            a=dt.datetime(2024,1,31,3,7,11,123456);b=a+span
            f=aware if is_aware else naive
            add('all frequencies '+str(freq)+' aware '+str(is_aware),f(a.isoformat()+'+00:00' if is_aware else a.isoformat()),f(b.isoformat()+'+00:00' if is_aware else b.isoformat()),freq=freq,options=dict(interval=2))
    for a,b in [('2024-01-31','2024-02-29'),('2023-01-31','2023-03-01'),('2024-02-28T23:30','2024-03-31T00:15'),('1900-02-28','1900-03-31'),('2000-02-29','2005-02-28')]:
        for reverse in [False,True]:
            first,last=(b,a) if reverse else (a,b)
            add('calendar expansion '+first+'/'+last,naive(first),naive(last),freq=1,options=dict(interval=3))
    for options in [dict(count=0),dict(count=-1),dict(count=1),dict(count=3),dict(byhour=[12]),dict(bymonth=[2],bymonthday=[30]),dict(byweekday=[0,4],bysetpos=[-1]),dict(byyearday=[60,-1]),dict(byweekno=[1,-1]),dict(byeaster=[0]),dict(bymonthday=[-1])]:
        add('filters '+str(options),naive('2024-01-01'),naive('2024-04-30T12:00:00'),options=options)
    for freq in [0,1,2,3]:
        for days in [[[0,2]],[[4,-1]],[[0,None],[1,1]]]:
            add('ordinal '+str(freq)+' '+str(days),naive('2024-01-01'),naive('2025-02-28'),freq=freq,options=dict(byweekdays=days,bymonth=[1,2,3]))
    for zone,a,b in [('NY','2024-03-10T00:00:00','2024-03-10T05:00:00'),('NY','2024-11-03T00:00:00','2024-11-03T04:00:00'),('LH','2024-10-06T01:00:00','2024-10-06T04:00:00'),('NEG','2024-03-31T00:00:00','2024-03-31T04:00:00'),('FIX','1900-01-01','1900-01-03')]:
        for base in [None,zone,'UTC']:
            for display in ['UTC',zone]:
                add('zones '+zone+' base '+str(base)+' display '+display,aware(a,zone),aware(b,zone),freq=4,base=base,display=display)
    for a,b in [(aware('2024-01-01T00:00:00+23:00'),aware('2023-12-31T00:00:00-23:00')),(aware('1900-01-01T00:00:00+00:09:21'),aware('1900-01-02T00:00:00-04:56:02')),(aware('2024-03-09T03:00:00','NY'),aware('2024-03-12T01:00:00+00:00'))]:
        add('mixed zones '+a['text']+'/'+b['text'],a,b,options=dict(interval=2))
    for a,b in [(naive('0001-01-01'),naive('0001-01-03')),(naive('9999-12-29'),naive('9999-12-31T23:59:59.999999')),(aware('0001-01-01T00:00:00+00:00'),aware('0001-01-03T00:00:00+00:00')),(aware('9999-12-29T00:00:00+00:00'),aware('9999-12-31T23:59:59.999999+00:00')),(aware('0001-01-01','E23'),aware('0001-01-03','E23')),(aware('9999-12-29','W23'),aware('9999-12-31T23:59:59','W23'))]:
        for base in [None,'UTC','E23']:
            add('caps '+a['kind']+' '+a['text']+'/'+b['text']+' base '+str(base),a,b,base=base)
    add('mixed awareness',naive('2024-01-01'),aware('2024-01-05T00:00:00+00:00'))
    for base in [None,'NY']:
        add('live metadata '+str(base),aware('2024-03-08T02:30:00','NY'),aware('2024-03-13T02:30:00','NY'),base=base,start=aware('2024-03-01T02:30:00','NY'),options=dict(cache=True),steps=[dict(frequency=4,interval=3),dict(bysetpos=[0],interval=7),dict(null=['bysetpos'],interval=2),dict(frequency=1,byweekdays=[[4,-1]])])
    for a,b in [('2024-01-01','2024-01-01'),('2024-01-01T00:00:00.000001','2024-01-01T00:00:00.000009')]:
        add('point/micro '+a,naive(a),naive(b),freq=6)
    code='// Generated original pinned RRuleLocator and rrulewrapper.\n';rows=[]
    for index,case in enumerate(specs):
        zones=dict(UTC=dt.timezone.utc,NY=tz.tzfile(str(ROOT/'testdata/tzif/new_york.tzif')),LH=tz.tzfile(str(ROOT/'testdata/tzif/lord_howe.tzif')),NEG=tz.tzstr('IST-1GMT0,M10.5.0/2,M3.5.0/1'),FIX=dt.timezone(dt.timedelta(seconds=561)),E23=dt.timezone(dt.timedelta(hours=23)),W23=dt.timezone(dt.timedelta(hours=-23)))
        moonzones=dict(UTC='@date.get_timezone(name="UTC")',NY='@date.get_timezone(name="D14/reference-NY")',LH='@date.get_timezone(name="D14/reference-LH")',NEG='@date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")',FIX='@date.fixed_timezone_seconds(561)',E23='@date.fixed_timezone_seconds(82800)',W23='@date.fixed_timezone_seconds(-82800)')
        def pydate(spec):
            value=dt.datetime.fromisoformat(spec['text'])
            if spec['kind']=='naive':return value.replace(tzinfo=None)
            return value.replace(tzinfo=zones[spec['zone']],fold=spec.get('fold',0)) if spec.get('zone') else value
        def moondate(spec):
            value='@date.parse_iso('+moon(spec['text'])+')'
            if spec['kind']=='naive':return '@date.RRuleDateTime::naive('+value+')'
            if spec.get('zone'):return '@date.RRuleDateTime::from_local('+value+', zone_'+spec['zone'].lower()+', fold='+moon(bool(spec.get('fold',0)))+')'
            return '@date.RRuleDateTime::aware('+value+')'
        def pyargs(opts):
            opts=opts.copy()
            if 'frequency' in opts:opts['freq']=opts.pop('frequency')
            if 'byweekdays' in opts:opts['byweekday']=[weekday(day,nth) for day,nth in opts.pop('byweekdays')]
            for name in opts.pop('null',[]):opts['byweekday' if name=='byweekdays' else name]=None
            return opts
        def moonargs(opts):
            args=[]
            for key,value in opts.items():
                if key=='frequency':args.append('frequency=@date.'+NAMES[value])
                elif key=='byweekdays':args.append('byweekdays=['+', '.join('@date.RelativeWeekday::new('+str(day)+(', nth='+str(nth) if nth is not None else '')+')' for day,nth in value)+']')
                else:args.append(key+'='+moon(value))
            return ', '.join(args)
        def call(fn):
            try:return fn(),False
            except (ValueError,OverflowError,TypeError,AttributeError):return None,True
        code+='\n///|\ntest '+moon('RRuleLocator original '+str(index)+' '+case['label'])+' {\n'
        code+='  @date.register_timezone("D14/reference-NY", tzif_new_york)\n  defer @date.unregister_timezone("D14/reference-NY")\n  @date.register_timezone("D14/reference-LH", tzif_lord_howe)\n  defer @date.unregister_timezone("D14/reference-LH")\n'
        used={case['base'],case['display'],case['first'].get('zone'),case['last'].get('zone'),case['start'].get('zone')}-{None}
        for name in sorted(used):code+='  let zone_'+name.lower()+' = '+moonzones[name]+'\n'
        opts=pyargs(case['options']);wrapper=ref['rrulewrapper'](case['freq'],tzinfo=zones.get(case['base']),dtstart=pydate(case['start']),**opts)
        locator=ref['RRuleLocator'](wrapper,tz=zones[case['display']])
        code+='  let wrapper = @date.RRuleWrapper::new(@date.'+NAMES[case['freq']]+', dtstart='+moondate(case['start'])+(', timezone=zone_'+case['base'].lower() if case['base'] else '')+(', '+moonargs(case['options']) if case['options'] else '')+')\n'
        code+='  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_'+case['display'].lower()+')\n  let adapter = locator.as_locator()\n  let copy = adapter.copy()\n'
        state_rows=[]
        def meta():
            nonlocal code
            row=dict(frequency=wrapper._rrule._freq,interval=wrapper._rrule._interval,unit=locator._get_unit(),timezone=wrapper._tzinfo is not None,start=fields(wrapper._rrule._dtstart),until=fields(wrapper._rrule._until))
            code+='  assert_true(wrapper.frequency() is @date.'+NAMES[row['frequency']]+')\n  assert_eq(locator.interval(), '+str(row['interval'])+')\n  assert_eq(copy.interval(), '+str(row['interval'])+')\n  assert_eq(copy.unit_scale(), '+moon(float(row['unit']))+')\n  assert_eq(wrapper.timezone() is Some(_), '+moon(row['timezone'])+')\n  assert_eq(wrapper_reference_fields(wrapper.dtstart()), '+moon(row['start'])+')\n  assert_eq(wrapper.until().map(wrapper_reference_fields), '+('None' if row['until'] is None else 'Some('+moon(row['until'])+')')+')\n'
            nonsingular=locator.nonsingular(10.,10.)
            code+='  assert_eq(copy.nonsingular(10.0, 10.0), ('+moon(nonsingular[0])+', '+moon(nonsingular[1])+'))\n'
            return row
        for step in [None,*case['steps']]:
            if step is not None:
                _,error=call(lambda:wrapper.set(**pyargs(step)))
                code+='  assert_eq(try { wrapper.set('+moonargs(step)+'); false } catch { _ => true }, '+moon(error)+')\n'
            before=meta()
            values,error=call(lambda:[float(x) for x in locator.tick_values(pydate(case['first']),pydate(case['last']))])
            code+='  assert_eq(try { Some(locator.tick_values('+moondate(case['first'])+', '+moondate(case['last'])+')) } catch { _ => None }, '+('None' if error else 'Some('+moon(values)+')')+')\n'
            after=meta()
            state_rows.append(dict(step=step,before=before,direct=dict(error=error,values=values),after=after))
            numbers,invalid=call(lambda:[float(x) for x in ref['date2num']([pydate(case['first']),pydate(case['last'])])])
            if not invalid:
                a,b=numbers;lo,hi=sorted(numbers)
                ticks,err=call(lambda:[float(x) for x in locator.tick_values(ref['num2date'](lo,zones[case['display']]),ref['num2date'](hi,zones[case['display']]))])
                expected=[] if err else ticks if a<=b else ticks[::-1]
                code+='  assert_eq(adapter.tick_values('+moon(a)+', '+moon(b)+'), '+moon(expected)+')\n'
                numeric=meta();state_rows[-1]['numeric']=dict(numbers=numbers,error=err,values=expected,meta=numeric)
        code+='}\n';rows.append(dict(case=case,states=state_rows))
    epoch_outputs={};epoch_rows=[]
    for name,epoch,year in [('fraction','2000-01-01T00:00:00.123456',2000),('2400','2400-01-01T00:00:00',2400)]:
        selected=load_reference(path,epoch)
        wrapper=selected['rrulewrapper'](rr.HOURLY,dtstart=dt.datetime(year,1,1))
        locator=selected['RRuleLocator'](wrapper,tz=dt.timezone.utc)
        first=dt.datetime(year,1,1);last=dt.datetime(year,1,1,2)
        direct=[float(x) for x in locator.tick_values(first,last)]
        numeric=[float(x) for x in locator.tick_values(selected['num2date'](0.,dt.timezone.utc),selected['num2date'](2/24,dt.timezone.utc))]
        extra='// Generated original RRuleLocator with custom epoch.\n\n///|\nfn verify_rrule_locator_epoch_reference() -> Unit raise {\n'
        extra+='  let wrapper = @date.RRuleWrapper::new(@date.Hourly, dtstart=@date.RRuleDateTime::naive(@date.datetime('+str(year)+', 1, 1)))\n  let locator = @date.RRuleLocator::new(wrapper, tz="UTC")\n'
        extra+='  assert_eq(locator.tick_values(@date.RRuleDateTime::naive(@date.datetime('+str(year)+', 1, 1)), @date.RRuleDateTime::naive(@date.datetime('+str(year)+', 1, 1, hour=2))), '+moon(direct)+')\n'
        extra+='  assert_eq(locator.as_locator().tick_values(0.0, 2.0 / 24.0), '+moon(numeric)+')\n}\n'
        epoch_outputs[ROOT/'integration'/('epoch_'+name)/'rrule_locator_reference_test.mbt']=formatted(extra)
        epoch_rows.append(dict(epoch=epoch,direct=direct,numeric=numeric))
    payload=dict(dates_source_sha256=DATES_SHA,rrule_source_sha256=RULE_SHA,tz_source_sha256=TZ_SHA,relative_source_sha256=REL_SHA,tz_common_source_sha256=COMMON_SHA,python=sys.version.split()[0],dateutil=dateutil.__version__,epoch='1970-01-01T00:00:00',timezone_reference='original dateutil.tzfile first 32-bit block; registered fixtures, not full IANA engine',cases=rows,epoch_cases=epoch_rows)
    return payload,formatted(code),epoch_outputs


def main():
    parser=argparse.ArgumentParser();parser.add_argument('dates',type=Path);parser.add_argument('--check',action='store_true');args=parser.parse_args()
    with warnings.catch_warnings():
        warnings.simplefilter('ignore',DeprecationWarning);payload,code,epoch_outputs=generate(args.dates)
    for path,text in {ROOT/'testdata/rrule_locator_reference.json':json.dumps(payload,indent=2)+'\n',ROOT/'ticker/date/rrule_locator_reference_test.mbt':code,**epoch_outputs}.items():
        if args.check:
            if not path.exists() or path.read_text()!=text:raise SystemExit('reference differs: '+str(path))
        else:path.write_text(text)
    print('RRuleLocator reference:',len(payload['cases']),'named,',sum(len(c['states']) for c in payload['cases']),'states')
if __name__=='__main__':main()
