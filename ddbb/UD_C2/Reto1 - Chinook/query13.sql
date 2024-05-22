-- Muestra el número total de artistas
SELECT COUNT(DISTINCT A.Artistid) as Artistas
FROM Artist AS A;