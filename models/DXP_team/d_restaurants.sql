{{
    config(
        materialized='table',
        unique_key='restaurant_id'
    )
}}

SELECT 
DISTINCT 
    RESTAURANT_UUID as restaurant_id,
    RESTAURANT_CITY as restaurant_city,
    RESTAURANT_COUNTRY as restaurant_country,
from thefork.stg_reservation