{{ config(materialized='view') }}

select
    OFFICECODE as office_id,
    CITY,
    PHONE,
    ADDRESSLINE1 as address_line1,
    ADDRESSLINE2 as address_line2,
    STATE,
    COUNTRY,
    POSTALCODE as postal_code,
    TERRITORY
from {{ source('sales', 'offices') }}





