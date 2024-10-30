with 

source as (

    select * from {{ source('raw', 'criteo') }}

),

renamed as (

    select
        date_date,
        paid_source,
        campaign_key,
        campgn_name AS campaign_name,
        Cast(ads_cost to FLOAT64) AS ads_cost,
        impression,
        click

    from source

)

select * from renamed
