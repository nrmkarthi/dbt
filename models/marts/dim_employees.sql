select
    {{ dbt_utils.generate_surrogate_key(['employeeNumber']) }} as employee_sk,
    employeeNumber as employee_id,
    firstName,
    lastName,
    extension,
    email,
    officeCode as office_id,
    reportsTo as manager_id,
    jobTitle
from {{ ref('stg_employees') }}

