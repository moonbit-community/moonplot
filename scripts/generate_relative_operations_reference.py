"""Original dateutil arithmetic, precedence, equality and weeks-property reference."""
from pathlib import Path
import argparse,copy,datetime as dt,json,math,random
import generate_relative_delta_reference as base
from generate_auto_date_reference import moon,formatted
ROOT=base.ROOT


def generate(source):
    ref=base.load_reference(source);cls=ref['relativedelta'];manifest,_=base.generate(source)
    options=[row['options'] for row in manifest['cases']]
    def construct(opts):
        kwargs=opts.copy()
        if 'on_weekday' in kwargs:day,nth=kwargs.pop('on_weekday');kwargs['weekday']=ref['weekday'](day,nth)
        return cls(**kwargs)
    code='// Generated original relativedelta object operations; finite Double/Int64 typed domain.\n';rows=[]
    def emit(label,expression,result):
        nonlocal code
        code+='\n///|\ntest '+moon('relative delta original '+label)+' {\n'
        try:
            if not -2**63<=result.years<2**63:raise OverflowError()
            expected={key:getattr(result,key) for key in ['years','months',*base.RELATIVE,*base.ABSOLUTE]}
            for key in base.RELATIVE:
                if not math.isfinite(float(expected[key])):raise OverflowError()
            expected['weekday']=None if result.weekday is None else [result.weekday.weekday,result.weekday.n]
            expected['zero']=not bool(result)
        except (OverflowError,AttributeError):expected=None
        rows.append(dict(label=label,expected=expected))
        if expected is None:code+='  assert_true(try { ignore('+expression+'); false } catch { _ => true })\n}\n';return
        code+='  let result = '+expression+'\n'
        code+='  assert_eq(result.years(), '+str(result.years)+'L)\n  assert_eq(result.months(), '+str(result.months)+')\n'
        code+='  assert_eq(['+', '.join('result.'+key+'()' for key in base.RELATIVE)+'], '+moon([float(expected[key]) for key in base.RELATIVE])+')\n'
        code+='  assert_eq(['+', '.join('result.'+key+'()' for key in base.ABSOLUTE)+'], ['+', '.join('None' if expected[key] is None else 'Some('+str(expected[key])+')' for key in base.ABSOLUTE)+'])\n'
        if result.weekday is None:code+='  assert_true(result.weekday() is None)\n'
        else:
            code+='  assert_eq(result.weekday().unwrap().weekday(), '+str(result.weekday.weekday)+')\n'
            code+='  assert_eq(result.weekday().unwrap().nth(), '+('None' if result.weekday.n is None else 'Some('+str(result.weekday.n)+')')+')\n'
        code+='  assert_eq(result.is_zero(), '+moon(not bool(result))+')\n}\n'
    def call(opts):return '@date.RelativeDelta::new('+base.arguments(opts)+')'
    # Absolute zero is present and must override; leapdays has truthy precedence.
    choices=[{},dict(year=2000,month=2,day=29,hour=1,minute=2,second=3,microsecond=4,leapdays=2.5,weekday=0),
             dict(year=0,month=0,day=0,hour=0,minute=0,second=0,microsecond=0,leapdays=-3.5,on_weekday=[6,-2]),
             dict(years=3,months=-11,days=1.5,hours=-23.5,microseconds=-1000000.5),
             dict(years=-9223372036854775808,months=11),dict(years=9223372036854775807,months=-11),
             dict(years=1,months=-1),dict(years=-1,months=1)]
    for i,a in enumerate(choices):
        for j,b in enumerate(choices):
            first=construct(a);second=construct(b)
            for name,operation in [('add',lambda:first+second),('subtract',lambda:first-second)]:
                result=operation();emit(name+' '+str(i)+'/'+str(j),call(a)+'.'+name+'('+call(b)+')',result)
    randomizer=random.Random(2026102304)
    for index in range(70):
        a=options[randomizer.randrange(len(options))];b=options[randomizer.randrange(len(options))]
        first=construct(a);second=construct(b)
        for name,operation in [('add',lambda:first+second),('subtract',lambda:first-second)]:
            emit(name+' random '+str(index),call(a)+'.'+name+'('+call(b)+')',operation())
    unary=[*choices,*options[:25],dict(days=1e100,hours=-23.5),dict(leapdays=0.25,day=0,on_weekday=[0,0])]
    for index,opts in enumerate(unary):
        value=construct(opts)
        emit('negated '+str(index),call(opts)+'.negated()',-value)
        emit('absolute '+str(index),call(opts)+'.abs()',abs(value))
        for weeks in [-1.5,0.,1.25]:
            result=copy.copy(value);result.weeks=weeks
            emit('weeks '+str(index)+'/'+str(weeks),call(opts)+'.with_weeks('+moon(weeks)+')',result)
        for duration in [dt.timedelta(days=2,seconds=86399,microseconds=999999),dt.timedelta(microseconds=-1)]:
            expression=call(opts)+'.add_timedelta(@date.timedelta(days='+str(duration.days)+', seconds='+str(duration.seconds)+'L, microseconds='+str(duration.microseconds)+'L))'
            emit('timedelta '+str(index)+'/'+str(duration),expression,value+duration)
    scales=[{},dict(days=1.75,hours=-12.5,minutes=0.25,seconds=0.125,microseconds=-0.5),
            choices[1],choices[2],choices[4],choices[5],dict(days=0.5,hours=-12),dict(days=0.1,hours=-2.4),
            dict(years=8384883669867977728,months=-11)]
    for index,opts in enumerate(scales):
        value=construct(opts)
        for factor in [-2.,-0.5,0.,1.,1.1,1.5,2.,math.pi,2.**100,2.**300,1e100]:
            for name,operation in [('scaled',lambda:value*factor),('divided',lambda:value/factor)]:
                try:result=operation()
                except (ValueError,OverflowError,ZeroDivisionError):result=None
                emit(name+' '+str(index)+'/'+str(factor),call(opts)+'.'+name+'('+moon(factor)+')',result)
    # Equality of weekday objects differs from relativedelta equality.
    equality=[{},dict(year=0),dict(day=0),dict(hour=0),dict(days=0.0),dict(leapdays=0.0),
              dict(on_weekday=[0,None]),dict(on_weekday=[0,0]),dict(on_weekday=[0,1]),dict(on_weekday=[0,-1]),dict(on_weekday=[7,1]),dict(on_weekday=[0,2])]
    eq_rows=[];code+='\n///|\ntest "relative delta original equality and zero semantics" {\n'
    for i,a in enumerate(equality):
        for j,b in enumerate(equality):
            answer=construct(a)==construct(b);eq_rows.append([i,j,answer])
            code+='  assert_eq('+call(a)+' == '+call(b)+', '+moon(answer)+')\n'
    code+='}\n'
    # Datetime subtraction negates relative fields only, retaining absolutes.
    code+='\n///|\ntest "relative delta original datetime subtraction absolute fields" {\n'
    date=dt.datetime(2024,7,15,12,34,56,123456,tzinfo=dt.timezone.utc)
    for opts in [choices[1],choices[2],dict(months=1,day=31,leapdays=1.5,weekday=0),dict(days=1.5,hours=2)]:
        result=date-construct(opts);expected=[getattr(result,key) for key in ['year','month','day','hour','minute','second','microsecond']]
        code+='  { let result = @date.parse_iso('+moon(date.isoformat())+').sub_relative_delta('+call(opts)+')\n'
        code+='    assert_eq(['+', '.join('result.'+key+'()' for key in ['year','month','day','hour','minute','second','microsecond'])+'], '+moon(expected)+')\n  }\n'
    code+='}\n'
    return dict(source_sha256=base.REL_SHA,weekday_sha256=base.COMMON_SHA,operations=rows,equality_options=equality,equality=eq_rows),formatted(code)


def main():
    parser=argparse.ArgumentParser();parser.add_argument('source',type=Path);parser.add_argument('--check',action='store_true');args=parser.parse_args();payload,code=generate(args.source)
    for path,text in {ROOT/'testdata/relative_operations_reference.json':json.dumps(payload,indent=2)+'\n',ROOT/'ticker/date/relative_operations_reference_test.mbt':code}.items():
        if args.check:
            if not path.exists() or path.read_text()!=text:raise SystemExit('reference differs: '+str(path))
        else:path.write_text(text)
    print('relative operations:',len(payload['operations'])+2,'named, equality:',len(payload['equality']),'observations')

if __name__=='__main__':main()
