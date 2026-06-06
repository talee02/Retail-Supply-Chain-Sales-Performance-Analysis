CREATE TABLE supplychain.dim_salesperson AS 
SELECT 
ROW_NUMBER() OVER (ORDER BY `Retail Sales People`) AS salesperson_key, 
`Retail Sales People` AS salesperson_name 
FROM ( 
SELECT DISTINCT `Retail Sales People` FROM supplychain.`retail-scm` 
) sub; 
ALTER TABLE supplychain.dim_salesperson ADD PRIMARY KEY (salesperson_key); 