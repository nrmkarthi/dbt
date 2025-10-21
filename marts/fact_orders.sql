select
    {{ dbt_utils.generate_surrogate_key(['o.orderNumber','od.productCode']) }} as order_sk,
    o.orderNumber as order_id,
    o.orderDate as order_date,
    o.requiredDate as required_date,
    o.shippedDate as shipped_date,
    o.status,
    c.customer_sk,
    p.product_sk,
    e.employee_sk,
    e.office_id as office_id,
    od.quantityOrdered,
    od.priceEach,
    od.quantityOrdered * od.priceEach as total_amount
from {{ ref('stg_orders') }} o
join {{ ref('stg_orderdetails') }} od
  on o.orderNumber = od.orderNumber
join {{ ref('dim_customers') }} c
  on o.customerNumber = c.customer_id
join {{ ref('dim_products') }} p
  on od.productCode = p.product_id
join {{ ref('dim_employees') }} e
  on c.employee_id = e.employee_id;
