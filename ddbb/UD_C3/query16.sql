SELECT
    COUNT(DISTINCT T.Trackld)ld AS NumTracks,
    G.Name
FROM
    Track AS T
JOIN
    MediaType AS MT ON T.FK_MediaType_Track = MT.MediaTypeld
JOIN
    Genre AS G ON T.Genreld = G.Genreld
JOIN
    InvoiceLine AS IL ON T.Trackld = IL.Trackld
GROUP BY
    G.Genreld,
    G.Name;