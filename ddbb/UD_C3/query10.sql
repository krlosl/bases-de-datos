SELECT
    P.Name,
    T.Name,
    A.Title,
    T.Milliseconds
FROM
    Playlist AS P
JOIN
    PlaylistTrack AS PT ON P.Playlistid = PT.FK_Playlist_PlaylistTrack
JOIN
    Track AS T ON PT.FK_Track_PlaylistTrack = T.Trackld
JOIN
    Album AS A ON T.FK_MediaType_Track = A.Albumid
WHERE
    P.Name LIKE 'C%'
ORDER BY
    A.Title,
    T.Milliseconds;