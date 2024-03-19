--getting the name of the movies where johnny depp and helena bonham carter are starred
SELECT
    movies.title
FROM
    movies
    --joining 3 tables
    JOIN stars AS s1 ON s1.movie_id = movies.id
    JOIN stars AS s2 ON s2.movie_id = movies.id
    JOIN people AS p1 ON p1.id = s1.person_id
    JOIN people AS p2 ON p2.id = s2.person_id
    --condition is star names are johnny depp and helena bonham carter
WHERE
    p1.name LIKE "Johnny Depp"
    AND p2.name LIKE "Helena Bonham Carter"
