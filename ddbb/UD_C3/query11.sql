SELECT
    C.Customerld,
    C.FirstName,
    C.LastName,
    SUM(IL.UnitPrice * IL.Quantity) AS Total
FROM
    Customer AS C
JOIN
    Invoice AS I ON C.Customerld = I.Customerd
JOIN
    InvoiceLine AS IL ON I.Invoiceld = IL.InvoiceLineld
JOIN
    Track AS T ON IL.Trackld = T.Trackld
GROUP BY
    C.Customerld,
    C.FirstName,
    C.LastName
HAVING
    SUM(IL.UnitPrice * IL.Quantity) > 10
ORDER BY
    C.LastName ,
    C.FirstName;