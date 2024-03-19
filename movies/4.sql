--getting total number of movie ids where rating is 10
SELECT
    COUNT(movie_id)
FROM
    ratings
WHERE
    rating = 10
