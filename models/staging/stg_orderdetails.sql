{{ config(materialized='view') }}

select
    ORDERNUMBER as order_id,
    PRODUCTCODE as product_id,
    QUANTITYORDERED as quantity,
    PRICEEACH as price_each,
    ORDERLINENUMBER as order_line_number
from {{ source('sales', 'orderdetails') }}

