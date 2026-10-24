"""Execute pinned Matplotlib datestr2num and dateutil parser with controlled local time."""
from pathlib import Path
import argparse,ast,calendar,datetime as dt,decimal,hashlib,inspect,io,json,os,re,string,sys,sysconfig,time,types,warnings
import six,numpy as np,dateutil,dateutil.parser
from dateutil import relativedelta,tz
from generate_auto_date_reference import moon,formatted
import generate_concise_date_reference as date_base
from generate_parser_foundation_reference import PARSER_SHA,TEST_SHA,ROOT

TZ_SHA='1149c474c7de4e15e263a978b21f7205a6d9eb7fcf3b3cb4d734ac87db619f5a'
NOW=int(dt.datetime(2026,6,15,12,tzinfo=dt.timezone.utc).timestamp()*1000)


class Clock:
    def __init__(self):self.values=[NOW];self.calls=0
    def read(self):
        value=self.values[min(self.calls,len(self.values)-1)];self.calls+=1;return value
    def reset(self,values):self.values=values;self.calls=0


def load_parser(source,clock):
    if hashlib.sha256(source.read_bytes()).hexdigest()!=PARSER_SHA:raise ValueError('parser source differs')
    tz_source=source.parent.parent/'tz/tz.py'
    if hashlib.sha256(tz_source.read_bytes()).hexdigest()!=TZ_SHA:raise ValueError('timezone source differs')
    class FixedDateTime(dt.datetime):
        @classmethod
        def now(cls,tz=None):
            millis=clock.read();raw=time.localtime(millis/1000)
            return dt.datetime(raw.tm_year,raw.tm_mon,raw.tm_mday,raw.tm_hour,raw.tm_min,raw.tm_sec,(millis%1000)*1000)
    fake_time=types.SimpleNamespace(localtime=lambda value=None:time.localtime(clock.read()/1000 if value is None else value),
                                    timezone=time.timezone,altzone=time.altzone,daylight=time.daylight,tzname=time.tzname)
    ns=dict(re=re,string=string,time=fake_time,warnings=warnings,warn=warnings.warn,StringIO=io.StringIO,six=six,
            integer_types=(int,),text_type=str,monthrange=calendar.monthrange,Decimal=decimal.Decimal,
            datetime=types.SimpleNamespace(datetime=FixedDateTime,timedelta=dt.timedelta),relativedelta=relativedelta,tz=tz)
    names={'_timelex','_resultbase','parserinfo','_ymd','parser','ParserError','UnknownTimezoneWarning'}
    nodes=[n for n in ast.parse(source.read_text()).body if isinstance(n,ast.ClassDef) and n.name in names]
    exec(compile(ast.Module(body=nodes,type_ignores=[]),str(source),'exec'),ns)
    return ns['parser']()


def zone_bytes(zone_dir,name):
    data=(zone_dir/name).read_bytes()
    expected=json.loads((ROOT/'ticker/date/tzdb/manifest.json').read_text())['names'][name]['sha256']
    if hashlib.sha256(data).hexdigest()!=expected:raise ValueError('IANA production blob differs: '+name)
    return data


def generate(dates_source,parser_source,zone_dir):
    if dateutil.__version__!='2.9.0.post0' or np.__version__!='2.3.5':raise ValueError('requires pinned dateutil/NumPy runtime')
    if hashlib.sha256(Path(inspect.getfile(tz.tzlocal)).read_bytes()).hexdigest()!=TZ_SHA:raise ValueError('installed tzlocal source differs from the fixed source')
    if sysconfig.get_config_var('HAVE_DECL_TZNAME')!=0:raise ValueError('requires pinned CPython sampling timezone profile')
    previous=os.environ.get('TZ');original_parse=dateutil.parser.parse
    old_tzdir=os.environ.pop('TZDIR',None)
    groups=[];code='// Generated from original datestr2num/default parser under controlled TZ/clock.\n'
    base_inputs=[r['text'] for r in json.loads((ROOT/'testdata/parser_fields_reference.json').read_text())['cases']]
    modes=['UTC','America/New_York','Europe/Paris','Europe/Dublin','Australia/Lord_Howe','Asia/Kolkata','POSIX:XST-14','POSIX:XST12','POSIX:XST-0:09:21','OVERRIDE:Europe/Dublin','POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2']
    common=['10:30','Jan 1','Wed','Feb 29','Jan of 76','2024-01-01 10:30 UTC','2024-01-01 10:30 GMT',
            '2024-01-01 10:30 EST','2024-07-01 10:30 EDT','2024-01-01 10:30 CET','2024-01-01 10:30 IST',
            '2024-07-01 10:30 IST','2024-01-01 10:30 BRST','2024-11-03 01:30 EST','2024-11-03 01:30 EDT',
            '2024-03-10 02:30 EST','2024-03-10 02:30 EDT','2024-01-01 10:30 EST+0300',
            '2024-07-01 10:30 GMT','2024-01-01 10:30 IST-0300',
            '1900-01-01 10:30 CET','1800-01-01 10:30 EST','0001-01-01 00:00 +2300',
            '9999-12-31 23:30 -2300','2024-01-01 23:59:59.123456789',
            '2024-04-07 01:45 LHST','2024-04-07 01:45 LHDT','2024-10-06 02:15 LHST','2024-10-06 02:15 LHDT']
    arrays=[[],['2024-01-01 12:00 UTC','2024-01-02 12:00'],['2024-01-01 12:00','2024-01-02 12:00 UTC'],
            ['2024-03-10 00:00 UTC','2024-03-10 02:30','2024-11-03 01:30'],
            ['2024-01-01 12:00 BRST','Jan 2'],['2024-01-01','invalid'],['invalid','2024-01-01'],
            ['2024-01-01','0001-01-01 00:00 +2300'],['2024-01-01 UTC','Jan 2'],
            ['2024-01-01 12:00 UTC','9999-12-31 23:30 -2300'],['Jan 1','Jan 2'],
            ['2024-01-01 12:00 UTC','2024-04-07 01:45','2024-10-06 02:15'],
            ['2024-01-01 12:00 UTC','2024-03-31 01:30','2024-10-27 01:30']]
    try:
        for zone in modes:
            if zone=='UTC':os.environ['TZ']='UTC0';zone_hash='POSIX UTC0'
            elif zone.startswith('POSIX:'):os.environ['TZ']=zone[6:];zone_hash=zone
            else:
                key=zone.removeprefix('OVERRIDE:');data=zone_bytes(zone_dir,key);os.environ['TZ']=str((zone_dir/key).resolve());zone_hash=hashlib.sha256(data).hexdigest()
            time.tzset()
            if zone.startswith('OVERRIDE:'):
                time.timezone=-3600;time.altzone=0;time.tzname=('IST','GMT');time.daylight=1
            clock=Clock();parser=load_parser(parser_source,clock)
            dateutil.parser.parse=parser.parse
            namespace=date_base.load_reference(dates_source)
            nodes=[n for n in ast.parse(dates_source.read_text()).body if (isinstance(n,ast.FunctionDef) and n.name=='datestr2num') or
                   (isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='_dateutil_parser_parse_np_vectorized' for t in n.targets))]
            exec(compile(ast.Module(body=nodes,type_ignores=[]),str(dates_source),'exec'),namespace)
            examples=[(s,dt.datetime(2003,9,25),None) for s in base_inputs] if zone=='UTC' else []
            examples += [(s,None,None) for s in common]
            for values in arrays:
                examples += [(values,None,None),(values,dt.datetime(2024,1,31,23,58,57,123456),None)]
            year_end=int(dt.datetime(2026,12,31,23,55,tzinfo=dt.timezone.utc).timestamp()*1000)
            examples.append((['10:00','11:00'],None,[year_end,year_end+400000,year_end+500000]))
            if zone=='UTC':
                midnight=int(dt.datetime(2026,12,31,23,59,59,tzinfo=dt.timezone.utc).timestamp()*1000)
                examples.append((['10:00','11:00'],None,[midnight,midnight+2000,midnight+3000]))
            rows=[]
            for index,(value,fallback,sequence) in enumerate(examples):
                sequence=sequence or [NOW];clock.reset(sequence)
                with warnings.catch_warnings(record=True) as caught:
                    warnings.simplefilter('always')
                    try:
                        result=namespace['datestr2num'](value,default=fallback)
                        expected=[float(v) for v in result] if isinstance(value,list) else float(result)
                    except (ValueError,OverflowError,TypeError,decimal.DecimalException):expected=None
                warning_names=[]
                for warning in caught:
                    if type(warning.message).__name__=='UnknownTimezoneWarning':
                        warning_names.append(re.search(r'tzname (\S+) identified',str(warning.message)).group(1))
                code+='\n///|\ntest '+moon('string parser original reference: '+zone+'/'+str(index))+' {\n'
                code+='  let calls = Ref(0)\n  let times = Ref(['+str(NOW)+'L])\n'
                code+='  let clock = fn() { let index = Int32::min(calls.val, times.val.length() - 1); calls.val += 1; times.val[index] }\n'
                context=('@date.DateParserContext::utc(clock~)' if zone=='UTC' else '@date.DateParserContext::from_posix('+moon(zone[6:])+', clock~)' if zone.startswith('POSIX:') else '@tzdb.parser_context('+moon(zone.removeprefix('OVERRIDE:'))+', clock~)' + ('.with_local_info(3600, 0, ["IST", "GMT"])' if zone.startswith('OVERRIDE:') else ''))
                code+='  let parser = @date.DateStringParser::new(context='+context+')\n'
                code+='  assert_eq(parser.reference_year(), '+str(parser.info._year)+')\n'
                code+='  assert_eq(parser.local_names(), '+moon(list(time.tzname))+')\n'
                code+='  assert_eq(parser.local_offsets(), ('+str(-time.timezone)+', '+str(-time.altzone)+'))\n'
                code+='  calls.val = 0\n  times.val = ['+', '.join(str(x)+'L' for x in sequence)+']\n'
                method='@date.datestrs2num' if isinstance(value,list) else '@date.datestr2num'
                call=method+'('+moon(value)+', parser~'+(', default_date=@date.parse_iso('+moon(fallback.isoformat())+')' if fallback else '')+')'
                code+='  let result = try { Some('+call+') } catch { _ => None }\n'
                code+='  assert_eq(result, '+('None' if expected is None else 'Some('+moon(expected)+')')+')\n'
                code+='  assert_eq(calls.val, '+str(clock.calls)+')\n'
                code+='  assert_eq(parser.warnings(), ['+', '.join('@date.UnknownTimezone('+moon(name)+')' for name in warning_names)+'])\n}\n'
                rows.append(dict(value=value,default=fallback.isoformat() if fallback else None,clock=sequence,result=expected,
                                 clock_calls=clock.calls,warnings=warning_names,other_warnings=[type(w.message).__name__ for w in caught if type(w.message).__name__!='UnknownTimezoneWarning']))
            groups.append(dict(zone=zone,tzif_sha256=zone_hash,reference_year=parser.info._year,names=time.tzname,
                               offsets=[-time.timezone,-time.altzone],cases=rows))
        epoch_outputs={};epoch_rows=[]
        os.environ['TZ']='UTC0';time.tzset()
        for name,epoch,year in [('2400','2400-01-01T00:00:00',2400),('fraction','2000-01-01T00:00:00.123456',2000)]:
            clock=Clock();clock.reset([int(dt.datetime(year,1,1,tzinfo=dt.timezone.utc).timestamp()*1000)])
            parser=load_parser(parser_source,clock);dateutil.parser.parse=parser.parse
            namespace=date_base.load_reference(dates_source,epoch)
            exec(compile(ast.Module(body=nodes,type_ignores=[]),str(dates_source),'exec'),namespace)
            extra='// Generated from original datestr2num under a fixed custom epoch.\n\n///|\nfn verify_string_parser_epoch_reference(parser : @date.DateStringParser) -> Unit raise {\n'
            examples=['January 1, '+str(year)+' 00:00:00.123456',[str(year)+'-01-01 13:00 UTC','Jan 2 '+str(year)+' 10:00'],['10:00','11:00']]
            for value in examples:
                result=namespace['datestr2num'](value)
                expected=[float(v) for v in result] if isinstance(value,list) else float(result)
                function='@date.datestrs2num' if isinstance(value,list) else '@date.datestr2num'
                extra+='  assert_eq('+function+'('+moon(value)+', parser~), '+moon(expected)+')\n'
                epoch_rows.append(dict(epoch=epoch,value=value,result=expected))
            extra+='}\n'
            epoch_outputs[ROOT/'tests/integration'/('epoch_'+name)/'string_parser_reference_test.mbt']=formatted(extra)
    finally:
        dateutil.parser.parse=original_parse
        if previous is None:os.environ.pop('TZ',None)
        else:os.environ['TZ']=previous
        if old_tzdir is not None:os.environ['TZDIR']=old_tzdir
        time.tzset()
    manifest=dict(matplotlib_commit='d3ca9172e392048ec242b90e8423e88d1a3000b2',dates_py_sha256=date_base.SHA256,
                  dateutil_version=dateutil.__version__,parser_sha256=PARSER_SHA,tz_py_sha256=TZ_SHA,
                  python=sys.version.split()[0],numpy=np.__version__,timezone_profile='CPython HAVE_DECL_TZNAME=0 sampling',
                  constructor_clock=NOW,epoch_cases=epoch_rows,named_case_count=sum(len(g['cases']) for g in groups),groups=groups,
                  note='Original scalar/flat datestr2num with exact NumPy vectorization probe and mixed-aware conversion, warning and clock counts. No installed Matplotlib imported.')
    outputs={ROOT/'ticker/date/tzdb/string_parser_reference_test.mbt':formatted(code),ROOT/'testdata/string_parser_reference.json':json.dumps(manifest,ensure_ascii=False,indent=2)+'\n'}
    outputs.update(epoch_outputs)
    return outputs


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('dates_py',type=Path);p.add_argument('parser_py',type=Path);p.add_argument('zoneinfo',type=Path);p.add_argument('--check',action='store_true');args=p.parse_args()
    for path,value in generate(args.dates_py,args.parser_py,args.zoneinfo).items():
        if args.check:
            if path.read_text()!=value:raise SystemExit('reference differs: '+str(path.relative_to(ROOT)))
        else:path.write_text(value)
    print(('Verified' if args.check else 'Generated')+' complete string parser references')


if __name__=='__main__':main()
