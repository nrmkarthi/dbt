select
    EMPLOYEENUMBER as employeeNumber,
    LASTNAME as lastName,
    FIRSTNAME as firstName,
    EXTENSION as extension,
    EMAIL as email,
    OFFICECODE as officeCode,
    REPORTSTO as reportsTo,
    JOBTITLE as jobTitle
from {{ source('sales', 'employees') }}




