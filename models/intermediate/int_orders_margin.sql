Select
    date_date,
    orders_id,
    Round(Sum(revenue),2) AS revenue,
    Round(Sum(quantity),2) AS quantity,
    Round(Sum(purchase_cost),2) AS purchase_cost,
    Round(Sum(margin),2) AS margin,
From {{ref("int_sales_margin")}}
group by orders_id, date_date
order by date_date