{{config (materialized='table') }}

with Raw_Customer  as
(
 select  
     CUSTOMERID as c_id,* 
     from   {{ source('Raw','Customer') }}
      
)

select *from  Raw_Customer;