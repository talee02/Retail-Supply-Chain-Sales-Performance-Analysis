CREATE TABLE supplychain.dim_location AS 
SELECT 
    ROW_NUMBER() OVER (ORDER BY `Region`, `State`, `City`) AS location_key, 
    `City`, 
    `State`, 
    `Postal Code`, 
    `Region`, 
    `Country` 
FROM ( 
    SELECT DISTINCT `City`, `State`, `Postal Code`, `Region`, `Country` 
    FROM supplychain.`retail-scm` 
) sub; 
 
ALTER TABLE supplychain.dim_location ADD PRIMARY KEY (location_key); 