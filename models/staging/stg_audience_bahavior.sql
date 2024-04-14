{{ config(materialized='view') }}

with source as (

    select * from {{ source('kaggle_netflix_analysis', 'audience_behavior') }}

),

renamed as (

    select

        --Date and time of the click
        datetime datetime_click,

        --Time between this click and the user's next tracked click on Netflix.com, in seconds
        duration as between_click_duration_in_seconds,

        title,

        genres,

        --Movie's original theatrical release date (not when it first appeared on Netflix)
        safe.PARSE_DATE('%F',release_date) as theatrical_release_date,

        
        movie_id,

        user_id 

    from source

)

select * 
from renamed
