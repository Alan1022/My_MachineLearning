--2,32,2,8g,4g,root.mapreduce.hadoop
--set spark.akka.frameSize=1024;
--set spark.sql.files.maxPartitionBytes=536870912;
--set spark.shuffle.file.buffer=128K;
--set spark.reducer.maxReqsInFligh=4294967294;
------------------------------------------------------------------------------------------------
--  file name   : FBI_AHEAD_REPAYMENT_DETAIL.hql
--  author      : bingao4
--  create date : 2018/03/16
--  fun desc    : 宜人贷提前还款明细表
--  target_table: APP.FBI_AHEAD_REPAYMENT_DETAIL
--  source_table :stg.ACTUAL_REPAYMENT_DETAIL,stg.ACTUAL_REPAYMENT,stg.REPAYMENT_STATISTICS,stg.trust_repayment_record_detail,stg.trust_repayment_record,stg.trust_repayment_statistics,app.ACTUAL_REPAYMENT_xhx,app.ACTUAL_REPAYMENT_DTL_xhx
--  tem_table   :
--  modify date : 2018-04-27
--  moifier     : bingao4
--  modify content :1追加【是否循环贷】字段,2.修正信托中，提前还款金额不正确问题
--  modify date : 2018-05-09
--  moifier     : yunbai7
--  modify content :1 增加百宜贷提前还款数据
--
----------------------------------------------------------------------------------------------
-------------------------
--  Copyright(c) 2008-2020  yrd
--  All Rights Reserved.
------------------------------------------------------------------------------------------------
set mapred.job.queue.name=root.mapreduce.hive;
use tmp;
drop table if exists tmp.fbi_ahead_repayment_detail_01;
create table tmp.fbi_ahead_repayment_detail_01
(
apply_id string,
period int,
ahead_date string,
ahead_repayment_principal string
)
stored as parquet
;

set spark.sql.shuffle.partitions=1;
use tmp;
insert overwrite table tmp.fbi_ahead_repayment_detail_01
select RS.APPLY_ID,                           --借款申请ID,
cast(ARD.PERIOD as int) as PERIOD,     --所属期数,
--RS.CREATE_DATE                        放款时间,
--RS.BORROWER_USER_ID                   客户ID,
--RS.CONTRACT_ID                        合同号,
max(TO_DATE(AR.PAY_DATE)) as ahead_date,                  --实还日期,
SUM(nvl(ARD.REPAYMENT_PRINCIPAL,0)) as ahead_REPAYMENT_PRINCIPAL   --实还本金,
--SUM(nvl(ARD.REPAYMENT_INTEREST,0))    实还利息,
--sum(nvl(ARD.REPAYMENT_PENALTY,0))            实收罚息
FROM (select * from stg.ACTUAL_REPAYMENT_DETAIL where IS_AHEAD = '1' and DT='$yesterday') ARD
left join (select * from stg.ACTUAL_REPAYMENT where DT='$yesterday') AR ON ARD.ACTUAL_REPAYMENT_ID = AR.ACTUAL_REPAYMENT_ID
left join (select * from stg.REPAYMENT_STATISTICS where DT='$yesterday') RS ON RS.STA_ID = AR.STA_ID
where substr(RS.CREATE_DATE,1,10) <= '$yesterday'
AND substr(AR.PAY_DATE,1,10) <= '$yesterday'      --实还时间
GROUP BY RS.APPLY_ID,cast(ARD.PERIOD as int)
UNION ALL
select TRRD.APPLY_ID,              --借款申请ID,
CAST(TRRD.PERIOD AS INT) as PERIOD, --所属期数,
--TRS.CREATE_TIME                           放款时间,
--cast(TRS.USER_ID as bigint)               客户ID,
--CAST(TRS.TRUST_CONTRACT_ID AS BIGINT)     合同号,
MAX(to_date(TRRD.REPAYMENT_TIME)) as ahead_date,              --实还日期,
--DECODE(TRR.REPAYMENT_TYPE,'0','正常还款','1','提前还款','3','逾期还款','4','逾期结清',TRR.REPAYMENT_TYPE)   是否提前结清,
NVL(SUM(CAST(TRRD.REPAY_PRINCIPAL AS decimal(18,4))),0) as ahead_REPAYMENT_PRINCIPAL      --实还本金,
--NVL(SUM(CAST(TRRD.REPAY_INTEREST AS decimal(18,4))),0)       实还利息,
--sum(nvl(cast(TRRD.OVERDUE_PENALTY as decimal(18,4)),0))      实收罚息,
FROM (select * from stg.trust_repayment_record_detail where DT='$yesterday' and REPAYMENT_TYPE in ('1','4')) TRRD
--left join (select * from stg.trust_repayment_record where DT='$yesterday') TRR ON TRR.APPLY_ID = TRRD.APPLY_ID
left join (select * from stg.trust_repayment_statistics where DT='$yesterday') TRS ON TRS.APPLY_ID = TRRD.APPLY_ID
where substr(TRS.CREATE_TIME,1,10) <= '$yesterday'
AND substr(TRRD.REPAYMENT_TIME,1,10) <= '$yesterday'
GROUP BY TRRD.APPLY_ID,CAST(TRRD.PERIOD AS INT)
--order by 借款申请ID,所属期数
UNION ALL
select AR.APPLY_ID,                      --借款申请id,
cast(ARD.PERIOD as int) as PERIOD,         --提前结清所在期数
TO_DATE(MAX(AR.PAY_DATE)) as ahead_date,      --提前结清时间
sum(ARD.REPAYMENT_PRINCIPAL) as ahead_REPAYMENT_PRINCIPAL    --实还本金
from (select * from app.ACTUAL_REPAYMENT_xhx where DT='$yesterday') AR
left join (select * from app.ACTUAL_REPAYMENT_DTL_xhx where DT='$yesterday') ARD on ARD.ACTUAL_REPAYMENT_ID = AR.ACTUAL_REPAYMENT_ID
where ARD.IS_AHEAD = '1'
group by AR.APPLY_ID,cast(ARD.PERIOD as int)
UNION ALL
--宜百贷
SELECT tyo.loan_id AS apply_id, --借款申请id,
cast(cur_term as int) PERIOD, --提前结清所在期数
ahead_date, --提前结清时间
ahead_REPAYMENT_PRINCIPAL --实还本金
FROM
(SELECT loan_id
FROM stg.tb_ybd_order
WHERE dt=substr(date_sub(current_date,1),1,10) AND ORDER_STATUS IN (60) AND IS_VALID=1) tyo
LEFT JOIN
(SELECT loan_id, prin_repay/100 AS ahead_REPAYMENT_PRINCIPAL,
cur_term, concat(substr(clear_date, 1, 4), '-',substr(clear_date,5,2),'-',substr(clear_date,7,2)) AS ahead_date
FROM stg.tb_ybd_baidu_loan
WHERE DT='$yesterday') tybl
ON tyo.loan_id=tybl.loan_id
;

set mapred.job.queue.name=root.mapreduce.hive;
use app;
drop table if exists app.fbi_ahead_repayment_detail;
create table app.fbi_ahead_repayment_detail as
select
apply_id,
period,
to_date(ahead_date) as ahead_date,
ahead_repayment_principal,
(case when ls.loop_appid is not null then '是' else '否' end) as is_loop_loan --是否循环贷
from tmp.fbi_ahead_repayment_detail_01 fard
left join stg.loan_settle ls
on(fard.apply_id = ls.appid and ls.dt='$yesterday' and ls.status='2')
;




