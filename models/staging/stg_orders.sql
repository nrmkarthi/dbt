select
    orderNumber as order_id,
    orderDate,
    status,
    customerNumber as customer_id
from {{ source('classicmodels','orders') }}



