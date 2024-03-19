--getting movies title and the rating of movies that release in 2010 and order them in decending order w.r.t ratings and accending w.r.t title
SELECT
    MOVIES.TITLE,
    RATINGS.RATING
FROM
    MOVIES
    JOIN RATINGS ON RATINGS.MOVIE_ID = MOVIES.ID
WHERE
    MOVIES.YEAR = 2010
ORDER BY
    RATINGS.RATING DESC,
    MOVIES.TITLE
