select 
RESERVATION_UUID as reservation_id,
CUSTOMER_UUID as customer_id,
RESTAURANT_UUID as restaurant_id,
c.channel_id as channel_id,
DT_DAY_BOOKING_DATE as booking_date,
DT_DAY_MEAL_DATE as meal_date,
IS_NET as is_net,
IS_ONLINE as is_online,
PARTY_SIZE as party_size,
IS_WALK_IN as is_walk_in,
LUNCH_TYPE as lunch_type,
from thefork.stg_reservation r
left outer join thefork.d_channels c on r.CHANNEL = c.channel