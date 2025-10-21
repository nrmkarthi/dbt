{{ config(materialized='view') }}

select
    EMPLOYEENUMBER as employee_id,
    FIRSTNAME,
    LASTNAME,
    EXTENSION,
    EMAIL,
    OFFICECODE as office_id,
    REPORTSTO as reports_to,
    JOBTITLE as job_title
from {{ source('sales', 'employees') }}
