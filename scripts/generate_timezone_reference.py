"""Execute original _get_tzinfo, converters and date formatters with pinned gettz.

The original dateutil module is used only after verifying its SHA. TZPATHS is
isolated to supplied fixture directories. No installed Matplotlib is imported.
"""
from pathlib import Path
import argparse, ast, datetime as dt, hashlib, inspect, io, json, locale, re, sys, types
import numpy as np
import dateutil
from dateutil import tz
import dateutil.tz.tz as tz_impl
import dateutil.tz._common as tz_common
import dateutil.relativedelta as relative
import generate_date_converter_reference as base
from generate_auto_date_reference import moon, formatted, RC_SHA

ROOT=base.ROOT
TZ_SHA='1149c474c7de4e15e263a978b21f7205a6d9eb7fcf3b3cb4d734ac87db619f5a'
RCSETUP_SHA='a052eac4af21ce8cdb58ee49c3ab952af4c2ff5e18f36cc8b741793fa79b5f59'
FORMAT='%Y-%m-%d %H:%M:%S.%f %z %Z'


def load_reference(path):
    if dateutil.__version__!='2.9.0.post0' or np.__version__!='2.3.5':raise ValueError('pinned dateutil/NumPy runtime required')
    for source,sha in [(path.parent/'rcsetup.py',RCSETUP_SHA),(path.parent/'mpl-data/matplotlibrc',RC_SHA),
                       (Path(inspect.getfile(tz.tzfile)),TZ_SHA),(Path(inspect.getfile(tz_common)),'720cc34c036c397bc473ce9c605efb12c962b9269bf0fbb0a6c979f9b5f7fd2e'),(Path(inspect.getfile(relative)),'218fe6825323a196d87ebbe5a1363671ed366a25633c892265faa03536517ee0')]:
        if hashlib.sha256(source.read_bytes()).hexdigest()!=sha:raise ValueError('pinned source differs: '+str(source))
    if not re.search(r'"timezone":\s+validate_string', (path.parent/'rcsetup.py').read_text()):raise ValueError('rc timezone validator differs')
    ref=base.load_reference(path)
    ref['mpl'].rcParams.update(timezone='UTC', **{'text.usetex':False})
    ref['mpl']._val_or_rc=lambda value,key: ref['mpl'].rcParams[key] if value is None else value
    node=next(n for n in ast.parse(path.read_text()).body if isinstance(n,ast.FunctionDef) and n.name=='_get_tzinfo')
    exec(compile(ast.Module(body=[node],type_ignores=[]),str(path),'exec'),ref)
    return ref


def generate(path, zone_dir):
    locale.setlocale(locale.LC_TIME,'C')
    ref=load_reference(path);rows=[];code='// Generated from pinned _get_tzinfo/formatters and verified dateutil gettz.\n'
    manifest=json.loads((ROOT/'testdata/tzif/manifest.json').read_text())
    for key,entry in manifest.items():
        if hashlib.sha256((ROOT/'testdata/tzif'/(key+'.tzif')).read_bytes()).hexdigest()!=entry['sha256']:raise ValueError('fixture differs: '+key)
    old_paths=tz_impl.TZPATHS;old_get=tz.gettz
    # Resolve via original gettz in an isolated fixture path; avoid its caches
    # crossing directory changes. All objects created below are real tzinfo.
    tz_impl.TZPATHS=[str(ROOT/'testdata/tzif')]
    tz.gettz=old_get.nocache
    fixtures=[('new_york.tzif','tzif_new_york'),('paris.tzif','tzif_paris'),('lord_howe.tzif','tzif_lord_howe'),('nuuk.tzif','tzif_nuuk')]
    dates=[dt.datetime(1,1,2,tzinfo=dt.timezone.utc),dt.datetime(1800,1,2,tzinfo=dt.timezone.utc),
           dt.datetime(1900,1,2,tzinfo=dt.timezone.utc),dt.datetime(1970,1,1,tzinfo=dt.timezone.utc),
           dt.datetime(2023,3,1,tzinfo=dt.timezone.utc),dt.datetime(2024,2,28,tzinfo=dt.timezone.utc),dt.datetime(2024,2,29,tzinfo=dt.timezone.utc),dt.datetime(2024,3,1,tzinfo=dt.timezone.utc),dt.datetime(2024,1,1,tzinfo=dt.timezone.utc),dt.datetime(2024,7,1,tzinfo=dt.timezone.utc),
           dt.datetime(2024,3,10,6,59,59,999999,tzinfo=dt.timezone.utc),dt.datetime(2024,3,10,7,tzinfo=dt.timezone.utc),
           dt.datetime(2024,11,3,5,30,tzinfo=dt.timezone.utc),dt.datetime(2024,11,3,6,30,tzinfo=dt.timezone.utc),
           dt.datetime(2038,7,1,tzinfo=dt.timezone.utc),dt.datetime(2400,7,1,tzinfo=dt.timezone.utc),
           dt.datetime(9999,7,1,tzinfo=dt.timezone.utc)]
    specs=['UTC','XST-5:45','XST0:09', 'XST0545', 'X-5','GMT+05:45','UTC-03:30','XST5XDT',
           'EST5EDT,M3.2.0/2,M11.1.0/2','LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2',
           'IST-1GMT0,M10.5.0/2,M3.5.0/1','GMT+3DST','UTC-3DST-5,M3.2.0,M11.1.0', 'XST5XDT,J60/0,J300/0', 'XST5XDT,59/0,300/0', 'XST5XDT,365/0,180/0', 'XST5XDT,M3-2-0/0230,M11-1-0/02:00:30']
    try:
        for name,blob in fixtures+[(s,None) for s in specs]:
            ref['mpl'].rcParams['timezone']=name
            label='timezone original conversion '+name
            code+='\n///|\ntest '+moon(label)+' {\n'
            code+='  let previous = @config.timezone()\n  defer @config.set_timezone(previous)\n'
            if blob:code+='  @date.register_timezone('+moon(name)+', '+blob+')\n  defer @date.unregister_timezone('+moon(name)+')\n'
            code+='  @config.set_timezone('+moon(name)+')\n  let formatter = @date.date_formatter('+moon(FORMAT)+')\n'
            outputs=[]
            for date in dates:
                value=float(ref['date2num'](date));answer=ref['num2date'](value).strftime(FORMAT);outputs.append([value,answer])
                code+='  assert_eq(@date.format_date(@date.num2date('+moon(value)+'), '+moon(FORMAT)+'), '+moon(answer)+')\n'
                code+='  assert_eq(formatter.format_value('+moon(value)+'), '+moon(answer)+')\n'
                code+='  assert_eq(@date.format_date(@date.num2date('+moon(value)+', tz='+moon(name)+'), '+moon(FORMAT)+'), '+moon(answer)+')\n'
            code+='}\n';rows.append(dict(kind='conversion',name=name,fixture=blob,outputs=outputs))
        # Non-UTC files and POSIX strings at constructor/format time. Formatter
        # scalar, concise batch/offset and automatic callbacks use original code.
        switches=[('new_york.tzif','XST-5:45'),('XST-5:45','UTC'),('UTC','EST5EDT,M3.2.0,M11.1.0')]
        values=[float(ref['date2num'](dt.datetime(2024,7,1,h,tzinfo=dt.timezone.utc))) for h in [0,1,2]]
        for before,after in switches:
            ref['mpl'].rcParams['timezone']=before
            locator=ref['AutoDateLocator']();fixed=ref['DateFormatter'](FORMAT)
            auto=ref['AutoDateFormatter'](types.SimpleNamespace(_get_unit=lambda: 1/24),usetex=False)
            auto.scaled={1/24:FORMAT}
            axis=types.SimpleNamespace(__name__='xaxis',get_inverted=lambda:False)
            concise=ref['ConciseDateFormatter'](types.SimpleNamespace(axis=axis),formats=[FORMAT]*6,zero_formats=[FORMAT]*6,offset_formats=[FORMAT]*6)
            info=ref['DateConverter']().axisinfo(None,None)
            explicit_auto=ref['AutoDateFormatter'](types.SimpleNamespace(_get_unit=lambda:1/24),tz=dt.timezone.utc,usetex=False);explicit_auto.scaled={1/24:FORMAT}
            ref['mpl'].rcParams['timezone']=after
            results=dict(fixed=[fixed(v) for v in values],auto=[auto(v) for v in values],concise=concise.format_ticks(values),
                         offset=concise.get_offset(),short=concise.format_data_short(values[0]),
                         explicit=[explicit_auto(v) for v in values],locator=ref['num2date'](values[0],locator.tz).strftime(FORMAT),
                         info_labels=[info.majfmt(v) for v in values],info_zone=ref['num2date'](values[0],info.majloc.tz).strftime(FORMAT))
            code+='\n///|\ntest '+moon('timezone original capture/dynamic '+before+' -> '+after)+' {\n'
            code+='  let previous = @config.timezone()\n  defer @config.set_timezone(previous)\n'
            code+='  @date.register_timezone("new_york.tzif", tzif_new_york)\n  defer @date.unregister_timezone("new_york.tzif")\n'
            code+='  @config.set_timezone('+moon(before)+')\n  let values = '+moon(values)+'\n  let fixed = @date.date_formatter('+moon(FORMAT)+')\n'
            code+='  let locator = @date.AutoDateLocator::new()\n  let info = @date.DateConverter::new().axisinfo()\n'
            code+='  let auto = @date.AutoDateFormatter::new().with_locator_unit(1.0 / 24.0).with_scaled([(1.0 / 24.0, @date.Text('+moon(FORMAT)+'))])\n'
            code+='  let explicit_auto = @date.AutoDateFormatter::new(tz="UTC").with_locator_unit(1.0 / 24.0).with_scaled([(1.0 / 24.0, @date.Text('+moon(FORMAT)+'))])\n'
            code+='  let concise = @date.concise_date_formatter(formats='+moon([FORMAT]*6)+', zero_formats='+moon([FORMAT]*6)+', offset_formats='+moon([FORMAT]*6)+')\n'
            code+='  @config.set_timezone('+moon(after)+')\n'
            for field,call in [('fixed','fixed.format_values(values)'),('auto','auto.format_ticks(values)'),('concise','concise.format_ticks(values)'),('offset','concise.get_offset()'),('short','concise.format_data_short(values[0])'),('explicit','explicit_auto.format_ticks(values)'),('info_labels','info.major_formatter().format_values(values)')]:
                code+='  assert_eq('+call+', '+moon(results[field])+')\n'
            code+='  assert_eq(@date.format_date(locator.as_locator().timezone().unwrap().to_datetime(values[0]), '+moon(FORMAT)+'), '+moon(results['locator'])+')\n'
            code+='  assert_eq(@date.format_date(info.major_locator().timezone().unwrap().to_datetime(values[0]), '+moon(FORMAT)+'), '+moon(results['info_zone'])+')\n}\n'
            rows.append(dict(kind='switch',before=before,after=after,values=values,**results))
        # Resolve getters from original classes for every explicit calendar ctor,
        # independently of their (already accepted) recurrence behavior.
        names=['DayLocator','WeekdayLocator','MonthLocator','YearLocator','HourLocator','MinuteLocator','SecondLocator','MicrosecondLocator']
        nodes=[n for n in ast.parse(path.read_text()).body if isinstance(n,ast.ClassDef) and n.name in names]
        exec(compile(ast.Module(body=nodes,type_ignores=[]),str(path),'exec'),ref)
        ref['mpl'].rcParams['timezone']='XST-5:45'
        ctors=['day_locator','weekday_locator','month_locator','year_locator','hour_locator','minute_locator','second_locator','microsecond_locator']
        code+='\n///|\ntest "timezone original all concrete locators capture defaults" {\n  let previous = @config.timezone()\n  defer @config.set_timezone(previous)\n  @config.set_timezone("XST-5:45")\n  let locators = ['+', '.join('@date.'+name+'()' for name in ctors)+']\n  @config.set_timezone("UTC")\n'
        expected=[int(ref[name]().tz.utcoffset(dt.datetime(2024,1,1)).total_seconds()) for name in names]
        code+='  assert_eq(locators.map(locator => locator.timezone().unwrap().initial_offset_seconds()), '+moon(expected)+')\n}\n'
        rows.append(dict(kind='locator_capture',expected=expected))
        bad=['invalid/D12-zone','XST0:09:21','XST5XDT,M3.2.0/-1,M11.1.0','XST5XDT,M3.2.0/2u,M11.1.0']
        code+='\n///|\ntest "timezone original unknown and unsupported string rejection" {\n'
        for name in bad:
            try:ref['_get_tzinfo'](name)
            except (ValueError,TypeError,OverflowError):pass
            else:raise ValueError('source unexpectedly accepts invalid timezone: '+name)
            code+='  assert_true(try { ignore(@date.get_timezone(name='+moon(name)+')); false } catch { _ => true })\n'
        code+='}\n';rows.append(dict(kind='errors',names=bad))
        slim_code='// Generated using original gettz and exact production IANA slim blobs.\n'
        production=json.loads((ROOT/'ticker/date/tzdb/manifest.json').read_text())['names']
        tz_impl.TZPATHS=[str(zone_dir.resolve())]
        for name in ['America/New_York','Europe/Paris','Europe/Dublin','Australia/Lord_Howe','Pacific/Apia','Asia/Kolkata']:
            data=(zone_dir/name).read_bytes();sha=hashlib.sha256(data).hexdigest()
            if sha!=production[name]['sha256']:raise ValueError('production blob differs: '+name)
            ref['mpl'].rcParams['timezone']=name
            slim_code+='\n///|\ntest '+moon('timezone original production slim '+name)+' {\n  let previous = @config.timezone()\n  defer @config.set_timezone(previous)\n  @tzdb.register_timezone('+moon(name)+')\n  defer @date.unregister_timezone('+moon(name)+')\n  @config.set_timezone('+moon(name)+')\n'
            results=[]
            for date in dates:
                value=float(ref['date2num'](date));answer=ref['num2date'](value).strftime(FORMAT)
                slim_code+='  assert_eq(@date.format_date(@date.num2date('+moon(value)+'), '+moon(FORMAT)+'), '+moon(answer)+')\n'
                results.append([value,answer])
            slim_code+='}\n';rows.append(dict(kind='production_slim',name=name,sha256=sha,outputs=results))

    finally:
        tz_impl.TZPATHS=old_paths;tz.gettz=old_get
    payload=dict(source_sha256=base.base.SHA256 if hasattr(base.base,'SHA256') else 'fb8d673fbc57c2499f2dd138c87c6c9520a59b38b60b01a6d59d5eb6540ef233',
                 dateutil_sha256=TZ_SHA,rcsetup_sha256=RCSETUP_SHA,common_sha256='720cc34c036c397bc473ce9c605efb12c962b9269bf0fbb0a6c979f9b5f7fd2e',relativedelta_sha256='218fe6825323a196d87ebbe5a1363671ed366a25633c892265faa03536517ee0',timezone_default='UTC',numpy=np.__version__,dateutil=dateutil.__version__,
                 fixtures={name:hashlib.sha256((ROOT/'testdata/tzif'/name).read_bytes()).hexdigest() for name,_ in fixtures},cases=rows)
    return payload,formatted(code),formatted(slim_code)


def main():
    parser=argparse.ArgumentParser();parser.add_argument('dates',type=Path);parser.add_argument('zone_dir',type=Path);parser.add_argument('--check',action='store_true');args=parser.parse_args()
    payload,code,slim=generate(args.dates,args.zone_dir)
    files={ROOT/'testdata/timezone_reference.json':json.dumps(payload,indent=2,ensure_ascii=False)+'\n',ROOT/'ticker/date/timezone_reference_test.mbt':code,ROOT/'ticker/date/tzdb/timezone_reference_test.mbt':slim}
    for path,text in files.items():
        if args.check:
            if not path.exists() or path.read_text()!=text:raise SystemExit('reference differs: '+str(path))
        else:path.write_text(text)
    print('timezone reference:',len(payload['cases']),'named cases')

if __name__=='__main__':main()
