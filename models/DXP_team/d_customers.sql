-- pipelines for d_customers
-- David Aichelin - 16/12/2024
-- This code populates the d_customers table.

{{
    config(
        materialized='table',
        unique_key='customer_id'
    )
}}

select 
    CUSTOMER_UUID                                               as customer_id,
    ONLINE_CUSTOMER_UUID                                        as customer_online_id,
    CASE WHEN ONLINE_CUSTOMER_UUID IS NULL THEN 0 ELSE 1 END    as is_customer_online,
    LOCALE                                                      as customer_locale,
    STATUS                                                      as customer_status, 
    TS_CRE                                                      as customer_create_date,
    TS_UPD                                                      as customer_update_date
from {{ ref('stg_offline_customers') }}

/*{% if is_incremental() %}
where 
TS_CRE >= (select coalesce(max(event_time),'1900-01-01') from {{ this }} )
or
TS_UPD >= (select coalesce(max(event_time),'1900-01-01') from {{ this }} )
{% endif %}
*/