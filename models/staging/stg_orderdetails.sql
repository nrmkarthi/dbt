select
    orderNumber as order_id,
    productCode as product_id,
    quantityOrdered as quantity,
    priceEach
from {{ source('classicmodels','orderdetails') }}
