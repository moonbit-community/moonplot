"""Execute pinned Matplotlib rrulewrapper with original dateutil and a controlled clock."""
from pathlib import Path
import argparse,ast,copy,datetime as dt,functools,hashlib,inspect,json,os,sys,time,types,warnings
import dateutil,dateutil.rrule as rr
from dateutil import tz
from dateutil._common import weekday as common_weekday
from generate_auto_date_reference import moon,formatted
ROOT=Path(__file__).resolve().parents[1]
DATES_SHA='fb8d673fbc57c2499f2dd138c87c6c9520a59b38b60b01a6d59d5eb6540ef233'
RULE_SHA='289cca95a09dd6311bbb8037f1996db256a801487d9d26dd6ce15d8e9ef429ec'
COMMON_SHA='720cc34c036c397bc473ce9c605efb12c962b9269bf0fbb0a6c979f9b5f7fd2e'
TZ_SHA='1149c474c7de4e15e263a978b21f7205a6d9eb7fcf3b3cb4d734ac87db619f5a'
NOW=1781524800123
NAMES=['Yearly','Monthly','Weekly','Daily','Hourly','Minutely','Secondly']
ARRAYS=['bymonth','bymonthday','byyearday','byweekno','byeaster','byweekday','byhour','byminute','bysecond','bysetpos']


def naive(text):return dict(kind='naive',text=text)
def aware(text,zone=None,fold=0):return dict(kind='aware',text=text,zone=zone,fold=fold)


def fields(value):
    if value is None:return None
    return [int(value.tzinfo is not None),value.year,value.month,value.day,value.hour,value.minute,value.second,value.microsecond,0 if value.tzinfo is None else int(value.utcoffset().total_seconds())]


def generate(source):
    if dateutil.__version__!='2.9.0.post0' or sys.version_info[:3]!=(3,12,14):raise ValueError('requires fixed reference runtime')
    for path,sha in [(source,DATES_SHA),(Path(inspect.getfile(rr.rrule)),RULE_SHA),(Path(inspect.getfile(tz.tzfile)),TZ_SHA),(Path(inspect.getfile(tz.tzrange.__mro__[1])),COMMON_SHA)]:
        if hashlib.sha256(path.read_bytes()).hexdigest()!=sha:raise ValueError('fixed source differs: '+str(path))
    fixture_manifest=json.loads((ROOT/'testdata/tzif/manifest.json').read_text())
    for name in ['new_york','lord_howe']:
        if hashlib.sha256((ROOT/'testdata/tzif'/(name+'.tzif')).read_bytes()).hexdigest()!=fixture_manifest[name]['sha256']:raise ValueError('fixture differs')
    node=next(n for n in ast.parse(source.read_text()).body if isinstance(n,ast.ClassDef) and n.name=='rrulewrapper')
    namespace=dict(rrule=rr.rrule,datetime=dt,functools=functools)
    exec(compile(ast.Module(body=[node],type_ignores=[]),str(source),'exec'),namespace)
    wrapper_type=namespace['rrulewrapper'];real_datetime=dt.datetime
    class DateMeta(type):
        def __instancecheck__(cls,value):return isinstance(value,real_datetime)
    clock=dict(calls=0,times=[NOW,NOW+86400000,NOW+172800000])
    class ControlledDateTime(real_datetime,metaclass=DateMeta):
        @classmethod
        def now(cls,tz=None):
            index=min(clock['calls'],len(clock['times'])-1);clock['calls']+=1
            return real_datetime.fromtimestamp(clock['times'][index]/1000,tz=tz)
    old_datetime=rr.datetime;old_tz=os.environ.get('TZ');os.environ['TZ']='UTC0';time.tzset()
    rr.datetime=types.SimpleNamespace(**{**vars(dt),'datetime':ControlledDateTime})
    code='''// Generated original Matplotlib rrulewrapper; no installed Matplotlib import.

///|
fn wrapper_reference_fields(value : @date.RRuleDateTime) -> Array[Int32] {
  let date = value.date()
  [if value.is_naive() { 0 } else { 1 }, date.year(), date.month(), date.day(),
   date.hour(), date.minute(), date.second(), date.microsecond(), date.offset_seconds()]
}
''';rows=[]
    # All queries remain bounded by count/until, except explicitly small xafter.
    spring=aware('2024-03-09T02:30:00.123456','NY')
    start=naive('2024-01-01T00:00:00.123456')
    scenarios=[]
    for base_zone in [None,'UTC','NY','LH','NEG','FIX']:
        for dtstart in [start,spring,aware('2024-11-03T01:30:00','NY',1)]:
            scenarios.append(dict(label='base '+str(base_zone)+' start '+dtstart['text'],base=base_zone,options=dict(freq=3,dtstart=dtstart,count=6)))
    for base_zone in [None,'NY']:
        for count in [0,-1,1]:scenarios.append(dict(label='empty/limited '+str(base_zone)+'/'+str(count),base=base_zone,options=dict(freq=3,dtstart=start,count=count)))
    for frequency in range(7):
        opts=dict(freq=frequency,dtstart=start,count=6)
        scenarios.append(dict(label='frequency '+str(frequency),options=opts))
    for cache in [False,True]:
        scenarios += [dict(label='inferred timezone drop '+str(cache),options=dict(freq=3,dtstart=spring,count=6,cache=cache),steps=[dict(interval=2),dict(dtstart=aware('2024-11-02T01:30:00','NY')),dict(count=0)]),
                      dict(label='failed selector stage '+str(cache),options=dict(freq=3,dtstart=spring,count=6,cache=cache),steps=[dict(interval=3,bysetpos=[0]),dict(null=['bysetpos'])]),
                      dict(label='failed normalize stage '+str(cache),options=dict(freq=3,dtstart=start,count=6,cache=cache),steps=[dict(until=aware('2024-01-05T00:00:00+00:00')),dict(interval=2),dict(dtstart=aware('2024-01-01T00:00:00+00:00'))]),
                      dict(label='null start retains state '+str(cache),options=dict(freq=3,dtstart=spring,count=6,cache=cache),steps=[dict(null=['dtstart']),dict(interval=2),dict(dtstart=start)]),
                      dict(label='null until retains state '+str(cache),base='NY',options=dict(freq=3,dtstart=start,count=6,cache=cache),steps=[dict(null=['until']),dict(until=naive('2024-01-08T00:00:00'))])]
    for base_zone in [None,'NY']:
        scenarios.append(dict(label='omitted dtstart local now '+str(base_zone),base=base_zone,options=dict(freq=3,count=6),steps=[dict(interval=2),dict(bysetpos=[0]),dict(bysetpos=[1])]))
    for name in ['dtstart','until']:
        scenarios.append(dict(label='constructor explicit None '+name,options=dict(freq=3,null=[name],count=6)))
    scenarios.append(dict(label='constructor aware until without zone',options=dict(freq=3,dtstart=start,until=aware('2024-01-05T00:00:00+00:00'))))
    scenarios.append(dict(label='aware until converted to inferred zone',options=dict(freq=3,dtstart=spring,until=aware('2024-03-14T12:00:00+00:00'))))
    for frequency in [0,1,2,3]:
        for weekdays in [[[0,1]],[[0,-1],[4,2]],[[0,None],[1,1]],[[6,0]]]:
            scenarios.append(dict(label='ordinal '+str(frequency)+' '+str(weekdays),options=dict(freq=frequency,dtstart=start,until=naive('2025-12-31T23:59:59'),byweekdays=weekdays),steps=[dict(freq=3),dict(freq=1)]))
    scenarios.append(dict(label='ordinal month mask',options=dict(freq=0,dtstart=start,until=naive('2025-12-31T23:59:59'),bymonth=[2,4],byweekdays=[[0,1]])))
    scenarios.append(dict(label='weekday form replacement',options=dict(freq=1,dtstart=start,until=naive('2024-06-30T23:59:59'),byweekday=[0]),steps=[dict(byweekdays=[[4,-1]]),dict(byweekday=[1]),dict(null=['byweekday'])]))
    scenarios.append(dict(label='configuration array mutation',options=dict(freq=3,dtstart=start,count=3,byhour=[0]),steps=[dict(mutate=dict(byhour=[12])),dict(count=2)]))
    scenarios.append(dict(label='first bound comparison order',options=dict(freq=3,dtstart=start,count=0),steps=[dict(count=1)]))
    scenarios.append(dict(label='year-one inferred fixed offset',options=dict(freq=3,dtstart=aware('0001-01-01T00:00:00+23:00'),count=2)))
    scenarios.append(dict(label='year-one explicit same local zone',base='E23',options=dict(freq=3,dtstart=aware('0001-01-01T00:00:00','E23'),count=2)))
    scenarios.append(dict(label='year-one different-zone overflow',base='UTC',options=dict(freq=3,dtstart=aware('0001-01-01T00:00:00+23:00'),count=2)))
    scenarios.append(dict(label='null optional keywords',options=dict(freq=1,dtstart=start,count=4,until=naive('2024-12-31T23:59:59'),bymonth=[1,2],byweekdays=[[0,None]],cache=True),steps=[dict(null=['count','byweekday','wkst','cache'])]))
    scenarios.append(dict(label='scalar calendar keyword forms',options=dict(freq=1,dtstart=start,count=6,bymonth_value=2,bymonthday_value=29),steps=[dict(bymonth=[4],bymonthday=[-1]),dict(bymonth_value=3,bymonthday_value=15),dict(null=['bymonth','bymonthday'])]))
    for frequency,key,start_text,interval,bad in [(4,'byhour','2024-01-01T12:00:00',24,1),(5,'byminute','2024-01-01T00:07:00',3,0),(6,'bysecond','2024-01-01T00:00:11',3,0)]:
        scenarios.append(dict(label='unreachable clock constructor '+key,options=dict(freq=frequency,dtstart=naive(start_text),interval=interval,count=3,**{key:[bad]})))
    scenarios.append(dict(label='pruned clock core versus raw construction',options=dict(freq=4,dtstart=naive('2024-01-01T12:00:00'),interval=6,byhour=[0,3,12],count=3),steps=[dict(interval=3),dict(byhour=[1]),dict(byhour=[3])]))
    for transition in ['2024-03-31T00:30:00','2024-10-27T00:30:00']:
        for fold in [0,1]:
            scenarios.append(dict(label='negative DST attach '+transition+' fold '+str(fold),base='NEG',options=dict(freq=4,dtstart=aware(transition,'NEG',fold),count=6)))
    try:
        for index,scenario in enumerate(scenarios):
            initial=copy.deepcopy(scenario);clock['calls']=0
            zones=dict(UTC=dt.timezone.utc,NY=tz.tzfile(str(ROOT/'testdata/tzif/new_york.tzif')),LH=tz.tzfile(str(ROOT/'testdata/tzif/lord_howe.tzif')),
                       NEG=tz.tzstr('IST-1GMT0,M10.5.0/2,M3.5.0/1'),FIX=dt.timezone(dt.timedelta(seconds=561)),E23=dt.timezone(dt.timedelta(hours=23)))
            moon_zones=dict(UTC='@date.get_timezone(name="UTC")',NY='@date.get_timezone(name="D14/reference-NY")',LH='@date.get_timezone(name="D14/reference-LH")',NEG='@date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")',FIX='@date.fixed_timezone_seconds(561)',E23='@date.fixed_timezone_seconds(82800)')
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
                result={key:value for key,value in opts.items() if key not in ['null','mutate','byweekdays']}
                for name in ['dtstart','until']:
                    if name in result:result[name]=pydate(result[name])
                if 'byweekdays' in opts:result['byweekday']=[common_weekday(day,nth) for day,nth in opts['byweekdays']]
                for key in ['bymonth','bymonthday']:
                    if key+'_value' in result:result[key]=result.pop(key+'_value')
                for name in opts.get('null',[]):result['byweekday' if name=='byweekdays' else name]=None
                return result
            def moonargs(opts,ctor=False):
                args=[]
                for key,value in opts.items():
                    if key=='freq':args.append(('@date.' if ctor else 'frequency=@date.')+NAMES[value])
                    elif key in ['dtstart','until']:args.append(key+'='+moondate(value))
                    elif key=='byweekdays':args.append('byweekdays=['+', '.join('@date.RelativeWeekday::new('+str(day)+(', nth='+str(nth) if nth is not None else '')+')' for day,nth in value)+']')
                    elif key=='byhour' and scenario['label']=='configuration array mutation' and ctor:args.append('byhour=byhour_input')
                    elif key!='mutate':args.append(key+'='+moon(value))
                if ctor:
                    if scenario.get('base'):args.append('timezone=zone_'+scenario['base'].lower())
                    args.append('context~')
                return ', '.join(args)
            code+='\n///|\ntest '+moon('rrulewrapper original '+str(index)+' '+scenario['label'])+' {\n'
            code+='  @date.register_timezone("D14/reference-NY", tzif_new_york)\n  defer @date.unregister_timezone("D14/reference-NY")\n  @date.register_timezone("D14/reference-LH", tzif_lord_howe)\n  defer @date.unregister_timezone("D14/reference-LH")\n'
            used=set([scenario.get('base')])
            for opts in [scenario['options'],*scenario.get('steps',[])]:
                for key in ['dtstart','until']:
                    if key in opts:used.add(opts[key].get('zone'))
            # Queries use NY for mixed-awareness and same-zone paths.
            used.add('NY')
            for name in sorted(used-{None}):code+='  let zone_'+name.lower()+' = '+moon_zones[name]+'\n'
            code+='  let calls = Ref(0)\n  let times = ['+str(NOW)+'L, '+str(NOW+86400000)+'L, '+str(NOW+172800000)+'L]\n  let context = @date.DateParserContext::utc(clock=fn() { let index = Int32::min(calls.val, 2); calls.val += 1; times[index] })\n'
            if scenario['label']=='configuration array mutation':code+='  let byhour_input = [0]\n'
            kwargs=pyargs(scenario['options']);frequency=kwargs.pop('freq');state_rows=[]
            with warnings.catch_warnings():
                warnings.simplefilter('ignore',DeprecationWarning)
                try:wrapper=wrapper_type(frequency,tzinfo=zones.get(scenario.get('base')),**kwargs)
                except (ValueError,TypeError,AttributeError,OverflowError):wrapper=None
            if wrapper is None:
                for name in sorted(used-{None}):code+='  ignore(zone_'+name.lower()+')\n'
                code+='  assert_true(try { ignore(@date.RRuleWrapper::new('+moonargs(scenario['options'],True)+')); false } catch { _ => true })\n  assert_eq(calls.val, '+str(clock['calls'])+')\n}\n'
                rows.append(dict(scenario=initial,constructor_error=True,clock_calls=clock['calls']));continue
            code+='  let wrapper = @date.RRuleWrapper::new('+moonargs(scenario['options'],True)+')\n'
            actions=[None,*scenario.get('steps',[])]
            for step,action in enumerate(actions):
                if action is not None:
                    if 'mutate' in action:
                        for key,values in action['mutate'].items():
                            scenario['options'][key][:]=values
                            code+='  byhour_input.clear()\n'+''.join('  byhour_input.push('+str(v)+')\n' for v in values)
                    else:
                        with warnings.catch_warnings():
                            warnings.simplefilter('ignore',DeprecationWarning)
                            try:wrapper.set(**pyargs(action));failed=False
                            except (ValueError,TypeError,AttributeError,OverflowError):failed=True
                        code+='  assert_eq(try { wrapper.set('+moonargs(action)+'); false } catch { _ => true }, '+moon(failed)+')\n'
                meta=dict(timezone=wrapper._tzinfo is not None,base=wrapper._base_tzinfo is not None,frequency=wrapper._rrule._freq,interval=wrapper._rrule._interval,count=wrapper._rrule._count,cache=wrapper._rrule._cache is not None,start=fields(wrapper._rrule._dtstart),until=fields(wrapper._rrule._until),clock_calls=clock['calls'])
                state_rows.append(dict(meta=meta,queries=[]))
                code+='  assert_eq(calls.val, '+str(clock['calls'])+')\n  assert_eq(wrapper.timezone() is Some(_), '+moon(meta['timezone'])+')\n  assert_eq(wrapper.base_timezone() is Some(_), '+moon(meta['base'])+')\n  assert_true(wrapper.frequency() is @date.'+NAMES[meta['frequency']]+')\n  assert_eq(wrapper.interval(), '+str(meta['interval'])+')\n  assert_eq(wrapper.count_limit(), '+('None' if meta['count'] is None else 'Some('+str(meta['count'])+')')+')\n  assert_eq(wrapper.cache_enabled(), '+moon(meta['cache'])+')\n  assert_eq(wrapper_reference_fields(wrapper.dtstart()), '+moon(meta['start'])+')\n'
                code+='  assert_eq(wrapper.until().map(wrapper_reference_fields), '+('None' if meta['until'] is None else 'Some('+moon(meta['until'])+')')+')\n'
                query_naive=naive('2024-03-10T02:30:00');query_aware=aware('2024-03-10T02:30:00','NY')
                queries=[('after',query_naive,False,None),('after',query_naive,True,None),('before',query_naive,True,None),('after',query_aware,True,None),('before',query_aware,False,None),
                         ('before',naive('2023-01-01T00:00:00'),False,None),('xafter',query_naive,True,3),('xafter',query_aware,True,0),
                         ('between',(naive('2024-01-01T00:00:00'),naive('2027-01-01T00:00:00')),True,None),
                         ('between',(query_aware,naive('2023-01-01T00:00:00')),False,None)]
                for method,value,inc,count in queries:
                    values=value if method=='between' else (value,)
                    args=[pydate(v) for v in values];margs=[moondate(v) for v in values]
                    if method=='xafter':margs+=['count='+str(count)]
                    margs+=['inc='+moon(inc)]
                    try:
                        result=getattr(wrapper,method)(*args,**({'inc':inc,'count':count} if method=='xafter' else {'inc':inc}))
                        expected=[fields(v) for v in result] if method in ['between','xafter'] else fields(result)
                        error=False
                    except (ValueError,TypeError,AttributeError,OverflowError):expected=None;error=True
                    expression='wrapper.'+method+'('+', '.join(margs)+')'+('.map(wrapper_reference_fields)' if method in ['between','xafter'] else '.map(wrapper_reference_fields)')
                    expected_moon='None' if error else 'Some('+('None' if expected is None else ('Some('+moon(expected)+')' if method in ['after','before'] else moon(expected)))+')'
                    code+='  assert_eq(try { Some('+expression+') } catch { _ => None }, '+expected_moon+')\n'
                    state_rows[-1]['queries'].append(dict(method=method,value=value,inc=inc,count=count,error=error,expected=expected))
                if scenario['label']=='pruned clock core versus raw construction':
                    replaced=[fields(v) for v in wrapper._rrule.replace(interval=1)]
                    code+='  assert_eq(wrapper.raw_rule().replace(interval=1).iter().to_array().map(value => wrapper_reference_fields(@date.RRuleDateTime::naive(value))), '+moon(replaced)+')\n'
                    state_rows[-1]['raw_replaced']=replaced
                raw=[fields(v) for _,v in zip(range(3),wrapper._rrule)]
                code+='  assert_eq(wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields), '+moon(raw)+')\n'
                if wrapper._rrule._count is not None or wrapper._rrule._until is not None:
                    number=wrapper.count();code+='  assert_eq(wrapper.occurrence_count(), '+str(number)+'L)\n';state_rows[-1]['occurrence_count']=number
            code+='}\n';rows.append(dict(scenario=initial,states=state_rows))
    finally:
        rr.datetime=old_datetime
        if old_tz is None:os.environ.pop('TZ',None)
        else:os.environ['TZ']=old_tz
        time.tzset()
    payload=dict(dates_source_sha256=DATES_SHA,rrule_source_sha256=RULE_SHA,tz_source_sha256=TZ_SHA,dateutil=dateutil.__version__,python='3.12.14',now_milliseconds=NOW,tz_common_source_sha256=COMMON_SHA,phase='wrapper constructor/set/query; named locator reference maintained separately',cases=rows)
    return payload,formatted(code)


def main():
    parser=argparse.ArgumentParser();parser.add_argument('dates',type=Path);parser.add_argument('--check',action='store_true');args=parser.parse_args();payload,code=generate(args.dates)
    for path,text in {ROOT/'testdata/rrule_wrapper_reference.json':json.dumps(payload,indent=2)+'\n',ROOT/'ticker/date/rrule_wrapper_reference_test.mbt':code}.items():
        if args.check:
            if not path.exists() or path.read_text()!=text:raise SystemExit('reference differs: '+str(path))
        else:path.write_text(text)
    print('rrulewrapper reference:',len(payload['cases']),'named,',sum(len(c.get('states',[])) for c in payload['cases']),'states')

if __name__=='__main__':main()
