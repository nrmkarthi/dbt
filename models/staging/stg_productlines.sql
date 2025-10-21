{{ config(materialized='view') }}

select
    productLine as product_line,
    textDescription as product_line_description,
    htmlDescription
    
from {{ source('classicmodels','productlines') }}
