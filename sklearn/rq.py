#-*- coding:utf-8 -*-
import requests
import re
url = 'http://bj.lianjia.com/zufang/tongzhou/pg3su1l1'
r = requests.get(url)
print (r.status_code)
print (r.encoding)
# print (r.json())
print (r.text)

