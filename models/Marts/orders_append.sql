-- incremental loading approach using append method. it adds to existing data 

-- incremental always creates tables in snowflake

{{ config (
    materialized='incremental',
    incremental_strategy='append'
) }}

with cte as 
(
    select * from {{ref('stg_orders_view')}}
)

select * from cte
{% if is_incremental() %}

    where o_date > (select max(o_date) from {{ this }})

{% endif %};

