select name,id_no,often_contacter from 
(select
  b.name,
  b.id_no,
  d.often_contacter1 as often_contacter
from(select distinct user_code from stg.tb_cbm_yxd_loan where status='loan_success') a
left join dw.tb_cbm_yxd_user b
on a.user_code = b.user_code
left join
(
  select
    t1.user_code,
    t1.operator_id
  from stg.tb_cbm_yxd_data_validation_relative t1
  inner join
  (
  select
    user_code,
    max(modify_time) modify_time
  from stg.tb_cbm_yxd_data_validation_relative
  group by user_code
  ) t2
  on t1.user_code = t2.user_code and t1.modify_time = t2.modify_time
) c
on a.user_code = c.user_code
left join stg.tb_cbm_telecom d
on c.operator_id = d.transport_id
where d.often_contacter1 is not null

union all
select
  b.name,
  b.id_no,
  d.often_contacter2 as often_contacter
from(select distinct user_code from stg.tb_cbm_yxd_loan where status='loan_success') a
left join stg.tb_cbm_yxd_user b
on a.user_code = b.user_code
left join
(
  select
    t1.user_code,
    t1.operator_id
  from stg.tb_cbm_yxd_data_validation_relative t1
  inner join
  (
  select
    user_code,
    max(modify_time) modify_time
  from stg.tb_cbm_yxd_data_validation_relative
  group by user_code
  ) t2
  on t1.user_code = t2.user_code and t1.modify_time = t2.modify_time
) c
on a.user_code = c.user_code
left join stg.tb_cbm_telecom d
on c.operator_id = d.transport_id
where d.often_contacter2 is not null

union all
select
  b.name,
  b.id_no,
  d.often_contacter3 as often_contacter
from(select distinct user_code from stg.tb_cbm_yxd_loan where status='loan_success') a
left join stg.tb_cbm_yxd_user b
on a.user_code = b.user_code
left join
(
  select
    t1.user_code,
    t1.operator_id
  from stg.tb_cbm_yxd_data_validation_relative t1
  inner join
  (
  select
    user_code,
    max(modify_time) modify_time
  from stg.tb_cbm_yxd_data_validation_relative
  group by user_code
  ) t2
  on t1.user_code = t2.user_code and t1.modify_time = t2.modify_time
) c
on a.user_code = c.user_code
left join stg.tb_cbm_telecom d
on c.operator_id = d.transport_id
where d.often_contacter3 is not null

union all
select
  b.name,
  b.id_no,
  d.often_contacter4 as often_contacter
from(select distinct user_code from stg.tb_cbm_yxd_loan where status='loan_success') a
left join stg.tb_cbm_yxd_user b
on a.user_code = b.user_code
left join
(
  select
    t1.user_code,
    t1.operator_id
  from stg.tb_cbm_yxd_data_validation_relative t1
  inner join
  (
  select
    user_code,
    max(modify_time) modify_time
  from stg.tb_cbm_yxd_data_validation_relative
  group by user_code
  ) t2
  on t1.user_code = t2.user_code and t1.modify_time = t2.modify_time
) c
on a.user_code = c.user_code
left join stg.tb_cbm_telecom d
on c.operator_id = d.transport_id
where d.often_contacter4 is not null

union all
select
  b.name,
  b.id_no,
  d.often_contacter5 as often_contacter
from(select distinct user_code from stg.tb_cbm_yxd_loan where status='loan_success') a
left join stg.tb_cbm_yxd_user b
on a.user_code = b.user_code
left join
(
  select
    t1.user_code,
    t1.operator_id
  from stg.tb_cbm_yxd_data_validation_relative t1
  inner join
  (
  select
    user_code,
    max(modify_time) modify_time
  from stg.tb_cbm_yxd_data_validation_relative
  group by user_code
  ) t2
  on t1.user_code = t2.user_code and t1.modify_time = t2.modify_time
) c
on a.user_code = c.user_code
left join stg.tb_cbm_telecom d
on c.operator_id = d.transport_id
where d.often_contacter5 is not null
) h
order by id_no
;

