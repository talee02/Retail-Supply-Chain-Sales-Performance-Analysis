USE supplychain;

-- DROP TABLE IF EXISTS fact_sales;

CREATE TABLE fact_sales AS 
SELECT 
    r.`Row ID` AS sales_key, 
    r.`Order ID`, 

    -- =========================
    -- DATE KEYS (HANDLE 2 FORMAT)
    -- =========================
    CAST(DATE_FORMAT(
        CASE 
            WHEN r.`Order Date` LIKE '%/%' 
                THEN STR_TO_DATE(r.`Order Date`, '%d/%m/%Y')
            ELSE STR_TO_DATE(r.`Order Date`, '%Y-%m-%d')
        END
    , '%Y%m%d') AS UNSIGNED) AS order_date_key, 

    CAST(DATE_FORMAT(
        CASE 
            WHEN r.`Ship Date` LIKE '%/%' 
                THEN STR_TO_DATE(r.`Ship Date`, '%d/%m/%Y')
            ELSE STR_TO_DATE(r.`Ship Date`, '%Y-%m-%d')
        END
    , '%Y%m%d') AS UNSIGNED) AS ship_date_key, 

    -- =========================
    -- FOREIGN KEYS
    -- =========================
    c.customer_key, 
    p.product_key, 
    l.location_key, 
    sp.salesperson_key, 

    -- =========================
    -- MEASURES
    -- =========================
    r.`Ship Mode`, 
    r.`Quantity`, 

    CAST(REPLACE(r.`Sales`, ',', '.')     AS DECIMAL(10,2)) AS sales, 
    CAST(REPLACE(r.`Discount`, ',', '.')  AS DECIMAL(5,2))  AS discount, 
    CAST(REPLACE(r.`Profit`, ',', '.')    AS DECIMAL(10,2)) AS profit, 

    -- =========================
    -- FLAG
    -- =========================
    CASE 
        WHEN r.`Returned` = 'Yes' THEN 1 
        ELSE 0 
    END AS is_returned, 

    -- =========================
    -- DAYS TO SHIP (FIXED)
    -- =========================
    DATEDIFF(
        CASE 
            WHEN r.`Ship Date` LIKE '%/%' 
                THEN STR_TO_DATE(r.`Ship Date`, '%d/%m/%Y')
            ELSE STR_TO_DATE(r.`Ship Date`, '%Y-%m-%d')
        END,
        CASE 
            WHEN r.`Order Date` LIKE '%/%' 
                THEN STR_TO_DATE(r.`Order Date`, '%d/%m/%Y')
            ELSE STR_TO_DATE(r.`Order Date`, '%Y-%m-%d')
        END
    ) AS days_to_ship 

FROM supplychain.`retail-scm` r 

-- =========================
-- JOINS (FULLY QUALIFIED)
-- =========================
JOIN supplychain.dim_customer   c  
    ON r.`Customer ID` = c.`Customer ID` 

JOIN supplychain.dim_product    p  
    ON r.`Product ID` = p.`Product ID` 

JOIN supplychain.dim_location   l  
    ON r.`City` = l.`City` 
   AND r.`State` = l.`State` 
   AND r.`Postal Code` = l.`Postal Code` 

JOIN supplychain.dim_salesperson sp  
    ON r.`Retail Sales People` = sp.`salesperson_name`;


-- =========================
-- INDEXING (PERFORMANCE)
-- =========================
ALTER TABLE fact_sales 
ADD PRIMARY KEY (sales_key);

ALTER TABLE fact_sales 
ADD INDEX idx_order_date (order_date_key);

ALTER TABLE fact_sales 
ADD INDEX idx_customer (customer_key);

ALTER TABLE fact_sales 
ADD INDEX idx_product (product_key);

ALTER TABLE fact_sales 
ADD INDEX idx_location (location_key);