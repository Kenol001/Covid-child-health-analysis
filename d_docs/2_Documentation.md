Health and Vaccination Analysis Documentation.
                          
Project Overview.

This project analyzes child health and vaccination data from Kenya to explore vaccination coverage, barriers to healthcare access and socioeconomic risk factors affecting child health outcomes. The analysis focuses on identifying patterns in missed vaccinations, healthcare provider access and the influence of social and economic conditions.

The analysis was conducted in the context of the COVID‑19 outbreak, a period during which healthcare access and routine immunization services were disrupted in many regions. Understanding vaccination delays and barriers during this time provides insights into how public health emergencies affect routine healthcare services.

Methodology
                          
Dataset

[kenya_ihme_prem_ch_health_202603140355.csv](../a_data/kenya_ihme_prem_ch_health_202603140355.csv)
                         
The dataset contains survey data related to child health conditions, vaccination status, healthcare access and demographic and socioeconomic characteristics of households in Kenya.

Tools Used
                         
- SQL for data cleaning, exploration and analysis
  
- DBeaver / SQL environment for running queries
  
- GitHub for version control and project documentation
  
Analytical Approach
  
1. Data Quality Assessment to check for missing values.
2. Data Exploration to preview the dataset structure.
3. Vaccination Status Analysis to identify children who missed vaccines.
4. Regional Analysis to compare vaccination coverage by geographic location.
5. Barrier Analysis to identify reasons for missed vaccinations and healthcare access issues.
6. Socioeconomic Risk Factor Analysis to explore education, employment and financial conditions.

Analysis

1.Data Quality Check

Query Objective

To assess the completeness of the dataset and ensure reliability before conducting further analysis. Missing or null values can affect the validity of findings and interpretations.

SQL Query

[01_data_quality_check.sql](../queries/01_data_quality_check.sql)

Results snippet.

<img width="374" height="56" alt="qc" src="https://github.com/user-attachments/assets/9461b946-d7c9-4387-9e93-ded66c139d9b" />

Explanation

The dataset contains 53 records and no missing values were found in the variables related to vaccination status and provider access. This indicates the dataset is suitable for further analysis.

2.Data Exploration.
    
Query Objective

To examine the structure and content of the dataset, understand variable types and validate expected ranges for demographic and health-related fields.

SQL Query
     
[View Query](../b_sql_queries/02_Data_exploration.sql)
   
Results snippet.

<img width="877" height="270" alt="expl" src="https://github.com/user-attachments/assets/7cb8333d-9528-4469-bbde-5b423b11e71a" />

Explanation

The dataset captures children from diverse regions (urban, suburban, rural).

Includes demographic, health condition and service access data.

Variability in provider location and health conditions was noted, which is useful for subgroup analyses.

3.Vaccination category Identification

Query Objective

To classify children based on whether they required vaccination or treatment and whether they experienced barriers to accessing care.
SQL Query

[View Query](../b_sql_queries/03_Category_identification.sql)
  
Results snippet.

<img width="845" height="102" alt="cat" src="https://github.com/user-attachments/assets/89b85154-6648-4d90-a599-a565f2d19ce1" />

Result Summary
28.3% (n = 15) of children missed vaccination.

7.6% (n = 4) could not access a healthcare provider.

7.6% (n = 4) experienced both barriers.

64.2% (n = 34) were not affected by either barrier

Interpretation.
Approximately 28% of children experienced delayed or missed vaccination, reflecting pandemic-related service disruptions. A smaller subset (7.6%) could not access treatment from providers, while another 7.6% faced both vaccination delays and access barriers, indicating compounded vulnerability during COVID-19. The majority (64%) were unaffected, suggesting some resilience in healthcare delivery.

4.Missed Vaccination Coverage

Query Objective

To determine the follow-up vaccination status among children who initially missed or were late for vaccination.

SQL Query

[View Query](../b_sql_queries/04_Missed_vaccine_coverage.sql)
   
Results snippet.

<img width="465" height="60" alt="missed vac cov" src="https://github.com/user-attachments/assets/acc25fd3-f149-4615-af6f-550807617b84" />

Key Findings

Total children who missed vaccination: 15

n = 11 (73.3%) received the missed vaccine

n = 4 (26.7%) never received the missed vaccine

Interpretation

While most children eventually received their delayed vaccines, 27% remained unvaccinated, highlighting a persistent gap in catch-up immunization efforts during COVID-19. This suggests that pandemic-related disruptions may have long-lasting effects on herd immunity if recovery strategies are insufficient.


5.Missed Vaccination coverage by Region
    
Query Objective

To examine geographic disparities in vaccination coverage among children.

SQL query

[View Query](../b_sql_queries/05_Missed_vaccination_coverage_by_region.sql)

Results snippet.

<img width="686" height="111" alt="missed vac cov r" src="https://github.com/user-attachments/assets/27c591c4-a50b-465f-a958-ba3db122ed89" />

Key Findings.

Analysis of child vaccination by region during COVID-19 shows that missed vaccines were highest in rural (83.3%) and suburban (81.5%) areas, compared to cities (75%). Receipt of late vaccines was slightly higher in cities (25%) than in suburban (18.5%) and rural areas (16.7%).

Interpretation

These results suggest that COVID-19 disruptions disproportionately affected children outside urban centers, likely due to limited access to health facilities and service interruptions. Targeted strategies are needed to maintain vaccination coverage in rural and suburban regions during public health crises.

6.Late Vaccination  Analysis

Query Objective

To understand reasons for late or missed vaccinations and classify them into actionable categories for public health planning.

SQL query

[View Query](../b_sql_queries/06_Late_vaccination_analysis.sql)
  
Results snippet.

<img width="637" height="47" alt="late vac an" src="https://github.com/user-attachments/assets/39011148-8c73-4e4a-ab30-8fa80986b9ed" />
Key findings

Total children with late vaccination: 11

Direct barriers: (n = 7) children (63.6%)

Indirect barriers:( n = 0) children (0%)

Other barriers:(n = 6) children (54.5%)

Interpretation.

Direct barriers, such as immediate access issues (e.g., clinic closures, transport challenges), were the main cause of delayed vaccination. Indirect/systemic barriers were minimal, indicating that the pandemic primarily disrupted service availability rather than systemic or policy-level processes. Other barriers (e.g., parental choice, miscellaneous reasons) affected over half the cases, suggesting that COVID-19’s indirect social and behavioral impacts also contributed.

7.No vaccination analysis.

 Query ojective
  
 To quantify the prevalence and types of reported barriers (direct, indirect, and other) among children who never received or missed vaccination
   
SQL query

[View Query](../b_sql_queries/07_No_vaccination_analysis.sql)
  
Results snippet.

<img width="640" height="48" alt="no vac an" src="https://github.com/user-attachments/assets/c3a14fbe-bc3c-4e51-bb1b-cf7945a23b04" />


Key Findings

Among 4 children who missed vaccination:

50% (n=2) experienced direct barriers

0% (n=0) experienced indirect barriers

50% (n=2) experienced other barriers

Interpretation.

COVID-19 likely disrupted immediate access to vaccination, while some obstacles were unique or less documented, highlighting the need for targeted catch-up interventions

8.Descriptive Risk Factors Analysis.
 
Query Objective

To describe the distribution of key socioeconomic risk factors (education, employment, and financial status) in the study population.

SQL query

[View Query](../b_sql_queries/08_Descriptive_risk_factor_analysis.sql)
  
Results snippet.

<img width="382" height="253" alt="sec" src="https://github.com/user-attachments/assets/ac9a4509-0314-4d7a-ad82-bac20883ea4f" />

Key Findings

COVID-19 disrupted child health services unevenly across socioeconomic groups. Children from moderate-income households had the highest missed vaccination (50%) and elevated provider barriers (33%), while those from households able to afford basics had the lowest. High education did not fully protect against service disruptions, with 50% experiencing provider barriers, and unstable or informal employment showed the highest access challenges (66.7%)

Interpretation

These findings highlight that pandemic-related disruptions affected both preventive (vaccination) and curative services across the population. Public health interventions should prioritize financially and economically vulnerable households while ensuring continuity of essential child health services for all.

 9.Provider Barrier analysis
 
 Query Objective:

To assess the types of provider-related barriers among children who did not experience late vaccination but reported difficulty accessing healthcare providers.

SQL query.

[View Query](../b_sql_queries/09_Provider_barrier_analysis.sql)
 
Results snippet.

<img width="635" height="54" alt="prov barrier an" src="https://github.com/user-attachments/assets/8340fdfe-4468-49f8-b029-612b445a7123" />

Methods

Children without late vaccination (late_vaccine_flag = 0) but with reported provider issues were included. Barriers were categorized into:

Direct barriers (e.g., immediate access issues)

Indirect barriers (system inefficiencies)

Other barriers

Binary indicators were generated and summarized using counts and percentages.

Key Findings

Among 4 children reporting provider-related barriers:

75% (n=3) experienced direct barriers

25% (n=1) experienced indirect barriers

25% (n=1) experienced other barriers

Findings indicate that direct access challenges due to covid are the most prominent provider-related issue among those who were not delayed in vaccination.

10.Barrier overlap analysis.

Query Objective:

To examine the overlap between late/missed vaccination and provider-related barriers in the study population

SQL query.

[View Query](../b_sql_queries/10_Barrier_overlap_analysis.sql)

Results snippet.

<img width="481" height="62" alt="overlap an" src="https://github.com/user-attachments/assets/44ee9614-cc02-4c1a-bfa6-f2865e790232" />

Key Findings

Out of 53 children:

28.3% (n=15) had late vaccination

7.5% (n=4) had provider barriers only

7.5% (n=4) experienced both barriers

64.2% (n=34) had neither barrier

These results indicate that while most children did not experience barriers, a non-negligible proportion (≈15%) faced either overlapping or isolated challenges.

Key Public Health Insight

COVID-19 disrupted both child vaccination and access to treatment, with 28% experiencing vaccination delays

73% recovered missed vaccines, but a critical gap remained (27% never vaccinated)

Financial vulnerability was a key driver — moderate-income households were most affected

Informal/unstable employment showed the highest treatment access barriers (66.7%)

Even high-education groups were affected, highlighting system-level disruptions

Overall, COVID-19 exacerbated existing health inequities and revealed gaps in health system resilience, emphasizing the need for targeted interventions to maintain essential child health services during public health crises.
