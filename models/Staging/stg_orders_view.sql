{{ config(materialized='view' )}}

with stg_orders  as
(
 select  
    OrderID     ,
    CustomerID    ,
    ProductID      ,
    OrderDate    as o_date  ,
    Quantity     ,
    OrderAmount   ,
    OrderStatus 
     from   {{ ref('stg_orders') }}
      
)

select *from  stg_orders;