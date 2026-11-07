-- COMBINE BOTH YEAR AND CONVERT TYPES SAFELY
USE [EcommerceCustomerAnalytics];
SELECT
Invoice, StockCode, Description, Quantity,
coalesce (
try_convert(datetime2, InvoiceDate, 120),
try_convert(datetime2, InvoiceDate, 105)
) as InvoiceDate,

TRY_CONVERT(decimal(10,2),Price) as Price,
Customer_ID,Country, '2009-2010' as SourceSheet
into dbo.RetailCombined
from dbo.[Year 2009-2010]

UNION ALL

SELECT
Invoice, StockCode, Description, Quantity,
coalesce (
try_convert(datetime2, InvoiceDate, 120),
try_convert(datetime2, InvoiceDate, 105)
) as InvoiceDate,

try_convert(decimal(10,2),price) as price,
Customer_ID,Country, '2010-2011' as SourceSheet
from dbo.[Year 2010-2011]