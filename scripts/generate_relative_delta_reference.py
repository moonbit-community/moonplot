"""Execute pinned original dateutil relativedelta for typed constructor references.

Separate manifests cover application, normalization, differences and object
operations. Constructor coverage alone is not full relativedelta acceptance.
"""
from pathlib import Path
import argparse,hashlib,inspect,json,math,random,types
import dateutil,dateutil._common as common
from generate_auto_date_reference import moon,formatted
ROOT=Path(__file__).resolve().parents[1]
REL_SHA='218fe6825323a196d87ebbe5a1363671ed366a25633c892265faa03536517ee0'
COMMON_SHA='efbc34cb2b64af19586d29fefa50d53d431a6d45d147d237941bffbd0454a946'
RELATIVE=['days','leapdays','hours','minutes','seconds','microseconds']
ABSOLUTE=['year','month','day','hour','minute','second','microsecond']


def load_reference(source):
    if dateutil.__version__!='2.9.0.post0':raise ValueError('requires fixed dateutil runtime')
    for path,sha in [(source,REL_SHA),(source.parent/'_common.py',COMMON_SHA),(Path(inspect.getfile(common)),COMMON_SHA)]:
        if hashlib.sha256(path.read_bytes()).hexdigest()!=sha:raise ValueError('fixed source differs: '+str(path))
    namespace={'__name__':'dateutil._mathplotlib_relative_reference','__package__':'dateutil'}
    exec(compile(source.read_text(),str(source),'exec'),namespace)
    return namespace


def arguments(options):
    args=[]
    for key,value in options.items():
        if key=='on_weekday':
            args.append('on_weekday=@date.RelativeWeekday::new('+str(value[0])+(', nth='+str(value[1]) if value[1] is not None else '')+')')
        elif key in ['years','months']:args.append(key+'='+str(value)+'L')
        elif key in RELATIVE or key=='weeks':args.append(key+'='+moon(float(value)))
        else:args.append(key+'='+moon(value))
    return ', '.join(args)


def generate(source):
    ref=load_reference(source);constructor=ref['relativedelta'];cases=[]
    inputs=[{}, {'years':1,'months':-13},{'years':-1,'months':13},{'months':-25},
            {'days':1.5,'hours':2},{'days':-1.5,'hours':2},{'weeks':-1.5,'days':2.25},
            {'microseconds':-1000001.5},{'hours':-24.5,'minutes':150.25,'seconds':-3601.125},
            {'years':-9223372036854775808,'months':9223372036854775807},
            {'months':-9223372036854775808},{'years':9223372036854775807,'months':-12},
            {'year':0,'month':0,'day':0,'hour':0,'microsecond':0},
            {'year':-1,'month':13,'day':-1,'hour':24,'second':60,'microsecond':1000000},
            {'days':1e100,'hours':-1e99,'microseconds':1e250},
            {'weekday':-7},{'weekday':-1},{'weekday':0},{'weekday':6},
            {'on_weekday':[0,None]},{'on_weekday':[0,0]},{'on_weekday':[0,1]},
            {'on_weekday':[6,-2]},{'on_weekday':[-2147483648,2147483647]}]
    for key in ['microseconds','seconds','minutes','hours']:
        threshold={'microseconds':1000000.,'seconds':60.,'minutes':60.,'hours':24.}[key]
        for value in [math.nextafter(threshold,0),threshold,math.nextafter(threshold,math.inf),-math.nextafter(threshold,0),-threshold,-math.nextafter(threshold,math.inf)]:inputs.append({key:value})
    for day in [-2147483648,-1,0,1,59,60,61,365,366]:
        inputs.extend([{'yearday':day,'leapdays':2.5},{'nlyearday':day,'leapdays':-3.5},
                       {'yearday':day,'nlyearday':60,'month':7,'day':8,'leapdays':4.25}])
    randomizer=random.Random(20261023)
    for _ in range(80):
        options={key:randomizer.randrange(-10000000,10000000)/randomizer.choice([1,2,8,10,1000000]) for key in RELATIVE if key!='leapdays'}
        options.update(years=randomizer.randrange(-20000,20000),months=randomizer.randrange(-20000,20000))
        inputs.append(options)
    code='// Generated from original dateutil relativedelta constructor/_fix.\n'
    for index,options in enumerate(inputs):
        kwargs=options.copy()
        if 'on_weekday' in kwargs:
            day,nth=kwargs.pop('on_weekday');kwargs['weekday']=ref['weekday'](day,nth)
        delta=constructor(**kwargs)
        attrs={key:getattr(delta,key) for key in ['years','months',*RELATIVE,*ABSOLUTE]}
        attrs['weekday']=None if delta.weekday is None else [delta.weekday.weekday,delta.weekday.n]
        attrs['weeks']=delta.weeks;attrs['has_time']=bool(delta._has_time)
        cases.append(dict(options=options,expected=attrs))
        code+='\n///|\ntest '+moon('relative delta original constructor '+str(index))+' {\n  let delta = @date.RelativeDelta::new('+arguments(options)+')\n'
        code+='  assert_eq(delta.years(), '+str(delta.years)+'L)\n  assert_eq(delta.months(), '+str(delta.months)+')\n'
        code+='  assert_eq(['+', '.join('delta.'+key+'()' for key in RELATIVE)+'], '+moon([float(attrs[key]) for key in RELATIVE])+')\n'
        code+='  assert_eq(['+', '.join('delta.'+key+'()' for key in ABSOLUTE)+'], ['+', '.join('None' if attrs[key] is None else 'Some('+str(attrs[key])+')' for key in ABSOLUTE)+'])\n'
        code+='  assert_eq(delta.weeks(), '+moon(float(delta.weeks))+')\n  assert_eq(delta.has_time(), '+moon(bool(delta._has_time))+')\n'
        if delta.weekday is None:code+='  assert_true(delta.weekday() is None)\n'
        else:
            code+='  assert_eq(delta.weekday().unwrap().weekday(), '+str(delta.weekday.weekday)+')\n'
            code+='  assert_eq(delta.weekday().unwrap().nth(), '+('None' if delta.weekday.n is None else 'Some('+str(delta.weekday.n)+')')+')\n'
        code+='}\n'
    code+='\n///|\ntest "relative delta original constructor rejected inputs" {\n'
    errors=[{'weekday':7},{'weekday':-8},{'yearday':367},{'nlyearday':2147483647}]
    for options in errors:
        try:constructor(**options)
        except (ValueError,IndexError):pass
        else:raise ValueError('source accepted invalid input')
        code+='  assert_true(try { ignore(@date.RelativeDelta::new('+arguments(options)+')); false } catch { _ => true })\n'
    code+='}\n'
    payload=dict(phase='constructor subset; see separate application/normalization/between/operation manifests',relative_source_sha256=REL_SHA,weekday_source_sha256=COMMON_SHA,dateutil=dateutil.__version__,cases=cases,errors=errors)
    return payload,formatted(code)


def main():
    parser=argparse.ArgumentParser();parser.add_argument('source',type=Path);parser.add_argument('--check',action='store_true');args=parser.parse_args()
    payload,code=generate(args.source)
    files={ROOT/'testdata/relative_delta_reference.json':json.dumps(payload,indent=2)+'\n',ROOT/'ticker/date/relative_delta_reference_test.mbt':code}
    for path,text in files.items():
        if args.check:
            if not path.exists() or path.read_text()!=text:raise SystemExit('reference differs: '+str(path))
        else:path.write_text(text)
    print('relative delta constructor reference:',len(payload['cases']),'named + 1 error group; constructor subset')

if __name__=='__main__':main()
