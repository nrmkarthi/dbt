{{ config(materialized='table') }}

select
    office_sk,
    office_id,
    city,
    phone,
    addressLine1,
    addressLine2,
    state,
    country,
    postal_code,
    territory
from {{ ref('stg_offices') }}



