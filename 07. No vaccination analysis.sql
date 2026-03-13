-- Calculating the values for those who never received missed vaccine
with barriers_calc as 
(select 
      case when 
      COALESCE(u2_no_vaccine_why_3,0) +
       COALESCE(u2_no_vaccine_why_11,0) +
       COALESCE(u2_late_vaccine_why_12,0) +
       COALESCE(u2_no_vaccine_why_13,0) > 0 
       then 1 else 0 end AS direct_barriers,
       case when
       COALESCE(u2_no_vaccine_why_5,0) +
       COALESCE(u2_no_vaccine_why_6,0) +
       COALESCE(u2_no_vaccine_why_8,0) > 0 
       then 1 else 0 end AS indirect_barriers,
       case when 
       COALESCE(u2_no_vaccine_why_1,0) + COALESCE(u2_no_vaccine_why_2,0) +
       COALESCE(u2_no_vaccine_why_4,0) + COALESCE(u2_no_vaccine_why_9,0) +
       COALESCE(u2_no_vaccine_why_10,0) +COALESCE(u2_no_vaccine_why_14,0) +
       COALESCE(u2_no_vaccine_why_88,0) +COALESCE(u2_no_vaccine_why_99,0) > 0 
       then 1 else 0 end AS other_barriers
   FROM practice_db.kenya_ihme_prem_ch_health
   WHERE u2_vaccine_late_missed = '0'
)
SELECT
    COUNT(*) AS total_missed,
    SUM(direct_barriers) AS direct_total,
    ROUND(SUM(direct_barriers) / COUNT(*) * 100.0, 1) AS perc_direct,   
    SUM(indirect_barriers) AS indirect_total,
    ROUND(SUM(indirect_barriers) / COUNT(*) * 100.0, 1) AS perc_indirect,
    SUM(other_barriers) AS other_total,
    ROUND(SUM(other_barriers) / COUNT(*) * 100.0, 1) AS perc_other
FROM barriers_calc;