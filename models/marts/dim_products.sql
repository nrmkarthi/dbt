select
    {{ dbt_utils.generate_surrogate_key(['p.productCode']) }} as product_sk,
    p.productCode as product_id,
    p.productName as product_name,
    p.productLine,
    pl.product_line_description,  -- updated to match staging view
    p.productScale,
    p.productVendor,
    p.buyPrice,
    p.MSRP
from {{ ref('stg_products') }} p
left join {{ ref('stg_productlines') }} pl
  on p.productLine = pl.product_line  -- also use staged column name
