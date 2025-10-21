{{ config(materialized='view') }}

select
    productLine as product_line,
    textDescription as product_line_description,
    htmlDescription,
    image
from {{ source('classicmodels','productlines') }}
