{{ config(materialized='table') }}

select
    EMPLOYEENUMBER as employee_id,
    FIRSTNAME,
    LASTNAME,
    EXTENSION,
    EMAIL,
    OFFICECODE as office_id,     -- alias here
    REPORTSTO,
    JOBTITLE
from {{ source('sales', 'employees') }}



