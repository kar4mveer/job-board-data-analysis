# Job Board Data Analysis

## Project Overview

This project analyses job application data collected between **July and September 2026** to understand recruitment performance, applicant behaviour, and employer response efficiency.

The project uses Excel and SQL Server to clean, validate, and analyse application records, identify recruitment trends, and present actionable insights.

## Project Objectives

The analysis focuses on three key business questions:

1. **Recruitment Source Performance:** Which application source generates the highest number of hires per 100 applications? Does the leading source remain the same across different role categories?
2. **Application Completion:** Are applicants who complete all four application steps more likely to be shortlisted?
3. **Response Time Analysis:** How do response times and no-reply rates differ between paid and unpaid opportunities?

## Tools & Technologies

- **Microsoft Excel:** Data cleaning and preliminary analysis.
- **Microsoft SQL Server (SSMS):** Data importing, quality checks, and analysis.
- **SQL:** Data aggregation, grouping, filtering, and calculations.
- **GitHub:** Project documentation and version control.

## Repository Structure

```text
job-board-data-analysis/
│
├── Datasets/
│   ├── job_board_applications.csv
│   └── job_board_cleaned.csv
│
├── Document/
│   ├── final_submission_summary.pdf
│   └── final_submission_summary.docx
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
- Email followed with 8.13 hires per 100 applications.
- The leading source varied across role categories.

### 2. Application Completion

- Applicants completing all four steps had a shortlisting rate of **48.39%**.
- Applicants completing fewer than four steps had a shortlisting rate of **9.28%**.
- Difference: **39.11 percentage points**.

### 3. Paid vs Unpaid Response Analysis

- Paid opportunities had an average response time of **3.22 days**.
- Unpaid opportunities had an average response time of **7.63 days**.
- No-reply rate for paid opportunities: **13.08%**.
- No-reply rate for unpaid opportunities: **29.61%**.

## Exploratory Data Analysis (EDA)

Project screenshots documenting the data exploration and analysis:

- [EDA Screenshot 1](Screenshots/EDA1.png)
- [EDA Screenshot 2](Screenshots/EDA2.png)
- [EDA Screenshot 3](Screenshots/EDA3.png)

## Manager's Note

The analysis of 1,200 job applications from July to September 2026 highlights three important recruitment insights.

Referral was the strongest overall application source, generating 10.74 hires per 100 applications. However, the leading source differed across role categories, indicating that recruitment teams should evaluate channels based on the roles they need to fill rather than relying on one source for every position.

Applicants who completed all four application steps had a shortlisting rate of 48.39%, compared with 9.28% among applicants who completed fewer steps. This highlights the importance of encouraging applicants to complete the full application process.

Response times also differed between paid and unpaid opportunities. Paid opportunities had an average response time of 3.22 days, compared with 7.63 days for unpaid opportunities. The no-reply rate was also higher for unpaid opportunities (29.61%) than paid opportunities (13.08%).

**Recommendation:** Prioritise effective recruitment channels by role, encourage application completion, and improve follow-up processes for unpaid opportunities.

## Data Cleaning & Quality Checks

The cleaned dataset contains **1,200 application records**.

Data preparation and validation included:

- Checking missing values.
- Checking duplicate application IDs.
- Standardising work-mode categories.
- Validating application funnel consistency.
- Checking invalid or negative values.
- Removing unnecessary empty columns.

## Project Deliverables

- Original and cleaned datasets.
- SQL scripts for data importing, quality checks, and analysis.
- Excel-based data cleaning work.
- EDA and SQL screenshots.
- Final project report.

---

**Project Category:** Data Analytics  
**Dataset Period:** July – September 2026  
**Records Analysed:** 1,200  
**Tools:** Microsoft Excel | SQL Server | GitHub
