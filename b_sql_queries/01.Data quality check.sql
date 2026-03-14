-- Data quality check. This query checks for null values.
SELECT
    COUNT(*) AS total_records,
    SUM(CASE WHEN u2_vaccine_late_missed IS NULL THEN 1 ELSE 0 END) AS missing_vaccine_status,
    SUM(CASE WHEN u2_no_provider_why IS NULL THEN 1 ELSE 0 END) AS missing_provider_reason
FROM practice_db.kenya_ihme_prem_ch_health;