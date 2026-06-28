-- Select the movie_name and release_date of ever movie

SELECT movie_name, release_date FROM movies;


--Select the first and last names of all American directors

SELECT first_name, last_name FROM directors
WHERE nationality = 'American';


--Select all male actors born after the 1st of January 1970

SELECT * FROM actors
WHERE gender ='M'
AND date_of_birth > '1970-01-01';


/*
Select the names of all movies which are over 90 minutes 
long and moive language is Englis
*/

SELECT movie_name FROM movies
WHERE movie_length > 90
AND movie_lang = 'English';
