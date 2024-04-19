USE Chinook;
SELECT Track.Name, Track.Milliseconds
FROM Track
WHERE Track.Milliseconds > (
    SELECT AVG(Track.Milliseconds)
    FROM Track
);