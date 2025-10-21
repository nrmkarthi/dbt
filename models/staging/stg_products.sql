{{ config(materialized='view') }}

select
    PRODUCTCODE as product_id,
    PRODUCTNAME as product_name,
    PRODUCTLINE as product_line,
    PRODUCTSCALE as product_scale,
    PRODUCTVENDOR as product_vendor,
    PRODUCTDESCRIPTION as product_description,
    QUANTITYINSTOCK as quantity_in_stock,
    BUYPRICE as buy_price,
    MSRP
from {{ source('sales', 'products') }}




