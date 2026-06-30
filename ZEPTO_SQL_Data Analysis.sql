drop table if exists zepto;

create table zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC (8,2),
discountPercent NUMERIC (5,2),
availibleQuantity INTEGER,
discountedSellingPrice NUMERIC (8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);

--data exploration

--count of rows
SELECT COUNT (*) FROM zepto;

--sample data
SELECT * FROM zepto
LIMIT 10;

--null values
SELECT * FROM zepto
WHERE name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountpercent IS NULL
OR
discountedsellingprice IS NULL
OR
weightingms IS NULL
OR
availiblequantity IS NULL
OR
outOfstock IS NULL
OR
quantity IS NULL;

--diffrent product category
SELECT DISTINCT category
FROM zepto
ORDER BY category;

--product in stock vs out of stock
SELECT outOfstock, COUNT (sku_id)
FROM zepto
GROUP BY outOfstock;

--product name present multiple times
SELECT name, COUNT(sku_id) as "Number of SKUs"
FROM zepto
GROUP BY name
HAVING count (sku_id) > 1
ORDER BY  COUNT(sku_id) DESC;

--data cleaning 

--product with price = 0
SELECT * FROM zepto 
WHERE mrp = 0 OR discountedsellingprice = 0;

DELETE FROM zepto
WHERE mrp = 0;

--convert paise to rupees
UPDATE zepto
SET mrp = mrp/100.0,
discountedsellingprice = discountedsellingprice/100.0;

SELECT mrp,discountedsellingprice FROM zepto

