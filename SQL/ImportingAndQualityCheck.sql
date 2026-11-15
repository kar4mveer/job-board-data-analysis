USE JobBoard

--Checking data

SELECT COUNT(*) AS Total_Applications
FROM dbo.applications_original

SELECT TOP 10 *
FROM dbo.applications_original

--Checking missing values

SELECT
    COUNT(*) AS Total_Rows,

    SUM(CASE WHEN source IS NULL
        THEN 1 ELSE 0 END) AS Missing_Source,

    SUM(CASE WHEN days_to_first_reply IS NULL
        THEN 1 ELSE 0 END) AS Missing_Reply_Days

FROM dbo.applications_original



-- Data validation

-- 1. Check duplicate application IDs
SELECT
    application_id,
    COUNT(*) AS duplicate_count
FROM dbo.applications_original
GROUP BY application_id
HAVING COUNT(*) > 1;


-- 2. Check role categories
SELECT DISTINCT role_category
FROM dbo.applications_original;


-- 3. Check work modes
SELECT DISTINCT work_mode
FROM dbo.applications_original;


-- 4. Check application sources
SELECT DISTINCT source
FROM dbo.applications_original;


-- 5. Check invalid step values
SELECT *
FROM dbo.applications_original
WHERE steps_done NOT BETWEEN 0 AND 4;


-- 6. Check negative stipends
SELECT *
FROM dbo.applications_original
WHERE stipend_inr_month < 0;


-- 7. Check invalid hiring outcomes
SELECT *
FROM dbo.applications_original
WHERE shortlisted NOT IN ('yes', 'no')
   OR interviewed NOT IN ('yes', 'no')
   OR hired NOT IN ('yes', 'no');


   -- Data Quality

   
USE JobBoard;
GO

-- 1. Check date range
SELECT
    MIN(applied_on) AS First_Application,
    MAX(applied_on) AS Last_Application,
    COUNT(*) AS Total_Applications,
    SUM(CASE WHEN applied_on IS NULL
        THEN 1 ELSE 0 END) AS Missing_Dates
FROM dbo.applications_original;


-- 2. Check negative reply days
SELECT *
FROM dbo.applications_original
WHERE days_to_first_reply < 0;


-- 3. Check hiring funnel consistency
SELECT *
FROM dbo.applications_original
WHERE
    (interviewed = 'yes' AND shortlisted <> 'yes')
    OR
    (hired = 'yes' AND interviewed <> 'yes');


-- 4. Check stipend distribution
SELECT
    CASE
        WHEN stipend_inr_month = 0 THEN 'Unpaid'
        WHEN stipend_inr_month > 0 THEN 'Paid'
        ELSE 'Invalid'
    END AS Stipend_Type,
    COUNT(*) AS Applications
FROM dbo.applications_original
GROUP BY
    CASE
        WHEN stipend_inr_month = 0 THEN 'Unpaid'
        WHEN stipend_inr_month > 0 THEN 'Paid'
        ELSE 'Invalid'
    END;


-- 5. Check application step distribution
SELECT
    steps_done,
    COUNT(*) AS Applications
FROM dbo.applications_original
GROUP BY steps_done
ORDER BY steps_done;



--- EDA Starting


-- EDA1 Application distribution by role

SELECT
    role_category,
    COUNT(*) AS Total_Applications,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*)
         FROM dbo.applications_original),
        2
    ) AS Application_Percentage
FROM dbo.applications_original
GROUP BY role_category
ORDER BY Total_Applications DESC;



-- EDA2  Applications by source

SELECT
    COALESCE(source, 'Unknown') AS Application_Source,
    COUNT(*) AS Total_Applications,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*)
         FROM dbo.applications_original),
        2
    ) AS Application_Percentage
FROM dbo.applications_original
GROUP BY source
ORDER BY Total_Applications DESC



-- EDA3 Applications by work mode

SELECT
    work_mode,
    COUNT(*) AS Total_Applications,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*)
         FROM dbo.applications_original),
        2
    ) AS Application_Percentage
FROM dbo.applications_original
GROUP BY work_mode
ORDER BY Total_Applications DESC



-- EDA4 Overall hiring funnel

SELECT
    COUNT(*) AS Total_Applications,

    SUM(CASE
        WHEN shortlisted = 'yes' THEN 1
        ELSE 0
    END) AS Total_Shortlisted,

    SUM(CASE
        WHEN interviewed = 'yes' THEN 1
        ELSE 0
    END) AS Total_Interviewed,

    SUM(CASE
        WHEN hired = 'yes' THEN 1
        ELSE 0
    END) AS Total_Hired,

    ROUND(
        SUM(CASE WHEN shortlisted = 'yes' THEN 1.0
        ELSE 0 END) * 100 / COUNT(*), 2
    ) AS Shortlist_Rate,

    ROUND(
        SUM(CASE WHEN interviewed = 'yes' THEN 1.0
        ELSE 0 END) * 100 / COUNT(*), 2
    ) AS Interview_Rate,

    ROUND(
        SUM(CASE WHEN hired = 'yes' THEN 1.0
        ELSE 0 END) * 100 / COUNT(*), 2
    ) AS Hiring_Rate

FROM dbo.applications_original




