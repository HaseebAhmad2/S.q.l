--getting stars name of movie  "toy story" by joining people and stars table
SELECT
    people.name
FROM
    people
    JOIN stars ON stars.person_id = people.ID,
    movies ON stars.movie_id = movies.id
WHERE
    movies.title = "Toy Story"
