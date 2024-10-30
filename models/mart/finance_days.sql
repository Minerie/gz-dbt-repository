{{ config(materialized=table) }}

Select
    date_date,
    Count(Distinct orders_id) AS Total_nbr_transac,         -- Variable nécessaire : Orders_id
    Round(Sum(revenue), 1) AS Total_revenue,          -- Variable nécessaire : Revenue
    Round(Sum(purchase_cost), 1) AS Total_purchase_cost,    -- Variable nécessaire : Quantity et purchase price
    Round(Sum(shipping_fee), 1) AS Total_shipping_fee,      -- Variable nécessaire : Shipping_fee
    Round(Sum(log_cost), 1) AS Total_log_cost,               -- Variable nécessaire : Log_cost
    Round(Sum(quantity), 1) AS Total_quantity_sold,                 -- Variable nécessaire : Quantity
    Round(Sum(revenue)/Count(Distinct orders_id), 1) AS Average_basket,                      -- Variable nécessaire : Revenue et Orders_id
    Round(Sum(margin + shipping_fee - log_cost - ship_cost ), 1) AS Operational_margin,-- Variable nécessaire : Revenue, Quantity, Purchase_price, Shipping_fee, Log_cost et Ship_cost
from {{ref("int_sales_margin")}} AS int_sales
Inner join {{ref("stg_raw__ship")}} AS ship 
Using (orders_id)
Group by date_date
Order by date_date Desc