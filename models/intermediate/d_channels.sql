SELECT 
distinct DENSE_RANK() OVER (ORDER BY channel) AS channel_id,
CHANNEL  
from thefork.stg_reservation  
ORDER BY CHANNEL