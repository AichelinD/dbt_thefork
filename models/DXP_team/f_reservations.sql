{{
    config(
       materialized='table',
       unique_key='reservation_id'
    )
}}

with channels as (
    select * from {{ ref("d_channels") }}
)

select 
RESERVATION_UUID as reservation_id,
CUSTOMER_UUID as customer_id,
RESTAURANT_UUID as restaurant_id,
c.channel_id as channel_id,
FORMAT_DATE('%Y%m%d', DT_DAY_BOOKING_DATE) as booking_date_id,
DT_DAY_BOOKING_DATE as booking_date,
FORMAT_DATE('%Y%m%d', DT_DAY_MEAL_DATE) as meal_date_id,
IS_NET as is_net,
IS_ONLINE as is_online,
PARTY_SIZE as party_size,
IS_WALK_IN as is_walk_in,
LUNCH_TYPE as lunch_type,
TS_CRE as reservation_create_date,
TS_UPD as reservation_update_date
from thefork.stg_reservation r
left outer join channels c on r.CHANNEL = c.channel_name
/*
{% if is_incremental() %}
where 
TS_CRE >= (select coalesce(max(event_time),'1900-01-01') from {{ this }} )
or
TS_UPD >= (select coalesce(max(event_time),'1900-01-01') from {{ this }} )
{% endif %}
*/