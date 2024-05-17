with manhatten_violation_codes as (
    Select
        violation_code
        , violation_description
        , TRUE as is_manhatten_96th_st_below
        , manhattan_96th_st_below as fee_usd
    FROM 
        {{ ref('bronze_parking_violation_codes') }}
),
all_other_violation_codes as (
    Select
        violation_code
        , violation_description
        , FALSE as is_manhatten_96th_st_below
        , all_other_areas as fee_usd
    FROM 
        {{ ref('bronze_parking_violation_codes') }}
)
SELECT * FROM manhatten_violation_codes
UNION ALL
SELECT * FROM all_other_violation_codes
ORDER BY violation_code