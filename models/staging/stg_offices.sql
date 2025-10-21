select *
from {{ source('classicmodels','offices') }};
