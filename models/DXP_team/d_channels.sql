-- pipelines for d_channels
-- David Aichelin - 16/12/2024
-- This code populates the d_channel table.

{{
    config(
        materialized='table',
        unique_key='channel_id'
    )
}}

SELECT 
    distinct DENSE_RANK() OVER (ORDER BY channel)       AS channel_id,
    CHANNEL                                             AS channel_name
from {{ ref('stg_reservation') }}
ORDER BY channel
