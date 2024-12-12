
with all_date as (
select distinct date from ( 
  SELECT
  distinct DT_DAY_BOOKING_DATE as date from thefork.stg_reservation
  union all
  SElect distinct DT_DAY_MEAL_DATE as date from thefork.stg_reservation
)
)

select 
FORMAT_DATE('%Y%m%d', date) as date_id,
date,
FORMAT_DATE('%Y', date) as year,
FORMAT_DATE('%m', date) as month,
FORMAT_DATE('%d', date) as day,
FORMAT_DATE('%A' , date) as weekday,
from all_date
limit 2