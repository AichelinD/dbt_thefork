

select 
RESERVATION_UUID as reservation_id,
CUSTOMER_UUID as customer_id,
RESTAURANT_UUID as restaurant_id,
DT_DAY_BOOKING_DATE as booking_date,
DT_DAY_MEAL_DATE as meal_date,
IS_NET as is_net,
IS_ONLINE as is_online,
CHANNEL as reservation_channel,
PARTY_SIZE as party_size,
IS_WALK_IN as is_walk_in,
LUNCH_TYPE as lunch_type,
RESTAURANT_CITY as restaurant_city,
RESTAURANT_COUNTRY as restaurant_country,
from thefork.stg_reservation

