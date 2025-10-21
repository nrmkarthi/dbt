select *

from {{ source('classicmodels','employees') }}
