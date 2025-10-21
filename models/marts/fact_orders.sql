{{ config(materialized='table') }}

select
    o.ORDERNUMBER as order_id,
    o.ORDERDATE,
    o.STATUS,
    o.CUSTOMERNUMBER as customer_id,
    c.customer_name,
    e.employee_id,
    e.FIRSTNAME || ' ' || e.LASTNAME as employee_name,
    e.office_id,
    p.PRODUCT_ID as product_id,
    p.PRODUCTNAME as product_name,      -- <- use this exact name
    p.BUYPRICE,
    od.QUANTITYORDERED as quantity,
    (od.QUANTITYORDERED * od.PRICEEACH) as total_amount
from {{ ref('stg_orders') }} o
join {{ ref('stg_orderdetails') }} od
    on o.ORDERNUMBER = od.ORDERNUMBER
join {{ ref('dim_customers') }} c
    on o.CUSTOMERNUMBER = c.customer_id
join {{ ref('dim_employees') }} e
    on c.employee_id = e.employee_id
join {{ ref('dim_products') }} p
    on od.PRODUCTCODE = p.PRODUCT_ID
