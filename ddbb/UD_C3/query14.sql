SELECT
    COUNT(DISTINCT TL.Trackld)
FROM
    Track AS T
JOIN
    MediaType AS MT ON T.FK_MediaType_Track = MT.MediaTypeld
JOIN
    Album AS AL ON T.FK_MediaType_Track = AL.MediaTypeld
                AND AL.Title = 'Out Of Time'
JOIN
    Genre AS G ON T.Genreld = G.Genreld
JOIN
    Artist AS AR ON AL.FK_Artist_Track = AR.Artistid
JOIN
    InvoiceLine AS IL ON T.Trackld = IL.Trackld
GROUP BY
    T.Trackld,
    T.Name,
    T.Composer,
    MT.Name,
    AL.Albumid,
    AL.Title,
    G.Genreld,
    G.Name,
    IL.UnitPrice,
    IL.Quantity,
    AR.Artistid,
    AR.Name;