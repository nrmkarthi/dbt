select
    {{ dbt_utils.generate_surrogate_key(['o.order_id','od.product_id']) }} as order_sk,
    o.order_id,
    o.orderDate as order_date,
    o.status,
    o.customer_id,
    c.customer_name,          -- updated here
    e.employee_id,
    e.firstName || ' ' || e.lastName as employee_name,
    e.office_id,
    p.product_id,
    p.product_name,
    p.buyPrice,
    od.quantity,
    (od.quantity * od.priceEach) as total_amount
from {{ ref('stg_orders') }} o
join {{ ref('stg_orderdetails') }} od
    on o.order_id = od.order_id
join {{ ref('dim_customers') }} c
    on o.customer_id = c.customer_id
join {{ ref('dim_employees') }} e
    on c.salesRepEmployeeNumber = e.employee_id
join {{ ref('dim_products') }} p
    on od.product_id = p.product_id
