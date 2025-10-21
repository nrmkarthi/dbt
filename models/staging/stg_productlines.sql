{{ config(materialized='view') }}

select
    {{ dbt_utils.generate_surrogate_key(['productLine']) }} as productline_sk,
    productLine,
    textDescription as product_line_description
from {{ source('sales', 'productlines') }}

