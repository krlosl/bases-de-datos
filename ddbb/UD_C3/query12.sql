SELECT
    I.Invoiceld,
    AVG(IL.UnitPrice * IL.Quantity) AS Average,
    MIN(IL.UnitPrice * IL.Quantity) AS Minimum,
    MAX(IL.UnitPrice * IL.Quantity) AS Maximum
FROM
    Invoice AS I
JOIN
    InvoiceLine AS IL ON I.Invoiceld = IL.InvoiceLineld
GROUP BY
    I.Invoiceld;