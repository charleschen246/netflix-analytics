{{ config(materialized='table') }}


with title_details as (
    select *
    from {{ ref('stg_title_details') }}
), 

audience_behavior as (
    select *
    from {{ ref('stg_audience_bahavior') }}
)

select title_type, title_details.title, director, country, 
date_add_netflix, release_year, duration, between_click_duration_in_seconds,datetime_click,
rating, user_id, theatrical_release_date, genere
from title_details
inner join audience_behavior
on title_details.title = audience_behavior.title