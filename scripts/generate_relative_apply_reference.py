"""Execute fixed dateutil calendar application, including DST and float accumulation."""
from pathlib import Path
import argparse,datetime as dt,hashlib,inspect,json,random,sys
from dateutil import tz
from generate_relative_delta_reference import ROOT,REL_SHA,COMMON_SHA,load_reference,arguments
from generate_auto_date_reference import moon,formatted


def generate(source):
    ref=load_reference(source);constructor=ref['relativedelta']
    datetime_source=ROOT/'.moonagent/upstream/cpython-v3.12.14/Modules/_datetimemodule.c'
    if hashlib.sha256(datetime_source.read_bytes()).hexdigest()!='cd11d1f38e9e637c7404c98ff45e355053b7f7e8251015d58a4c1f17e6d5f8a8':raise ValueError('datetime accumulation source differs')
    if sys.version_info[:3]!=(3,12,14):raise ValueError('requires fixed CPython3.12.14')
    if hashlib.sha256(Path(inspect.getfile(tz.tzstr)).read_bytes()).hexdigest()!='1149c474c7de4e15e263a978b21f7205a6d9eb7fcf3b3cb4d734ac87db619f5a':raise ValueError('tzstr source differs')
    if hashlib.sha256(Path(inspect.getfile(tz.tzstr)).with_name('_common.py').read_bytes()).hexdigest()!='720cc34c036c397bc473ce9c605efb12c962b9269bf0fbb0a6c979f9b5f7fd2e':raise ValueError('tzrange source differs')
    manifest=json.loads((ROOT/'testdata/tzif/manifest.json').read_text())
    for name in ['new_york','lord_howe']:
        if hashlib.sha256((ROOT/'testdata/tzif'/(name+'.tzif')).read_bytes()).hexdigest()!=manifest[name]['sha256']:raise ValueError('fixture differs')
    options=[{}, {'months':1},{'months':-1},{'years':1},{'years':-4,'months':13},
             {'year':0,'month':0,'day':0},{'month':13},{'month':25,'months':-11},{'year':0,'years':1},
             {'days':1.5,'hours':2.25},{'hours':25,'day':1,'weekday':0},{'hours':-25,'day':31,'on_weekday':[0,-1]},
             {'day':32},{'day':0},{'day':-1},{'hour':24},{'year':-1,'years':2},
             {'year':2024,'month':2,'day':31},{'yearday':60},{'yearday':366},{'nlyearday':60},
             {'leapdays':1.5},{'days':1e100,'leapdays':-1e100}, {'weekday':6},
             {'on_weekday':[0,0]},{'on_weekday':[-9999,2]},{'on_weekday':[6,-2]},
             {'hours':1},{'days':1},{'weeks':1.5},{'microseconds':0.5}, {'microseconds':-0.5},
             {'microseconds':0.49999999999999994},{'microseconds':-0.49999999999999994},
             {'seconds':0.0000005},{'days':0.000000000005787037},{'microseconds':1.5,'seconds':-0.000001},
             {'years':9223372036854775807},{'months':-9223372036854775808},{'on_weekday':[0,-2147483648]}]
    randomizer=random.Random(2026102301)
    for _ in range(60):
        options.append(dict(years=randomizer.randrange(-4,5),months=randomizer.randrange(-24,25),
                            days=randomizer.randrange(-60,60)/8,hours=randomizer.randrange(-60,60)/10,
                            minutes=randomizer.randrange(-600,600)/10,seconds=randomizer.randrange(-120,120)/16,
                            microseconds=randomizer.randrange(-2000000,2000000)/10))
    zone_ny=tz.tzfile(str(ROOT/'testdata/tzif/new_york.tzif'));zone_lh=tz.tzfile(str(ROOT/'testdata/tzif/lord_howe.tzif'))
    ny_posix=tz.tzstr('EST5EDT,M3.2.0,M11.1.0')
    bases=[(dt.datetime(1,1,1,tzinfo=dt.timezone.utc),None),(dt.datetime(9999,12,31,23,59,59,999999,tzinfo=dt.timezone.utc),None),
           (dt.datetime(2020,1,31,23,58,57,123457,tzinfo=dt.timezone.utc),None),
           (dt.datetime(2024,2,29,12,30,tzinfo=dt.timezone.utc),None),
           (dt.datetime(1970,1,1,microsecond=1,tzinfo=dt.timezone(dt.timedelta(seconds=561))),None),
           (dt.datetime(2024,3,9,2,30,tzinfo=zone_ny),'tzif_new_york'),
           (dt.datetime(2024,3,10,1,30,tzinfo=zone_ny),'tzif_new_york'),
           (dt.datetime(2024,11,2,1,30,tzinfo=zone_ny),'tzif_new_york'),
           (dt.datetime(2024,11,3,1,30,tzinfo=zone_ny,fold=1),'tzif_new_york'),
           (dt.datetime(2400,3,11,2,30,tzinfo=zone_ny),'tzif_new_york'),
           (dt.datetime(2024,10,5,2,15,tzinfo=zone_lh),'tzif_lord_howe'),
           (dt.datetime(2024,4,7,1,45,tzinfo=zone_lh,fold=1),'tzif_lord_howe'),
           (dt.datetime(2400,3,11,2,30,tzinfo=ny_posix),'NY_POSIX')]
    code='// Generated from original relativedelta.__add__ and reference datetime.timedelta.\n';rows=[]
    for index,opts in enumerate(options):
        kwargs=opts.copy()
        if 'on_weekday' in kwargs:weekday,nth=kwargs.pop('on_weekday');kwargs['weekday']=ref['weekday'](weekday,nth)
        delta=constructor(**kwargs)
        code+='\n///|\ntest '+moon('relative delta original application '+str(index))+' {\n  @date.register_timezone("D13/reference-NY", tzif_new_york)\n  defer @date.unregister_timezone("D13/reference-NY")\n  @date.register_timezone("D13/reference-LH", tzif_lord_howe)\n  defer @date.unregister_timezone("D13/reference-LH")\n  let delta = @date.RelativeDelta::new('+arguments(opts)+')\n'
        observations=[]
        for base,blob in bases:
            text=base.isoformat();expr='@date.parse_iso('+moon(text)+')'
            if blob:
                name={'tzif_new_york':'D13/reference-NY','tzif_lord_howe':'D13/reference-LH','NY_POSIX':'EST5EDT,M3.2.0,M11.1.0'}[blob]
                expr+='.with_timezone(@date.get_timezone(name='+moon(name)+'))'
            try:
                result=base+delta
                expected=[getattr(result,key) for key in ['year','month','day','hour','minute','second','microsecond']]+[int(result.utcoffset().total_seconds())]
            except (OverflowError,ValueError):expected=None
            observations.append(dict(base=text,zone=blob,expected=expected))
            if expected is None:
                code+='  assert_true(try { ignore('+expr+'.add_relative_delta(delta)); false } catch { _ => true })\n'
            else:
                code+='  { let result = '+expr+'.add_relative_delta(delta)\n'
                code+='    assert_eq(['+', '.join('result.'+key+'()' for key in ['year','month','day','hour','minute','second','microsecond','offset_seconds'])+'], '+moon(expected)+')\n  }\n'
        code+='}\n';rows.append(dict(options=opts,observations=observations))
    payload=dict(source_sha256=REL_SHA,weekday_sha256=COMMON_SHA,phase='application subset; see separate object-operation manifests',python='3.12.14',datetime_source_sha256='cd11d1f38e9e637c7404c98ff45e355053b7f7e8251015d58a4c1f17e6d5f8a8',tz_source_sha256='1149c474c7de4e15e263a978b21f7205a6d9eb7fcf3b3cb4d734ac87db619f5a',fixtures={name:manifest[name]['sha256'] for name in ['new_york','lord_howe']},cases=rows)
    return payload,formatted(code)


def main():
    parser=argparse.ArgumentParser();parser.add_argument('source',type=Path);parser.add_argument('--check',action='store_true');args=parser.parse_args()
    payload,code=generate(args.source)
    for path,text in {ROOT/'testdata/relative_apply_reference.json':json.dumps(payload,indent=2)+'\n',ROOT/'ticker/date/relative_apply_reference_test.mbt':code}.items():
        if args.check:
            if not path.exists() or path.read_text()!=text:raise SystemExit('reference differs: '+str(path))
        else:path.write_text(text)
    print('relative application:',len(payload['cases']),'named,',sum(len(row['observations']) for row in payload['cases']),'observations')

if __name__=='__main__':main()
