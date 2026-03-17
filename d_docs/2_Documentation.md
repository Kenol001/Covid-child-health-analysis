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
28.3% of children missed vaccination.

7.6% could not access a healthcare provider.

7.6% experienced both barriers.

64.2% were not affected by either barrier

The majority of children were able to access vaccination and healthcare, but a notable subset faced access barriers, highlighting targets for public health interventions.

4.Missed Vaccination Coverage

Query Objective

To determine the follow-up vaccination status among children who initially missed or were late for vaccination.

SQL Query

[View Query](../b_sql_queries/04_Missed_vaccine_coverage.sql)
   
Results snippet.

<img width="465" height="60" alt="missed vac cov" src="https://github.com/user-attachments/assets/acc25fd3-f149-4615-af6f-550807617b84" />

Key Findings

Total children who missed vaccination: 15

11 (73.3%) received the missed vaccine

4 (26.7%) never received the missed vaccine

Interpretation

While most children eventually received vaccination, approximately one in four remained unvaccinated, indicating potential gaps in follow-up or healthcare delivery.


5.Missed Vaccination coverage by Region
    
Query Objective

To examine geographic disparities in vaccination coverage among children.

SQL query

[View Query](../b_sql_queries/05_Missed_vaccination_coverage_by_region.sql)

Results snippet.

<img width="686" height="111" alt="missed vac cov r" src="https://github.com/user-attachments/assets/27c591c4-a50b-465f-a958-ba3db122ed89" />

Key Findings.

City: 25% received missed vaccines, 75% did not

Rural: 16.7% received, 83.3% did not

Suburban: 18.5% received, 81.5% did not
Interpretation

Rural and suburban regions had higher proportions of children not receiving missed vaccines compared to urban areas, highlighting geographic inequalities in vaccination access.

6.Late Vaccination  Analysis

Query Objective

To understand reasons for late or missed vaccinations and classify them into actionable categories for public health planning.

SQL query

[View Query](../b_sql_queries/06_Late_vaccination_analysis.sql)
  
Results snippet.

<img width="637" height="47" alt="late vac an" src="https://github.com/user-attachments/assets/39011148-8c73-4e4a-ab30-8fa80986b9ed" />
Key findings

Total children with late vaccination: 11

Direct barriers: 7 children (63.6%)

Indirect barriers: 0 children (0%)

Other barriers: 6 children (54.5%)

Explanation

Most delays were due to direct access issues, suggesting that improving immediate service availability and outreach could reduce missed vaccinations. Other less common reasons also contributed and may need targeted interventions.

7.No vaccination b analysis.
 
SQL query

[View Query](../b_sql_queries/07_No_vaccination_analysis.sql)
  
Results snippet.

<img width="640" height="48" alt="no vac an" src="https://github.com/user-attachments/assets/c3a14fbe-bc3c-4e51-bb1b-cf7945a23b04" />

8.Descriptive Risk Factors Analysis.
 
Query Objective

Analyze key socioeconomic characteristics including education, employment and financial status.

SQL query

[View Query](../b_sql_queries/08_Descriptive_risk_factor_analysis.sql)
  
Results snippet.

<img width="382" height="253" alt="sec" src="https://github.com/user-attachments/assets/ac9a4509-0314-4d7a-ad82-bac20883ea4f" />

Explanation

Socioeconomic conditions may influence healthcare access and the likelihood of delayed or missed vaccinations.

Interpretation of Results

The results indicate that a portion of children experienced delayed vaccinations, likely influenced by healthcare access challenges during the COVID‑19 outbreak. Direct barriers such as access to healthcare facilities appear to be the most common obstacles. Geographic differences in vaccination outcomes suggest variations in healthcare access across regions.

 9.Provider Barrier analysis
 
 Query Objective:

This query identifies children who missed vaccinations not due to late vaccination but because of provider-related barriers

SQL query.

[View Query](../b_sql_queries/09_Provider_barrier_analysis.sql)
 
Results snippet.

<img width="635" height="54" alt="prov barrier an" src="https://github.com/user-attachments/assets/8340fdfe-4468-49f8-b029-612b445a7123" />

Results Summary:

Total children missing vaccination due to provider-related issues: 4

Direct barriers: 3 children (75%)

Indirect barriers: 1 child (25%)

Other barriers: 1 child (25%)

This shows that the majority of missed vaccinations were due to direct access issues, highlighting the need to address immediate service barriers

10.Barrier overlap analysis.

Query Objective:

This query examines the overlap between late vaccination and provider-related barriers among children.

SQL query.

[View Query](../b_sql_queries/10_Barrier_overlap_analysis.sql)

Results snippet.

<img width="481" height="62" alt="overlap an" src="https://github.com/user-attachments/assets/44ee9614-cc02-4c1a-bfa6-f2865e790232" />

Results Summary:

Total children in the sample: 53

Late vaccination only: 15 children

Provider barrier only: 4 children

Both barriers: 4 children

Neither barrier: 34 children

The results show that most children experienced no barriers, while a smaller proportion faced late vaccination or provider-related issues individually or simultaneously, highlighting areas for targeted intervention.

Key Findings

- The dataset contains 53 observations with no missing values in key variables.
  
- 15 children experienced late or missed vaccinations.
  
- Most children who missed vaccines eventually received them.
  
- Direct access barriers appear to be the main reason for vaccination delays.
  
- Geographic differences exist in vaccination outcomes.
  
- Socioeconomic factors provide important context for understanding healthcare access challenges.

