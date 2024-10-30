Select
    orders_id,
    date_date,
    quantity,
    
    Round(margin + shipping_fee - logcost - ship_cost ) AS Operational_margin,
From {{ref("int_sales_margin")}}
Inner join {{ref("stg_raw__ship")}}
Using (orders_id)