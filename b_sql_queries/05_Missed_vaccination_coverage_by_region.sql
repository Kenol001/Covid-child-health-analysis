/*
Query: Vaccination status by region
Purpose: Count children who received late, did not receive, and total in need of vaccine by region
Dataset: kenya_ihme_prem_ch_health
*/
SELECT
    CASE geography
        WHEN 1 THEN 'City'
        WHEN 2 THEN 'Suburban'
        WHEN 3 THEN 'Rural'
        ELSE 'Unknown'
    END AS region,
    count(CASE WHEN TRIM(u2_vaccine_late_missed) <> 'NA' THEN 1 ELSE 0 end) AS late_vaccine_flag,
    count(CASE WHEN u2_vaccine_late_missed = 1 THEN 1 end) AS received_missed,
    count(CASE WHEN u2_vaccine_late_missed = '0' THEN 1 end) AS did_not_receive_missed,
    ROUND(
        COUNT(CASE WHEN u2_vaccine_late_missed = 1 THEN 1 END) * 100.0
        / NULLIF(COUNT(CASE WHEN u2_vaccine_late_missed IN (0,1) THEN 1 END),0), 1
    ) AS perc_received_late,
    ROUND(
        COUNT(CASE WHEN u2_vaccine_late_missed = 0 THEN 1 END) * 100.0
        / NULLIF(COUNT(CASE WHEN u2_vaccine_late_missed IN (0,1) THEN 1 END),0), 1
    ) AS perc_did_not_receive_missed
FROM practice_db.kenya_ihme_prem_ch_health
WHERE u2_vaccine_late_missed IS NOT NULL -- exclude NA for children who did not need vaccine
GROUP BY geography
ORDER BY region;
