/* Необходимо вывести 200 самых популярных фильмов для указанных жанров (Drama, Thriller, Comedy) */
SELECT
  movies.title,
  AVG(rating) AS rating
FROM ratings
  INNER JOIN movies ON ratings.movie_id = movies.id
  INNER JOIN genres_movies ON ratings.movie_id = genres_movies.movie_id
WHERE genres_movies.genre_id IN (5, 8, 16)
GROUP BY movies.title
ORDER BY rating DESC
LIMIT 200;


/* Необходимо вывести 50 самых популярных фильмов для указанного списка профессий (Engineer, Programmer и Marketing) */
SELECT
  movies.title,
  AVG(rating) AS rating
FROM ratings
  INNER JOIN movies ON ratings.movie_id = movies.id
  INNER JOIN users ON ratings.user_id = users.id
WHERE users.occupation_id IN (5, 12, 15)
GROUP BY movies.title
ORDER BY rating DESC
LIMIT 50;


/* Необходимо вывести 200 самых не популярных фильмов, которые были просмотрены пользователями в указанном возрастном
   диапазоне (от 18 до 35 лет) */
SELECT
  movies.title,
  AVG(rating) AS rating
FROM ratings
  INNER JOIN movies ON ratings.movie_id = movies.id
  INNER JOIN users ON ratings.user_id = users.id
WHERE users.age BETWEEN 18 AND 35
GROUP BY movies.title
ORDER BY rating ASC
LIMIT 200;


/*  Необходимо вывести 100 фильмов, снятые в указанный период (c 1993 по 1997 год)
    с максимальной оценкой пользоватлей (женского пола) */
SELECT
  movies.title,
  AVG(rating) AS rating
FROM ratings
  INNER JOIN movies ON ratings.movie_id = movies.id
  INNER JOIN users ON ratings.user_id = users.id
WHERE users.gender = 'F' AND (date_part('year', movies.release_date) BETWEEN 1993 AND 1997)
GROUP BY movies.title
ORDER BY rating DESC
LIMIT 100;