{{ config(materialized='table') }}

select
    p.product_id,
    p.product_name,
    p.product_line,
    pl.text_description as product_line_description,
    p.product_scale,
    p.product_vendor,
    p.buy_price,
    p.MSRP
from {{ ref('stg_products') }} p
left join {{ ref('stg_productlines') }} pl
    on p.product_line = pl.product_line


