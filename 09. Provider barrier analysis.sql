-- CTE 1: Base dataset with flags for late vaccination and provider-related issues
WITH base AS (
    SELECT *,
    -- Flag individuals with late or missed vaccines
           CASE WHEN TRIM(u2_vaccine_late_missed) <> 'NA' THEN 1 ELSE 0 END AS late_vaccine_flag,  
     -- Flag individuals who provided a reason for not accessing provider
           CASE WHEN u2_no_provider_why IS NOT NULL AND TRIM(u2_no_provider_why) <> '' THEN 1 ELSE 0 END AS provider_flag
    FROM practice_db.kenya_ihme_prem_ch_health
),
-- CTE 2: Calculate categories of provider-related barriers
no_provider_calc AS (
    select
    -- Direct barriers: reasons 1, 6, 7 (immediate or obvious access issues)
        CASE WHEN COALESCE(u2_no_provider_why_1,0) +
                  COALESCE(u2_no_provider_why_6,0) +
                  COALESCE(u2_no_provider_why_7,0) > 0 THEN 1 ELSE 0 END AS direct_barriers,              
    -- Indirect barriers: reasons 3, 4, 5 (systemic or secondary issues)
        CASE WHEN COALESCE(u2_no_provider_why_3,0) +
                  COALESCE(u2_no_provider_why_4,0) +
                  COALESCE(u2_no_provider_why_5,0) > 0 THEN 1 ELSE 0 END AS indirect_barriers,
                  
    -- Other barriers: reasons 2, 8, 88, 99 (miscellaneous or uncommon reasons)
        CASE WHEN COALESCE(u2_no_provider_why_2,0) +
                  COALESCE(u2_no_provider_why_8,0) +
                  COALESCE(u2_no_provider_why_88,0) +
                  COALESCE(u2_no_provider_why_99,0) > 0 THEN 1 ELSE 0 END AS other_barriers
    FROM base
    WHERE late_vaccine_flag = 0
      AND provider_flag = 1 )
SELECT
    COUNT(*) AS total_no_provider,
    SUM(direct_barriers) AS direct_total,
    ROUND(SUM(direct_barriers) / COUNT(*) * 100.0, 1) AS perc_direct,   
    SUM(indirect_barriers) AS indirect_total,
    ROUND(SUM(indirect_barriers) / COUNT(*) * 100.0, 1) AS perc_indirect,
    SUM(other_barriers) AS other_total,
    ROUND(SUM(other_barriers) / COUNT(*) * 100.0, 1) AS perc_other
FROM no_provider_calc;