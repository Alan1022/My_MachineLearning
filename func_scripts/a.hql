8
4
Processing Please Waiting...
sqls[0]: ﻿
------------------------------------------------------------------------------------------------
--  file name   : fin_yrb_use.hql
--  author      : xiaogangguan
--  create date : 2015/06/25
--  fun desc    : 宜人币使用
--  target_table: app.fin_yrb_use
--  source_table : 
--
--
--  tem_table   :
--  modify date :
--  moifier     :
--  modify content :
--  全量
-- --------------------------------------------------------------------------------------------
-------------------------
--  Copyright(c) 2008-2013  yrd
--  All Rights Reserved.
------------------------------------------------------------------------------------------------
 
sqls[0]:Execute Begin at: 2018-06-01 12:01:17
ls: 无法访问/usr/local/spark/lib/spark-assembly-*.jar: 没有那个文件或目录
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option PermSize=256M; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option MaxPermSize=512m; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: Using incremental CMS is deprecated and will likely be removed in a future release
which: no hbase in (/usr/local/presto/bin:/usr/local/elasticsearch/bin:/usr/local/tachyon/bin:/usr/local/alluxio/bin:/usr/local/sentry/bin:/usr/local/maven/bin:/usr/local/sqoop2/bin:/usr/local/sqoop/bin:/usr/local/hive/bin:/usr/local/storm/bin:/usr/local/hbase/sbin:/usr/local/hbase/bin:/usr/local/flume/bin:/usr/local/kafka/bin:/usr/local/spark/bin:/usr/local/zookeeper/bin:/usr/local/scala/bin:/usr/local/hadoop/sbin:/usr/local/hadoop/bin:/usr/local/java/bin:/usr/local/slider/bin:/usr/local/bin:/usr/bin)
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option PermSize=256M; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option MaxPermSize=512m; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: Using incremental CMS is deprecated and will likely be removed in a future release
18/06/01 12:01:18 WARN conf.HiveConf: HiveConf of name hive.server2.in.mem.logging does not exist
18/06/01 12:01:18 WARN conf.HiveConf: HiveConf of name hive.task.progress does not exist
18/06/01 12:01:18 WARN conf.HiveConf: HiveConf of name hive.multigroupby.singlemr does not exist
18/06/01 12:01:18 WARN conf.HiveConf: HiveConf of name hive.server2.in.mem.log.size does not exist

Logging initialized using configuration in jar:file:/usr/local/apache/hive-1.1.0-cdh5.7.0/lib/hive-common-1.1.0-cdh5.7.0.jar!/hive-log4j.properties
WARNING: Hive CLI is deprecated and migration to Beeline is recommended.
hive (default)>       ﻿
              > ---------------------------------------------------------------- 
--------------------------------
              > --  file name   : fin_yrb_use.hql
              > --  author      : xiaogangguan
              > --  create date : 2015/06/25
              > --  fun desc    : 宜人币使用
              > --  target_table: app.fin_yrb_use
              > --  source_table : 
              > --
              > --
              > --  tem_table   :
              > --  modify date :
              > --  moifier     :
              > --  modify content :
              > --  全量
              > -- ------------------------------------------------------------- 
-------------------------------
              > -------------------------
              > --  Copyright(c) 2008-2013  yrd
              > --  All Rights Reserved.
              > ---------------------------------------------------------------- 
--------------------------------
              > hive Connect Successful!
sqls[0]:Execute End at: 2018-06-01 12:01:26
RET_CODE is 0 .................
sqls[1]: 
--18、宜人币使用
;
set mapred.job.queue.name=root.mapreduce.hive;
use tmp;
drop table if exists app_fin_yrb_use;
create table app_fin_yrb_use
(
USAGE_ID string,
USER_ID string,
STATUS_CD string,
USAGE_TYPE_CD string,
PAY_ID string,
YRB_PAY_AMT string,
CREATE_DATE string,
PAY_BILL_TYPE_CD string,
PAY_BILL_STATUS_CD string,
USED_AMT string,
FAIL_DATE string,
MAN_OPE_TYPE_CD string,
MAN_OPE_AMT string,
MAN_OPE_STATUS_CD string,
VAIL_DAYS string,
MAN_OPE_DATE string,
stat_dt string,
date_type string
)
 stored as textfile;
 
sqls[1]:Execute Begin at: 2018-06-01 12:01:26
ls: 无法访问/usr/local/spark/lib/spark-assembly-*.jar: 没有那个文件或目录
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option PermSize=256M; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option MaxPermSize=512m; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: Using incremental CMS is deprecated and will likely be removed in a future release
which: no hbase in (/usr/local/presto/bin:/usr/local/elasticsearch/bin:/usr/local/tachyon/bin:/usr/local/alluxio/bin:/usr/local/sentry/bin:/usr/local/maven/bin:/usr/local/sqoop2/bin:/usr/local/sqoop/bin:/usr/local/hive/bin:/usr/local/storm/bin:/usr/local/hbase/sbin:/usr/local/hbase/bin:/usr/local/flume/bin:/usr/local/kafka/bin:/usr/local/spark/bin:/usr/local/zookeeper/bin:/usr/local/scala/bin:/usr/local/hadoop/sbin:/usr/local/hadoop/bin:/usr/local/java/bin:/usr/local/slider/bin:/usr/local/bin:/usr/bin)
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option PermSize=256M; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option MaxPermSize=512m; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: Using incremental CMS is deprecated and will likely be removed in a future release
18/06/01 12:01:28 WARN conf.HiveConf: HiveConf of name hive.server2.in.mem.logging does not exist
18/06/01 12:01:28 WARN conf.HiveConf: HiveConf of name hive.task.progress does not exist
18/06/01 12:01:28 WARN conf.HiveConf: HiveConf of name hive.multigroupby.singlemr does not exist
18/06/01 12:01:28 WARN conf.HiveConf: HiveConf of name hive.server2.in.mem.log.size does not exist

Logging initialized using configuration in jar:file:/usr/local/apache/hive-1.1.0-cdh5.7.0/lib/hive-common-1.1.0-cdh5.7.0.jar!/hive-log4j.properties
WARNING: Hive CLI is deprecated and migration to Beeline is recommended.
hive (default)>       
              > --18、宜人币使用
              > ;
NoViableAltException(-1@[])
	at org.apache.hadoop.hive.ql.parse.HiveParser.statement(HiveParser.java:1024)
	at org.apache.hadoop.hive.ql.parse.ParseDriver.parse(ParseDriver.java:201)
	at org.apache.hadoop.hive.ql.parse.ParseDriver.parse(ParseDriver.java:166)
	at org.apache.hadoop.hive.ql.Driver.compile(Driver.java:423)
	at org.apache.hadoop.hive.ql.Driver.compile(Driver.java:311)
	at org.apache.hadoop.hive.ql.Driver.compileInternal(Driver.java:1194)
	at org.apache.hadoop.hive.ql.Driver.runInternal(Driver.java:1289)
	at org.apache.hadoop.hive.ql.Driver.run(Driver.java:1120)
	at org.apache.hadoop.hive.ql.Driver.run(Driver.java:1108)
	at org.apache.hadoop.hive.cli.CliDriver.processLocalCmd(CliDriver.java:218)
	at org.apache.hadoop.hive.cli.CliDriver.processCmd(CliDriver.java:170)
	at org.apache.hadoop.hive.cli.CliDriver.processLine(CliDriver.java:381)
	at org.apache.hadoop.hive.cli.CliDriver.executeDriver(CliDriver.java:773)
	at org.apache.hadoop.hive.cli.CliDriver.run(CliDriver.java:691)
	at org.apache.hadoop.hive.cli.CliDriver.main(CliDriver.java:626)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:498)
	at org.apache.hadoop.util.RunJar.run(RunJar.java:221)
	at org.apache.hadoop.util.RunJar.main(RunJar.java:136)
FAILED: ParseException line 3:0 cannot recognize input near '<EOF>' '<EOF>' '<EOF>'
hive (default)> set mapred.job.queue.name=root.mapreduce.hive;
hive (default)> use tmp;
OK
Time taken: 0.087 seconds
hive (tmp)> drop table if exists app_fin_yrb_use;
OK
Time taken: 0.411 seconds
hive (tmp)> create table app_fin_yrb_use
          > (
          > USAGE_ID string,
          > USER_ID string,
          > STATUS_CD string,
          > USAGE_TYPE_CD string,
          > PAY_ID string,
          > YRB_PAY_AMT string,
          > CREATE_DATE string,
          > PAY_BILL_TYPE_CD string,
          > PAY_BILL_STATUS_CD string,
          > USED_AMT string,
          > FAIL_DATE string,
          > MAN_OPE_TYPE_CD string,
          > MAN_OPE_AMT string,
          > MAN_OPE_STATUS_CD string,
          > VAIL_DAYS string,
          > MAN_OPE_DATE string,
          > stat_dt string,
          > date_type string
          > )
          >  stored as textfile;
OK
Time taken: 0.483 seconds
hive (tmp)> hive Connect Successful!
sqls[1]:Execute End at: 2018-06-01 12:01:34
RET_CODE is 0 .................
sqls[2]: 
 
sqls[2]:Execute Begin at: 2018-06-01 12:01:34
ls: 无法访问/usr/local/spark/lib/spark-assembly-*.jar: 没有那个文件或目录
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option PermSize=256M; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option MaxPermSize=512m; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: Using incremental CMS is deprecated and will likely be removed in a future release
which: no hbase in (/usr/local/presto/bin:/usr/local/elasticsearch/bin:/usr/local/tachyon/bin:/usr/local/alluxio/bin:/usr/local/sentry/bin:/usr/local/maven/bin:/usr/local/sqoop2/bin:/usr/local/sqoop/bin:/usr/local/hive/bin:/usr/local/storm/bin:/usr/local/hbase/sbin:/usr/local/hbase/bin:/usr/local/flume/bin:/usr/local/kafka/bin:/usr/local/spark/bin:/usr/local/zookeeper/bin:/usr/local/scala/bin:/usr/local/hadoop/sbin:/usr/local/hadoop/bin:/usr/local/java/bin:/usr/local/slider/bin:/usr/local/bin:/usr/bin)
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option PermSize=256M; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option MaxPermSize=512m; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: Using incremental CMS is deprecated and will likely be removed in a future release
18/06/01 12:01:36 WARN conf.HiveConf: HiveConf of name hive.server2.in.mem.logging does not exist
18/06/01 12:01:36 WARN conf.HiveConf: HiveConf of name hive.task.progress does not exist
18/06/01 12:01:36 WARN conf.HiveConf: HiveConf of name hive.multigroupby.singlemr does not exist
18/06/01 12:01:36 WARN conf.HiveConf: HiveConf of name hive.server2.in.mem.log.size does not exist

Logging initialized using configuration in jar:file:/usr/local/apache/hive-1.1.0-cdh5.7.0/lib/hive-common-1.1.0-cdh5.7.0.jar!/hive-log4j.properties
WARNING: Hive CLI is deprecated and migration to Beeline is recommended.
hive (default)> hive Connect Successful!
sqls[3]: 
set mapred.job.queue.name=root.mapreduce.hive;
use tmp;
insert overwrite table tmp.app_fin_yrb_use
select yur.usage_id usage_id,
       yur.user_id user_id,
       yur.status status,
       yur.usage_type usage_type,
       a.pay_id,
       a.yrb_pay_amt,
       a.create_date,
       a.pay_bill_type,
       a.pay_bill_status,
       b.used_amt,
       b.fail_date,
       c.man_ope_type,
       c.man_ope_amt,
       c.man_ope_status,
       c.vail_days,
       c.man_ope_date,
       '2018-05' calc_dt,
       'm' date_type
  from stg.yrb_usage_record yur
  left join (select yur.usage_id        usage_id,
                    yur.user_id         user_id,
                    yur.status          status,
                    yur.usage_type      usage_type,
                    pby.pay_id          pay_id,
                    pby.yrb_pay_amt     yrb_pay_amt,
                    pby.create_date     create_date,
                    pbm.pay_bill_type   pay_bill_type,
                    pbm.pay_bill_status pay_bill_status
               from stg.yrb_usage_record yur
               left join stg.pay_bill_main_yrb pby
                 on pby.pay_id = yur.bus_id and pby.dt='2018-05-31' and pby.sys='p2p'
               left join stg.pay_bill_main pbm
                 on pbm.pay_id = pby.pay_id and pbm.dt='2018-05-31' and pbm.sys='p2p'
              where yur.usage_type = 1
               and yur.dt='2018-05-31' and yur.sys='p2p') a
    on a.usage_id = yur.usage_id
  left join (select yur.usage_id    usage_id,
                    yur.user_id     user_id,
                    yur.status      status,
                    yur.usage_type  usage_type,
                    yur.used_amt    used_amt,
                    yur.create_date fail_date
               from stg.yrb_usage_record yur
              where yur.usage_type = 2
               and yur.dt='2018-05-31' and yur.sys='p2p') b
    on b.usage_id = yur.usage_id
  left join (select yur.usage_id     usage_id,
                    yur.user_id      user_id,
                    yur.status       status,
                    yur.usage_type   usage_type,
                    yafr.type        man_ope_type,
                    yafr.amt         man_ope_amt,
                    yafr.status      man_ope_status,
                    yafr.vail_days   vail_days,
                    yafr.create_date man_ope_date
               from stg.yrb_usage_record yur
               left join stg.yrb_admin_fix_record yafr
                 on yafr.record_id = yur.bus_id and yafr.dt='2018-05-31' and yafr.sys='p2p'
              where yur.usage_type = 3
               and yur.dt='2018-05-31' and yur.sys='p2p') c
    on c.usage_id = yur.usage_id
    where  yur.dt='2018-05-31' and yur.sys='p2p';
 
sqls[3]:Execute Begin at: 2018-06-01 12:01:34
ls: 无法访问/usr/local/spark/lib/spark-assembly-*.jar: 没有那个文件或目录
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option PermSize=256M; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option MaxPermSize=512m; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: Using incremental CMS is deprecated and will likely be removed in a future release
which: no hbase in (/usr/local/presto/bin:/usr/local/elasticsearch/bin:/usr/local/tachyon/bin:/usr/local/alluxio/bin:/usr/local/sentry/bin:/usr/local/maven/bin:/usr/local/sqoop2/bin:/usr/local/sqoop/bin:/usr/local/hive/bin:/usr/local/storm/bin:/usr/local/hbase/sbin:/usr/local/hbase/bin:/usr/local/flume/bin:/usr/local/kafka/bin:/usr/local/spark/bin:/usr/local/zookeeper/bin:/usr/local/scala/bin:/usr/local/hadoop/sbin:/usr/local/hadoop/bin:/usr/local/java/bin:/usr/local/slider/bin:/usr/local/bin:/usr/bin)
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option PermSize=256M; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option MaxPermSize=512m; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: Using incremental CMS is deprecated and will likely be removed in a future release
18/06/01 12:01:44 WARN conf.HiveConf: HiveConf of name hive.server2.in.mem.logging does not exist
18/06/01 12:01:44 WARN conf.HiveConf: HiveConf of name hive.task.progress does not exist
18/06/01 12:01:45 WARN conf.HiveConf: HiveConf of name hive.multigroupby.singlemr does not exist
18/06/01 12:01:45 WARN conf.HiveConf: HiveConf of name hive.server2.in.mem.log.size does not exist

Logging initialized using configuration in jar:file:/usr/local/apache/hive-1.1.0-cdh5.7.0/lib/hive-common-1.1.0-cdh5.7.0.jar!/hive-log4j.properties
WARNING: Hive CLI is deprecated and migration to Beeline is recommended.
hive (default)>       
              > set mapred.job.queue.name=root.mapreduce.hive;
hive (default)> use tmp;
OK
Time taken: 0.124 seconds
hive (tmp)> insert overwrite table tmp.app_fin_yrb_use
          > select yur.usage_id usage_id,
          >        yur.user_id user_id,
          >        yur.status status,
          >        yur.usage_type usage_type,
          >        a.pay_id,
          >        a.yrb_pay_amt,
          >        a.create_date,
          >        a.pay_bill_type,
          >        a.pay_bill_status,
          >        b.used_amt,
          >        b.fail_date,
          >        c.man_ope_type,
          >        c.man_ope_amt,
          >        c.man_ope_status,
          >        c.vail_days,
          >        c.man_ope_date,
          >        '2018-05' calc_dt,
          >        'm' date_type
          >   from stg.yrb_usage_record yur
          >   left join (select yur.usage_id        usage_id,
          >                     yur.user_id         user_id,
          >                     yur.status          status,
          >                     yur.usage_type      usage_type,
          >                     pby.pay_id          pay_id,
          >                     pby.yrb_pay_amt     yrb_pay_amt,
          >                     pby.create_date     create_date,
          >                     pbm.pay_bill_type   pay_bill_type,
          >                     pbm.pay_bill_status pay_bill_status
          >                from stg.yrb_usage_record yur
          >                left join stg.pay_bill_main_yrb pby
          >                  on pby.pay_id = yur.bus_id and pby.dt='2018-05-31'  
and pby.sys='p2p'
          >                left join stg.pay_bill_main pbm
          >                  on pbm.pay_id = pby.pay_id and pbm.dt='2018-05-31'  
and pbm.sys='p2p'
          >               where yur.usage_type = 1
          >                and yur.dt='2018-05-31' and yur.sys='p2p') a
          >     on a.usage_id = yur.usage_id
          >   left join (select yur.usage_id    usage_id,
          >                     yur.user_id     user_id,
          >                     yur.status      status,
          >                     yur.usage_type  usage_type,
          >                     yur.used_amt    used_amt,
          >                     yur.create_date fail_date
          >                from stg.yrb_usage_record yur
          >               where yur.usage_type = 2
          >                and yur.dt='2018-05-31' and yur.sys='p2p') b
          >     on b.usage_id = yur.usage_id
          >   left join (select yur.usage_id     usage_id,
          >                     yur.user_id      user_id,
          >                     yur.status       status,
          >                     yur.usage_type   usage_type,
          >                     yafr.type        man_ope_type,
          >                     yafr.amt         man_ope_amt,
          >                     yafr.status      man_ope_status,
          >                     yafr.vail_days   vail_days,
          >                     yafr.create_date man_ope_date
          >                from stg.yrb_usage_record yur
          >                left join stg.yrb_admin_fix_record yafr
          >                  on yafr.record_id = yur.bus_id and yafr.dt='2018-05 
-31' and yafr.sys='p2p'
          >               where yur.usage_type = 3
          >                and yur.dt='2018-05-31' and yur.sys='p2p') c
          >     on c.usage_id = yur.usage_id
          >     where  yur.dt='2018-05-31' and yur.sys='p2p';
Query ID = hadoop_20180601120101_607b4843-42b9-42e4-9c5b-351c2b645ff0
Total jobs = 3
Launching Job 1 out of 3
Launching Job 2 out of 3
Number of reduce tasks not specified. Estimated from input data size: 7
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Number of reduce tasks not specified. Estimated from input data size: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1527722723848_6920, Tracking URL = http://pmaster3:8088/proxy/application_1527722723848_6920/
Kill Command = /usr/local/hadoop/bin/hadoop job  -kill job_1527722723848_6920
Starting Job = job_1527722723848_6919, Tracking URL = http://pmaster3:8088/proxy/application_1527722723848_6919/
Kill Command = /usr/local/hadoop/bin/hadoop job  -kill job_1527722723848_6919
Hadoop job information for Stage-1: number of mappers: 12; number of reducers: 7
2018-06-01 12:02:05,780 Stage-1 map = 0%,  reduce = 0%
Hadoop job information for Stage-7: number of mappers: 2; number of reducers: 1
2018-06-01 12:02:06,364 Stage-7 map = 0%,  reduce = 0%
2018-06-01 12:02:16,048 Stage-7 map = 50%,  reduce = 0%, Cumulative CPU 9.21 sec
2018-06-01 12:02:16,207 Stage-1 map = 1%,  reduce = 0%, Cumulative CPU 9.83 sec
2018-06-01 12:02:17,356 Stage-1 map = 5%,  reduce = 0%, Cumulative CPU 35.59 sec
2018-06-01 12:02:18,432 Stage-1 map = 6%,  reduce = 0%, Cumulative CPU 48.51 sec
2018-06-01 12:02:19,443 Stage-7 map = 100%,  reduce = 0%, Cumulative CPU 23.58 sec
2018-06-01 12:02:20,516 Stage-1 map = 8%,  reduce = 0%, Cumulative CPU 78.05 sec
2018-06-01 12:02:22,625 Stage-1 map = 11%,  reduce = 0%, Cumulative CPU 176.87 sec
2018-06-01 12:02:24,719 Stage-1 map = 12%,  reduce = 0%, Cumulative CPU 204.99 sec
2018-06-01 12:02:25,787 Stage-1 map = 15%,  reduce = 0%, Cumulative CPU 211.88 sec
2018-06-01 12:02:28,582 Stage-1 map = 21%,  reduce = 0%, Cumulative CPU 248.21 sec
2018-06-01 12:02:28,600 Stage-7 map = 100%,  reduce = 100%, Cumulative CPU 32.86 sec
2018-06-01 12:02:30,649 Stage-1 map = 22%,  reduce = 0%, Cumulative CPU 260.7 sec
2018-06-01 12:02:31,677 Stage-1 map = 23%,  reduce = 0%, Cumulative CPU 283.5 sec
MapReduce Total cumulative CPU time: 32 seconds 860 msec
Ended Job = job_1527722723848_6920
2018-06-01 12:02:34,002 Stage-1 map = 27%,  reduce = 0%, Cumulative CPU 343.96 sec
2018-06-01 12:02:35,054 Stage-1 map = 28%,  reduce = 0%, Cumulative CPU 353.84 sec
2018-06-01 12:02:37,125 Stage-1 map = 29%,  reduce = 0%, Cumulative CPU 409.79 sec
2018-06-01 12:02:39,202 Stage-1 map = 30%,  reduce = 0%, Cumulative CPU 444.65 sec
2018-06-01 12:02:40,231 Stage-1 map = 31%,  reduce = 0%, Cumulative CPU 480.99 sec
2018-06-01 12:02:41,349 Stage-1 map = 31%,  reduce = 2%, Cumulative CPU 495.84 sec
2018-06-01 12:02:42,385 Stage-1 map = 31%,  reduce = 3%, Cumulative CPU 504.52 sec
2018-06-01 12:02:43,420 Stage-1 map = 32%,  reduce = 3%, Cumulative CPU 524.27 sec
2018-06-01 12:02:44,495 Stage-1 map = 33%,  reduce = 4%, Cumulative CPU 547.8 sec
2018-06-01 12:02:46,564 Stage-1 map = 34%,  reduce = 5%, Cumulative CPU 606.67 sec
2018-06-01 12:02:49,676 Stage-1 map = 35%,  reduce = 5%, Cumulative CPU 650.86 sec
2018-06-01 12:02:52,790 Stage-1 map = 36%,  reduce = 6%, Cumulative CPU 741.75 sec
2018-06-01 12:03:02,199 Stage-1 map = 37%,  reduce = 6%, Cumulative CPU 869.96 sec
2018-06-01 12:03:09,487 Stage-1 map = 38%,  reduce = 6%, Cumulative CPU 1025.11 sec
2018-06-01 12:03:12,687 Stage-1 map = 39%,  reduce = 6%, Cumulative CPU 1053.22 sec
2018-06-01 12:03:15,858 Stage-1 map = 40%,  reduce = 6%, Cumulative CPU 1083.68 sec
2018-06-01 12:03:18,977 Stage-1 map = 41%,  reduce = 6%, Cumulative CPU 1112.87 sec
2018-06-01 12:03:22,102 Stage-1 map = 42%,  reduce = 6%, Cumulative CPU 1197.38 sec
2018-06-01 12:03:24,298 Stage-1 map = 43%,  reduce = 6%, Cumulative CPU 1212.1 sec
2018-06-01 12:03:26,393 Stage-1 map = 44%,  reduce = 6%, Cumulative CPU 1257.13 sec
2018-06-01 12:03:28,465 Stage-1 map = 45%,  reduce = 6%, Cumulative CPU 1314.36 sec
2018-06-01 12:03:31,577 Stage-1 map = 46%,  reduce = 6%, Cumulative CPU 1417.35 sec
2018-06-01 12:03:33,648 Stage-1 map = 47%,  reduce = 6%, Cumulative CPU 1442.62 sec
2018-06-01 12:03:37,278 Stage-1 map = 48%,  reduce = 6%, Cumulative CPU 1477.53 sec
2018-06-01 12:03:39,383 Stage-1 map = 49%,  reduce = 6%, Cumulative CPU 1490.95 sec
2018-06-01 12:03:43,671 Stage-1 map = 50%,  reduce = 6%, Cumulative CPU 1653.58 sec
2018-06-01 12:03:46,837 Stage-1 map = 51%,  reduce = 6%, Cumulative CPU 1688.99 sec
2018-06-01 12:03:48,913 Stage-1 map = 52%,  reduce = 6%, Cumulative CPU 1731.7 sec
2018-06-01 12:03:51,278 Stage-1 map = 53%,  reduce = 6%, Cumulative CPU 1752.69 sec
2018-06-01 12:03:54,376 Stage-1 map = 54%,  reduce = 6%, Cumulative CPU 1784.22 sec
2018-06-01 12:03:58,541 Stage-1 map = 55%,  reduce = 6%, Cumulative CPU 1860.87 sec
2018-06-01 12:04:01,785 Stage-1 map = 56%,  reduce = 6%, Cumulative CPU 1899.39 sec
2018-06-01 12:04:08,014 Stage-1 map = 57%,  reduce = 6%, Cumulative CPU 2006.16 sec
2018-06-01 12:04:09,040 Stage-1 map = 58%,  reduce = 6%, Cumulative CPU 2027.88 sec
2018-06-01 12:04:12,187 Stage-1 map = 59%,  reduce = 6%, Cumulative CPU 2058.81 sec
2018-06-01 12:04:13,214 Stage-1 map = 60%,  reduce = 6%, Cumulative CPU 2069.35 sec
2018-06-01 12:04:15,280 Stage-1 map = 61%,  reduce = 8%, Cumulative CPU 2138.09 sec
2018-06-01 12:04:18,572 Stage-1 map = 62%,  reduce = 8%, Cumulative CPU 2181.48 sec
2018-06-01 12:04:19,603 Stage-1 map = 63%,  reduce = 9%, Cumulative CPU 2190.24 sec
2018-06-01 12:04:21,832 Stage-1 map = 63%,  reduce = 10%, Cumulative CPU 2229.77 sec
2018-06-01 12:04:22,872 Stage-1 map = 64%,  reduce = 11%, Cumulative CPU 2288.71 sec
2018-06-01 12:04:27,072 Stage-1 map = 65%,  reduce = 11%, Cumulative CPU 2330.75 sec
2018-06-01 12:04:30,242 Stage-1 map = 66%,  reduce = 11%, Cumulative CPU 2354.03 sec
2018-06-01 12:04:34,374 Stage-1 map = 67%,  reduce = 12%, Cumulative CPU 2517.88 sec
2018-06-01 12:04:35,421 Stage-1 map = 67%,  reduce = 13%, Cumulative CPU 2557.98 sec
2018-06-01 12:04:36,453 Stage-1 map = 68%,  reduce = 13%, Cumulative CPU 2584.35 sec
2018-06-01 12:04:37,557 Stage-1 map = 68%,  reduce = 14%, Cumulative CPU 2595.2 sec
2018-06-01 12:04:42,892 Stage-1 map = 69%,  reduce = 14%, Cumulative CPU 2627.74 sec
2018-06-01 12:04:48,161 Stage-1 map = 70%,  reduce = 14%, Cumulative CPU 2652.13 sec
2018-06-01 12:04:50,271 Stage-1 map = 70%,  reduce = 15%, Cumulative CPU 2732.65 sec
2018-06-01 12:04:51,300 Stage-1 map = 70%,  reduce = 16%, Cumulative CPU 2732.79 sec
2018-06-01 12:04:52,321 Stage-1 map = 71%,  reduce = 16%, Cumulative CPU 2744.2 sec
2018-06-01 12:04:53,379 Stage-1 map = 71%,  reduce = 17%, Cumulative CPU 2764.22 sec
2018-06-01 12:04:55,516 Stage-1 map = 72%,  reduce = 17%, Cumulative CPU 2778.07 sec
2018-06-01 12:04:58,608 Stage-1 map = 73%,  reduce = 17%, Cumulative CPU 2812.5 sec
2018-06-01 12:04:59,634 Stage-1 map = 74%,  reduce = 17%, Cumulative CPU 2816.34 sec
2018-06-01 12:05:02,780 Stage-1 map = 75%,  reduce = 17%, Cumulative CPU 2832.35 sec
2018-06-01 12:05:05,862 Stage-1 map = 76%,  reduce = 17%, Cumulative CPU 2860.54 sec
2018-06-01 12:05:08,967 Stage-1 map = 76%,  reduce = 19%, Cumulative CPU 2917.56 sec
2018-06-01 12:05:11,037 Stage-1 map = 77%,  reduce = 19%, Cumulative CPU 2938.25 sec
2018-06-01 12:05:21,466 Stage-1 map = 78%,  reduce = 19%, Cumulative CPU 3022.71 sec
2018-06-01 12:05:23,824 Stage-1 map = 78%,  reduce = 21%, Cumulative CPU 3031.47 sec
2018-06-01 12:05:24,876 Stage-1 map = 78%,  reduce = 22%, Cumulative CPU 3076.12 sec
2018-06-01 12:05:42,366 Stage-1 map = 79%,  reduce = 22%, Cumulative CPU 3135.14 sec
2018-06-01 12:05:51,661 Stage-1 map = 80%,  reduce = 22%, Cumulative CPU 3162.38 sec
2018-06-01 12:05:58,091 Stage-1 map = 81%,  reduce = 22%, Cumulative CPU 3181.6 sec
2018-06-01 12:06:01,243 Stage-1 map = 82%,  reduce = 22%, Cumulative CPU 3190.43 sec
2018-06-01 12:06:07,458 Stage-1 map = 83%,  reduce = 22%, Cumulative CPU 3209.41 sec
2018-06-01 12:06:08,485 Stage-1 map = 83%,  reduce = 23%, Cumulative CPU 3210.52 sec
2018-06-01 12:06:10,546 Stage-1 map = 83%,  reduce = 25%, Cumulative CPU 3216.37 sec
2018-06-01 12:06:13,633 Stage-1 map = 83%,  reduce = 27%, Cumulative CPU 3221.95 sec
2018-06-01 12:06:15,693 Stage-1 map = 83%,  reduce = 28%, Cumulative CPU 3223.37 sec
2018-06-01 12:07:16,662 Stage-1 map = 83%,  reduce = 28%, Cumulative CPU 3290.56 sec
2018-06-01 12:08:08,515 Stage-1 map = 84%,  reduce = 28%, Cumulative CPU 3432.68 sec
2018-06-01 12:08:43,188 Stage-1 map = 85%,  reduce = 28%, Cumulative CPU 3462.76 sec
2018-06-01 12:09:31,329 Stage-1 map = 86%,  reduce = 28%, Cumulative CPU 3920.73 sec
2018-06-01 12:10:31,541 Stage-1 map = 86%,  reduce = 28%, Cumulative CPU 4225.53 sec
2018-06-01 12:11:12,242 Stage-1 map = 87%,  reduce = 28%, Cumulative CPU 4273.33 sec
2018-06-01 12:12:12,940 Stage-1 map = 87%,  reduce = 28%, Cumulative CPU 4304.26 sec
2018-06-01 12:12:46,886 Stage-1 map = 88%,  reduce = 28%, Cumulative CPU 4322.02 sec
2018-06-01 12:13:05,405 Stage-1 map = 89%,  reduce = 28%, Cumulative CPU 4361.09 sec
2018-06-01 12:13:20,062 Stage-1 map = 90%,  reduce = 28%, Cumulative CPU 4397.19 sec
2018-06-01 12:13:51,030 Stage-1 map = 91%,  reduce = 28%, Cumulative CPU 4463.85 sec
2018-06-01 12:14:03,389 Stage-1 map = 92%,  reduce = 28%, Cumulative CPU 4502.64 sec
2018-06-01 12:14:36,594 Stage-1 map = 93%,  reduce = 28%, Cumulative CPU 4592.85 sec
2018-06-01 12:15:10,622 Stage-1 map = 94%,  reduce = 28%, Cumulative CPU 4661.17 sec
2018-06-01 12:15:31,514 Stage-1 map = 95%,  reduce = 28%, Cumulative CPU 4701.04 sec
2018-06-01 12:15:40,765 Stage-1 map = 96%,  reduce = 28%, Cumulative CPU 4721.25 sec
2018-06-01 12:15:50,037 Stage-1 map = 97%,  reduce = 28%, Cumulative CPU 4752.21 sec
2018-06-01 12:15:52,164 Stage-1 map = 97%,  reduce = 29%, Cumulative CPU 4757.16 sec
2018-06-01 12:15:53,194 Stage-1 map = 97%,  reduce = 30%, Cumulative CPU 4762.01 sec
2018-06-01 12:15:54,232 Stage-1 map = 97%,  reduce = 31%, Cumulative CPU 4771.29 sec
2018-06-01 12:16:54,535 Stage-1 map = 97%,  reduce = 31%, Cumulative CPU 4856.09 sec
2018-06-01 12:17:39,783 Stage-1 map = 98%,  reduce = 31%, Cumulative CPU 4889.84 sec
2018-06-01 12:18:40,798 Stage-1 map = 98%,  reduce = 31%, Cumulative CPU 4935.04 sec
2018-06-01 12:19:41,496 Stage-1 map = 98%,  reduce = 31%, Cumulative CPU 4953.24 sec
2018-06-01 12:19:57,994 Stage-1 map = 99%,  reduce = 31%, Cumulative CPU 5444.6 sec
2018-06-01 12:20:58,742 Stage-1 map = 99%,  reduce = 31%, Cumulative CPU 5914.15 sec
2018-06-01 12:21:45,446 Stage-1 map = 100%,  reduce = 31%, Cumulative CPU 6229.68 sec
2018-06-01 12:21:46,482 Stage-1 map = 100%,  reduce = 32%, Cumulative CPU 6230.33 sec
2018-06-01 12:21:47,518 Stage-1 map = 100%,  reduce = 43%, Cumulative CPU 6237.67 sec
2018-06-01 12:21:48,544 Stage-1 map = 100%,  reduce = 48%, Cumulative CPU 6240.74 sec
2018-06-01 12:21:49,577 Stage-1 map = 100%,  reduce = 57%, Cumulative CPU 6253.01 sec
2018-06-01 12:21:50,611 Stage-1 map = 100%,  reduce = 67%, Cumulative CPU 6282.84 sec
2018-06-01 12:21:52,692 Stage-1 map = 100%,  reduce = 68%, Cumulative CPU 6326.4 sec
2018-06-01 12:21:53,727 Stage-1 map = 100%,  reduce = 69%, Cumulative CPU 6375.3 sec
2018-06-01 12:21:56,834 Stage-1 map = 100%,  reduce = 71%, Cumulative CPU 6416.85 sec
2018-06-01 12:21:59,931 Stage-1 map = 100%,  reduce = 72%, Cumulative CPU 6440.14 sec
2018-06-01 12:22:00,965 Stage-1 map = 100%,  reduce = 73%, Cumulative CPU 6447.34 sec
2018-06-01 12:22:03,035 Stage-1 map = 100%,  reduce = 74%, Cumulative CPU 6465.4 sec
2018-06-01 12:22:05,100 Stage-1 map = 100%,  reduce = 75%, Cumulative CPU 6479.95 sec
2018-06-01 12:22:06,136 Stage-1 map = 100%,  reduce = 76%, Cumulative CPU 6490.44 sec
2018-06-01 12:22:08,191 Stage-1 map = 100%,  reduce = 77%, Cumulative CPU 6504.87 sec
2018-06-01 12:22:09,225 Stage-1 map = 100%,  reduce = 78%, Cumulative CPU 6515.41 sec
2018-06-01 12:22:11,292 Stage-1 map = 100%,  reduce = 79%, Cumulative CPU 6529.0 sec
2018-06-01 12:22:12,313 Stage-1 map = 100%,  reduce = 80%, Cumulative CPU 6540.04 sec
2018-06-01 12:22:14,369 Stage-1 map = 100%,  reduce = 81%, Cumulative CPU 6553.9 sec
2018-06-01 12:22:15,402 Stage-1 map = 100%,  reduce = 82%, Cumulative CPU 6564.19 sec
2018-06-01 12:22:17,460 Stage-1 map = 100%,  reduce = 83%, Cumulative CPU 6578.31 sec
2018-06-01 12:22:19,526 Stage-1 map = 100%,  reduce = 84%, Cumulative CPU 6595.93 sec
2018-06-01 12:22:20,560 Stage-1 map = 100%,  reduce = 85%, Cumulative CPU 6602.37 sec
2018-06-01 12:22:22,631 Stage-1 map = 100%,  reduce = 86%, Cumulative CPU 6619.78 sec
2018-06-01 12:22:24,693 Stage-1 map = 100%,  reduce = 87%, Cumulative CPU 6636.88 sec
2018-06-01 12:22:25,725 Stage-1 map = 100%,  reduce = 88%, Cumulative CPU 6644.19 sec
2018-06-01 12:22:27,789 Stage-1 map = 100%,  reduce = 89%, Cumulative CPU 6668.81 sec
2018-06-01 12:22:28,831 Stage-1 map = 100%,  reduce = 90%, Cumulative CPU 6672.61 sec
2018-06-01 12:22:31,048 Stage-1 map = 100%,  reduce = 91%, Cumulative CPU 6697.0 sec
2018-06-01 12:22:32,073 Stage-1 map = 100%,  reduce = 92%, Cumulative CPU 6704.29 sec
2018-06-01 12:22:34,132 Stage-1 map = 100%,  reduce = 93%, Cumulative CPU 6727.34 sec
2018-06-01 12:22:35,162 Stage-1 map = 100%,  reduce = 94%, Cumulative CPU 6735.05 sec
2018-06-01 12:22:37,198 Stage-1 map = 100%,  reduce = 95%, Cumulative CPU 6752.11 sec
2018-06-01 12:22:38,228 Stage-1 map = 100%,  reduce = 96%, Cumulative CPU 6759.31 sec
2018-06-01 12:22:39,261 Stage-1 map = 100%,  reduce = 97%, Cumulative CPU 6765.99 sec
2018-06-01 12:22:41,312 Stage-1 map = 100%,  reduce = 98%, Cumulative CPU 6786.43 sec
2018-06-01 12:22:44,388 Stage-1 map = 100%,  reduce = 99%, Cumulative CPU 6800.0 sec
2018-06-01 12:22:53,686 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 6841.65 sec
MapReduce Total cumulative CPU time: 0 days 1 hours 54 minutes 1 seconds 650 msec
Ended Job = job_1527722723848_6919
Launching Job 3 out of 3
Number of reduce tasks not specified. Estimated from input data size: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1527722723848_7073, Tracking URL = http://pmaster3:8088/proxy/application_1527722723848_7073/
Kill Command = /usr/local/hadoop/bin/hadoop job  -kill job_1527722723848_7073
Hadoop job information for Stage-2: number of mappers: 9; number of reducers: 1
2018-06-01 12:23:04,289 Stage-2 map = 0%,  reduce = 0%
2018-06-01 12:23:12,658 Stage-2 map = 11%,  reduce = 0%, Cumulative CPU 7.8 sec
2018-06-01 12:23:13,693 Stage-2 map = 33%,  reduce = 0%, Cumulative CPU 32.1 sec
2018-06-01 12:23:15,742 Stage-2 map = 52%,  reduce = 0%, Cumulative CPU 50.34 sec
2018-06-01 12:23:16,775 Stage-2 map = 60%,  reduce = 0%, Cumulative CPU 64.33 sec
2018-06-01 12:23:17,811 Stage-2 map = 65%,  reduce = 0%, Cumulative CPU 73.87 sec
2018-06-01 12:23:18,837 Stage-2 map = 71%,  reduce = 0%, Cumulative CPU 75.62 sec
2018-06-01 12:23:19,868 Stage-2 map = 84%,  reduce = 0%, Cumulative CPU 91.16 sec
2018-06-01 12:23:22,962 Stage-2 map = 85%,  reduce = 0%, Cumulative CPU 95.51 sec
2018-06-01 12:23:26,065 Stage-2 map = 85%,  reduce = 26%, Cumulative CPU 100.53 sec
2018-06-01 12:23:34,348 Stage-2 map = 89%,  reduce = 26%, Cumulative CPU 111.0 sec
2018-06-01 12:23:40,558 Stage-2 map = 89%,  reduce = 30%, Cumulative CPU 140.79 sec
2018-06-01 12:24:40,627 Stage-2 map = 89%,  reduce = 30%, Cumulative CPU 142.74 sec
2018-06-01 12:25:40,761 Stage-2 map = 89%,  reduce = 30%, Cumulative CPU 144.39 sec
2018-06-01 12:26:41,551 Stage-2 map = 89%,  reduce = 30%, Cumulative CPU 145.77 sec
2018-06-01 12:27:18,678 Stage-2 map = 92%,  reduce = 30%, Cumulative CPU 155.55 sec
2018-06-01 12:27:21,788 Stage-2 map = 96%,  reduce = 30%, Cumulative CPU 157.83 sec
2018-06-01 12:27:22,825 Stage-2 map = 100%,  reduce = 30%, Cumulative CPU 159.03 sec
2018-06-01 12:27:26,943 Stage-2 map = 100%,  reduce = 67%, Cumulative CPU 162.41 sec
2018-06-01 12:27:30,039 Stage-2 map = 100%,  reduce = 72%, Cumulative CPU 170.81 sec
2018-06-01 12:27:32,111 Stage-2 map = 100%,  reduce = 81%, Cumulative CPU 170.81 sec
2018-06-01 12:27:35,203 Stage-2 map = 100%,  reduce = 89%, Cumulative CPU 178.86 sec
2018-06-01 12:27:38,300 Stage-2 map = 100%,  reduce = 97%, Cumulative CPU 182.15 sec
2018-06-01 12:27:40,403 Stage-2 map = 100%,  reduce = 100%, Cumulative CPU 183.91 sec
MapReduce Total cumulative CPU time: 3 minutes 3 seconds 910 msec
Ended Job = job_1527722723848_7073
Loading data to table tmp.app_fin_yrb_use
[Error 30017]: Skipping stats aggregation by error org.apache.hadoop.hive.ql.metadata.HiveException: [Error 30001]: StatsPublisher cannot be initialized. There was a error in the initialization of StatsPublisher, and retrying might help. If you dont want the query to fail because accurate statistics could not be collected, set hive.stats.reliable=false
Table tmp.app_fin_yrb_use stats: [numFiles=1, numRows=-1, totalSize=247487646, rawDataSize=-1]
MapReduce Jobs Launched: 
Stage-Stage-7: Map: 2  Reduce: 1   Cumulative CPU: 32.86 sec   HDFS Read: 78258221 HDFS Write: 223847 SUCCESS
Stage-Stage-1: Map: 12  Reduce: 7   Cumulative CPU: 6841.65 sec   HDFS Read: 13372662813 HDFS Write: 108980760 SUCCESS
Stage-Stage-2: Map: 9  Reduce: 1   Cumulative CPU: 183.91 sec   HDFS Read: 183317821 HDFS Write: 247487646 SUCCESS
Total MapReduce CPU Time Spent: 0 days 1 hours 57 minutes 38 seconds 420 msec
OK
usage_id	user_id	status	usage_type	a.pay_id	a.yrb_pay_amt	a.create_date	a.pay_bill_type	a.pay_bill_status	b.used_amt	b.fail_date	c.man_ope_type	c.man_ope_amt	c.man_ope_status	c.vail_days	c.man_ope_date	calc_dt	date_type
Time taken: 1553.26 seconds
hive (tmp)> hive Connect Successful!
sqls[3]:Execute End at: 2018-06-01 12:27:44
RET_CODE is 0 .................
sqls[4]: 
;
set mapred.job.queue.name=root.mapreduce.hive;
use app;
alter table fin_yrb_use drop if exists partition (dt='2018-05-31',sys='fin');
insert overwrite table app.fin_yrb_use partition (dt='2018-05-31',sys='fin')
select USAGE_ID,
       USER_ID,
       STATUS_CD,
       coalesce(acd1.code_desc, STATUS_CD) as STATUS,
       USAGE_TYPE_CD,
       coalesce(acd2.code_desc, USAGE_TYPE_CD) as USAGE_TYPE,
       PAY_ID,
       YRB_PAY_AMT,
       CREATE_DATE,
       PAY_BILL_TYPE_CD,
       coalesce(acd3.code_desc, PAY_BILL_TYPE_CD) as PAY_BILL_TYPE,
       PAY_BILL_STATUS_CD,
       coalesce(acd4.code_desc, PAY_BILL_STATUS_CD) as PAY_BILL_STATUS,
       USED_AMT,
       FAIL_DATE,
       MAN_OPE_TYPE_CD,
       coalesce(acd5.code_desc, MAN_OPE_TYPE_CD) as MAN_OPE_TYPE,
       MAN_OPE_AMT,
       MAN_OPE_STATUS_CD,
       coalesce(acd6.code_desc, MAN_OPE_STATUS_CD) MAN_OPE_STATUS,
       VAIL_DAYS,
       MAN_OPE_DATE,
       stat_dt,
       date_type
  from tmp.app_fin_yrb_use afyu
  left outer join dim.app_code_dic acd1
    on acd1.code_value = afyu.STATUS_CD
   and acd1.code_id = 'SUD000009'
  left outer join dim.app_code_dic acd2
    on acd2.code_value = afyu.USAGE_TYPE_CD
   and acd2.code_id = 'SUD000002'
  left outer join dim.app_code_dic acd3
    on acd3.code_value = afyu.PAY_BILL_TYPE_CD
   and acd3.code_id = 'SUD000015'
  left outer join dim.app_code_dic acd4
    on acd4.code_value = afyu.PAY_BILL_STATUS_CD
   and acd4.code_id = 'SUD000016'
  left outer join dim.app_code_dic acd5
    on acd5.code_value = afyu.MAN_OPE_TYPE_CD
   and acd5.code_id = 'SUD000003'
  left outer join dim.app_code_dic acd6
    on acd6.code_value = afyu.MAN_OPE_STATUS_CD
   and acd6.code_id = 'SUD000014'
;
 
sqls[4]:Execute Begin at: 2018-06-01 12:27:44
ls: 无法访问/usr/local/spark/lib/spark-assembly-*.jar: 没有那个文件或目录
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option PermSize=256M; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option MaxPermSize=512m; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: Using incremental CMS is deprecated and will likely be removed in a future release
which: no hbase in (/usr/local/presto/bin:/usr/local/elasticsearch/bin:/usr/local/tachyon/bin:/usr/local/alluxio/bin:/usr/local/sentry/bin:/usr/local/maven/bin:/usr/local/sqoop2/bin:/usr/local/sqoop/bin:/usr/local/hive/bin:/usr/local/storm/bin:/usr/local/hbase/sbin:/usr/local/hbase/bin:/usr/local/flume/bin:/usr/local/kafka/bin:/usr/local/spark/bin:/usr/local/zookeeper/bin:/usr/local/scala/bin:/usr/local/hadoop/sbin:/usr/local/hadoop/bin:/usr/local/java/bin:/usr/local/slider/bin:/usr/local/bin:/usr/bin)
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option PermSize=256M; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option MaxPermSize=512m; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: Using incremental CMS is deprecated and will likely be removed in a future release
18/06/01 12:27:46 WARN conf.HiveConf: HiveConf of name hive.server2.in.mem.logging does not exist
18/06/01 12:27:46 WARN conf.HiveConf: HiveConf of name hive.task.progress does not exist
18/06/01 12:27:46 WARN conf.HiveConf: HiveConf of name hive.multigroupby.singlemr does not exist
18/06/01 12:27:46 WARN conf.HiveConf: HiveConf of name hive.server2.in.mem.log.size does not exist

Logging initialized using configuration in jar:file:/usr/local/apache/hive-1.1.0-cdh5.7.0/lib/hive-common-1.1.0-cdh5.7.0.jar!/hive-log4j.properties
WARNING: Hive CLI is deprecated and migration to Beeline is recommended.
hive (default)>       
              > ;
hive (default)> set mapred.job.queue.name=root.mapreduce.hive;
hive (default)> use app;
OK
Time taken: 0.107 seconds
hive (app)> alter table fin_yrb_use drop if exists partition (dt='2018-05-31',sy 
s='fin');
OK
Time taken: 0.33 seconds
hive (app)> insert overwrite table app.fin_yrb_use partition (dt='2018-05-31',sy 
s='fin')
          > select USAGE_ID,
          >        USER_ID,
          >        STATUS_CD,
          >        coalesce(acd1.code_desc, STATUS_CD) as STATUS,
          >        USAGE_TYPE_CD,
          >        coalesce(acd2.code_desc, USAGE_TYPE_CD) as USAGE_TYPE,
          >        PAY_ID,
          >        YRB_PAY_AMT,
          >        CREATE_DATE,
          >        PAY_BILL_TYPE_CD,
          >        coalesce(acd3.code_desc, PAY_BILL_TYPE_CD) as PAY_BILL_TYPE,
          >        PAY_BILL_STATUS_CD,
          >        coalesce(acd4.code_desc, PAY_BILL_STATUS_CD) as PAY_BILL_STAT 
US,
          >        USED_AMT,
          >        FAIL_DATE,
          >        MAN_OPE_TYPE_CD,
          >        coalesce(acd5.code_desc, MAN_OPE_TYPE_CD) as MAN_OPE_TYPE,
          >        MAN_OPE_AMT,
          >        MAN_OPE_STATUS_CD,
          >        coalesce(acd6.code_desc, MAN_OPE_STATUS_CD) MAN_OPE_STATUS,
          >        VAIL_DAYS,
          >        MAN_OPE_DATE,
          >        stat_dt,
          >        date_type
          >   from tmp.app_fin_yrb_use afyu
          >   left outer join dim.app_code_dic acd1
          >     on acd1.code_value = afyu.STATUS_CD
          >    and acd1.code_id = 'SUD000009'
          >   left outer join dim.app_code_dic acd2
          >     on acd2.code_value = afyu.USAGE_TYPE_CD
          >    and acd2.code_id = 'SUD000002'
          >   left outer join dim.app_code_dic acd3
          >     on acd3.code_value = afyu.PAY_BILL_TYPE_CD
          >    and acd3.code_id = 'SUD000015'
          >   left outer join dim.app_code_dic acd4
          >     on acd4.code_value = afyu.PAY_BILL_STATUS_CD
          >    and acd4.code_id = 'SUD000016'
          >   left outer join dim.app_code_dic acd5
          >     on acd5.code_value = afyu.MAN_OPE_TYPE_CD
          >    and acd5.code_id = 'SUD000003'
          >   left outer join dim.app_code_dic acd6
          >     on acd6.code_value = afyu.MAN_OPE_STATUS_CD
          >    and acd6.code_id = 'SUD000014'
          > ;
Query ID = hadoop_20180601122727_734c5b34-cd11-4aab-9fab-749faa05bfe9
Total jobs = 6
Launching Job 1 out of 6
Number of reduce tasks not specified. Estimated from input data size: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1527722723848_7097, Tracking URL = http://pmaster3:8088/proxy/application_1527722723848_7097/
Kill Command = /usr/local/hadoop/bin/hadoop job  -kill job_1527722723848_7097
Hadoop job information for Stage-1: number of mappers: 3; number of reducers: 1
2018-06-01 12:28:05,891 Stage-1 map = 0%,  reduce = 0%
2018-06-01 12:28:16,395 Stage-1 map = 33%,  reduce = 0%, Cumulative CPU 15.67 sec
2018-06-01 12:28:19,521 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 30.82 sec
2018-06-01 12:28:28,877 Stage-1 map = 100%,  reduce = 73%, Cumulative CPU 53.41 sec
2018-06-01 12:28:33,000 Stage-1 map = 100%,  reduce = 83%, Cumulative CPU 58.28 sec
2018-06-01 12:28:36,102 Stage-1 map = 100%,  reduce = 88%, Cumulative CPU 64.25 sec
2018-06-01 12:28:48,743 Stage-1 map = 100%,  reduce = 95%, Cumulative CPU 95.88 sec
2018-06-01 12:28:51,884 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 106.59 sec
MapReduce Total cumulative CPU time: 1 minutes 46 seconds 590 msec
Ended Job = job_1527722723848_7097
Launching Job 2 out of 6
Number of reduce tasks not specified. Estimated from input data size: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1527722723848_7107, Tracking URL = http://pmaster3:8088/proxy/application_1527722723848_7107/
Kill Command = /usr/local/hadoop/bin/hadoop job  -kill job_1527722723848_7107
Hadoop job information for Stage-2: number of mappers: 3; number of reducers: 1
2018-06-01 12:29:10,141 Stage-2 map = 0%,  reduce = 0%
2018-06-01 12:29:16,376 Stage-2 map = 33%,  reduce = 0%, Cumulative CPU 3.18 sec
2018-06-01 12:29:26,777 Stage-2 map = 67%,  reduce = 0%, Cumulative CPU 43.67 sec
2018-06-01 12:29:27,812 Stage-2 map = 67%,  reduce = 22%, Cumulative CPU 44.46 sec
2018-06-01 12:29:28,851 Stage-2 map = 100%,  reduce = 22%, Cumulative CPU 49.26 sec
2018-06-01 12:29:30,916 Stage-2 map = 100%,  reduce = 42%, Cumulative CPU 90.24 sec
2018-06-01 12:29:34,042 Stage-2 map = 100%,  reduce = 68%, Cumulative CPU 126.31 sec
2018-06-01 12:29:36,136 Stage-2 map = 100%,  reduce = 78%, Cumulative CPU 131.31 sec
2018-06-01 12:29:39,268 Stage-2 map = 100%,  reduce = 88%, Cumulative CPU 138.14 sec
2018-06-01 12:29:51,672 Stage-2 map = 100%,  reduce = 93%, Cumulative CPU 162.54 sec
2018-06-01 12:29:54,787 Stage-2 map = 100%,  reduce = 99%, Cumulative CPU 168.33 sec
2018-06-01 12:30:01,010 Stage-2 map = 100%,  reduce = 100%, Cumulative CPU 177.18 sec
MapReduce Total cumulative CPU time: 2 minutes 57 seconds 180 msec
Ended Job = job_1527722723848_7107
Launching Job 3 out of 6
Number of reduce tasks not specified. Estimated from input data size: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1527722723848_7112, Tracking URL = http://pmaster3:8088/proxy/application_1527722723848_7112/
Kill Command = /usr/local/hadoop/bin/hadoop job  -kill job_1527722723848_7112
Hadoop job information for Stage-3: number of mappers: 4; number of reducers: 1
2018-06-01 12:30:09,632 Stage-3 map = 0%,  reduce = 0%
2018-06-01 12:30:17,251 Stage-3 map = 25%,  reduce = 0%, Cumulative CPU 5.03 sec
2018-06-01 12:30:18,291 Stage-3 map = 50%,  reduce = 0%, Cumulative CPU 13.04 sec
2018-06-01 12:30:25,530 Stage-3 map = 100%,  reduce = 0%, Cumulative CPU 55.55 sec
2018-06-01 12:30:27,587 Stage-3 map = 100%,  reduce = 39%, Cumulative CPU 85.03 sec
2018-06-01 12:30:33,828 Stage-3 map = 100%,  reduce = 67%, Cumulative CPU 91.12 sec
2018-06-01 12:30:36,927 Stage-3 map = 100%,  reduce = 73%, Cumulative CPU 116.53 sec
2018-06-01 12:30:40,011 Stage-3 map = 100%,  reduce = 79%, Cumulative CPU 124.45 sec
2018-06-01 12:30:43,124 Stage-3 map = 100%,  reduce = 82%, Cumulative CPU 138.91 sec
2018-06-01 12:30:46,228 Stage-3 map = 100%,  reduce = 86%, Cumulative CPU 156.76 sec
2018-06-01 12:30:49,358 Stage-3 map = 100%,  reduce = 94%, Cumulative CPU 159.75 sec
2018-06-01 12:30:52,479 Stage-3 map = 100%,  reduce = 99%, Cumulative CPU 164.61 sec
2018-06-01 12:31:02,833 Stage-3 map = 100%,  reduce = 100%, Cumulative CPU 184.04 sec
MapReduce Total cumulative CPU time: 3 minutes 4 seconds 40 msec
Ended Job = job_1527722723848_7112
Launching Job 4 out of 6
Number of reduce tasks not specified. Estimated from input data size: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1527722723848_7118, Tracking URL = http://pmaster3:8088/proxy/application_1527722723848_7118/
Kill Command = /usr/local/hadoop/bin/hadoop job  -kill job_1527722723848_7118
Hadoop job information for Stage-4: number of mappers: 4; number of reducers: 1
2018-06-01 12:31:10,233 Stage-4 map = 0%,  reduce = 0%
2018-06-01 12:31:18,523 Stage-4 map = 25%,  reduce = 0%, Cumulative CPU 5.83 sec
2018-06-01 12:31:24,876 Stage-4 map = 50%,  reduce = 0%, Cumulative CPU 44.44 sec
2018-06-01 12:31:29,021 Stage-4 map = 67%,  reduce = 0%, Cumulative CPU 82.45 sec
2018-06-01 12:31:30,045 Stage-4 map = 75%,  reduce = 17%, Cumulative CPU 86.32 sec
2018-06-01 12:31:33,157 Stage-4 map = 75%,  reduce = 25%, Cumulative CPU 121.31 sec
2018-06-01 12:31:34,192 Stage-4 map = 100%,  reduce = 25%, Cumulative CPU 124.69 sec
2018-06-01 12:31:37,302 Stage-4 map = 100%,  reduce = 67%, Cumulative CPU 159.23 sec
2018-06-01 12:31:41,441 Stage-4 map = 100%,  reduce = 72%, Cumulative CPU 175.52 sec
2018-06-01 12:31:44,539 Stage-4 map = 100%,  reduce = 78%, Cumulative CPU 184.45 sec
2018-06-01 12:31:47,641 Stage-4 map = 100%,  reduce = 83%, Cumulative CPU 231.87 sec
2018-06-01 12:31:50,745 Stage-4 map = 100%,  reduce = 93%, Cumulative CPU 236.51 sec
2018-06-01 12:31:53,861 Stage-4 map = 100%,  reduce = 99%, Cumulative CPU 240.49 sec
2018-06-01 12:32:04,252 Stage-4 map = 100%,  reduce = 100%, Cumulative CPU 263.82 sec
MapReduce Total cumulative CPU time: 4 minutes 23 seconds 820 msec
Ended Job = job_1527722723848_7118
Launching Job 5 out of 6
Number of reduce tasks not specified. Estimated from input data size: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1527722723848_7124, Tracking URL = http://pmaster3:8088/proxy/application_1527722723848_7124/
Kill Command = /usr/local/hadoop/bin/hadoop job  -kill job_1527722723848_7124
Hadoop job information for Stage-5: number of mappers: 3; number of reducers: 1
2018-06-01 12:32:12,196 Stage-5 map = 0%,  reduce = 0%
2018-06-01 12:32:23,582 Stage-5 map = 33%,  reduce = 0%, Cumulative CPU 36.78 sec
2018-06-01 12:32:29,938 Stage-5 map = 44%,  reduce = 0%, Cumulative CPU 49.08 sec
2018-06-01 12:32:35,166 Stage-5 map = 67%,  reduce = 11%, Cumulative CPU 55.57 sec
2018-06-01 12:32:38,511 Stage-5 map = 67%,  reduce = 22%, Cumulative CPU 56.83 sec
2018-06-01 12:33:38,651 Stage-5 map = 67%,  reduce = 22%, Cumulative CPU 58.94 sec
2018-06-01 12:34:39,505 Stage-5 map = 67%,  reduce = 22%, Cumulative CPU 60.21 sec
2018-06-01 12:35:40,447 Stage-5 map = 67%,  reduce = 22%, Cumulative CPU 61.52 sec
2018-06-01 12:36:41,295 Stage-5 map = 67%,  reduce = 22%, Cumulative CPU 62.91 sec
2018-06-01 12:37:42,191 Stage-5 map = 67%,  reduce = 22%, Cumulative CPU 64.55 sec
2018-06-01 12:38:42,932 Stage-5 map = 67%,  reduce = 22%, Cumulative CPU 66.03 sec
2018-06-01 12:39:43,824 Stage-5 map = 67%,  reduce = 22%, Cumulative CPU 67.45 sec
2018-06-01 12:40:44,427 Stage-5 map = 67%,  reduce = 22%, Cumulative CPU 69.05 sec
2018-06-01 12:41:20,462 Stage-5 map = 100%,  reduce = 22%, Cumulative CPU 130.94 sec
2018-06-01 12:41:39,121 Stage-5 map = 100%,  reduce = 34%, Cumulative CPU 365.03 sec
2018-06-01 12:41:42,209 Stage-5 map = 100%,  reduce = 67%, Cumulative CPU 372.66 sec
2018-06-01 12:41:45,303 Stage-5 map = 100%,  reduce = 72%, Cumulative CPU 377.64 sec
2018-06-01 12:41:48,376 Stage-5 map = 100%,  reduce = 75%, Cumulative CPU 414.98 sec
2018-06-01 12:41:55,552 Stage-5 map = 100%,  reduce = 78%, Cumulative CPU 422.42 sec
2018-06-01 12:42:14,083 Stage-5 map = 100%,  reduce = 83%, Cumulative CPU 774.22 sec
2018-06-01 12:42:17,192 Stage-5 map = 100%,  reduce = 89%, Cumulative CPU 777.69 sec
2018-06-01 12:42:20,270 Stage-5 map = 100%,  reduce = 93%, Cumulative CPU 781.03 sec
2018-06-01 12:42:23,353 Stage-5 map = 100%,  reduce = 97%, Cumulative CPU 784.64 sec
2018-06-01 12:42:26,448 Stage-5 map = 100%,  reduce = 100%, Cumulative CPU 787.25 sec
MapReduce Total cumulative CPU time: 13 minutes 7 seconds 250 msec
Ended Job = job_1527722723848_7124
Launching Job 6 out of 6
Number of reduce tasks not specified. Estimated from input data size: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1527722723848_7163, Tracking URL = http://pmaster3:8088/proxy/application_1527722723848_7163/
Kill Command = /usr/local/hadoop/bin/hadoop job  -kill job_1527722723848_7163
Hadoop job information for Stage-6: number of mappers: 3; number of reducers: 1
2018-06-01 12:51:45,777 Stage-6 map = 0%,  reduce = 0%
2018-06-01 12:51:56,227 Stage-6 map = 33%,  reduce = 0%, Cumulative CPU 9.75 sec
2018-06-01 12:52:00,368 Stage-6 map = 44%,  reduce = 0%, Cumulative CPU 23.84 sec
2018-06-01 12:52:06,586 Stage-6 map = 67%,  reduce = 0%, Cumulative CPU 49.04 sec
2018-06-01 12:52:08,664 Stage-6 map = 67%,  reduce = 11%, Cumulative CPU 51.66 sec
2018-06-01 12:52:11,774 Stage-6 map = 67%,  reduce = 22%, Cumulative CPU 52.27 sec
2018-06-01 12:53:11,973 Stage-6 map = 67%,  reduce = 22%, Cumulative CPU 57.4 sec
2018-06-01 12:53:53,340 Stage-6 map = 100%,  reduce = 22%, Cumulative CPU 93.29 sec
2018-06-01 12:53:55,410 Stage-6 map = 100%,  reduce = 42%, Cumulative CPU 100.89 sec
2018-06-01 12:53:58,528 Stage-6 map = 100%,  reduce = 68%, Cumulative CPU 111.99 sec
2018-06-01 12:54:01,604 Stage-6 map = 100%,  reduce = 74%, Cumulative CPU 117.08 sec
2018-06-01 12:54:04,697 Stage-6 map = 100%,  reduce = 80%, Cumulative CPU 122.52 sec
2018-06-01 12:54:07,791 Stage-6 map = 100%,  reduce = 86%, Cumulative CPU 127.48 sec
2018-06-01 12:54:10,892 Stage-6 map = 100%,  reduce = 94%, Cumulative CPU 132.17 sec
2018-06-01 12:54:14,001 Stage-6 map = 100%,  reduce = 100%, Cumulative CPU 137.62 sec
MapReduce Total cumulative CPU time: 2 minutes 17 seconds 620 msec
Ended Job = job_1527722723848_7163
Loading data to table app.fin_yrb_use partition (dt=2018-05-31, sys=fin)
[Error 30017]: Skipping stats aggregation by error org.apache.hadoop.hive.ql.metadata.HiveException: [Error 30001]: StatsPublisher cannot be initialized. There was a error in the initialization of StatsPublisher, and retrying might help. If you dont want the query to fail because accurate statistics could not be collected, set hive.stats.reliable=false
Partition app.fin_yrb_use{dt=2018-05-31, sys=fin} stats: [numFiles=1, numRows=-1, totalSize=382546587, rawDataSize=-1]
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 3  Reduce: 1   Cumulative CPU: 121.3 sec   HDFS Read: 247527413 HDFS Write: 262259581 SUCCESS
Stage-Stage-2: Map: 3  Reduce: 1   Cumulative CPU: 177.18 sec   HDFS Read: 262295832 HDFS Write: 292162792 SUCCESS
Stage-Stage-3: Map: 4  Reduce: 1   Cumulative CPU: 184.04 sec   HDFS Read: 292209375 HDFS Write: 324715477 SUCCESS
Stage-Stage-4: Map: 4  Reduce: 1   Cumulative CPU: 263.82 sec   HDFS Read: 324760531 HDFS Write: 346671066 SUCCESS
Stage-Stage-5: Map: 3  Reduce: 1   Cumulative CPU: 787.25 sec   HDFS Read: 346712460 HDFS Write: 346697978 SUCCESS
Stage-Stage-6: Map: 3  Reduce: 1   Cumulative CPU: 137.62 sec   HDFS Read: 346739758 HDFS Write: 382546587 SUCCESS
Total MapReduce CPU Time Spent: 27 minutes 51 seconds 210 msec
OK
usage_id	user_id	status_cd	status	usage_type_cd	usage_type	pay_id	yrb_pay_amt	create_date	pay_bill_type_cd	pay_bill_type	pay_bill_status_cd	pay_bill_status	used_amt	fail_date	man_ope_type_cd	man_ope_type	man_ope_amt	man_ope_status_cd	man_ope_status	vail_days	man_ope_date	stat_dt	date_type
Time taken: 1580.832 seconds
hive (app)> hive Connect Successful!
sqls[4]:Execute End at: 2018-06-01 12:54:16
RET_CODE is 0 .................
sqls[5]: 
 
sqls[5]:Execute Begin at: 2018-06-01 12:54:16
ls: 无法访问/usr/local/spark/lib/spark-assembly-*.jar: 没有那个文件或目录
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option PermSize=256M; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option MaxPermSize=512m; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: Using incremental CMS is deprecated and will likely be removed in a future release
which: no hbase in (/usr/local/presto/bin:/usr/local/elasticsearch/bin:/usr/local/tachyon/bin:/usr/local/alluxio/bin:/usr/local/sentry/bin:/usr/local/maven/bin:/usr/local/sqoop2/bin:/usr/local/sqoop/bin:/usr/local/hive/bin:/usr/local/storm/bin:/usr/local/hbase/sbin:/usr/local/hbase/bin:/usr/local/flume/bin:/usr/local/kafka/bin:/usr/local/spark/bin:/usr/local/zookeeper/bin:/usr/local/scala/bin:/usr/local/hadoop/sbin:/usr/local/hadoop/bin:/usr/local/java/bin:/usr/local/slider/bin:/usr/local/bin:/usr/bin)
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option PermSize=256M; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option MaxPermSize=512m; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: Using incremental CMS is deprecated and will likely be removed in a future release
18/06/01 12:54:17 WARN conf.HiveConf: HiveConf of name hive.server2.in.mem.logging does not exist
18/06/01 12:54:17 WARN conf.HiveConf: HiveConf of name hive.task.progress does not exist
18/06/01 12:54:17 WARN conf.HiveConf: HiveConf of name hive.multigroupby.singlemr does not exist
18/06/01 12:54:17 WARN conf.HiveConf: HiveConf of name hive.server2.in.mem.log.size does not exist

Logging initialized using configuration in jar:file:/usr/local/apache/hive-1.1.0-cdh5.7.0/lib/hive-common-1.1.0-cdh5.7.0.jar!/hive-log4j.properties
WARNING: Hive CLI is deprecated and migration to Beeline is recommended.
hive (default)> hive Connect Successful!
sqls[6]: 
 
sqls[6]:Execute Begin at: 2018-06-01 12:54:16
ls: 无法访问/usr/local/spark/lib/spark-assembly-*.jar: 没有那个文件或目录
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option PermSize=256M; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option MaxPermSize=512m; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: Using incremental CMS is deprecated and will likely be removed in a future release
which: no hbase in (/usr/local/presto/bin:/usr/local/elasticsearch/bin:/usr/local/tachyon/bin:/usr/local/alluxio/bin:/usr/local/sentry/bin:/usr/local/maven/bin:/usr/local/sqoop2/bin:/usr/local/sqoop/bin:/usr/local/hive/bin:/usr/local/storm/bin:/usr/local/hbase/sbin:/usr/local/hbase/bin:/usr/local/flume/bin:/usr/local/kafka/bin:/usr/local/spark/bin:/usr/local/zookeeper/bin:/usr/local/scala/bin:/usr/local/hadoop/sbin:/usr/local/hadoop/bin:/usr/local/java/bin:/usr/local/slider/bin:/usr/local/bin:/usr/bin)
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option PermSize=256M; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option MaxPermSize=512m; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: Using incremental CMS is deprecated and will likely be removed in a future release
18/06/01 12:54:23 WARN conf.HiveConf: HiveConf of name hive.server2.in.mem.logging does not exist
18/06/01 12:54:23 WARN conf.HiveConf: HiveConf of name hive.task.progress does not exist
18/06/01 12:54:23 WARN conf.HiveConf: HiveConf of name hive.multigroupby.singlemr does not exist
18/06/01 12:54:23 WARN conf.HiveConf: HiveConf of name hive.server2.in.mem.log.size does not exist

Logging initialized using configuration in jar:file:/usr/local/apache/hive-1.1.0-cdh5.7.0/lib/hive-common-1.1.0-cdh5.7.0.jar!/hive-log4j.properties
WARNING: Hive CLI is deprecated and migration to Beeline is recommended.
hive (default)> hive Connect Successful!
sqls[7]: 
 
sqls[7]:Execute Begin at: 2018-06-01 12:54:22
ls: 无法访问/usr/local/spark/lib/spark-assembly-*.jar: 没有那个文件或目录
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option PermSize=256M; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option MaxPermSize=512m; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: Using incremental CMS is deprecated and will likely be removed in a future release
which: no hbase in (/usr/local/presto/bin:/usr/local/elasticsearch/bin:/usr/local/tachyon/bin:/usr/local/alluxio/bin:/usr/local/sentry/bin:/usr/local/maven/bin:/usr/local/sqoop2/bin:/usr/local/sqoop/bin:/usr/local/hive/bin:/usr/local/storm/bin:/usr/local/hbase/sbin:/usr/local/hbase/bin:/usr/local/flume/bin:/usr/local/kafka/bin:/usr/local/spark/bin:/usr/local/zookeeper/bin:/usr/local/scala/bin:/usr/local/hadoop/sbin:/usr/local/hadoop/bin:/usr/local/java/bin:/usr/local/slider/bin:/usr/local/bin:/usr/bin)
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option PermSize=256M; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option MaxPermSize=512m; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: Using incremental CMS is deprecated and will likely be removed in a future release
18/06/01 12:54:34 WARN conf.HiveConf: HiveConf of name hive.server2.in.mem.logging does not exist
18/06/01 12:54:34 WARN conf.HiveConf: HiveConf of name hive.task.progress does not exist
18/06/01 12:54:34 WARN conf.HiveConf: HiveConf of name hive.multigroupby.singlemr does not exist
18/06/01 12:54:34 WARN conf.HiveConf: HiveConf of name hive.server2.in.mem.log.size does not exist

Logging initialized using configuration in jar:file:/usr/local/apache/hive-1.1.0-cdh5.7.0/lib/hive-common-1.1.0-cdh5.7.0.jar!/hive-log4j.properties
WARNING: Hive CLI is deprecated and migration to Beeline is recommended.
hive (default)> hive Connect Successful!
sqls[8]: 
 
sqls[8]:Execute Begin at: 2018-06-01 12:54:33
hive Connect Successful!
run_sqlplus_command() = 0 ..............
ls: 无法访问/usr/local/spark/lib/spark-assembly-*.jar: 没有那个文件或目录
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option PermSize=256M; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option MaxPermSize=512m; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: Using incremental CMS is deprecated and will likely be removed in a future release
which: no hbase in (/usr/local/presto/bin:/usr/local/elasticsearch/bin:/usr/local/tachyon/bin:/usr/local/alluxio/bin:/usr/local/sentry/bin:/usr/local/maven/bin:/usr/local/sqoop2/bin:/usr/local/sqoop/bin:/usr/local/hive/bin:/usr/local/storm/bin:/usr/local/hbase/sbin:/usr/local/hbase/bin:/usr/local/flume/bin:/usr/local/kafka/bin:/usr/local/spark/bin:/usr/local/zookeeper/bin:/usr/local/scala/bin:/usr/local/hadoop/sbin:/usr/local/hadoop/bin:/usr/local/java/bin:/usr/local/slider/bin:/usr/local/bin:/usr/bin)
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option PermSize=256M; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option MaxPermSize=512m; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: Using incremental CMS is deprecated and will likely be removed in a future release
18/06/01 12:54:40 WARN conf.HiveConf: HiveConf of name hive.server2.in.mem.logging does not exist
18/06/01 12:54:40 WARN conf.HiveConf: HiveConf of name hive.task.progress does not exist
18/06/01 12:54:40 WARN conf.HiveConf: HiveConf of name hive.multigroupby.singlemr does not exist
18/06/01 12:54:40 WARN conf.HiveConf: HiveConf of name hive.server2.in.mem.log.size does not exist

Logging initialized using configuration in jar:file:/usr/local/apache/hive-1.1.0-cdh5.7.0/lib/hive-common-1.1.0-cdh5.7.0.jar!/hive-log4j.properties
WARNING: Hive CLI is deprecated and migration to Beeline is recommended.
hive (default)> 

