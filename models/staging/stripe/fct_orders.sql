
with customers as (

    select * from {{ ref('stg_customers')}} -- ANALYTICS.DBT_AKIZER.STG_CUSTOMERS--

),

orders as (

    select * from {{ ref('stg_orders') }} -- ANALYTICS.DBT_AKIZER.STG_ORDERS--

),

payments as (

    select * from {{ ref('stg_payments') }} -- ANALYTICS.DBT_AKIZER.STG_PAYMENTS--

 

),

fct_orders as (

    select
             orders.ORDER_ID
            ,orders.CUSTOMER_ID
            ,payments.AMOUNT
     

    from  orders

    left join  payments on (orders.ORDER_ID=payments.ORDERID)

)

select * from fct_orders
