select
    orders_id,
    date_date,
    revenue,
    quantity,
    purchase_price,
    sales.products_id,
from {{ref("stg_raw__sales")}} AS sales
inner join {{ref("stg_raw__product")}} AS product
on product.products_id = sales.products_id