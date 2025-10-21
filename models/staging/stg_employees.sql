{{ config(materialized='view') }}

select
    {{ dbt_utils.generate_surrogate_key(['employeeNumber']) }} as employee_sk,
    employeeNumber as employee_id,
    firstName,
    lastName,
    extension,
    email,
    officeCode as office_id,
    reportsTo,
    jobTitle
from {{ source('sales', 'employees') }}


