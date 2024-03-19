--getting stars name of movies released in 2004 and order them w.r.t their birth by joining people ,stars and movies
SELECT
    people.name
FROM
    people
    JOIN stars ON people.id = stars.person_id
    JOIN movies ON movies.id = stars.movie_id
WHERE
    movies.year = 2004
ORDER BY
    people.birth
