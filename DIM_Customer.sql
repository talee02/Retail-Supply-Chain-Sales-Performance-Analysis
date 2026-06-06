CREATE TABLE supplychain.dim_customer AS 
SELECT 
    ROW_NUMBER() OVER (ORDER BY `Customer ID`) AS customer_key, 
    `Customer ID`, 
    `Customer Name`, 
    `Segment`
FROM ( 
    SELECT DISTINCT `Customer ID`, `Customer Name`, `Segment`
    FROM supplychain.`retail-scm`
) sub; 
 
ALTER TABLE supplychain.dim_customer ADD PRIMARY KEY (`customer_key`); 
ALTER TABLE supplychain.dim_customer ADD UNIQUE KEY (`Customer ID`); 