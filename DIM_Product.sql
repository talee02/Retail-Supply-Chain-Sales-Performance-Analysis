CREATE TABLE dim_product AS
SELECT 
    ROW_NUMBER() OVER (ORDER BY `Product ID`) AS product_key,
    `Product ID`,
    MIN(`Product Name`) AS product_name,
    MIN(`Category`) AS category,
    MIN(`Sub-Category`) AS sub_category
FROM supplychain.`retail-scm`
GROUP BY `Product ID`;

ALTER TABLE dim_product 
ADD PRIMARY KEY (product_key);