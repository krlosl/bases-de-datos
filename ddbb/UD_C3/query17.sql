SELECT

    A.Albumid,

    A.Title,

    COUNT(DISTINCT T.Trackld) AS TRACK_COUNT

FROM

    Album AS A

JOIN

    Track AS T ON A.Albumid = T.FK_MediaTypeORDER BY

    NumTracks DES_Track

GROUP BY

    A.Albumid,

    A.Title

ORDER BY

    TRACK_COUNT DESC;