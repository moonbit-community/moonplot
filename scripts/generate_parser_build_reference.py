"""Execute pinned parser.parse with explicit defaults, before runtime clock adaptation."""
from pathlib import Path
import argparse,ast,calendar,datetime,decimal,hashlib,io,json,os,re,string,sys,time,warnings
import six
from dateutil import relativedelta,tz
from generate_auto_date_reference import moon,formatted
from generate_parser_foundation_reference import PARSER_SHA,TEST_SHA,ROOT


def generate(source):
    if hashlib.sha256(source.read_bytes()).hexdigest()!=PARSER_SHA:raise ValueError('parser source differs')
    ns=dict(re=re,string=string,time=time,warnings=warnings,warn=warnings.warn,StringIO=io.StringIO,six=six,integer_types=(int,),text_type=str,
            monthrange=calendar.monthrange,Decimal=decimal.Decimal,datetime=datetime,relativedelta=relativedelta,tz=tz)
    names=['_timelex','_resultbase','parserinfo','_ymd','parser','ParserError','UnknownTimezoneWarning']
    nodes=[n for n in ast.parse(source.read_text()).body if isinstance(n,ast.ClassDef) and n.name in names]
    exec(compile(ast.Module(body=nodes,type_ignores=[]),str(source),'exec'),ns)
    parser=ns['parser']();parser.info._year=2026;parser.info._century=2000
    inputs=[row['text'] for row in json.loads((ROOT/'testdata/parser_fields_reference.json').read_text())['cases']]
    ny=tz.tzfile(str(ROOT/'testdata/tzif/new_york.tzif'))
    defaults=[('ordinary',datetime.datetime(2003,9,25),'datetime(2003, 9, 25)',inputs),
              ('month end fixed seconds',datetime.datetime(2024,1,31,23,58,57,123456,tzinfo=datetime.timezone(datetime.timedelta(seconds=561))),
               'datetime(2024, 1, 31, hour=23, minute=58, second=57, microsecond=123456, offset_seconds=561)',inputs),
              ('nonleap century',datetime.datetime(1900,3,31,11,22,33,456789),'datetime(1900, 3, 31, hour=11, minute=22, second=33, microsecond=456789)',inputs),
              ('inherited rule zone',datetime.datetime(2024,3,9,2,30,tzinfo=ny),'datetime(2024, 3, 9, hour=7, minute=30).with_timezone(tzif_timezone(parser_new_york))',
               ['10 March','10 March 02:30','11 March','Sunday','2024-11-03 01:30','2024-11-03 01:30 UTC','10:30 BRST']),
              ('default later fold',tz.enfold(datetime.datetime(2024,11,3,1,30,tzinfo=ny),fold=1),
               'datetime(2024, 11, 3, hour=6, minute=30).with_timezone(tzif_timezone(parser_new_york))',
               ['01:30','Sunday 01:30','Nov 3 01:30','Nov 4 01:30','2024-03-10 02:30','2024-11-03 01:30 +0300'])]
    code='// Generated from pinned parser.parse/default replacement under TZ=UTC.\n'
    fixture=(ROOT/'testdata/tzif/new_york.tzif').read_bytes()
    code+='\n///|\nlet parser_new_york : Bytes = '+ ' +\n'.join('b"'+''.join('\\x%02x'%byte for byte in fixture[index:index+60])+'"' for index in range(0,len(fixture),60))+'\n'
    groups=[]
    previous=os.environ.get('TZ');os.environ['TZ']='UTC';time.tzset()
    try:
        for name,fallback,expression,strings in defaults:
            rows=[]
            code+='\n///|\ntest '+moon('parser explicit default reference: '+name)+' {\n  let fallback = '+expression+'\n  let parser = DateStringParser::new(context=DateParserContext::utc(clock=fn() { 1767225600000L }), reference_year=2026)\n'
            code+='  let cases : Array[(String, Array[Int32]?)] = [\n'
            for text in strings:
                try:
                    with warnings.catch_warnings(record=True) as caught:
                        value=parser.parse(text,default=fallback)
                        expected=[value.year,value.month,value.day,value.hour,value.minute,value.second,value.microsecond,int(value.utcoffset().total_seconds()) if value.tzinfo else 0]
                    warning_names=[type(w.message).__name__ for w in caught]
                except (ValueError,OverflowError):expected=None;warning_names=[]
                code+='    ('+moon(text)+', '+('None' if expected is None else 'Some('+moon(expected)+')')+'),\n'
                rows.append(dict(text=text,result=expected,warnings=warning_names))
            code+='''  ]
  for (text, expected) in cases {
    let result = try {
      let value = parser.parse(text, default_date=fallback)
      Some([value.year, value.month, value.day, value.hour, value.minute, value.second, value.microsecond, value.offset_seconds])
    } catch { _ => None }
    assert_eq((text, result), (text, expected))
  }
}
'''
            groups.append(dict(name=name,default=fallback.isoformat(),fold=fallback.fold,cases=rows))
    finally:
        if previous is None:os.environ.pop('TZ',None)
        else:os.environ['TZ']=previous
        time.tzset()
    manifest=dict(dateutil_version='2.9.0.post0',parser_sha256=PARSER_SHA,python=sys.version.split()[0],reference_year=2026,TZ='UTC',
                  named_case_count=len(groups),case_count=sum(len(row['cases']) for row in groups),groups=groups,
                  note='Explicit default replacement and numeric/UTC timezone construction. Unknown timezone diagnostics and automatic host-local names/clock remain D11-03 work.')
    return {ROOT/'ticker/date/parser_build_reference_wbtest.mbt':formatted(code),ROOT/'testdata/parser_build_reference.json':json.dumps(manifest,ensure_ascii=False,indent=2)+'\n'}


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('parser_py',type=Path);p.add_argument('--check',action='store_true');args=p.parse_args()
    for path,value in generate(args.parser_py).items():
        if args.check:
            if path.read_text()!=value:raise SystemExit('reference differs: '+str(path.relative_to(ROOT)))
        else:path.write_text(value)
    print(('Verified' if args.check else 'Generated')+' explicit parser default references')


if __name__=='__main__':main()
