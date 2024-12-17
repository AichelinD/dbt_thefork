-- pipelines for d_dates
-- David Aichelin - 16/12/2024
-- This code populates the f_reservations table.

{{
    config(
       materialized='incremental',
       unique_key='reservation_id'
    )
}}

with channels as (
    select * from {{ ref("d_channels") }}
)

select 
    RESERVATION_UUID                            as reservation_id,
    CUSTOMER_UUID                               as customer_id,
    RESTAURANT_UUID                             as restaurant_id,
    c.channel_id                                as channel_id,
    FORMAT_DATE('%Y%m%d', DT_DAY_BOOKING_DATE)  as booking_date_id,
    DT_DAY_BOOKING_DATE                         as booking_date,
    FORMAT_DATE('%Y%m%d', DT_DAY_MEAL_DATE)     as meal_date_id,
    IS_NET                                      as is_net,
    IS_ONLINE                                   as is_online,
    PARTY_SIZE                                  as party_size,
    IS_WALK_IN                                  as is_walk_in,
    LUNCH_TYPE                                  as lunch_type,
    TS_CRE                                      as reservation_create_date,
    TS_UPD                                      as reservation_update_date
from {{ ref('stg_reservation') }} r
left outer join channels c on r.CHANNEL = c.channel_name

{% if is_incremental() %}
where 
    TS_CRE >= (SELECT MAX(TS_CRE) - INTERVAL '7 days' FROM {{ this }})
    or
    TS_UPD >= (SELECT MAX(TS_UPD) - INTERVAL '7 days' FROM {{ this }})
{% endif %}


