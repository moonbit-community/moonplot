"""Original dateutil clock-cycle iteration errors through pinned Matplotlib wrapper."""
from pathlib import Path
import argparse,datetime as dt,hashlib,inspect,json,sys,warnings
import dateutil,dateutil.rrule as rr
from dateutil import tz
from generate_auto_locator_reference import load_reference
from generate_auto_date_reference import moon,formatted
from generate_rrule_wrapper_reference import DATES_SHA,RULE_SHA,TZ_SHA,COMMON_SHA,NAMES,fields
ROOT=Path(__file__).resolve().parents[1]
START=dt.datetime(2024,1,1,12)
BAD=[(5,1440,dict(byhour=[13],byminute=[0])),(5,720,dict(byhour=[5,17],byminute=[0])),(5,90,dict(byhour=[12],byminute=[30])),(6,86400,dict(byhour=[13],byminute=[0],bysecond=[0])),(6,3600,dict(byminute=[1],bysecond=[0])),(6,120,dict(byminute=[1],bysecond=[0]))]
GOOD=[(5,1440,dict(byhour=[12],byminute=[0])),(5,90,dict(byhour=[13],byminute=[30])),(6,86400,dict(byhour=[12],byminute=[0],bysecond=[0])),(6,120,dict(byminute=[2],bysecond=[0]))]


def generate(path):
    if sys.version_info[:3]!=(3,12,14) or dateutil.__version__!='2.9.0.post0':raise ValueError('fixed runtime required')
    for source,sha in [(path,DATES_SHA),(Path(inspect.getfile(rr.rrule)),RULE_SHA),(Path(inspect.getfile(tz.tzfile)),TZ_SHA),(Path(inspect.getfile(tz.tzrange.__mro__[1])),COMMON_SHA)]:
        if hashlib.sha256(source.read_bytes()).hexdigest()!=sha:raise ValueError('fixed source differs: '+str(source))
    ref=load_reference(path);specs=[]
    def add(label,pattern,cache,base,count=None,until=None,start=START,extra=None):
        freq,interval,selectors=pattern
        specs.append(dict(label=label,freq=freq,interval=interval,selectors={**selectors,**(extra or {})},cache=cache,base=base,count=count,until=until,start=start.isoformat()))
    for pattern in [BAD[0],BAD[3]]:
        for cache in [False,True]:
            for base in [False,True]:
                for count in [None,0,-1,1]:
                    for until in [None,START-dt.timedelta(days=1),START,START+dt.timedelta(days=2)]:
                        add('full error boundary matrix',pattern,cache,base,count,until)
    for pattern in [BAD[1],BAD[2],BAD[4],BAD[5]]:
        for cache in [False,True]:
            for base in [False,True]:add('cross-field clock mask',pattern,cache,base,count=2)
    for pattern in GOOD:
        for cache in [False,True]:
            for base in [False,True]:
                for label,count,until in [('valid bounded',2,None),('valid zero count',0,None),('valid early until',None,START-dt.timedelta(days=1))]:add(label,pattern,cache,base,count,until)
    for pattern in [GOOD[0],GOOD[2]]:
        for cache in [False,True]:
            for base in [False,True]:add('calendar filter empty is not clock error',pattern,cache,base,until=START+dt.timedelta(days=1),extra=dict(bymonth=[2]))
    for pattern in [BAD[0],BAD[3]]:
        for start in [dt.datetime(1,1,1,12),dt.datetime(9999,12,31,12)]:
            for cache in [False,True]:add('calendar endpoint clock error',pattern,cache,False,count=0,start=start)
    code='// Generated original clock-cycle iterator/query/count behavior. Fresh cached rule per operation.\n';rows=[]
    for index,case in enumerate(specs):
        start=dt.datetime.fromisoformat(case['start']);until=case['until']
        def date_text(value):return value.isoformat()
        def mdate(value):return '@date.RRuleDateTime::naive(@date.parse_iso('+moon(date_text(value))+'))'
        def make():
            args=dict(dtstart=start,interval=case['interval'],cache=case['cache'],**case['selectors'])
            if case['count'] is not None:args['count']=case['count']
            if until is not None:args['until']=until
            return ref['rrulewrapper'](case['freq'],tzinfo=dt.timezone.utc if case['base'] else None,**args)
        args=['@date.'+NAMES[case['freq']],'dtstart='+mdate(start),'interval='+str(case['interval']),'cache='+moon(case['cache'])]
        if case['base']:args.append('timezone=@date.fixed_timezone(0)')
        if case['count'] is not None:args.append('count='+str(case['count']))
        if until is not None:args.append('until='+mdate(until))
        for name,values in case['selectors'].items():args.append(name+'='+moon(values))
        expression='@date.RRuleWrapper::new('+', '.join(args)+')'
        # Source constructor must succeed; moving this error to __init__ is wrong.
        make()
        code+='\n///|\ntest '+moon('clock iteration original '+str(index)+' '+case['label']+' '+NAMES[case['freq']]+' cache '+str(case['cache'])+' base '+str(case['base'])+' count '+str(case['count'])+' until '+str(until))+' {\n'
        try:early=start-dt.timedelta(days=2)
        except OverflowError:early=dt.datetime(1,1,1)
        try:late=start+dt.timedelta(days=3)
        except OverflowError:late=dt.datetime(9999,12,31,23,59,59)
        queries=[('after',[start],dict(inc=True)),('after',[early],dict(inc=False)),('before',[early],dict(inc=False)),('before',[late],dict(inc=True)),('between',[early,start],dict(inc=False)),('between',[late,early],dict(inc=True)),('xafter',[start],dict(count=0,inc=True)),('xafter',[start],dict(count=2,inc=True)),('count',[],{})]
        results=[]
        for method,values,kwargs in queries:
            wrapper=make()
            try:
                value=getattr(wrapper,method)(*values,**kwargs)
                if method=='xafter':value=list(value)
                expected=value if method=='count' else [fields(v) for v in value] if method in ['between','xafter'] else fields(value)
                error=None
            except (ValueError,TypeError,AttributeError,OverflowError) as exc:expected=None;error=type(exc).__name__
            code+='  let wrapper = '+expression+'\n'
            if method=='count':call='wrapper.occurrence_count()';want=str(expected)+'L' if error is None else None
            else:
                margs=[mdate(v) for v in values]+[name+'='+moon(v) for name,v in kwargs.items()]
                call='wrapper.'+method+'('+', '.join(margs)+').map(wrapper_reference_fields)'
                want=('None' if expected is None else 'Some('+moon(expected)+')') if method in ['before','after'] else moon(expected)
            code+='  assert_eq(try { Some('+call+') } catch { _ => None }, '+('None' if error else 'Some('+want+')')+')\n'
            results.append(dict(method=method,dates=[date_text(v) for v in values],kwargs=kwargs,error=error,expected=expected))
        locator_results=[]
        for numeric in [False,True]:
            wrapper=make();locator=ref['RRuleLocator'](wrapper,tz=dt.timezone.utc)
            lo,hi=[float(value) for value in ref['date2num']([start,late])]
            first,last=(ref['num2date'](lo,dt.timezone.utc),ref['num2date'](hi,dt.timezone.utc)) if numeric else (start,late)
            try:expected=[float(value) for value in locator.tick_values(first,last)];error=None
            except (ValueError,TypeError,AttributeError,OverflowError) as exc:expected=None;error=type(exc).__name__
            code+='  let wrapper = '+expression+'\n  let locator = @date.RRuleLocator::new(wrapper, tz="UTC")\n'
            if numeric:
                code+='  assert_eq(locator.as_locator().tick_values('+moon(lo)+', '+moon(hi)+'), '+moon([] if error else expected)+')\n'
            else:
                code+='  assert_eq(try { Some(locator.tick_values('+mdate(start)+', '+mdate(late)+')) } catch { _ => None }, '+('None' if error else 'Some('+moon(expected)+')')+')\n'
            locator_results.append(dict(numeric=numeric,bounds=[lo,hi],error=error,expected=expected))
        # Iterator creation is lazy; an error closes that same reader.
        wrapper=make();iterator=iter(wrapper._rrule);reads=[]
        code+='  let wrapper = '+expression+'\n  let reader = wrapper.checked_raw_iter()\n'
        for number in range(3):
            try:value=next(iterator,None);expected=fields(value);error=None
            except (ValueError,TypeError,AttributeError,OverflowError) as exc:expected=None;error=type(exc).__name__
            want='None' if expected is None else 'Some('+moon(expected)+')'
            code+='  assert_eq(try { Some(reader.next().map(wrapper_reference_fields)) } catch { _ => None }, '+('None' if error else 'Some('+want+')')+')\n'
            reads.append(dict(error=error,expected=expected))
        code+='}\n'
        serial={**case,'until':None if until is None else until.isoformat()}
        rows.append(dict(case=serial,constructor_succeeds=True,queries=results,reader=reads,locators=locator_results))
    payload=dict(dates_source_sha256=DATES_SHA,rrule_source_sha256=RULE_SHA,tz_source_sha256=TZ_SHA,tz_common_source_sha256=COMMON_SHA,python=sys.version.split()[0],dateutil=dateutil.__version__,fresh_cached_rule_per_operation=True,cases=rows)
    return payload,formatted(code)


def main():
    parser=argparse.ArgumentParser();parser.add_argument('dates',type=Path);parser.add_argument('--check',action='store_true');args=parser.parse_args()
    with warnings.catch_warnings():warnings.simplefilter('ignore',DeprecationWarning);payload,code=generate(args.dates)
    for path,text in {ROOT/'testdata/clock_iteration_reference.json':json.dumps(payload,indent=2)+'\n',ROOT/'ticker/date/clock_iteration_reference_test.mbt':code}.items():
        if args.check:
            if not path.exists() or path.read_text()!=text:raise SystemExit('reference differs: '+str(path))
        else:path.write_text(text)
    print('Clock iteration reference:',len(payload['cases']),'named,',sum(len(c['queries'])+len(c['reader'])+len(c['locators']) for c in payload['cases']),'observations')
if __name__=='__main__':main()
