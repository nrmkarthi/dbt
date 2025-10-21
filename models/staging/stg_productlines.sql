{{ config(materialized='view') }}

select
    PRODUCTLINE as product_line,
    TEXTDESCRIPTION as text_description,
    HTMLDESCRIPTION as html_description
from {{ source('sales', 'productlines') }}

