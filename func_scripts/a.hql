--8,32,2,16g,16g,root.mapreduce.hadoop
--set spark.akka.frameSize=1024;
--set spark.sql.files.maxPartitionBytes=536870912;
--set spark.shuffle.file.buffer=128K;
--set spark.sql.shuffle.partitions=100;
--set spark.reducer.maxReqsInFligh=4294967294;
------------------------------------------------------------------------------------------------
--  file name   : FIN_PLATFORM_MANAGE_FEE.ssl
--  author      : wenbowang6
--  create date : 2018/04/23
--  fun desc    : 服务费测算
--  target_table: app.FIN_PLATFORM_MANAGE_FEE
--  source_table : stg.b_apply_info,stg.B_BASIC_INFO,stg.REPAYMENT_STATISTICS,stg.c_user_regist_info,stg.p_borrower_product
--                 stg.p_product,gdm.SUM_BOR_INFO,fdm.CN_SUBM_CHNL
--  tem_table   :
--
-- $yesterday =  上个月最后一天 2018-03-31
-- '$LoanStartTime'=2010-01-01
-- '$PayStartTime'=2010-01-01
--  全量
--
--  append       :   ISPICC --是否PICC; apply_rate --借款申请评级
----------------------------------------------------------------------------------------------
-------------------------
--  Copyright(c) 2018  webowang6
--  All Rights Reserved.
------------------------------------------------------------------------------------------------

set mapred.job.queue.name=root.mapreduce.hive;
use tmp;
drop table if exists tmp.FIN_PLATFORM_MANAGE_FEE_TMP1;
create table tmp.FIN_PLATFORM_MANAGE_FEE_TMP1
(
APPLY_ID string,
CONTRACT_ID string,
IAPPROVE_AMT double,
IAPPROVE_INHAND_AMT double,
IAPPROVE_NO int,
s_audit_date    string,
PLAN_PAY_AMT double,
PLAN_PAY_PRINCIPAL double,
PLAN_PAY_INTEREST double,
PLAN_PAY_MANAGE double,
ACTUAL_PAY_AMT double,
ACTUAL_PAY_PRINCIPAL double,
ACTUAL_PAY_INTEREST double,
PERIOD_NUM int,
PERIOD_START_TIME string,
PERIOD_END_TIME string,
ACTUAL_PAY_STATUS string,
IS_OVERDUE string,
OVERDUE_DAYS int,
CountTime string,
PLAN_PAY_PRINCIPAL_total double,
PAY_MANAGE double,
STA_ID string,
channel string,
TRANSPORT_SOURCE string,
count_overdue_dates string,
ranks int
) stored as parquet
;

 -- 非信托借款申请信息
set mapred.job.queue.name=root.mapreduce.hive;
set spark.sql.shuffle.partitions=10;
use tmp;
insert overwrite table tmp.FIN_PLATFORM_MANAGE_FEE_TMP1
select A.*,
ROW_NUMBER() OVER(PARTITION BY A.APPLY_ID ORDER BY A.count_overdue_dates desc) as N
from (
select   cast(BAI.I_APPLY_ID as bigint)  as APPLY_ID, --  借款申请ID,
RS.CONTRACT_ID  as CONTRACT_ID,                  --                  合同号,
cast(BAI.IAPPROVE_AMT as decimal(18,4))    as IAPPROVE_AMT, --                合同金额,
BAI.IAPPROVE_INHAND_AMT as IAPPROVE_INHAND_AMT, --         批核到手金额,
BAI.IAPPROVE_NO    as IAPPROVE_NO,--              批核分期数,
TO_DATE(BAI.S_AUDIT_DATE)  as S_AUDIT_DATE,--                          放款时间,
RP.PLAN_PAY_AMT  as PLAN_PAY_AMT,--                                   计划应还总金额,
RP.PLAN_PAY_PRINCIPAL as PLAN_PAY_PRINCIPAL,--                               计划应还本金,
RP.PLAN_PAY_INTEREST  as PLAN_PAY_INTEREST  ,--                             计划应还利息,
nvl(cast(RP.PLAN_PAY_MANAGE as decimal(18,4)),0) as PLAN_PAY_MANAGE,--     计划支付管理费,
RP.ACTUAL_PAY_AMT   as ACTUAL_PAY_AMT   ,--                              实际支付总金额,
RP.ACTUAL_PAY_PRINCIPAL  as ACTUAL_PAY_PRINCIPAL,--                            实际支付本金,
RP.ACTUAL_PAY_INTEREST   as ACTUAL_PAY_INTEREST,--                            实际支付利息,
cast(RP.PERIOD_NUM as int)   as PERIOD_NUM ,--                       期数,
TO_DATE(RP.PERIOD_START_TIME)  as PERIOD_START_TIME ,--                     正常还款开始时间,
TO_DATE(RP.PERIOD_END_TIME)   as PERIOD_END_TIME ,--                      当期还款截止日期,
case when RP.ACTUAL_PAY_STATUS = '0' then '未还'
when RP.ACTUAL_PAY_STATUS = '1' then '已还清'
when RP.ACTUAL_PAY_STATUS = '2' then '未还清'
else RP.ACTUAL_PAY_STATUS
end as ACTUAL_PAY_STATUS,--  还款状态,
case when RP.IS_OVERDUE = '0' then '否'
when RP.IS_OVERDUE = '1' then '是'
else RP.IS_OVERDUE
end as IS_OVERDUE,--   是否逾期,
cast(RP.OVERDUE_DAYS as int)  as OVERDUE_DAYS  ,--                     逾期天数,
'$yesterday'    as CountTime,--                                     统计时点,    --修改参数
RS.PLAN_PAY_PRINCIPAL  as PLAN_PAY_PRINCIPAL_total   ,--                           应还本金总额,
nvl(cast(RS.PLAN_PAY_MANAGE as decimal(18,4)),0) as PAY_MANAGE,--     平台管理费,
RS.STA_ID   as STA_ID          ,--                               统表ID,
'非信托'    as channel     ,--                                    渠道,
(CASE when BAI.TRANSPORT_SOURCE LIKE 'JK01%' THEN '线上'
WHEN TO_date(BAI.S_AUDIT_DATE) >= '2015-01-01' AND  BAI.TRANSPORT_SOURCE LIKE 'JK02%' AND (CURI.C_TYPE_SOURCE='ZC03010001' or CURI.C_TYPE_SOURCE='ZC03010002') THEN '线上'
WHEN TO_date(BAI.S_AUDIT_DATE) >= '2015-01-01' AND  BAI.TRANSPORT_SOURCE LIKE 'JK02%' AND (CURI.C_TYPE_SOURCE<>'ZC03010001' or CURI.C_TYPE_SOURCE<>'ZC03010002') THEN '线下'
WHEN TO_date(BAI.S_AUDIT_DATE) <  '2015-01-01' AND  BAI.TRANSPORT_SOURCE LIKE 'JK02%' THEN '线下'
ELSE NULL END)   as TRANSPORT_SOURCE  ,--                           报告渠道,
(case when RP.IS_OVERDUE = '0' then 0
when RP.IS_OVERDUE = '1' and RP.ACTUAL_PAY_STATUS = '1'
and date_add(TO_DATE(RP.PERIOD_END_TIME),cast(RP.OVERDUE_DAYS as int)) >= TO_DATE('$yesterday')
then (unix_timestamp('$yesterday') - unix_timestamp(RP.PERIOD_END_TIME))/86400  --逾期但已还清
when RP.IS_OVERDUE = '1' and RP.ACTUAL_PAY_STATUS = '1' and
date_add(TO_DATE(RP.PERIOD_END_TIME),cast(RP.OVERDUE_DAYS as int)) <  TO_DATE('$yesterday')
then cast(RP.OVERDUE_DAYS as int)
when RP.IS_OVERDUE = '1' and (RP.ACTUAL_PAY_STATUS = '0' or RP.ACTUAL_PAY_STATUS = '2')
then (unix_timestamp('$yesterday') - unix_timestamp(RP.PERIOD_END_TIME)) / 86400
ELSE null END) AS count_overdue_dates-- 截至统计时点逾期天数
from (select * from stg.stg.B_APPLY_INFO where dt='$yesterday') BAI
left join (select * from stg.stg.REPAYMENT_PLAN where dt='$yesterday') RP ON BAI.I_APPLY_ID = RP.APPLY_ID
LEFT JOIN (select * from stg.stg.REPAYMENT_STATISTICS where dt='$yesterday') RS ON RS.APPLY_ID = cast(BAI.I_APPLY_ID as BIGINT) --REPAYMENT_STATISTICS还款统表
LEFT JOIN (select * from stg.stg.C_USER_REGIST_INFO where dt='$yesterday') CURI ON CURI.I_USER_ID =RS.BORROWER_USER_ID
WHERE BAI.ISVALID = '1'    --有效的借款申请
AND BAI.S_AUDIT_DATE >= '2010-01-01'
AND to_date(BAI.S_AUDIT_DATE) <=  '$yesterday'
AND BAI.STATUS IN ('1','2') --0.投标中 1. 还款中 2.已还清 .3 流标、4 待审 6 被拒绝放款 7 被取消 8 用户主动取消
--AND RP.ACTUAL_PAY_STATUS IN ('0','2')
--AND RP.IS_OVERDUE = '1'
and RP.INVALID = '0'
) A
;

set mapred.job.queue.name=root.mapreduce.hive;
use tmp;
drop table if exists tmp.FIN_PLATFORM_MANAGE_FEE_TMP2;
create table tmp.FIN_PLATFORM_MANAGE_FEE_TMP2
(
APPLY_ID string,
CONTRACT_ID string,
PERIOD int,
IS_AHEAD int,
PAY_DATE string,
REPAYMENT_PRINCIPAL double,
REPAYMENT_INTEREST double,
REPAYMENT_MANAGE double
) stored as parquet
;

-- 借款实还信息
set mapred.job.queue.name=root.mapreduce.hive;
set spark.sql.shuffle.partitions=10;
use tmp;
insert overwrite table tmp.FIN_PLATFORM_MANAGE_FEE_TMP2
select cast(RS.APPLY_ID as bigint) as APPLY_ID,--                           `借款申请ID`,
RS.CONTRACT_ID as CONTRACT_ID,--                        `合同号`,
cast(ARD.PERIOD as int) as PERIOD ,--              `所属期数`,
max(ARD.IS_AHEAD)  as IS_AHEAD ,--                  `是否提前结清`,
MAX(to_date(AR.PAY_DATE)) as PAY_DATE  ,--          `实还日期`,
NVL(SUM(ARD.REPAYMENT_PRINCIPAL),0) as REPAYMENT_PRINCIPAL ,-- `实还本金`,
NVL(SUM(ARD.REPAYMENT_INTEREST),0) as REPAYMENT_INTEREST,--   `实还利息`,
sum(NVL(ARD.REPAYMENT_MANAGE,0)) as REPAYMENT_MANAGE --        `实际支付管理费`
FROM (select * from stg.ACTUAL_REPAYMENT_DETAIL where dt='$yesterday') ARD
left join (select * from stg.ACTUAL_REPAYMENT where dt='$yesterday') AR ON ARD.ACTUAL_REPAYMENT_ID = AR.ACTUAL_REPAYMENT_ID
left join (select * from stg.REPAYMENT_STATISTICS where dt='$yesterday') RS ON RS.STA_ID = AR.STA_ID
where AR.PAY_DATE >='2010-01-01'
and to_date(AR.PAY_DATE)<= '$yesterday'
GROUP BY cast(RS.APPLY_ID as bigint),RS.CONTRACT_ID,cast(ARD.PERIOD as int)
;

set mapred.job.queue.name=root.mapreduce.hive;
use tmp;
drop table if exists tmp.FIN_PLATFORM_MANAGE_FEE_TMP3;
create table tmp.FIN_PLATFORM_MANAGE_FEE_TMP3
(
APPLY_ID string,
fee_rate string,
payment_type string,
RATE_NAME string
) stored as parquet
;

-- 产品费率
set mapred.job.queue.name=root.mapreduce.hive;
set spark.sql.shuffle.partitions=10;
use tmp;
insert overwrite table tmp.FIN_PLATFORM_MANAGE_FEE_TMP3
select distinct(cast(PBP.APPLY_ID as bigint)) as APPLY_ID,  --`借款申请ID`,
(case when P.PRODUCT_NAME like '%0.78%' then '0.78'
when P.PRODUCT_NAME like '%1.29%' then '1.29'
when P.PRODUCT_NAME like '%1.59%' then '1.59'
when P.PRODUCT_NAME like '%1.89%' then '1.89'
when P.PRODUCT_NAME like '%2.19%' then '2.19'
when P.PRODUCT_NAME like '%129%' then '1.29'
when P.PRODUCT_NAME like '%159%' then '1.59'
when P.PRODUCT_NAME like '%1.74%' then '1.74'
when P.PRODUCT_NAME like '%1.77%' then '1.77'
when P.PRODUCT_NAME like '%189%' then '1.89'
when P.PRODUCT_NAME in ('自主申请','精英贷','旧码上贷','旧瞬时贷','随时贷','工薪借款') then '0.78'
else P.PRODUCT_NAME end) AS fee_rate,  --`借款人费率`,
(case when B.PLATFORM_FEE_RATE ='0' and LOAN_FEE_RATE>'0' then '趸交'
when B.PLATFORM_FEE_RATE >'0' and LOAN_FEE_RATE='0' then '期交'
when B.PLATFORM_FEE_RATE >'0' and LOAN_FEE_RATE>'0' then '双棒'
else null end)   as payment_type,  --  `缴费方式`,
B.RATE_NAME   as RATE_NAME   --         `费率名称`
from (select APPLY_ID,PRODUCT_ID from stg.P_BORROWER_PRODUCT where dt='$yesterday') PBP
LEFT JOIN (select PRODUCT_ID,PRODUCT_NAME,rate_code from stg.P_PRODUCT where dt='$yesterday') P ON P.PRODUCT_ID = PBP.PRODUCT_ID
left join (select RATE_NAME,RATE_CODE,LOAN_FEE_RATE,PLATFORM_FEE_RATE from stg.borrow_rate where dt='$yesterday') B on P.rate_code=B.RATE_CODE
;




set mapred.job.queue.name=root.mapreduce.hive;
use tmp;
drop table if exists tmp.FIN_PLATFORM_MANAGE_FEE_TMP4;
create table tmp.FIN_PLATFORM_MANAGE_FEE_TMP4
(
APPLY_ID string
) stored as parquet
;

-- 添加保费信息
set mapred.job.queue.name=root.mapreduce.hive;
set spark.sql.shuffle.partitions=10;
use tmp;
insert overwrite table tmp.FIN_PLATFORM_MANAGE_FEE_TMP4
select
ala.appid
-- ,sum(c.cash_value) as cash_value  -- 汇总每一笔申请的保费金额
from (select appid,id from stg.apply_loan_audit where dt='$yesterday') ala
left join (select flow_bus_id,business_id,flow_bus_type_id,create_date from stg.flow_business where dt='$yesterday') b on ala.id = b.business_id
left join ods.s01_flow_cash c on c.flow_bus_id = b.flow_bus_id
left join (select * from stg.flow_dic_cash_type where dt='$yesterday') ct on ct.flow_cash_type_id = c.flow_cash_type_uuid
where   b.flow_bus_type_id = '1004'
and ct.flow_cash_type_id = '200422'
and substr(b.create_date,1,10)<='$yesterday'
group by ala.appid
;





set mapred.job.queue.name=root.mapreduce.hive;
use app;
drop table if exists app.FIN_PLATFORM_MANAGE_FEE;
create table app.FIN_PLATFORM_MANAGE_FEE
(
s_audit_date  string,
IAPPROVE_NO int,
channel string,
fee_rate string,
CHARGE_MODEL string,
status string,
PERIOD int,
plan_pay_year_mon string,
actual_pay_year_mon string,
count_date string,
ISPICC string,
IAPPROVE_AMT double,
MANAGE double,
PLAN_PAY_MANAGE double,
acutal_PAY_MANAGE double
) stored as parquet
;



set mapred.job.queue.name=root.mapreduce.hive;
set spark.sql.shuffle.partitions=10;
use app;
insert overwrite table app.FIN_PLATFORM_MANAGE_FEE
SELECT substr(B.S_AUDIT_DATE,1,7) as  S_AUDIT_DATE, --   `放款时间`,
B.IAPPROVE_NO  as IAPPROVE_NO ,--    `借款期限`
B.TRANSPORT_SOURCE  as channel, --          `进件来源`,
B3.fee_rate  as fee_rate,--            `借款人费率`,
B3.payment_type   as CHARGE_MODEL,--             `缴费方式`,
(case when B5.IS_AHEAD='是'  then '提前结清'
when B4.risk_type = '是' then '逾期大于90天'
WHEN cast(B.count_overdue_dates as int) BETWEEN 1 and 30  then '逾期1至30天'
WHEN cast(B.count_overdue_dates as int) BETWEEN 31 and 60 then '逾期31至60天'
WHEN cast(B.count_overdue_dates as int) BETWEEN 61 and 90 then '逾期61至90天'
else '正常还款' end) as status, -- `还款状态`,
B.PERIOD_NUM as period,
substr(B.PERIOD_END_TIME,1,7) as plan_pay_year_mon, --`应还年月` ,
substr(B1.PAY_DATE,1,7) as actual_pay_year_mon, --        `实还年月`,
B.CountTime  as count_date,                --    `统计时点`,
--12*(year(B.统计时点) - year(B.放款时间)) + month(B.统计时点) - month(B.放款时间)   M,
SUM(B.IAPPROVE_AMT)  as IAPPROVE_AMT  ,         --    `合同金额`,
SUM(B.PLAN_PAY_MANAGE) as  MANAGE  ,       --   `平台管理费`,
sum(B.PLAN_PAY_MANAGE) as PLAN_PAY_MANAGE ,      --   `应还平台管理费`,
sum(B1.REPAYMENT_MANAGE) as acutal_PAY_MANAGE,      --  `实还平台管理费`
case when B6.appid is null then '否'
else '是' end  AS ISPICC, -- 是否PICC
case when nr.IS_FRAUD='欺诈' then '欺诈'
else nr.NEW_RATE_REVISED end as apply_rate  --借款申请评级
FROM tmp.FIN_PLATFORM_MANAGE_FEE_TMP1 B
left join tmp.FIN_PLATFORM_MANAGE_FEE_TMP2 B1 ON (B1.APPLY_ID = B.APPLY_ID and B.PERIOD_NUM = B1.PERIOD)
LEFT JOIN tmp.FIN_PLATFORM_MANAGE_FEE_TMP3 B3 ON B3.APPLY_ID = cast(B.APPLY_ID as bigint)
left join (select APPLY_ID,--`借款申请ID`,
PERIOD_NUM ,--`M3所在期数`,
'是' as risk_type -- `风险状态`
from tmp.FIN_PLATFORM_MANAGE_FEE_TMP1
where N=1 and b.count_overdue_dates>=90) B4 on B4.APPLY_ID=B.APPLY_ID
left join (select APPLY_ID,-- `借款申请ID`,
PERIOD as PERIOD,--`提前结清所属期数`,
'是' as IS_AHEAD
from tmp.FIN_PLATFORM_MANAGE_FEE_TMP2 B1
where IS_AHEAD='1') B5 on B5.APPLY_ID=cast(B.APPLY_ID as bigint)
left join tmp.app_fin_loan_sum_all_audit_tmp04 B6 on B.APPLY_ID=B6.appid
left join app.FIN_APPLY_NEW_RATE nr on B.APPLY_ID=nr.apply_id
-- WHERE to_date(B.`放款时间`) >=  '2017-12-01'
--AND to_date(B.`放款时间`) <=  '2018-01-31' -- 分批次跑
GROUP BY substr(B.S_AUDIT_DATE,1,7), --   `放款时间`,
B.IAPPROVE_NO ,--    `借款期限`
B.TRANSPORT_SOURCE, --          `进件来源`,
B3.fee_rate,--            `借款人费率`,
B3.payment_type,--             `缴费方式`,
(case when B5.IS_AHEAD='是'  then '提前结清'
when B4.risk_type = '是' then '逾期大于90天'
WHEN cast(B.count_overdue_dates as int) BETWEEN 1 and 30  then '逾期1至30天'
WHEN cast(B.count_overdue_dates as int) BETWEEN 31 and 60 then '逾期31至60天'
WHEN cast(B.count_overdue_dates as int) BETWEEN 61 and 90 then '逾期61至90天'
else '正常还款' end), -- `还款状态`,
B.PERIOD_NUM ,
substr(B.PERIOD_END_TIME,1,7) , --`应还年月` ,
substr(B1.PAY_DATE,1,7), --        `实还年月`,
B.CountTime,                --    `统计时点`,
case when B6.appid is null then '否'
else '是' end,
case when nr.IS_FRAUD='欺诈' then '欺诈'
else nr.NEW_RATE_REVISED end as apply_rate  --借款申请评级
;



