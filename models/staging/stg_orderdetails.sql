{{ config(materialized='view') }}

select
    {{ dbt_utils.generate_surrogate_key(['orderNumber','productCode']) }} as orderdetail_sk,
    orderNumber as order_id,
    productCode as product_id,
    quantityOrdered as quantity,
    priceEach
from {{ source('sales', 'orderdetails') }}
