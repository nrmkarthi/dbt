{{ config(materialized='table') }}

select
    o.ORDERNUMBER as order_id,
    o.ORDERDATE as order_date,
    o.STATUS as order_status,
    o.CUSTOMERNUMBER as customer_id,
    c.customer_name,
    e.EMPLOYEENUMBER as employee_id,
    e.FIRSTNAME || ' ' || e.LASTNAME as employee_name,
    e.OFFICECODE as office_id,
    p.product_id,
    p.productName as product_name,
    p.buyPrice,
    od.QUANTITYORDERED as quantity,
    (od.QUANTITYORDERED * od.PRICEEACH) as total_amount
from {{ ref('stg_orders') }} o
join {{ ref('stg_orderdetails') }} od
    on o.ORDERNUMBER = od.ORDERNUMBER
join {{ ref('dim_customers') }} c
    on o.CUSTOMERNUMBER = c.customer_id
join {{ ref('dim_employees') }} e
    on c.employee_id = e.EMPLOYEENUMBER
join {{ ref('dim_products') }} p
    on od.PRODUCTCODE = p.product_id
