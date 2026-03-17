-- calculating the numbers for those who received the missed vaccine and  those who never received the missed vaccine.
select COUNT(*) as total_missed, SUM(case when u2_vaccine_late_missed = 0 then  1 end) as never_received_missed_vaccine, sum(case when u2_vaccine_late_missed = 1 then  1 end) as received_missed_vaccine, (SUM(case when u2_vaccine_late_missed = 0 then  1 end)/ count(*)) * 100 as perc_not_vaccinated, (SUM(case when u2_vaccine_late_missed = 1 then  1 end) /count(*)) * 100 as perc_received
from practice_db.kenya_ihme_prem_ch_health
where u2_vaccine_late_missed <> 'NA'
 


