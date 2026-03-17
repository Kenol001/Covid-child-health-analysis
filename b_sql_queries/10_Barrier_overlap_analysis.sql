-- Query: Barrier Overlap Analysis (Vaccine vs Provider)
-- Purpose: Identify children experiencing late vaccination, 
--          provider barriers, both, or neither.
-- Dataset: practice_db.kenya_ihme_prem_ch_health
-- Notes: Flags created for each barrier to simplify counting.
WITH base AS (
    SELECT *,
           -- Flag for late or missed vaccination
           CASE 
               WHEN TRIM(u2_vaccine_late_missed) <> 'NA' THEN 1 
               ELSE 0 
           END AS late_vaccine_flag,           
           -- Flag for provider-related barriers
           CASE 
               WHEN u2_no_provider_why IS NOT NULL 
                    AND TRIM(u2_no_provider_why) <> '' 
               THEN 1 
               ELSE 0 
           END AS provider_flag
    FROM practice_db.kenya_ihme_prem_ch_health
)
SELECT
    -- Total number of observations
    COUNT(*) AS total_sample,    
    -- Number of children with late vaccination only
    SUM(CASE WHEN late_vaccine_flag = 1 THEN 1 ELSE 0 END) AS late_vaccine_count,    
    -- Number of children with provider barrier only
    SUM(CASE WHEN late_vaccine_flag = 0 AND provider_flag = 1 THEN 1 ELSE 0 END) AS no_provider_count,    
    -- Number of children with both barriers
    SUM(CASE WHEN late_vaccine_flag = 1 AND provider_flag = 1 THEN 1 ELSE 0 END) AS both_count,    
    -- Number of children with neither barrier
    SUM(CASE WHEN late_vaccine_flag = 0 AND provider_flag = 0 THEN 1 ELSE 0 END) AS neither_count
FROM base;
