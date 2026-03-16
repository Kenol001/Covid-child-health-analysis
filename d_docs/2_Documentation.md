
Child Health and Vaccination Analysis Documentation
Project Overview
This project analyzes child health and vaccination data from Kenya to explore vaccination coverage, barriers to healthcare access, and socioeconomic risk factors affecting child health outcomes. The analysis focuses on identifying patterns in missed vaccinations, healthcare provider access, and the influence of social and economic conditions.
The analysis was conducted in the context of the COVID‑19 outbreak, a period during which healthcare access and routine immunization services were disrupted in many regions. Understanding vaccination delays and barriers during this time provides insights into how public health emergencies affect routine healthcare services.
Methodology
Dataset
practice_db.kenya_ihme_prem_ch_health
The dataset contains survey data related to child health conditions, vaccination status, healthcare access, and demographic and socioeconomic characteristics of households in Kenya.
Tools Used
- SQL for data cleaning, exploration, and analysis
- DBeaver / SQL environment for running queries
- GitHub for version control and project documentation
Analytical Approach
1. Data Quality Assessment to check for missing values.
2. Data Exploration to preview the dataset structure.
3. Vaccination Status Analysis to identify children who missed vaccines.
4. Regional Analysis to compare vaccination coverage by geographic location.
5. Barrier Analysis to identify reasons for missed vaccinations and healthcare access issues.
6. Socioeconomic Risk Factor Analysis to explore education, employment, and financial conditions.
Analysis
1. Data Quality Check
Query Objective
Check the dataset for missing values in key variables related to vaccination status and healthcare provider access.
SQL Query
b_sql_queries/01.Data quality check.sql
Results snippet.

Explanation
The dataset contains 53 records and no missing values were found in the variables related to vaccination status and provider access. This indicates the dataset is suitable for further analysis.
2. Data Preview
Query Objective
Preview the dataset to understand the structure and types of variables available for analysis.
SQL Query
b_sql_queries/02. Data exploration.sql
Results snippet.

Explanation
Previewing the data helps confirm the structure of the dataset and identify key variables such as demographics, socioeconomic indicators, child health conditions, and vaccination records.
3. Vaccination category Identification
Query Objective
Identify individuals who missed vaccinations or experienced barriers to healthcare access.
SQL Query
b_sql_queries/03. Category identification.sql
Results snippet.

Result Summary
Total sample: 53
Late vaccine cases: 15
Provider access barriers: 4
Neither barrier: 34
4. Missed Vaccination Coverage
Query Objective
Determine how many children who missed vaccines eventually received them and how many did not.
SQL Query
b_sql_queries/04. Missed vaccine coverage.sql
Results snippet.

Result Summary
Total missed: 15
Never received missed vaccine: 4
Received missed vaccine: 11
5. Vaccination Status by Region
Query Objective
Analyze vaccination outcomes across geographic regions.
SQL query
b_sql_queries/05. Missed vaccination coverage by region .sql
Results snippet.


Explanation
Regional analysis helps identify geographic disparities in vaccination coverage and recovery of missed vaccines.
6.Late Vaccination Barrier Analysis
Query Objective
Identify the types of barriers responsible for delayed vaccinations.
SQL query
b_sql_queries/06. Late vaccination analysis.sql
Results snippet.

Explanation
The analysis categorizes barriers into direct, indirect, and other barriers based on survey responses.
7.No vaccination barrier analysis.
SQL query
b_sql_queries/07. No vaccination analysis.sql
Results snippet.

8.Socioeconomic Risk Factors
Query Objective
Analyze key socioeconomic characteristics including education, employment, and financial status.
SQL query
b_sql_queries/08. Descriptive risk factor analysis.sql
Results snippet.

Explanation
Socioeconomic conditions may influence healthcare access and the likelihood of delayed or missed vaccinations.
Interpretation of Results
The results indicate that a portion of children experienced delayed vaccinations, likely influenced by healthcare access challenges during the COVID‑19 outbreak. Direct barriers such as access to healthcare facilities appear to be the most common obstacles. Geographic differences in vaccination outcomes suggest variations in healthcare access across regions.
7.Provider Barrier analysis
 Query Objective:

This query identifies children who missed vaccinations not due to late vaccination but because of provider-related barriers
SQL query.
b_sql_queries/09. Provider barrier analysis.sql
Results snippet.

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
b_sql_queries/10.Barrier overlap analysis.sql
Results snippet.

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

