-- CHECK 1 : MISSING CUSTOMER ID
SELECT COUNT(*) AS Missing_CustomerID 
FROM dbo.RetailCombined 
WHERE Customer_ID IS NULL;

-- CHECK 2 : -VE OR 0 QUANTITY
SELECT COUNT(*) AS NEGVEQUANTITY
FROM dbo.RetailCombined 
WHERE Quantity <= 0;

-- CHECK 3 : 
SELECT COUNT(*) AS Missing_description
FROM dbo.RetailCombined 
WHERE description IS NULL;

-- CHECK 4 : EXACT DUPLICATE ROW
SELECT Invoice, StockCode, Description, Quantity, InvoiceDate, Price , Customer_ID, Country,
COUNT(*) AS ExactDupeCount
FROM dbo.RetailCombined 
GROUP BY Invoice, StockCode, Description, Quantity, InvoiceDate, Price , Customer_ID, Country
HAVING COUNT(*) >1;


