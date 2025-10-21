{{ config(materialized='view') }}

select
    {{ dbt_utils.generate_surrogate_key(['productCode']) }} as product_sk,
    productCode as product_id,
    productName,
    productLine,
    productScale,
    productVendor,
    productDescription,
    quantityInStock,
    buyPrice,
    MSRP
from {{ source('sales', 'products') }}


