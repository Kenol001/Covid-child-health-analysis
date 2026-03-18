WITH categorized AS (
    SELECT
        *,
        -- Education categories
        CASE 
            WHEN education IN (1,2,7,8) THEN 'Low education'
            WHEN education IN (3,9,10,4,11,12) THEN 'Medium education'
            WHEN education IN (5,13,14,6,15) THEN 'High education'
        END AS education_group,
        -- Employment categories
        CASE 
            WHEN employment_status IN (1,11,2,12,3,20) THEN 'Employed'
            WHEN employment_status IN (7,17) THEN 'Unemployed'
            ELSE 'Other'
        END AS employment_group,
        -- Financial status categories
        CASE 
            WHEN financial_situation IN (1,2,3,6) THEN 'Can afford'
            WHEN financial_situation IN (4,7) THEN 'Moderate'
            WHEN financial_situation = 5 THEN 'Cannot afford'
        END AS financial_group,
        -- Outcomes
        CASE 
            WHEN u2_vaccine_late_missed = 0 THEN 1 ELSE 0 
        END AS never_received_vaccine,
        CASE 
            WHEN u2_no_provider_why IS NOT NULL 
                 AND TRIM(u2_no_provider_why) <> '' 
            THEN 1 ELSE 0 
        END AS provider_issue
    FROM practice_db.kenya_ihme_prem_ch_health
    WHERE u2_vaccine_late_missed <> 'NA'
)
-- Education analysis
SELECT
    'Education' AS variable,
    education_group AS category,
    COUNT(*) AS total,
    SUM(never_received_vaccine) AS never_received_count,
    ROUND(100.0 * SUM(never_received_vaccine) / COUNT(*), 1) AS perc_never_received,
    SUM(provider_issue) AS provider_issue_count,
    ROUND(100.0 * SUM(provider_issue) / COUNT(*), 1) AS perc_provider_issue
FROM categorized
WHERE education_group IS NOT NULL
GROUP BY education_group
UNION ALL
-- Employment analysis
SELECT
    'Employment' AS variable,
    employment_group AS category,
    COUNT(*) AS total,
    SUM(never_received_vaccine) AS never_received_count,
    ROUND(100.0 * SUM(never_received_vaccine) / COUNT(*), 1) AS perc_never_received,
    SUM(provider_issue) AS provider_issue_count,
    ROUND(100.0 * SUM(provider_issue) / COUNT(*), 1) AS perc_provider_issue
FROM categorized
WHERE employment_group IS NOT NULL
GROUP BY employment_group
UNION ALL
-- Financial status analysis
SELECT
    'Financial status' AS variable,
    financial_group AS category,
    COUNT(*) AS total,
    SUM(never_received_vaccine) AS never_received_count,
    ROUND(100.0 * SUM(never_received_vaccine) / COUNT(*), 1) AS perc_never_received,
    SUM(provider_issue) AS provider_issue_count,
    ROUND(100.0 * SUM(provider_issue) / COUNT(*), 1) AS perc_provider_issue
FROM categorized
WHERE financial_group IS NOT NULL
GROUP BY financial_group
ORDER BY variable, category;