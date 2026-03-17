-- identifying individual status i.e those who needed  vaccination or treatment and those not in need of either service.
WITH status AS (
    SELECT *,
           CASE WHEN TRIM(u2_vaccine_late_missed) <> 'NA' THEN 1 ELSE 0 END AS late_vaccine_flag,
           CASE WHEN u2_no_provider_why IS NOT NULL AND TRIM(u2_no_provider_why) <> ''
                THEN 1 ELSE 0 END AS provider_flag
    FROM practice_db.kenya_ihme_prem_ch_health
)
select
-- count all individuals regardless of their status
    COUNT(*) AS total_sample,
-- get total no of individuals who missed vaccine    
    SUM(CASE WHEN late_vaccine_flag = 1 THEN 1 ELSE 0 END) AS late_vaccine_count,
-- calculate no of individuals who could not access healthcare service providers for treatment   
    SUM(CASE WHEN late_vaccine_flag = 0 AND provider_flag = 1 THEN 1 ELSE 0 END) AS no_provider_count,
-- calculate the number of people who were not in either group    
    SUM(CASE WHEN late_vaccine_flag = 0 AND provider_flag = 0 THEN 1 ELSE 0 END) AS neither_count
FROM status;
