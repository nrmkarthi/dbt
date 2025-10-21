{{ config(materialized='table') }}

select
    {{ dbt_utils.generate_surrogate_key(['p.product_id']) }} as product_sk,
    p.product_id,
    p.productName,
    p.productLine,
    pl.product_line_description,
    p.productScale,
    p.productVendor,
    p.buyPrice,
    p.MSRP
from {{ ref('stg_products') }} p
left join {{ ref('stg_productlines') }} pl
  on p.productLine = pl.productLine
