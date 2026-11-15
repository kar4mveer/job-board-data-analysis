# Job Board Data Analysis

## Project Overview
This project analyses job application data collected between **July and September 2026** to understand recruitment performance, applicant behaviour, and response efficiency.

The objective is to identify which application sources generate the most hires, understand how completing application steps relates to shortlisting, and compare employer response times for paid and unpaid opportunities.

## Objectives
The analysis focuses on three key business questions:

1. **Recruitment Source Performance:** Which application source generates the highest number of hires per 100 applications? Does the leading source remain the same across different role categories?
2. **Application Completion:** Are applicants who complete all four application steps more likely to be shortlisted?
3. **Response Time Analysis:** How do response times and no-reply rates differ between paid and unpaid opportunities?

## Tools & Technologies
- **Microsoft Excel:** Data cleaning, formatting, and preliminary analysis.
- **Microsoft SQL Server (SSMS):** Data importing, quality checks, querying, and analysis.
- **SQL:** Aggregations, grouping, filtering, and calculations.
- **Data Visualization:** Charts to communicate key findings.
- **GitHub:** Project documentation and version control.

## Repository Structure

```text
job-board-data-analysis/
│
├── Datasets/
│   ├── job_board_applications.csv
│   └── job_board_cleaned.csv
│
├── Result/
│   └── summary.pdf
│
├── SQL/
│   ├── Answers.sql
│   └── ImportingAndQualityCheck.sql
│
├── Screenshots/
│   ├── EDA1.png
│   ├── EDA2.png
│   └── EDA3.png
│
└── README.md
```

## Key Findings

### 1. Recruitment Source Performance
- Referral generated the highest overall hiring rate, with **10.74 hires per 100 applications**.
- The leading source varied across role categories.

### 2. Application Completion
- Applicants completing all four steps had a shortlisting rate of **48.39%**.
- Applicants completing fewer than four steps had a shortlisting rate of **9.28%**.
- This represents a difference of **39.11 percentage points**.

### 3. Paid vs Unpaid Response Analysis
- Paid opportunities had an average response time of **3.22 days**.
- Unpaid opportunities had an average response time of **7.63 days**.
- The no-reply rate was **13.08% for paid** and **29.61% for unpaid** opportunities.

## Data Quality
The cleaned dataset contains **1,200 application records**.

Data preparation and quality checks included:
- Checking missing values.
- Checking duplicate application IDs.
- Standardising work-mode categories.
- Validating application funnel consistency.
- Checking invalid or negative values.

## Recommendation
Recruitment teams should prioritise referral channels while evaluating source performance separately for each role category. They should also encourage applicants to complete all application steps and improve response follow-up, particularly for unpaid opportunities.

## Project Deliverables
- Original and cleaned datasets.
- SQL scripts for data quality checks and analysis.
- Analysis screenshots.
- Final results and summary report.

---
**Project Category:** Data Analytics  
**Dataset Period:** July – September 2026  
**Tools:** Excel | SQL Server | GitHub

