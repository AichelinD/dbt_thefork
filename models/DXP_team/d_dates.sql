-- pipelines for d_dates
-- David Aichelin - 16/12/2024
-- This code populates the d_dates table.

{{
    config(
        materialized='table',
        unique_key='date_id'
    )
}}

-- We retrieve all the dates present in the reservations table.
with all_date as (
select 
  distinct date 
from ( 
    SELECT
    distinct DT_DAY_BOOKING_DATE as date from {{ ref('stg_reservation') }}
    union all
    SElect distinct DT_DAY_MEAL_DATE as date from {{ ref('stg_reservation') }}
))

select 
    FORMAT_DATE('%Y%m%d', date)     as date_id,
    date                            as date,
    FORMAT_DATE('%Y', date)         as year,
    FORMAT_DATE('%m', date)         as month,
    FORMAT_DATE('%d', date)         as day,
    FORMAT_DATE('%A' , date)        as weekday,
from all_date