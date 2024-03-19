--getting title of all movies of name Harry potter and order them with respect to year
SELECT
    title,
    YEAR
FROM
    movies
WHERE
    title LIKE "%Harry Potter%"
ORDER BY
    YEAR;
