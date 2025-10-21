{{ config(materialized='view') }}

select
    ORDERNUMBER as order_id,
    ORDERDATE as order_date,
    REQUIREDDATE as required_date,
    SHIPPEDDATE as shipped_date,
    STATUS as order_status,
    CUSTOMERNUMBER as customer_id
from {{ source('sales', 'orders') }}









