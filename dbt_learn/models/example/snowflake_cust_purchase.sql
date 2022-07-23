{{ config(materialized='table') }}

select C_CUSTKEY,
C_NAME,
C_NATIONKEY as nation,
sum(O_TOTALPRICE) total_order_price
from
"SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."CUSTOMER" cust
left join "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."ORDERS" ord
on cust.C_CUSTKEY=ord.O_CUSTKEY
group by
C_CUSTKEY,
C_NAME,
C_NATIONKEY
