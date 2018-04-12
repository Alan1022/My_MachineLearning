#!/usr/bin/env python
#coding=utf-8
#================================================================================
#
#功能描述：主要查找一个hql脚本中所有的原表，方便统计所有的依赖作业，防止人工检查遗漏的可能
#使用说明：python search_all_source_tables.py 参数(需要解析的脚本路径及名称)
#
#================================================================================
import sys
import re
#参数文件即需要检查的hql文件
hql_file=sys.argv[1]

print("开始解析文件："+hql_file)
with open (hql_file,'r') as f:
    for line in f.readlines():  #readlines()则一次性读取所有的内容按行返回
        hql=line.upper()
        hql=hql.replace('  ',' ')  #双空格替换为单空格
        # print "正在查找这行代码：" + hql
        #http://www.runoob.com/python/python-reg-expressions.html#flags
        m1 = re.match(r'.*FROM\s([^TMP][A-Z]{2,5})\.([A-Z0-9\_]+)', hql, re.I | re.M)
        m2 = re.match(r'.*JOIN\s([^TMP][A-Z]{2,5})\.([A-Z0-9\_]+)', hql, re.I | re.M)
        if m1:
            table1=m1.group(1)+"."+m1.group(2)
            print (table1)
        if m2:
            table2=m2.group(1)+"."+m2.group(2)
            print (table2)


