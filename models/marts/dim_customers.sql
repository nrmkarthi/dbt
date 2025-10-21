{{ config(materialized='table') }}

select
    customer_sk,
    customer_id,
    customer_name,
    contactFirstName,
    contactLastName,
    phone,
    addressLine1,
    addressLine2,
    city,
    state,
    postal_code,
    country,
    creditLimit,
    employee_id
from {{ ref('stg_customers') }}
