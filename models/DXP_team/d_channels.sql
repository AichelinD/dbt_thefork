{{
    config(
        materialized='table',
        unique_key='channel_id'
    )
}}
SELECT 
distinct DENSE_RANK() OVER (ORDER BY channel) AS channel_id,
CHANNEL as channel_name
from thefork.stg_reservation  
ORDER BY CHANNEL