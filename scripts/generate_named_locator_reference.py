"""Execute six original pinned calendar locator constructors and inherited queries."""
from pathlib import Path
import argparse,ast,copy,datetime as dt,hashlib,inspect,json,os,sys,time,types,warnings
import dateutil,dateutil.rrule as rr
from dateutil import tz
from dateutil._common import weekday
from generate_auto_locator_reference import load_reference
from generate_auto_date_reference import moon,formatted
from generate_rrule_wrapper_reference import DATES_SHA,RULE_SHA,TZ_SHA,COMMON_SHA,NAMES,NOW,fields,naive,aware
ROOT=Path(__file__).resolve().parents[1]
CLASSES=['Month','Weekday','Day','Hour','Minute','Second']
SELECTORS=dict(Month='bymonth',Weekday='byweekday',Day='bymonthday',Hour='byhour',Minute='byminute',Second='bysecond')
SPANS=dict(Month=dt.timedelta(days=100),Weekday=dt.timedelta(days=21),Day=dt.timedelta(days=10),Hour=dt.timedelta(hours=5),Minute=dt.timedelta(minutes=5),Second=dt.timedelta(seconds=5))


def load(path,epoch='1970-01-01T00:00:00'):
    ref=load_reference(path,epoch)
    names={name+'Locator' for name in CLASSES}|{'_get_tzinfo'}
    nodes=[n for n in ast.parse(path.read_text()).body if isinstance(n,(ast.ClassDef,ast.FunctionDef)) and n.name in names]
    ref['mpl'].rcParams['timezone']='UTC'
    ref['mpl']._val_or_rc=lambda value,key:ref['mpl'].rcParams.get(key,False) if value is None else value
    exec(compile(ast.Module(body=nodes,type_ignores=[]),str(path),'exec'),ref)
    return ref


def generate(path):
    if sys.version_info[:3]!=(3,12,14) or dateutil.__version__!='2.9.0.post0':raise ValueError('fixed runtime required')
    for source,sha in [(path,DATES_SHA),(Path(inspect.getfile(rr.rrule)),RULE_SHA),(Path(inspect.getfile(tz.tzfile)),TZ_SHA),(Path(inspect.getfile(tz.tzrange.__mro__[1])),COMMON_SHA)]:
        if hashlib.sha256(source.read_bytes()).hexdigest()!=sha:raise ValueError('fixed source differs: '+str(source))
    manifest=json.loads((ROOT/'testdata/tzif/manifest.json').read_text())
    for name in ['new_york','lord_howe','paris']:
        if hashlib.sha256((ROOT/'testdata/tzif'/(name+'.tzif')).read_bytes()).hexdigest()!=manifest[name]['sha256']:raise ValueError('fixture differs')
    ref=load(path);specs=[]
    def add(kind,label,options=None,*,zone='UTC',first=None,last=None,steps=None,rc='UTC',pre=None):
        start=dt.datetime(2024,1,31,3,7,11,123456)
        specs.append(dict(kind=kind,label=label,options=options or {},zone=zone,first=first or naive(start.isoformat()),last=last or naive((start+SPANS[kind]).isoformat()),steps=steps or [],rc=rc,pre=pre or []))
    variants=dict(Month=[dict(bymonth_value=2,bymonthday_value=-1),dict(bymonth=[1,3,6],bymonthday=[1,15]),dict(null=['bymonthday']),dict(bymonth=[4],null=['bymonth']),dict(interval=3)],
                  Weekday=[dict(byweekday_value=0),dict(byweekday=[1,4]),dict(on_weekday=[0,2]),dict(byweekdays=[[0,1],[4,-1]]),dict(null=['byweekday']),dict(interval=3)],
                  Day=[dict(bymonthday_value=-1),dict(bymonthday=[1,15,-1]),dict(bymonthday_value=5,null=['bymonthday']),dict(interval=2)],
                  Hour=[dict(byhour_value=12),dict(byhour=[0,12,23]),dict(byhour=[0],null=['byhour']),dict(interval=7),dict(interval=24,byhour_value=1)],
                  Minute=[dict(byminute_value=17),dict(byminute=[0,15,45]),dict(byminute=[0],null=['byminute']),dict(interval=7)],
                  Second=[dict(bysecond_value=17),dict(bysecond=[0,15,45]),dict(bysecond=[0],null=['bysecond']),dict(interval=7)])
    for kind in CLASSES:
        for is_aware in [False,True]:
            for zone in ['UTC','FIX','NY']:
                args={}
                if is_aware:
                    start=dt.datetime(2024,1,31,3,7,11,123456)
                    args=dict(first=aware(start.isoformat(),'NY'),last=aware((start+SPANS[kind]).isoformat(),'NY'))
                add(kind,'defaults aware '+str(is_aware)+' display '+zone,zone=zone,**args)
        for opts in variants[kind]:add(kind,'selectors '+str(opts),opts,steps=[dict(frequency=1)] if kind=='Weekday' and ('on_weekday' in opts or 'byweekdays' in opts) else [])
        add(kind,'capture rc',zone=None,rc='XST-5:45')
        add(kind,'invalid display after clock',zone='INVALID')
        add(kind,'invalid default rc after clock',zone=None,rc='invalid/D17-reference')
        key=SELECTORS[kind]
        steps=[dict(interval=2),dict(count=0),dict(null=['count'],frequency=1 if kind=='Weekday' else 3),dict(bysetpos=[0],interval=3),dict(null=['bysetpos'])]
        add(kind,'live metadata and failed core',steps=steps)
        first_value={'Month':1,'Weekday':0,'Day':1,'Hour':0,'Minute':0,'Second':0}[kind]
        second_value={'Month':3,'Weekday':4,'Day':15,'Hour':12,'Minute':30,'Second':30}[kind]
        add(kind,'external selector array',dict(**{key:[first_value]}),pre=[dict(mutate=[second_value])],steps=[dict(mutate=[first_value]),dict(interval=3)])
    add('Day','invalid interval before clock',dict(interval=0),zone='INVALID')
    add('Day','negative interval before clock',dict(interval=-1))
    for zone,a,b in [('NY','2024-03-10T00:00:00','2024-03-10T05:00:00'),('NY','2024-11-03T00:00:00','2024-11-03T04:00:00'),('LH','2024-10-06T01:00:00','2024-10-06T04:00:00'),('NEG','2024-03-31T00:00:00','2024-03-31T04:00:00'),('PARIS','1900-01-01','1900-01-02')]:
        for kind in CLASSES:
            # Reduce dense minute/second selectors while retaining transition masks.
            opts=dict(byminute=[0,30]) if kind=='Minute' else dict(bysecond=[0]) if kind=='Second' else {}
            add(kind,'transition '+zone+' '+a,opts,zone=zone,first=aware(a,zone),last=aware(b,zone))
    for kind in CLASSES:
        for a,b in [('0001-01-01','0001-01-02'),('9999-12-30','9999-12-31T23:59:59'),('2024-03-31','2024-02-29')]:
            opts=dict(bysecond_value=0) if kind=='Second' else dict(byminute_value=0) if kind=='Minute' else {}
            add(kind,'bounds '+a+'/'+b,opts,first=naive(a),last=naive(b))
    real_datetime=dt.datetime;clock=dict(calls=0)
    class DateMeta(type):
        def __instancecheck__(cls,value):return isinstance(value,real_datetime)
    class ControlledDateTime(real_datetime,metaclass=DateMeta):
        @classmethod
        def now(cls,tz=None):
            index=clock['calls'];clock['calls']+=1
            return real_datetime.fromtimestamp((NOW+index*86400000)/1000,tz=tz)
    old_datetime=rr.datetime;old_tz=os.environ.get('TZ');os.environ['TZ']='UTC0';time.tzset()
    rr.datetime=types.SimpleNamespace(**{**vars(dt),'datetime':ControlledDateTime})
    code='// Generated six original Matplotlib locator classes, timezone helper and core recurrence.\n';rows=[]
    try:
        for index,case in enumerate(specs):
            initial=copy.deepcopy(case);clock['calls']=0;kind=case['kind'];ref['mpl'].rcParams['timezone']=case['rc']
            zones=dict(UTC=dt.timezone.utc,NY=tz.tzfile(str(ROOT/'testdata/tzif/new_york.tzif')),LH=tz.tzfile(str(ROOT/'testdata/tzif/lord_howe.tzif')),PARIS=tz.tzfile(str(ROOT/'testdata/tzif/paris.tzif')),FIX=dt.timezone(dt.timedelta(seconds=561)),NEG=tz.tzstr('IST-1GMT0,M10.5.0/2,M3.5.0/1'),INVALID='invalid/D17-reference')
            moonzones=dict(UTC='@date.get_timezone(name="UTC")',NY='@date.get_timezone(name="D17/reference-NY")',LH='@date.get_timezone(name="D17/reference-LH")',PARIS='@date.get_timezone(name="D17/reference-PARIS")',FIX='@date.fixed_timezone_seconds(561)',NEG='@date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")')
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
                result={key[:-6] if key.endswith('_value') else 'freq' if key=='frequency' else key:value for key,value in opts.items() if key not in ['null','byweekdays','on_weekday','mutate']}
                if 'byweekdays' in opts:result['byweekday']=[weekday(day,nth) for day,nth in opts['byweekdays']]
                if 'on_weekday' in opts:result['byweekday']=weekday(*opts['on_weekday'])
                for key in opts.get('null',[]):result[key]=None
                return result
            def moonargs(opts,ctor=False):
                result=[]
                for key,value in opts.items():
                    if key=='mutate':continue
                    if key=='frequency':text='@date.'+NAMES[value]
                    elif key=='on_weekday':text='@date.RelativeWeekday::new('+str(value[0])+', nth='+str(value[1])+')'
                    elif key=='byweekdays':text='['+', '.join('@date.RelativeWeekday::new('+str(day)+', nth='+str(nth)+')' for day,nth in value)+']'
                    elif case['label']=='external selector array' and ctor and key==SELECTORS[kind]:text='selector_input'
                    else:text=moon(value)
                    result.append(key+'='+text)
                return ', '.join(result)
            def call(fn):
                try:return fn(),False
                except (ValueError,TypeError,AttributeError,OverflowError):return None,True
            code+='\n///|\ntest '+moon('named locator original '+str(index)+' '+kind+' '+case['label'])+' {\n'
            code+='  let previous_rc = @config.timezone()\n  defer @config.set_timezone(previous_rc)\n  @config.set_timezone('+moon(case['rc'])+')\n'
            used={case['zone'],case['first'].get('zone'),case['last'].get('zone')}-{None,'INVALID'}
            for name in sorted(used):
                if name in ['NY','LH','PARIS']:
                    short=dict(NY='new_york',LH='lord_howe',PARIS='paris')[name]
                    code+='  @date.register_timezone("D17/reference-'+name+'", tzif_'+short+')\n  defer @date.unregister_timezone("D17/reference-'+name+'")\n'
                code+='  let zone_'+name.lower()+' = '+moonzones[name]+'\n'
            code+='  let calls = Ref(0)\n  let context = @date.DateParserContext::utc(clock=fn() { let now = '+str(NOW)+'L + Int64::from_int(calls.val) * 86400000L; calls.val += 1; now })\n'
            if case['label']=='external selector array':code+='  let selector_input = '+moon(case['options'][SELECTORS[kind]])+'\n'
            args=pyargs(case['options']);zone=zones.get(case['zone'])
            locator,error=call(lambda:ref[kind+'Locator'](**args,tz=zone))
            margs=moonargs(case['options'],True)
            margs+=(', ' if margs else '')+'context~'
            if case['zone']=='INVALID':margs+=', tz="invalid/D17-reference"'
            elif case['zone'] is not None:margs+=', timezone=zone_'+case['zone'].lower()
            expr='@date.'+kind+'Locator::new('+margs+')'
            if error:
                for name in sorted(used):code+='  ignore(zone_'+name.lower()+')\n'
                code+='  assert_true(try { ignore('+expr+'); false } catch { _ => true })\n  assert_eq(calls.val, '+str(clock['calls'])+')\n}\n'
                rows.append(dict(case=initial,constructor_error=True,calls=clock['calls']));continue
            code+='  let locator = '+expr+'\n  let wrapper = locator.rule()\n  let generic = locator.as_rrule_locator()\n  let adapter = locator.as_locator()\n  let copy = adapter.copy()\n'
            # Capture after construction: later rc changes do not alter the display zone.
            ref['mpl'].rcParams['timezone']='UTC';code+='  @config.set_timezone("UTC")\n'
            def action(opts):
                nonlocal code
                if 'mutate' in opts:
                    key=SELECTORS[kind];args[key][:]=opts['mutate']
                    code+='  selector_input.clear()\n'+''.join('  selector_input.push('+str(value)+')\n' for value in opts['mutate'])
                    return False
                _,error=call(lambda:locator.rule.set(**pyargs(opts)))
                code+='  assert_eq(try { wrapper.set('+moonargs(opts)+'); false } catch { _ => true }, '+moon(error)+')\n'
                return error
            for step in case['pre']:action(step)
            states=[]
            def meta():
                nonlocal code
                rule=locator.rule._rrule
                raw=[fields(value) for _,value in zip(range(3),rule)]
                row=dict(clock_calls=clock['calls'],frequency=rule._freq,interval=rule._interval,unit=locator._get_unit(),effective=locator.rule._tzinfo is not None,start=fields(rule._dtstart),until=fields(rule._until),raw=raw)
                code+='  assert_eq(calls.val, '+str(row['clock_calls'])+')\n  assert_true(wrapper.frequency() is @date.'+NAMES[row['frequency']]+')\n  assert_eq(locator.interval(), '+str(row['interval'])+')\n  assert_eq(copy.interval(), '+str(row['interval'])+')\n  assert_eq(copy.unit_scale(), '+moon(float(row['unit']))+')\n  assert_eq(wrapper.timezone() is Some(_), '+moon(row['effective'])+')\n  assert_eq(wrapper_reference_fields(wrapper.dtstart()), '+moon(row['start'])+')\n  assert_eq(wrapper.until().map(wrapper_reference_fields), '+('None' if row['until'] is None else 'Some('+moon(row['until'])+')')+')\n  assert_eq(wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields), '+moon(raw)+')\n'
                return row
            for step in [None,*case['steps']]:
                if step is not None:action(step)
                before=meta()
                ticks,error=call(lambda:[float(x) for x in locator.tick_values(pydate(case['first']),pydate(case['last']))])
                expected='None' if error else 'Some('+moon(ticks)+')'
                code+='  assert_eq(try { Some(locator.tick_values('+moondate(case['first'])+', '+moondate(case['last'])+')) } catch { _ => None }, '+expected+')\n'
                code+='  assert_eq(try { Some(generic.tick_values('+moondate(case['first'])+', '+moondate(case['last'])+')) } catch { _ => None }, '+expected+')\n'
                row=dict(step=step,before=before,ticks=ticks,error=error,after=meta())
                numbers,invalid=call(lambda:[float(x) for x in ref['date2num']([pydate(case['first']),pydate(case['last'])])])
                if not invalid:
                    a,b=numbers;lo,hi=sorted(numbers)
                    vals,error=call(lambda:[float(x) for x in locator.tick_values(ref['num2date'](lo,locator.tz),ref['num2date'](hi,locator.tz))])
                    vals=[] if error else vals if a<=b else vals[::-1]
                    code+='  assert_eq(adapter.tick_values('+moon(a)+', '+moon(b)+'), '+moon(vals)+')\n'
                    row['numeric']=dict(bounds=numbers,ticks=vals,error=error,after=meta())
                if case['label']=='defaults aware False display UTC':
                    shifted=copy.copy(locator);shifted.set_tzinfo(dt.timezone(dt.timedelta(hours=3)))
                    vals=[float(x) for x in shifted.tick_values(ref['num2date'](lo,shifted.tz),ref['num2date'](hi,shifted.tz))]
                    code+='  let shifted = locator.with_offset(180)\n  assert_eq(shifted.timezone().initial_offset_seconds(), 10800)\n  assert_eq(shifted.as_locator().tick_values('+moon(lo)+', '+moon(hi)+'), '+moon(vals)+')\n'
                    row['shifted']=dict(ticks=vals,after=meta())
                    shifted.set_tzinfo(zones['UTC'])
                    vals=[float(x) for x in shifted.tick_values(ref['num2date'](lo,shifted.tz),ref['num2date'](hi,shifted.tz))]
                    code+='  let restored = shifted.with_timezone(zone_utc)\n  assert_eq(restored.as_locator().tick_values('+moon(lo)+', '+moon(hi)+'), '+moon(vals)+')\n'
                    row['restored']=dict(ticks=vals,after=meta())
                states.append(row)
            code+='}\n';rows.append(dict(case=initial,constructor_error=False,states=states))
    finally:
        rr.datetime=old_datetime
        if old_tz is None:os.environ.pop('TZ',None)
        else:os.environ['TZ']=old_tz
        time.tzset()
    epoch_outputs={};epoch_rows=[]
    for name,epoch,year in [('fraction','2000-01-01T00:00:00.123456',2000),('2400','2400-01-01T00:00:00',2400)]:
        selected=load(path,epoch)
        extra='// Generated six original named locators with custom epoch.\n\n///|\nfn verify_named_locator_epoch_reference() -> Unit raise {\n  let context = @date.DateParserContext::utc(clock=fn() { '+str(NOW)+'L })\n'
        for kind in CLASSES:
            locator=selected[kind+'Locator'](tz=dt.timezone.utc)
            first=dt.datetime(year,1,1,microsecond=123456);last=first+SPANS[kind]
            direct=[float(x) for x in locator.tick_values(first,last)]
            bounds=[float(x) for x in selected['date2num']([dt.datetime(year,1,1),dt.datetime(year,1,1)+SPANS[kind]])]
            numeric=[float(x) for x in locator.tick_values(selected['num2date'](bounds[0],dt.timezone.utc),selected['num2date'](bounds[1],dt.timezone.utc))]
            # Exact field construction avoids depending on parser/host defaults.
            def date_expr(value):return '@date.datetime('+str(value.year)+', '+str(value.month)+', '+str(value.day)+', hour='+str(value.hour)+', minute='+str(value.minute)+', second='+str(value.second)+', microsecond='+str(value.microsecond)+')'
            variable=kind.lower()
            extra+='  let '+variable+' = @date.'+kind+'Locator::new(tz="UTC", context~)\n'
            extra+='  assert_eq('+variable+'.tick_values(@date.RRuleDateTime::naive('+date_expr(first)+'), @date.RRuleDateTime::naive('+date_expr(last)+')), '+moon(direct)+')\n'
            extra+='  assert_eq('+variable+'.as_locator().tick_values('+moon(bounds[1])+', '+moon(bounds[0])+'), '+moon(numeric[::-1])+')\n'
            epoch_rows.append(dict(epoch=epoch,kind=kind,bounds=bounds,direct=direct,numeric=numeric))
        extra+='}\n'
        epoch_outputs[ROOT/'integration'/('epoch_'+name)/'named_locator_reference_test.mbt']=formatted(extra)
    payload=dict(dates_source_sha256=DATES_SHA,rrule_source_sha256=RULE_SHA,tz_source_sha256=TZ_SHA,tz_common_source_sha256=COMMON_SHA,python=sys.version.split()[0],dateutil=dateutil.__version__,host_timezone='UTC0',now_milliseconds=NOW,cases=rows,epoch_cases=epoch_rows)
    return payload,formatted(code),epoch_outputs


def main():
    parser=argparse.ArgumentParser();parser.add_argument('dates',type=Path);parser.add_argument('--check',action='store_true');args=parser.parse_args()
    with warnings.catch_warnings():
        warnings.simplefilter('ignore',DeprecationWarning);payload,code,epoch_outputs=generate(args.dates)
    for path,text in {ROOT/'testdata/named_locator_reference.json':json.dumps(payload,indent=2)+'\n',ROOT/'ticker/date/named_locator_reference_test.mbt':code,**epoch_outputs}.items():
        if args.check:
            if not path.exists() or path.read_text()!=text:raise SystemExit('reference differs: '+str(path))
        else:path.write_text(text)
    print('Named locator reference:',len(payload['cases']),'named,',sum(len(c.get('states',[])) for c in payload['cases']),'states')
if __name__=='__main__':main()
