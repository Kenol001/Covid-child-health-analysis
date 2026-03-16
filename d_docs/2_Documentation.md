# Child Health and Vaccination Analysis Documentation

## Project Overview

This project analyzes child health and vaccination data from Kenya to explore vaccination coverage, barriers to healthcare access, and socioeconomic risk factors affecting child health outcomes. The analysis focuses on identifying patterns in missed vaccinations, healthcare provider access, and the influence of social and economic conditions.

The goal of this project is to demonstrate the use of SQL for data exploration, data quality assessment, and analytical reporting in a public health dataset.

---

## Methodology

### Dataset
The dataset used in this analysis is:

`practice_db.kenya_ihme_prem_ch_health`

It contains survey data related to child health conditions, vaccination status, healthcare access, and demographic and socioeconomic characteristics of households.

### Tools Used
- **SQL** for data cleaning, exploration, and analysis
- **DBeaver / SQL environment** for running queries
- **GitHub** for version control and project documentation

### Analytical Approach
The analysis followed these steps:

1. **Data Quality Assessment** to check for missing values.
2. **Data Exploration** to preview the dataset structure.
3. **Vaccination Status Analysis** to identify children who missed vaccines.
4. **Regional Analysis** to compare vaccination coverage by geographic location.
5. **Barrier Analysis** to identify reasons for missed vaccinations and healthcare access issues.
6. **Socioeconomic Risk Factor Analysis** to explore education, employment, and financial conditions.

---

# Analysis

## 1. Data Quality Check

### Query Objective
Check the dataset for missing values in key variables related to vaccination status and healthcare provider access.

### SQL Query

```sql
SELECT
    COUNT(*) AS total_records,
    SUM(CASE WHEN u2_vaccine_late_missed IS NULL THEN 1 ELSE 0 END) AS missing_vaccine_status,
    SUM(CASE WHEN u2_no_provider_why IS NULL THEN 1 ELSE 0 END) AS missing_provider_reason
FROM practice_db.kenya_ihme_prem_ch_health;
