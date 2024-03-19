--getting title of movies of year 2018 in accending order by title
SELECT
    title
FROM
    movies
WHERE
    YEAR >= 2018
ORDER BY
    title
