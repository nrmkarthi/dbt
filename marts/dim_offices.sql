select
    {{ dbt_utils.generate_surrogate_key(['officeCode']) }} as office_sk,
    officeCode as office_id,
    city,
    phone,
    addressLine1,
    addressLine2,
    state,
    country,
    postalCode as postal_code,
    territory
from {{ ref('stg_offices') }};
