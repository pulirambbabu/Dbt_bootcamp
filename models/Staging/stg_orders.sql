{{ config(materialized='table') }}

with Raw_orders  as
(
 select  
    OrderID     ,
    CustomerID    ,
    ProductID      ,
    OrderDate     ,
    Quantity     ,
    OrderAmount   ,
    OrderStatus 
     from   {{ source('Raw','Orders') }}
      
)

select *from  Raw_orders;