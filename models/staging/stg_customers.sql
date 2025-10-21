{{ config(materialized='view') }}

select
    CUSTOMERNUMBER as customer_id,
    CUSTOMERNAME as customer_name,
    CONTACTFIRSTNAME as contact_first_name,
    CONTACTLASTNAME as contact_last_name,
    PHONE,
    ADDRESSLINE1 as address_line1,
    ADDRESSLINE2 as address_line2,
    CITY,
    STATE,
    POSTALCODE as postal_code,
    COUNTRY,
    SALESREPEMPLOYEENUMBER as sales_rep_id,
    CREDITLIMIT as credit_limit
from {{ source('sales', 'customers') }}





