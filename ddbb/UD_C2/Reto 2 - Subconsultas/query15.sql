USE Chinook;
SELECT Invoice.InvoiceId, Invoice.Total,
CASE
    WHEN Invoice.Total > 100 THEN Invoice.Total * 0.9
    ELSE Invoice.Total
END as DiscountedTotal
FROM Invoice;