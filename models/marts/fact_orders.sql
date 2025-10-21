{{ config(materialized='table') }}

select
    o.order_id,
    o.orderDate,
    o.status,
    c.customer_id,
    c.customer_name,
    e.employee_id,
    e.firstName || ' ' || e.lastName as employee_name,
    e.office_id,
    p.product_id,
    p.productName,
    p.buyPrice,
    od.quantity,
    (od.quantity * od.priceEach) as total_amount
from {{ ref('stg_orders') }} o
join {{ ref('stg_orderdetails') }} od
    on o.order_id = od.order_id
join {{ ref('dim_customers') }} c
    on o.customer_id = c.customer_id
join {{ ref('dim_employees') }} e
    on c.employee_id = e.employee_id
join {{ ref('dim_products') }} p
    on od.product_id = p.product_id
