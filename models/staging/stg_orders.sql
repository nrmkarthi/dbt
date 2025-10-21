{{ config(materialized='view') }}

select
    ORDERNUMBER as orderNumber,
    ORDERDATE as orderDate,
    REQUIREDDATE as requiredDate,
    SHIPPEDDATE as shippedDate,
    STATUS as status,
    CUSTOMERNUMBER as customerNumber
from {{ source('sales', 'orders') }}







