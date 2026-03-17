-- Purpose: Analyze reasons for late  vaccinations.
-- The query groups reported reasons into three categories:
-- Direct barriers, Indirect barriers, and Other barriers.
-- Exact reason definitions can be found in the project codebook.
-- CTE: Calculate barrier category flags for each record
with barriers_calc as
(select 
-- Direct barriers: reaons 3, 11, 12, 13 (immediate or obvious access issues)
      case when
           COALESCE(u2_late_vaccine_why_3,0) +
           COALESCE(u2_late_vaccine_why_11,0) +
           COALESCE(u2_late_vaccine_why_12,0) +
           COALESCE(u2_late_vaccine_why_13,0) > 0 
       then 1 else 0 end AS direct_barrier,
-- Indirect barriers: reasons 5, 6, 8 (systemic or secondary issues)
       case when 
           COALESCE(u2_late_vaccine_why_5,0) +
           COALESCE(u2_late_vaccine_why_6,0) +
           COALESCE(u2_late_vaccine_why_8,0) > 0 
       then 1 else 0 end as indirect_barrier,
-- Other barriers: reasons 2, 8, 88, 99 (miscellaneous or uncommon reasons)
       CASE WHEN 
            COALESCE(u2_late_vaccine_why_1,0) +
            COALESCE(u2_late_vaccine_why_2,0) +
            COALESCE(u2_late_vaccine_why_4,0) +
            COALESCE(u2_late_vaccine_why_9,0) +
            COALESCE(u2_late_vaccine_why_10,0) +
            COALESCE(u2_late_vaccine_why_14,0) +
            COALESCE(u2_late_vaccine_why_88,0) +
            COALESCE(u2_late_vaccine_why_99,0) > 0
        THEN 1 ELSE 0 END AS other_barrier
  FROM practice_db.kenya_ihme_prem_ch_health
  -- Filter records to include only individuals with late or missed vaccination
  WHERE u2_vaccine_late_missed = 1)
  -- Final aggregation: summarize counts and percentages of each barrier type
SELECT
    COUNT(*) AS total_missed, -- Total individuals with late/missed vaccination
    SUM(direct_barrier) AS direct_total, -- Number experiencing direct barriers
    ROUND(SUM(direct_barrier) / COUNT(*) * 100.0, 1) AS perc_direct, -- Percentage with direct barriers  
    SUM(indirect_barrier) AS indirect_total, -- Number experiencing indirect barriers
    ROUND(SUM(indirect_barrier) / COUNT(*) * 100.0, 1) AS perc_indirect, -- Percentage with indirect barriers
    SUM(other_barrier) AS other_total, -- Number experiencing other barriers
    ROUND(SUM(other_barrier) / COUNT(*) * 100.0, 1) AS perc_other -- Percentage with other barriers
FROM barriers_calc;

