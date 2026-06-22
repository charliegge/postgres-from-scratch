-- Database: movie_data

-- DROP DATABASE IF EXISTS movie_data;

CREATE DATABASE movie_data
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;


-- 1. Drop existing tables if they exist (drop child tables first to avoid constraint errors)
DROP TABLE IF EXISTS directors;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS movie_revenues;
DROP TABLE IF EXISTS movies_actors;


--Create 5 tables

-- 2. Create the directors table

CREATE TABLE directors (

	director_id SERIAL PRIMARY KEY,
	first_name VARCHAR(30), 
	last_name VARCHAR(30)NOT NULL,
	date_of_birth DATE,
	nationality VARCHAR (20)
);

--Create actor table


CREATE TABLE actors (

    actor_id SERIAL PRIMARY KEY,
	first_name VARCHAR(30), 
	last_name VARCHAR(30),
	gender CHAR(1),
	date_of_birth DATE
	
);


--Create the movies table (with a foreign key)

CREATE TABLE movies(

	movie_id SERIAL PRIMARY KEY,
	movie_name VARCHAR(50)NOT NULL,
	movie_length INT,
	movie_lang VARCHAR(20),
	release_date DATE,
	age_certificate VARCHAR(5),
	director_id INT REFERENCES directors (director_id)

);


--Create the movie_revenues table with foreign key

CREATE TABLE movie_revenues(

	revenue_id SERIAL PRIMARY KEY,
	movie_id INT REFERENCES movies (movie_id),
	domestic_takings NUMERIC(6,2),
	international_takings NUMERIC (6,2)

);

--Create the movies_actors table junction table)

CREATE TABLE movies_actors(

	movie_id INT REFERENCES movies (movie_id),
	actor_id INT REFERENCES actors (actor_id),
	PRIMARY KEY (movie_id,actor_id)
);


