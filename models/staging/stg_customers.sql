{{ config(materialized='view') }}

select
    {{ dbt_utils.generate_surrogate_key(['customerNumber']) }} as customer_sk,
    customerNumber as customer_id,
    customerName as customer_name,
    contactFirstName,
    contactLastName,
    phone,
    addressLine1,
    addressLine2,
    city,
    state,
    postalCode as postal_code,
    country,
    creditLimit,
    salesRepEmployeeNumber as employee_id
from {{ source('sales', 'customers') }}



