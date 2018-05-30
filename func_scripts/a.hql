------------------------------------------------------------------------------------------------
--  file name   : FBI_LEND_DETAIL_YDY_AUM.hql
--  author      : bingao4
--  create date : 2017/12/18
--  fun desc    : 宜人贷财务出借宜定盈AUM明细
--  target_table: APP.FBI_LEND_DETAIL_YDY_AUM
--  source_table :FINANCE_RENEW_PROCESS,STG.FINACES_MANAGER,STG.FINACE_PRODUCT,STG.PAY_BILL_MAIN,STG.TPW_RECHARGE,STG.C_USER_REGIST_INFO,STG.REGIST_CHANNEL,STG.UMBRELLA_BORROWER,ODS.S05_C_EMPLOYEE,ODS.S05_C_ORGUNIT
--  tem_table   :
--  modify date : 
--  moifier     : 
--  modify content : 
--  params desc: 如果跑2018年3月份的AUM明细，那么$yesterday='2018-03-31'
----------------------------------------------------------------------------------------------
-------------------------
--  Copyright(c) 2008-2020  yrd
--  All Rights Reserved.
------------------------------------------------------------------------------------------------
set mapred.job.queue.name=root.mapreduce.hive;
use tmp;
drop table if exists tmp.FBI_LEND_DETAIL_YDY_AUM_TMP01;
create table tmp.FBI_LEND_DETAIL_YDY_AUM_TMP01 as
SELECT
FRP.FINACE_ID AS FINACE_ID,
FM.FINACE_NO AS FINACE_NO,--理财单ID,
FM.USER_ID AS USER_ID --用户ID, 
FROM (SELECT * FROM STG.FINANCE_RENEW_PROCESS WHERE DT='$thismonthend') FRP
LEFT JOIN (SELECT * FROM STG.FINACES_MANAGER WHERE DT='$yesterday') FM ON FRP.FINACE_ID=FM.FINACE_ID
LEFT JOIN (SELECT * FROM STG.PAY_BILL_MAIN WHERE DT='$yesterday') PBM ON PBM.PAY_ID=FM.PAY_ID 
WHERE FM.D_STATUS='1'   --数据状态（1生效  2删除）
AND FM.FINACE_STATUS IN('3','4','5','9')  --理财单状态
AND PBM.PAY_BILL_STATUS ='3'  --支付成功
AND FRP.AUDIT_STATE='1'
AND FRP.OLD_FINANCE_INVALID_DATE< NVL(TO_DATE(FM.EXIT_TIME),ADD_MONTHS(FRP.OLD_FINANCE_INVALID_DATE,1)) --续约生效后退出 
AND FRP.NEW_FINANCE_INVALID_DATE > DATE_ADD(SUBSTR(FRP.OLD_FINANCE_INVALID_DATE, 1,10), 4)
;


set mapred.job.queue.name=root.mapreduce.hive;
use tmp;
drop table if exists tmp.FBI_LEND_DETAIL_YDY_AUM_TMP02;
create table tmp.FBI_LEND_DETAIL_YDY_AUM_TMP02 as
SELECT TO_DATE(PBM.CREATE_DATE) as invest_date,                --出借时间,
       --FM.FINACE_ID                            理财单ID,
       --FM.SEQUEST_ID                           划扣ID,
       FM.FINACE_NO,                            --理财单号,
       --TO_CHAR(CURI.CREATE_DATE,'YYYY-MM-DD')  注册日期,
       FM.USER_ID,                              --用户ID,
       --FM.USER_NAME 用户姓名,FM.USER_MAIL      用户邮箱,
       --FM.USER_PHONE                           用户手机,
       cast(FP.PRODUCT_CYCLE as int) as invest_period,           --投资期限,
       cast(FP.PRE_INCOME_RATE as decimal(18,4))/100 as PRE_INCOME_RATE,       --预期年化收益率,
       FM.INVEST_AMOUNT,                        --出借金额,
       FM.PRODUCT_NAME,                         --产品名称,
       (case when FP.FINANCE_PRODUCT_TYPE='0' then '宜定盈E'
            when FP.FINANCE_PRODUCT_TYPE='1' then '宜定盈V'
            when FP.FINANCE_PRODUCT_TYPE='2' then '节节高'
        else FP.FINANCE_PRODUCT_TYPE end) AS PRODUCT_TYPE,--产品类型,
        (case when FM.FINACE_STATUS= '0' then '未支付'
              when FM.FINACE_STATUS= '1' then '支付中'
              when FM.FINACE_STATUS= '2' then '购买失败'
              when FM.FINACE_STATUS= '3' then '购买成功'
              when FM.FINACE_STATUS= '4' then '理财中'
              when FM.FINACE_STATUS= '5' then '退出中'
              when FM.FINACE_STATUS= '9' then '已结束'
              when FM.FINACE_STATUS= '10' then '已删除'
         else FM.FINACE_STATUS end) as FINACE_STATUS,--理财单状态,
       --FM.SALES_ID                           销售ID,
       --FM.SALES_NAME                         销售姓名,
       (CASE WHEN FM.FINACE_CHANNEL_CODE LIKE 'F01%'
               OR FM.FINACE_CHANNEL_CODE LIKE 'F07%' THEN 'PC'
             WHEN FM.FINACE_CHANNEL_CODE LIKE 'F02%' THEN '线下'
             WHEN FM.FINACE_CHANNEL_CODE LIKE 'F03%'
               OR FM.FINACE_CHANNEL_CODE LIKE 'F05%'
               OR FM.FINACE_CHANNEL_CODE LIKE 'F08%'
               OR FM.FINACE_CHANNEL_CODE LIKE 'F09%' THEN '移动'
             WHEN FM.FINACE_CHANNEL_CODE LIKE 'F04%' THEN '合作'
             ELSE FM.FINACE_CHANNEL_CODE END)  as  FINACE_CHANNEL1,               --购买来源分类,
       (CASE WHEN FM.FINACE_CHANNEL_CODE LIKE 'F01%'
             OR FM.FINACE_CHANNEL_CODE LIKE 'F03%'
             OR FM.FINACE_CHANNEL_CODE LIKE 'F05%'
             OR FM.FINACE_CHANNEL_CODE LIKE 'F07%'
             OR FM.FINACE_CHANNEL_CODE LIKE 'F08%'
             OR FM.FINACE_CHANNEL_CODE LIKE 'F09%' THEN '线上'
             WHEN FM.FINACE_CHANNEL_CODE LIKE 'F02%' THEN '线下'
             WHEN FM.FINACE_CHANNEL_CODE LIKE 'F04%' THEN '合作'
             ELSE FM.FINACE_CHANNEL_CODE END) as FINACE_CHANNEL2,                 --购买来源分类大类,
       (CASE WHEN FM.FINACE_CHANNEL_CODE = 'F01001' THEN '宜人贷网站'
             WHEN FM.FINACE_CHANNEL_CODE = 'F01002' THEN '互联网测试'
             WHEN FM.FINACE_CHANNEL_CODE = 'F02001' THEN '投一'
             WHEN FM.FINACE_CHANNEL_CODE = 'F02002' THEN '投二'
             WHEN FM.FINACE_CHANNEL_CODE = 'F02003' THEN '投三'
             WHEN FM.FINACE_CHANNEL_CODE = 'F02004' THEN '星火团队'
             WHEN FM.FINACE_CHANNEL_CODE = 'F02005' THEN '互联网团办'
             WHEN FM.FINACE_CHANNEL_CODE = 'F02006' THEN '投米'
             WHEN FM.FINACE_CHANNEL_CODE = 'F03001' THEN '宜定盈APP'
             WHEN FM.FINACE_CHANNEL_CODE = 'F03002' THEN '挖财'
             WHEN FM.FINACE_CHANNEL_CODE = 'F03003' THEN '铜板街'
             WHEN FM.FINACE_CHANNEL_CODE = 'F03004' THEN '51宜定盈'
             WHEN FM.FINACE_CHANNEL_CODE = 'F03005' THEN '好规划'
             WHEN FM.FINACE_CHANNEL_CODE = 'F03006' THEN '银信宝'
             WHEN FM.FINACE_CHANNEL_CODE = 'F03007' THEN '大都会'
             WHEN FM.FINACE_CHANNEL_CODE = 'F03008' THEN '宜定盈WAP'
             WHEN FM.FINACE_CHANNEL_CODE = 'F03009' THEN '高尔夫'
             WHEN FM.FINACE_CHANNEL_CODE = 'F04001' THEN '新浪微财富'
             WHEN FM.FINACE_CHANNEL_CODE = 'F05001' THEN '宜定盈微信'
             WHEN FM.FINACE_CHANNEL_CODE = 'F07001' THEN '企业理财'
             WHEN FM.FINACE_CHANNEL_CODE = 'F08001' THEN '预售'
             WHEN FM.FINACE_CHANNEL_CODE = 'F09001' THEN '宜睿'
             ELSE FM.FINACE_CHANNEL_CODE END) as FINACE_CHANNEL3, --购买来源细分,
       --FM.CREATE_DATE                          录入日期,
       FM.PAY_ID,                               --订单号,
       TR.ID,                                   --支付单号,
       --PBM.CREATE_DATE                         支付单创建时间,
       --PBM.UPDATE_DATE                         支付单更新时间,
       (case when PBM.PAY_BILL_STATUS='1' then '未支付'
            when PBM.PAY_BILL_STATUS='2' then '支付中'
            when PBM.PAY_BILL_STATUS='3' then '支付成功'
            when PBM.PAY_BILL_STATUS='4' then '支付失败'
        else PBM.PAY_BILL_STATUS end) as PAY_BILL_STATUS,--支付状态,
       PBM.PAY_BILL_TYPE,                       --支付单类型,
       PBM.PAY_BILL_TOTAL_AMT,                  --支付单总金额,
       PBM.PAY_AMT,                             --第三方支付金额,
       PBM.ACCOUNT_AMT,                         --账户支付金额,
       (case when TR.STATUS= '1' then '支付中'
            when TR.STATUS= '2' then '支付成功'
            when TR.STATUS= '3' then '支付失败'
            when TR.STATUS= '4' then '用户解锁'
        else TR.STATUS end) as RECHARGE_STATUS,                                --充值状态,
       TR.REC_AMT,                              --充值实收金额,
      -- '宜定盈' AS LEND_TYPE                               --出借类型
      CASE WHEN FRP.FINACE_ID IS NOT NULL THEN '宜定盈本息自动续约' ELSE '宜定盈' END AS LEND_TYPE, --          出借类型,
    NVL(NVL(FM.EXIT_TIME, FM.INVALI_DATE),ADD_MONTHS(TO_DATE(PBM.CREATE_DATE), CAST(FP.PRODUCT_CYCLE AS INT))) AS EXP_DATE --到期时间
  FROM (select * from STG.FINACES_MANAGER where dt='$yesterday' and D_STATUS='1' and FINACE_STATUS IN('3','4','5','9')) FM
  LEFT JOIN (select * from STG.FINACE_PRODUCT where dt='$yesterday') FP ON cast(FP.PRODUCT_ID as int) = cast(FM.PRODUCT_ID as int)
  LEFT JOIN (select * from STG.PAY_BILL_MAIN where dt='$yesterday') PBM ON PBM.PAY_ID=FM.PAY_ID
  LEFT JOIN (select * from STG.TPW_RECHARGE where dt='$yesterday') TR ON TR.ORDER_ID=PBM.PAY_ID
  LEFT JOIN FBI_LEND_DETAIL_YDY_AUM_TMP01 FRP ON FM.FINACE_ID=FRP.FINACE_ID 
 WHERE PBM.PAY_BILL_STATUS = '3'  --支付成功
   AND (TR.IS_CURRENT_PAY = '1' OR TR.IS_CURRENT_PAY IS NULL) --2015年6月5日修改
  AND SUBSTR(PBM.CREATE_DATE,1,10) <='$yesterday'     --全量条件
;

set mapred.job.queue.name=root.mapreduce.hive;
use tmp;
drop table if exists tmp.FBI_LEND_DETAIL_YDY_AUM_TMP03;
create table tmp.FBI_LEND_DETAIL_YDY_AUM_TMP03 as
select  CURI.I_USER_ID,--用户ID,
        CURI.passpor_id as passport_id,--passport_id,
     RC.channel_name,--注册来源三级,
    (CASE WHEN CURI.C_TYPE_SOURCE LIKE 'ZC0101%'      THEN 'PC'
    WHEN CURI.C_TYPE_SOURCE = 'ZC01040004'      THEN 'PC'
    WHEN CURI.C_TYPE_SOURCE = 'ZC01040005'      THEN 'PC'
    WHEN CURI.C_TYPE_SOURCE = 'ZC01040007'      THEN 'PC'
    WHEN CURI.C_TYPE_SOURCE = 'ZC01040008'      THEN 'PC'
    WHEN CURI.C_TYPE_SOURCE = 'ZC01040010'      THEN 'PC'
    WHEN CURI.C_TYPE_SOURCE = 'ZC01040011'      THEN 'PC'
    WHEN CURI.C_TYPE_SOURCE = 'ZC01040081'      THEN 'PC'
    WHEN CURI.C_TYPE_SOURCE = 'ZC01040082'      THEN 'PC'
    WHEN CURI.C_TYPE_SOURCE = 'ZC01040083'      THEN 'PC'
    WHEN CURI.C_TYPE_SOURCE = 'ZC01040084'      THEN 'PC'
    WHEN CURI.C_TYPE_SOURCE = 'ZC01040085'      THEN 'PC'
    WHEN CURI.C_TYPE_SOURCE = 'ZC01040086'      THEN 'PC'
    WHEN CURI.C_TYPE_SOURCE = 'ZC01040087'      THEN 'PC'
    WHEN CURI.C_TYPE_SOURCE = 'ZC01040088'      THEN 'PC'
    WHEN CURI.C_TYPE_SOURCE = 'ZC01040089'      THEN 'PC'
    WHEN CURI.C_TYPE_SOURCE = 'ZC01040090'      THEN 'PC'
    WHEN CURI.C_TYPE_SOURCE = 'ZC01040091'      THEN 'PC'
    WHEN CURI.C_TYPE_SOURCE = 'ZC01040092'      THEN 'PC'
    WHEN CURI.C_TYPE_SOURCE = 'ZC01040093'      THEN 'PC'
    WHEN CURI.C_TYPE_SOURCE LIKE 'ZC0107%'      THEN 'PC'
    WHEN CURI.C_TYPE_SOURCE LIKE 'ZC0102%'      THEN '移动'
    WHEN CURI.C_TYPE_SOURCE LIKE 'ZC0105%'      THEN '移动'
    WHEN CURI.C_TYPE_SOURCE LIKE 'ZC0106%'      THEN '移动'
    WHEN CURI.C_TYPE_SOURCE LIKE 'ZC0103%'      THEN '移动'
    WHEN CURI.C_TYPE_SOURCE = 'ZC01040001'      THEN '移动'
    WHEN CURI.C_TYPE_SOURCE = 'ZC01040002'      THEN '移动'
    WHEN CURI.C_TYPE_SOURCE = 'ZC01040003'      THEN '移动'
    WHEN CURI.C_TYPE_SOURCE = 'ZC01040006'      THEN '移动'
    WHEN CURI.C_TYPE_SOURCE = 'ZC01040008'      THEN '移动'
    WHEN CURI.C_TYPE_SOURCE = 'ZC01040009'      THEN '移动'
    WHEN CURI.C_TYPE_SOURCE = 'ZC01040094'      THEN '移动'
    WHEN CURI.C_TYPE_SOURCE = 'ZC01040096'      THEN '移动'
    WHEN CURI.C_TYPE_SOURCE = 'ZC01040097'      THEN '移动'  --20170606开心麻花
    WHEN CURI.C_TYPE_SOURCE = 'ZC01040099'      THEN '移动'
    WHEN CURI.C_TYPE_SOURCE = 'ZC01040100'      THEN 'PC'
    WHEN CURI.C_TYPE_SOURCE = 'ZC01130001'      THEN 'PC'   --20170605企业合作
    WHEN CURI.C_TYPE_SOURCE LIKE 'ZC02%'        THEN '线下'
    WHEN CURI.C_TYPE_SOURCE LIKE 'ZC03%'        THEN '安布雷拉'
    ELSE CURI.C_TYPE_SOURCE END) as register_sourse               --注册来源分类
  FROM (select * from STG.C_USER_REGIST_INFO where dt='$yesterday') CURI
  left join (select * from STG.regist_channel where dt='$yesterday') RC ON concat(RC.one_code,RC.two_code,RC.three_code) = CURI.C_TYPE_SOURCE
 where RC.level_is = '3'
;

set mapred.job.queue.name=root.mapreduce.hive;

use tmp;
drop table if exists tmp.FBI_LEND_DETAIL_YDY_AUM_TMP04;
create table tmp.FBI_LEND_DETAIL_YDY_AUM_TMP04 as
SELECT A.*,
       CURI.channel_name,
       CURI.register_sourse,
       (CASE WHEN A.invest_date >= '2015-01-01' AND  A.FINACE_CHANNEL1 = 'PC'   THEN 'PC'
             WHEN A.invest_date >= '2015-01-01' AND  A.FINACE_CHANNEL1 = '移动' THEN '移动'
             WHEN A.invest_date >= '2015-01-01' AND  A.FINACE_CHANNEL1 = '线下' AND CURI.register_sourse =  '安布雷拉' THEN '移动'
             WHEN A.invest_date >= '2015-01-01' AND  A.FINACE_CHANNEL1 = '线下' AND CURI.register_sourse <> '安布雷拉' THEN '线下'
             WHEN A.invest_date <  '2015-01-01' THEN A.FINACE_CHANNEL1
             ELSE NULL END)  as report_channel_detail,                    --报道渠道细分,
       (CASE WHEN A.invest_date >= '2015-01-01' AND  A.FINACE_CHANNEL2 = '线上'   THEN '线上'
             WHEN A.invest_date >= '2015-01-01' AND  A.FINACE_CHANNEL2 = '线上' THEN '线上'
             WHEN A.invest_date >= '2015-01-01' AND  A.FINACE_CHANNEL2 = '线下' AND CURI.register_sourse =  '安布雷拉' THEN '线上'
             WHEN A.invest_date >= '2015-01-01' AND  A.FINACE_CHANNEL2 = '线下' AND CURI.register_sourse <> '安布雷拉' THEN '线下'
             WHEN A.invest_date <  '2015-01-01' THEN A.FINACE_CHANNEL2
             ELSE NULL END) as report_channel,                     --报告渠道,
    (CASE WHEN A.FINACE_CHANNEL2 = '线下' THEN '线下'
             WHEN b.org2 in ('财富管理一部','财富管理二部','投资理财二部','投资理财一部') AND A.FINACE_CHANNEL2 = '线上' AND CURI.register_sourse = '安布雷拉' THEN '线下'
             ELSE '线上' END) as private_channel --内部管理渠道
  from tmp.FBI_LEND_DETAIL_YDY_AUM_TMP02 A
  left join tmp.FBI_LEND_DETAIL_YDY_AUM_TMP03 CURI on A.USER_ID=CURI.I_USER_ID
  LEFT JOIN (
select ub.passportid,
       max(hoo.org2) as org2
  from (select distinct passportid,RECOMMENDEDNO from STG.umbrella_borrower where dt='$yesterday') ub
  left join ods.s05_c_employee hoe on hoe.empnum=ub.RECOMMENDEDNO
  left join ods.s05_c_orgunit hoo on hoe.orgunitid=hoo.orgunitid
  group by ub.passportid
  ) b ON CURI.passport_id=b.passportid
;



set mapred.job.queue.name=root.mapreduce.hive;
use tmp;
drop table if exists tmp.FBI_LEND_DETAIL_YDY_AUM_TMP05;
create table tmp.FBI_LEND_DETAIL_YDY_AUM_TMP05 as
select  distinct FINACE_NO,--                 理财单ID,
USER_ID,--               用户ID, 
invest_date CREATE_DATE,--    出借时间,
INVEST_AMOUNT,--   出借金额,
LEND_TYPE, --          出借类型,   
invest_period PRODUCT_CYCLE,
PRE_INCOME_RATE,
private_channel,
exp_date --到期时间
from tmp.FBI_LEND_DETAIL_YDY_AUM_TMP04
;


set mapred.job.queue.name=root.mapreduce.hive;
use app;
insert overwrite table app.fbi_lend_detail_ydy_aum partition (dt='$yesterday')       
select '$yesterday' ct, 
      substr(B.CREATE_DATE,1,7) as CREATE_DATE,-- 出借月份,
        substr(to_date(B.EXP_DATE),1,7) as EXP_DATE,--到期月份,
       B.PRODUCT_CYCLE,--期数,
       B.PRE_INCOME_RATE,--预期年化收益率,
       B.private_channel,--内部管理渠道,
        SUM(B.INVEST_AMOUNT)/count(distinct B.USER_ID) as PER_INVEST_AMOUNT,--  人均在投金额,
        count(distinct B.USER_ID) as USER_CNT,-- 在投出借人数,
        SUM(B.INVEST_AMOUNT) as INVEST_AMOUNT --   在投出借金额
from tmp.FBI_LEND_DETAIL_YDY_AUM_TMP05 b where
B.CREATE_DATE >= '2010-01-01'
    AND to_date(B.CREATE_DATE) <=  '$yesterday'
    AND to_date(B.exp_date) > '$yesterday'        --近一个月有在投：宜定盈到期时间在月初到月末之间
    and B.exp_date is not null 
     group by substr(B.CREATE_DATE,1,7),
     substr(to_date(B.EXP_DATE),1,7),
     B.PRODUCT_CYCLE,--期数,
        B.PRE_INCOME_RATE,--预期年化收益率,
        B.private_channel --内部管理渠道
;





