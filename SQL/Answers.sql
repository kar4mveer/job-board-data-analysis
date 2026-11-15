
-- Question 1 Hires per 100 applications by source

SELECT
    COALESCE(source, 'Unknown') AS Application_Source,

    COUNT(*) AS Total_Applications,

    SUM(CASE
        WHEN hired = 'yes' THEN 1
        ELSE 0
    END) AS Total_Hires,

    ROUND(
        SUM(CASE
            WHEN hired = 'yes' THEN 1.0
            ELSE 0
        END) * 100 / COUNT(*),
        2
    ) AS Hires_Per_100_Applications

FROM dbo.applications_original

GROUP BY source

ORDER BY Hires_Per_100_Applications DESC



--  Hires per 100 applications by source and role

SELECT
    role_category,
    source AS Application_Source,

    COUNT(*) AS Total_Applications,

    SUM(CASE
        WHEN hired = 'yes' THEN 1
        ELSE 0
    END) AS Total_Hires,

    ROUND(
        SUM(CASE
            WHEN hired = 'yes' THEN 1.0
            ELSE 0
        END) * 100 / COUNT(*),
        2
    ) AS Hires_Per_100_Applications

FROM dbo.applications_original

WHERE source IS NOT NULL

GROUP BY
    role_category,
    source

ORDER BY
    role_category,
    Hires_Per_100_Applications DESC



    
--  Question 2 Shortlisting rate by application completion

SELECT
    CASE
        WHEN steps_done = 4 THEN 'Completed all 4 steps'
        ELSE 'Completed less Than 4 steps'
    END AS Completion_Group,

    COUNT(*) AS Total_Applications,

    SUM(
        CASE
            WHEN shortlisted = 'yes' THEN 1
            ELSE 0
        END
    ) AS Total_Shortlisted,

    ROUND(
        SUM(
            CASE
                WHEN shortlisted = 'yes' THEN 1.0
                ELSE 0
            END
        ) * 100 / COUNT(*),
        2
    ) AS Shortlist_Rate

FROM dbo.applications_original

GROUP BY
    CASE
        WHEN steps_done = 4 THEN 'Completed all 4 steps'
        ELSE 'Completed less Than 4 steps'
    END

ORDER BY
    Shortlist_Rate DESC




--  Question 3 Paid vs unpaid response time analysis

WITH BaseData AS
(
    SELECT
        CASE
            WHEN stipend_inr_month > 0 THEN 'Paid'
            ELSE 'Unpaid'
        END AS Pay_Type,
        days_to_first_reply
    FROM dbo.applications_original
),

MedianData AS
(
    SELECT
        Pay_Type,
        PERCENTILE_CONT(0.5)
        WITHIN GROUP
        (ORDER BY days_to_first_reply)
        OVER (PARTITION BY Pay_Type) AS Median_Reply_Days
    FROM BaseData
    WHERE days_to_first_reply IS NOT NULL
),

SummaryData AS
(
    SELECT
        Pay_Type,
        COUNT(*) AS Total_Applications,

        SUM(CASE
            WHEN days_to_first_reply IS NOT NULL
            THEN 1 ELSE 0
        END) AS Applicants_Replied,

        SUM(CASE
            WHEN days_to_first_reply IS NULL
            THEN 1 ELSE 0
        END) AS Applicants_No_Reply,

        ROUND(
            AVG(CAST(days_to_first_reply AS FLOAT)),
            2
        ) AS Average_Reply_Days,

        ROUND(
            SUM(CASE
                WHEN days_to_first_reply IS NULL
                THEN 1.0 ELSE 0
            END) * 100 / COUNT(*),
            2
        ) AS No_Reply_Percentage

    FROM BaseData
    GROUP BY Pay_Type
),

MedianSummary AS
(
    SELECT
        Pay_Type,
        MAX(Median_Reply_Days) AS Median_Reply_Days
    FROM MedianData
    GROUP BY Pay_Type
)

SELECT
    S.Pay_Type,
    S.Total_Applications,
    S.Applicants_Replied,
    S.Applicants_No_Reply,
    S.Average_Reply_Days,
    M.Median_Reply_Days,
    S.No_Reply_Percentage

FROM SummaryData S
LEFT JOIN MedianSummary M
    ON S.Pay_Type = M.Pay_Type

ORDER BY S.Pay_Type


