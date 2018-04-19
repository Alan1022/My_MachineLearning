--8,32,2,16g,16g,root.mapreduce.hadoop
--set spark.akka.frameSize=1024;
--set spark.sql.files.maxPartitionBytes=536870912;
--set spark.shuffle.file.buffer=128K;
--set spark.sql.shuffle.partitions=100;
--set spark.reducer.maxReqsInFligh=4294967294;
------------------------------------------------------------------------------------------------
--  file name   : LOANINFO.ssl
--  author      : feifeibai
--  create date : 2016/06/30
--  fun desc    : 中合担保数据对接--借款信息
--  target_table: DMS.LOANINFO
--  SOURCE_TABLE :
--
--  tem_table   :
--  modify date :
--  moifier     :
--  modify content :
----------------------------------------------------------------------------------------------
--  Copyright(c) 2008-2015  yrd
--  All Rights Reserved.
------------------------------------------------------------------------------------------------
;
use tmp;
drop table if exists tmp.loaninfo_tmp01;
create table tmp.loaninfo_tmp01
(
apply_id string,
iapprove_amt string,
PERIODS string,
total_FEE string,
server_FEE string,
COMPLETE_TIME string,
FEE_TYPE string
) stored as parquet
;

use tmp;
set spark.sql.shuffle.partitions=10;
insert overwrite table tmp.loaninfo_tmp01
SELECT 
ala.appid as apply_id, --借款单号
bai.iapprove_amt, –-合同金额
rs.PERIODS, –-借款期限
mfr1.FEE as total_FEE, –-风险保障金总金额/风险保障费（单给融担公司的费用，不包含服务费）
mfr2.FEE as server_FEE, –-服务费 
substr(ala.COMPLETE_TIME,1,19) as COMPLETE_TIME, –-收款日期/贷款发放日期
'C1' as FEE_TYPE --收款类型
FROM (select * from stg.apply_loan_audit where dt='$yesterday') ala
LEFT JOIN (select *from stg.b_apply_info where dt='$yesterday') bai 
ON ala.appid = bai.i_apply_id
LEFT JOIN (select *from stg.MAKELOAN_FEE_RECORD where dt='$yesterday')mfr1 
ON mfr1.APPLY_ID = ala.appid
AND mfr1.FEE_TYPE = 'ASSURANCE_FEE'
LEFT JOIN (select * from stg.MAKELOAN_FEE_RECORD where dt='$yesterday') mfr2 
ON mfr2.APPLY_ID = ala.appid
AND mfr2.FEE_TYPE = 'ASSU_MANAGE_FEE'
INNER JOIN (select * from stg.REPAYMENT_STATISTICS where dt='$yesterday') rs ON rs.APPLY_ID = ala.appid
AND rs.INSURANCE_COMPANY_CODE = 'ZHRD'--中和融担的单子
where ala.status =1  -- 放款成功
AND substr(ala.COMPLETE_TIME,1,10) ='$yesterday'    --放款日期增量条件
;

use tmp;
drop table if exists tmp.loaninfo_tmp02;
create table tmp.loaninfo_tmp02
(
project_id string,
apply_id string,
user_name string,
card_no string,
PERIODS string,
iapprove_amt string,
product_type string,
total_FEE string,
server_FEE string,
COMPLETE_TIME string,
expand1 string,
expand2 string,
expand3 string,
expand4 string,
expand5 string,
expand6 string,
expand7 string
) stored as parquet
;

use tmp;
set spark.sql.shuffle.partitions=10;
insert overwrite table tmp.loaninfo_tmp02
SELECT '' as project_id
       t1.apply_id,
       bi.user_name,
       bi.card_no,
       t1.PERIODS,
       t1.iapprove_amt,
       case when pi.product_type in ('0','1','2','4','5','9','10','14') then '精英模式'
            when pi.product_type in ('3','7','11','15') then '极速模式'
            when pi.product_type = '6' then '公积金'
            when pi.product_type = '12' then '寿险'
            when pi.product_type = '13' then '小咖贷'
            else pi.product_type end as product_type,
       t1.total_FEE,
       t1.server_FEE,
       t1.COMPLETE_TIME,
       '' as expand1,
       '' as expand2,
       '' as expand3,
       '' as expand4,
       '' as expand5,
       '' as expand6,
       '' as expand7
FROM tmp.loaninfo_tmp01 t1
left join (select * from dw.application_borrower_info where dt='$yesterday') bi on t1.apply_id = bi.apply_id
left join (select * from stg.audit_application where dt='$yesterday')aa on aa.apply_id = t1.apply_id
left join (select * from stg.product_info where dt='$yesterday') pi on aa.audit_product_id=pi.product_id
;

use dms;
set spark.sql.shuffle.partitions=10;
insert overwrite table dms.loaninfo partition (dt='$yesterday')
select
concat_ws(project_id,'~@~',apply_id,'~@~',user_name,'~@~',card_no,'~@~',periods,'~@~',iapprove_amt,'~@~',product_type,'~@~',total_fee,'~@~',server_fee,'~@~',complete_time,'~@~',expand1,'~@~',expand2,'~@~',expand3,'~@~',expand4,'~@~',expand5,'~@~',expand6,'~@~',expand7)
from tmp.loaninfo_tmp02
;

use tmp;
drop table if exists tmp.loaninfo_tmp03;
create table tmp.loaninfo_tmp03 as
select count(1) as nums,sum(coalesce(iapprove_amt,0)) as totalamount from tmp.loaninfo_tmp02
;




