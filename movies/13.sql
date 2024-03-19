--getting the names of all people who starred in a movie in which Kevin Bacon also starred and kevin bacon  birth year is 1958 and kavin bacon is not listed in the output list
SELECT
    p1.name
FROM
    movies
    JOIN stars AS s1 ON s1.movie_id = movies.id
    JOIN stars AS s2 ON s2.movie_id = movies.id
    JOIN people AS p1 ON p1.id = s1.person_id
    JOIN people AS p2 ON p2.id = s2.person_id
WHERE
    NOT p1.name = "Kevin Bacon"
    AND p2.birth = 1958
    AND p2.name = "Kevin Bacon"
