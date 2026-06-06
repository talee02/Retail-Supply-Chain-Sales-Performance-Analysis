SELECT 
    CAST(DATE_FORMAT(date_col, '%Y%m%d') AS UNSIGNED) AS date_key,
    date_col AS full_date,
    DAY(date_col) AS day,
    MONTH(date_col) AS month,
    YEAR(date_col) AS year,
    QUARTER(date_col) AS quarter,
    DAYNAME(date_col) AS day_name,
    MONTHNAME(date_col) AS month_name
FROM (
    SELECT `Order Date` AS date_col FROM supplychain.`retail-scm`
    UNION
    SELECT `Ship Date` FROM supplychain.`retail-scm`
) t
WHERE date_col IS NOT NULL
ORDER BY full_date;