"""Pinned AutoDateLocator recurrence wiring at DST transitions; original classes only."""
from pathlib import Path
import argparse,datetime as dt,hashlib,inspect,json,sys,types,warnings
import dateutil,dateutil.rrule as rr
from dateutil import tz
from dateutil.relativedelta import relativedelta
from generate_auto_locator_reference import load_reference,FREQUENCIES
from generate_auto_date_reference import moon,formatted
from generate_rrule_wrapper_reference import DATES_SHA,RULE_SHA,TZ_SHA,COMMON_SHA,fields
from generate_rrule_locator_reference import REL_SHA
ROOT=Path(__file__).resolve().parents[1]


def generate(path):
    if sys.version_info[:3]!=(3,12,14) or dateutil.__version__!='2.9.0.post0':raise ValueError('fixed runtime required')
    for source,sha in [(path,DATES_SHA),(Path(inspect.getfile(rr.rrule)),RULE_SHA),(Path(inspect.getfile(tz.tzfile)),TZ_SHA),(Path(inspect.getfile(tz.tzrange.__mro__[1])),COMMON_SHA),(Path(inspect.getfile(relativedelta)),REL_SHA)]:
        if hashlib.sha256(source.read_bytes()).hexdigest()!=sha:raise ValueError('fixed source differs: '+str(source))
    manifest=json.loads((ROOT/'testdata/tzif/manifest.json').read_text())
    for name in ['new_york','lord_howe','paris']:
        if hashlib.sha256((ROOT/'testdata/tzif'/(name+'.tzif')).read_bytes()).hexdigest()!=manifest[name]['sha256']:raise ValueError('fixture differs')
    ref=load_reference(path)
    zones=dict(NY=tz.tzfile(str(ROOT/'testdata/tzif/new_york.tzif')),LH=tz.tzfile(str(ROOT/'testdata/tzif/lord_howe.tzif')),PARIS=tz.tzfile(str(ROOT/'testdata/tzif/paris.tzif')),NEG=tz.tzstr('IST-1GMT0,M10.5.0/2,M3.5.0/1'),FUTURE=tz.tzstr('EST5EDT,M3.2.0/2,M11.1.0/2'))
    moonzones=dict(NY='@date.get_timezone(name="D15/reference-NY")',LH='@date.get_timezone(name="D15/reference-LH")',PARIS='@date.get_timezone(name="D15/reference-PARIS")',NEG='@date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")',FUTURE='@date.tzif_timezone(tzif_new_york)')
    transitions=[('NY','2024-03-10T07:00:00'),('NY','2024-11-03T06:00:00'),('LH','2024-10-05T15:30:00'),('LH','2024-04-06T15:00:00'),('NEG','2024-03-31T01:00:00'),('NEG','2024-10-27T01:00:00'),('FUTURE','2400-11-05T06:00:00'),('FUTURE','2400-03-12T07:00:00'),('PARIS','1900-01-01T00:00:00')]
    windows=[('seconds',dt.timedelta(seconds=-5),dt.timedelta(seconds=5)),('minutes',dt.timedelta(minutes=-45),dt.timedelta(minutes=75)),('hours',dt.timedelta(hours=-3),dt.timedelta(hours=5)),('daily',dt.timedelta(days=-7),dt.timedelta(days=7)),('monthly',dt.timedelta(days=-40),dt.timedelta(days=40))]
    code='// Generated fixed AutoDateLocator -> original wrapper recurrence at transitions.\n';rows=[]
    for zone_name,transition in transitions:
        point=dt.datetime.fromisoformat(transition).replace(tzinfo=dt.timezone.utc)
        selected_windows=windows+([('pyplot fold view',dt.timedelta(hours=-1),dt.timedelta(hours=1))] if zone_name=='FUTURE' and '11-05' in transition else [])
        for label,before,after in selected_windows:
            for multiples in [False,True]:
                lo,hi=[float(x) for x in ref['date2num']([point+before,point+after])]
                zone=zones[zone_name];locator=ref['AutoDateLocator'](tz=zone,interval_multiples=multiples)
                messages=[];ref['_api'].warn_external=lambda message:messages.append(str(message))
                axis=types.SimpleNamespace(get_view_interval=lambda:[lo,hi]);locator.set_axis(axis)
                first,last=locator.viewlim_to_dt();selected=locator.get_locator(first,last)
                decoded=[fields(first),fields(last)]
                meta=dict(frequency=locator._freq,interval=selected._get_interval(),unit=selected._get_unit(),start=fields(selected.rule._rrule._dtstart),until=fields(selected.rule._rrule._until),effective=selected.rule._tzinfo is not None)
                ticks=[float(x) for x in locator()]
                labels=[ref['num2date'](value,zone).strftime('%Y-%m-%d %H:%M:%S %Z %z') for value in ticks]
                chosen_ticks=[float(x) for x in selected()]
                assert ticks==chosen_ticks
                row=dict(zone=zone_name,transition=transition,window=label,multiples=multiples,bounds=[lo,hi],decoded=decoded,meta=meta,ticks=ticks,labels=labels)
                index=len(rows);rows.append(row)
                code+='\n///|\ntest '+moon('automatic wrapper original '+str(index)+' '+zone_name+' '+transition+' '+label+' '+str(multiples))+' {\n'
                if zone_name in ['NY','LH','PARIS']:
                    short={'NY':'new_york','LH':'lord_howe','PARIS':'paris'}[zone_name]
                    code+='  @date.register_timezone("D15/reference-'+zone_name+'", tzif_'+short+')\n  defer @date.unregister_timezone("D15/reference-'+zone_name+'")\n'
                code+='  let zone = '+moonzones[zone_name]+'\n  let locator = @date.AutoDateLocator::new(timezone=zone, interval_multiples='+moon(multiples)+')\n'
                for number,expected in zip([lo,hi],decoded):
                    code+='  assert_eq(wrapper_reference_fields(@date.RRuleDateTime::aware(@date.num2date('+moon(number)+', timezone=zone))), '+moon(expected)+')\n'
                    code+='  assert_eq(wrapper_reference_fields(@date.RRuleDateTime::aware(@date.from_ordinal('+moon(number)+').with_timezone(zone))), '+moon(expected)+')\n'
                code+='  let selected = locator.get_locator_for_range('+moon(lo)+', '+moon(hi)+')\n  let rule = selected.rrule_locator().unwrap().rule()\n'
                code+='  assert_eq(locator.frequency(), @date.'+FREQUENCIES[meta['frequency']]+')\n  assert_eq(selected.interval(), '+str(meta['interval'])+')\n  assert_eq(selected.unit_scale(), '+moon(float(meta['unit']))+')\n  assert_eq(rule.timezone() is Some(_), '+moon(meta['effective'])+')\n  assert_eq(wrapper_reference_fields(rule.dtstart()), '+moon(meta['start'])+')\n  assert_eq(rule.until().map(wrapper_reference_fields), Some('+moon(meta['until'])+'))\n'
                code+='  let ticks = locator.tick_values('+moon(lo)+', '+moon(hi)+')\n  assert_eq(ticks, '+moon(ticks)+')\n  assert_eq(locator.tick_values('+moon(hi)+', '+moon(lo)+'), ticks.rev())\n'
                code+='  assert_eq(locator.as_locator().tick_values('+moon(lo)+', '+moon(hi)+'), ticks)\n  assert_eq(selected.tick_values('+moon(lo)+', '+moon(hi)+'), ticks)\n'
                code+='  assert_eq(@date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(ticks), '+moon(labels)+')\n}\n'
    payload=dict(dates_source_sha256=DATES_SHA,rrule_source_sha256=RULE_SHA,tz_source_sha256=TZ_SHA,tz_common_source_sha256=COMMON_SHA,relative_source_sha256=REL_SHA,python=sys.version.split()[0],dateutil=dateutil.__version__,epoch='1970-01-01T00:00:00',reference='Original classes; NY/LH/PARIS dateutil first compatibility block; future NY tzstr equivalent to supplied TZif footer; negative DST original tzstr.',cases=rows)
    return payload,formatted(code)


def main():
    parser=argparse.ArgumentParser();parser.add_argument('dates',type=Path);parser.add_argument('--check',action='store_true');args=parser.parse_args()
    with warnings.catch_warnings():
        warnings.simplefilter('ignore',DeprecationWarning);payload,code=generate(args.dates)
    for path,text in {ROOT/'testdata/automatic_wrapper_reference.json':json.dumps(payload,indent=2)+'\n',ROOT/'ticker/date/automatic_wrapper_reference_test.mbt':code}.items():
        if args.check:
            if not path.exists() or path.read_text()!=text:raise SystemExit('reference differs: '+str(path))
        else:path.write_text(text)
    print('Automatic wrapper reference:',len(payload['cases']),'named')
if __name__=='__main__':main()
