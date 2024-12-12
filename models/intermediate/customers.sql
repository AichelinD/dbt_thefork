

with customers as (

    select 
    CUSTOMER_UUID as customer_id,
    ONLINE_CUSTOMER_UUID as customer_online_id,
    CASE WHEN ONLINE_CUSTOMER_UUID IS NULL THEN 0 ELSE 1 END as is_customer_online,
    LOCALE as customer_locale,
    STATUS as customer_STATUS, 
    from thefork.stg_offline_customers
)


select * from customers

