{{ config(materialized='table') }}

select
    o.orderNumber as order_id,
    o.orderDate,
    o.status,
    o.customerNumber as customer_id,
    c.customer_name,
    e.employee_id,
    e.firstName || ' ' || e.lastName as employee_name,
    e.officeCode as office_id,
    p.product_id,
    p.productName,
    p.buyPrice,
    od.quantityOrdered as quantity,
    (od.quantityOrdered * od.priceEach) as total_amount
from {{ ref('stg_orders') }} o
join {{ ref('stg_orderdetails') }} od
    on o.orderNumber = od.orderNumber
join {{ ref('dim_customers') }} c
    on o.customerNumber = c.customer_id
join {{ ref('dim_employees') }} e
    on c.employee_id = e.employee_id
join {{ ref('dim_products') }} p
    on od.productCode = p.product_id
