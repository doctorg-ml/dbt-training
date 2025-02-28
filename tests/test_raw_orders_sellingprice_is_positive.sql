with orders as (
    select 
        {{ ref("raw_orders") }}.*
    from 
        {{ ref("raw_orders") }}
)

select 
    orderid, 
    sum(ordersellingprice) as total_sp
from 
    orders
group by 
    orderid
having 
    total_sp < 0
