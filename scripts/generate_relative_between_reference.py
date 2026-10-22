"""Original relativedelta(first, second), including tzinfo identity and folds."""
from pathlib import Path
import argparse,datetime as dt,hashlib,inspect,json,random,sys
from dateutil import tz
import generate_relative_delta_reference as base
from generate_auto_date_reference import moon,formatted
ROOT=base.ROOT


def generate(source):
    if sys.version_info[:3]!=(3,12,14):raise ValueError('fixed CPython required')
    if hashlib.sha256(Path(inspect.getfile(tz.tzfile)).read_bytes()).hexdigest()!='1149c474c7de4e15e263a978b21f7205a6d9eb7fcf3b3cb4d734ac87db619f5a':raise ValueError('fixed tz source differs')
    ref=base.load_reference(source);cls=ref['relativedelta']
    ny=lambda:tz.tzfile(str(ROOT/'testdata/tzif/new_york.tzif'))
    lh=lambda:tz.tzfile(str(ROOT/'testdata/tzif/lord_howe.tzif'))
    manifest=json.loads((ROOT/'testdata/tzif/manifest.json').read_text())
    for name in ['new_york','lord_howe']:
        if hashlib.sha256((ROOT/'testdata/tzif'/(name+'.tzif')).read_bytes()).hexdigest()!=manifest[name]['sha256']:raise ValueError('fixture differs')
    pairs=[]
    utc=dt.timezone.utc
    dates=[dt.datetime(1,1,1,tzinfo=utc),dt.datetime(9999,12,31,23,59,59,999999,tzinfo=utc),
           dt.datetime(2020,1,31,23,59,59,999999,tzinfo=utc),dt.datetime(2020,2,29,tzinfo=utc),
           dt.datetime(2021,2,28,23,tzinfo=utc),dt.datetime(2024,3,31,tzinfo=utc),dt.datetime(2024,4,30,tzinfo=utc)]
    for i,a in enumerate(dates):
        for j,b in enumerate(dates):
            pairs.append(('UTC/'+str(i)+'/'+str(j),a,b,'UTC'))
    fixed=dt.timezone(dt.timedelta(seconds=561))
    for a,b in [(dates[2].replace(tzinfo=fixed),dates[3]),(dates[2],dates[3].replace(tzinfo=fixed))]:
        pairs.extend([('fixed second offset',a,b,'FIXED'),('fixed reverse',b,a,'FIXED')])
    for mode in ['NY-same','NY-separate','NY-UTC','LH-same','LH-separate']:
        zone=lh() if mode.startswith('LH') else ny()
        other=(lh() if mode.startswith('LH') else ny()) if mode.endswith('separate') else utc if mode.endswith('UTC') else zone
        date_args=[((2024,3,11,1,30),(2024,3,9,1,30)),((2024,11,4,1,30),(2024,11,2,1,30)),
                   ((2024,11,3,1,30),(2024,11,3,1,30)),((2024,4,8,1,45),(2024,4,6,1,45)),
                   ((2024,10,7,2,15),(2024,10,5,2,15))]
        for args1,args2 in date_args:
            a=dt.datetime(*args1,tzinfo=zone);b=dt.datetime(*args2,tzinfo=other,fold=1)
            pairs.extend([(mode,a,b,mode),(mode+' reverse',b,a,mode)])
    randomizer=random.Random(2026102303)
    for _ in range(80):
        def random_date():return dt.datetime(randomizer.randrange(1950,2050),randomizer.randrange(1,13),randomizer.randrange(1,29),randomizer.randrange(24),randomizer.randrange(60),randomizer.randrange(60),randomizer.randrange(1000000),tzinfo=utc)
        pairs.append(('random UTC',random_date(),random_date(),'UTC'))
    code='// Generated original relativedelta difference construction and reconstruction.\n';rows=[]
    for index,(label,first,second,mode) in enumerate(pairs):
        code+='\n///|\ntest '+moon('relative delta original between '+str(index)+' '+label)+' {\n'
        if mode not in ['UTC','FIXED']:
            blob='tzif_lord_howe' if mode.startswith('LH') else 'tzif_new_york'
            code+='  let first_zone = @date.tzif_timezone('+blob+')\n'
            if mode.endswith('same'):code+='  let second_zone = first_zone\n'
            elif mode.endswith('separate'):code+='  let second_zone = @date.tzif_timezone('+blob+')\n'
        def expression(value):
            result='@date.parse_iso('+moon(value.isoformat())+')'
            if value.tzinfo is not utc and mode not in ['UTC','FIXED']:
                slot='first_zone' if value is first else 'second_zone'
                # Reversed source pairs swap the roles of the original handles.
                # Same/sep still preserve exactly the required identity relation.
                if mode.endswith('UTC'):slot='first_zone'
                result+='.with_timezone('+slot+')'
            return result
        code+='  let first = '+expression(first)+'\n  let second = '+expression(second)+'\n'
        try:
            delta=cls(first,second);reconstructed=second+delta
            attrs={key:getattr(delta,key) for key in ['years','months',*base.RELATIVE]}
            result=[getattr(reconstructed,key) for key in ['year','month','day','hour','minute','second','microsecond']]+[int(reconstructed.utcoffset().total_seconds())]
        except (ValueError,OverflowError):attrs=None;result=None
        rows.append(dict(mode=mode,label=label,first=first.isoformat(),second=second.isoformat(),expected=attrs,reconstructed=result))
        if attrs is None:code+='  assert_true(try { ignore(@date.RelativeDelta::between(first, second)); false } catch { _ => true })\n'
        else:
            code+='  let delta = @date.RelativeDelta::between(first, second)\n  assert_eq(delta.years(), '+str(delta.years)+'L)\n  assert_eq(delta.months(), '+str(delta.months)+')\n'
            code+='  assert_eq(['+', '.join('delta.'+key+'()' for key in base.RELATIVE)+'], '+moon([float(attrs[key]) for key in base.RELATIVE])+')\n'
            code+='  let reconstructed = second.add_relative_delta(delta)\n  assert_eq(['+', '.join('reconstructed.'+key+'()' for key in ['year','month','day','hour','minute','second','microsecond','offset_seconds'])+'], '+moon(result)+')\n'
        code+='}\n'
    payload=dict(source_sha256=base.REL_SHA,python='3.12.14',fixtures={key:manifest[key]['sha256'] for key in ['new_york','lord_howe']},cases=rows)
    return payload,formatted(code)


def main():
    parser=argparse.ArgumentParser();parser.add_argument('source',type=Path);parser.add_argument('--check',action='store_true');args=parser.parse_args();payload,code=generate(args.source)
    for path,text in {ROOT/'testdata/relative_between_reference.json':json.dumps(payload,indent=2)+'\n',ROOT/'ticker/date/relative_between_reference_test.mbt':code}.items():
        if args.check:
            if not path.exists() or path.read_text()!=text:raise SystemExit('reference differs: '+str(path))
        else:path.write_text(text)
    print('relative between:',len(payload['cases']),'named')

if __name__=='__main__':main()
