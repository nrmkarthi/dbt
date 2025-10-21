{{ config(materialized='view') }}

select
    {{ dbt_utils.generate_surrogate_key(['orderNumber']) }} as order_sk,
    orderNumber as order_id,
    orderDate,
    requiredDate,
    shippedDate,
    status,
    comments,
    customerNumber as customer_id
from {{ source('sales', 'orders') }}





