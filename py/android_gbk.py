import idautils
from idaapi import *
s=Strings()
for i in s:
  print "%x: len=%d ASCII: '%s'" % (i.ea, i.length, str(i))
  gbkstr=str(i).decode('utf-8','ignore').encode('gbk','ignore')
  MakeComm(i.ea,gbkstr)
  Message("UTF8:")
  Message(gbkstr)
  Message("\n")