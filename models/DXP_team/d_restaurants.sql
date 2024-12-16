-- pipelines for d_dates
-- David Aichelin - 16/12/2024
-- This code populates the d_dates table.

{{
    config(
        materialized='table',
        unique_key='restaurant_id'
    )
}}

select distinct 
    RESTAURANT_UUID     as restaurant_id,
    RESTAURANT_CITY     as restaurant_city,
    RESTAURANT_COUNTRY  as restaurant_country,
from {{ ref('stg_reservation') }}