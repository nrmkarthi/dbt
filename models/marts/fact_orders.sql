{{ config(materialized='table') }}

select
    o.order_id,
    o.order_date,
    o.order_status,
    o.customer_id,
    c.customer_name,
    c.sales_rep_id as employee_id,
    e.FIRSTNAME || ' ' || e.LASTNAME as employee_name,
    e.office_id,
    od.product_id,
    p.product_name,
    p.buy_price,
    od.quantity,
    (od.quantity * od.price_each) as total_amount
from {{ ref('stg_orders') }} o
join {{ ref('stg_orderdetails') }} od
    on o.order_id = od.order_id
join {{ ref('dim_customers') }} c
    on o.customer_id = c.customer_id
left join {{ ref('dim_employees') }} e
    on c.sales_rep_id = e.employee_id
join {{ ref('dim_products') }} p
    on od.product_id = p.product_id
