-- getting average of ratings of movies by joining movies and rating tables and movie release year is 2012
SELECT
    AVG(ratings.rating)
FROM
    movies
    JOIN RATINGS ON RATINGS.MOVIE_ID = MOVIES.ID
WHERE
    movies.year = 2012
