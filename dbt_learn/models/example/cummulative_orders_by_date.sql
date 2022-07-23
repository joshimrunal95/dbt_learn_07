{{ config(materialized='table') }}

select O_ORDERDATE,O_TOTALPRICE,
sum(O_TOTALPRICE) over(order by O_ORDERDATE,O_TOTALPRICE rows unbounded preceding) cummulative_orders_by_date
from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."ORDERS"
