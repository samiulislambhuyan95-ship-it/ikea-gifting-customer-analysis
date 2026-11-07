-- REMOVE DUPLICATE AND CREATE A FINAL CLEANED TABLE
WITH Deduped AS (
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY Invoice, StockCode, Description, Quantity, InvoiceDate, Price , Customer_ID, Country
ORDER BY (SELECT NULL)
) AS RowNum
from dbo.RetailCombined
)
SELECT Invoice, StockCode, Description, Quantity, InvoiceDate, Price , Customer_ID, Country,SourceSheet
INTO dbo.RetailCleaned
FROM Deduped
WHERE RowNum = 1;