/*
   PROJECT: Child Health Survey Analysis
   FILE: Risk Factors Summary
   PURPOSE: 
       Calculate counts and percentages for key socioeconomic 
       risk factors (education, employment, financial status).
   NOTE:
       - Null values are excluded from category counts.
       - Percentages are calculated within each variable.
    */
WITH categorized AS (
    -- Create grouped socioeconomic categories
    SELECT         
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
        END AS financial_group
    FROM practice_db.kenya_ihme_prem_ch_health
)
-- Education distribution
SELECT
    'Education' AS variable,
    education_group AS category,
    COUNT(*) AS total,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM categorized
WHERE education_group IS NOT NULL
GROUP BY education_group
UNION ALL
-- Employment distribution
SELECT
    'Employment' AS variable,
    employment_group AS category,
    COUNT(*) AS total,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM categorized
WHERE employment_group IS NOT NULL
GROUP BY employment_group
UNION ALL
-- Financial status distribution
SELECT
    'Financial status' AS variable,
    financial_group AS category,
    COUNT(*) AS total,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM categorized
WHERE financial_group IS NOT NULL
GROUP BY financial_group;