{{ config(materialized='view') }}

with source as (

    select * from {{ source('kaggle_netflix_analysis', 'title_details') }}

),

renamed as (
    select
        --unique show ID
        show_id,

        --Identifier - A Movie or TV Show
        type as title_type,

        title,

        director,

        country,

        --Date it was added on Netflix 10 null
         safe.parse_date('%B %e, %Y', date_added) as date_add_netflix,

        --Actual Release year of the move / show
        release_year,

        --TV Rating of the movie / show
        rating,

        --casts name
        source.cast as casts,

        --Total Duration - in minutes or number of seasons
        duration,

        --Genere
        listed_in as genere,

        --summary
        description as title_summary
    from source as source )

select * 
from renamed
