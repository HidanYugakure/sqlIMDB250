create database IMDB250
create table Movies (
id INT PRIMARY KEY,
title VARCHAR(255),
year INT,
imdb_rating FLOAT,
duration INT,
director_id INT
);
create table Directors (
id INT PRIMARY KEY,
name VARCHAR(255)
);
create table Actors (
id INT PRIMARY KEY,
name VARCHAR(255)
);
create table Genres (
movie_id INT,
genre VARCHAR(255),
FOREIGN KEY (movie_id) REFERENCES Movies(id)
);
insert into Movies (id, title, year, imdb_rating, duration, director_id) VALUES
(1, 'The Shawshank Redemption', 1994, 9.3, 142, 1),
(2, 'The Godfather', 1972, 9.2, 175, 2),
(3, 'The Godfather Part II', 1974, 9.0, 202, 2),
(4, 'The Dark Knight', 2008, 9.0, 152, 3),
(5, '12 Angry Men', 1957, 9.0, 96, 4),
(6, 'Schindler''s List', 1993, 8.9, 195, 5),
(7, 'The Lord of the Rings: The Return of the King', 2003, 8.9, 201, 6),
(8, 'Pulp Fiction', 1994, 8.9, 154, 7),
(9, 'The Good, the Bad and the Ugly', 1966, 8.8, 161, 8),
(10, 'The Lord of the Rings: The Fellowship of the Ring', 2001, 8.8, 178, 6),
(11, 'Fight Club', 1999, 8.8, 139, 9),
(12, 'Forrest Gump', 1994, 8.8, 142, 10),
(13, 'Inception', 2010, 8.7, 148, 3),
(14, 'The Lord of the Rings: The Two Towers', 2002, 8.7, 179, 6),
(15, 'Star Wars: Episode V - The Empire Strikes Back', 1980, 8.7, 124, 11);

insert into Directors (id, name) VALUES
(1, 'Frank Darabont'),
(2, 'Francis Ford Coppola'),
(3, 'Christopher Nolan'),
(4, 'Sidney Lumet'),
(5, 'Steven Spielberg'),
(6, 'Peter Jackson'),
(7, 'Quentin Tarantino'),
(8, 'Sergio Leone'),
(9, 'David Fincher'),
(10, 'Robert Zemeckis'),
(11, 'Irvin Kershner');
insert into Actors (id, name) VALUES
(1, 'Tim Robbins'),
(2, 'Morgan Freeman'),
(3, 'Marlon Brando'),
(4, 'Al Pacino'),
(5, 'Robert De Niro'),
(6, 'Christian Bale'),
(7, 'Heath Ledger'),
(8, 'Henry Fonda'),
(9, 'Liam Neeson'),
(10, 'Ben Kingsley'),
(11, 'Elijah Wood'),
(12, 'Ian McKellen'),
(13, 'John Travolta'),
(14, 'Uma Thurman'),
(15, 'Clint Eastwood'),
(16, 'Edward Norton'),
(17, 'Brad Pitt'),
(18, 'Tom Hanks'),
(19, 'Leonardo DiCaprio'),
(20, 'Harrison Ford');
insert into Genres (movie_id, genre) VALUES
(1, 'Drama'),
(2, 'Crime'),
(2, 'Drama'),
(3, 'Crime'),
(3, 'Drama'),
(4, 'Action'),
(4, 'Crime'),
(4, 'Drama'),
(5, 'Drama'),
(6, 'Biography'),
(6, 'Drama'),
(6, 'History'),
(7, 'Action'),
(7, 'Adventure'),
(7, 'Drama'),
(8, 'Crime'),
(8, 'Drama'),
(8, 'Thriller'),
(9, 'Western'),
(10, 'Action'),
(10, 'Adventure'),
(10, 'Drama'),
(11, 'Drama'),
(11, 'Thriller'),
(12, 'Drama'),
(12, 'Romance'),
(13, 'Action'),
(13, 'Adventure'),
(13, 'Sci-Fi'),
(14, 'Action'),
(14, 'Adventure'),
(14, 'Drama'),
(15, 'Action'),
(15, 'Adventure'),
(15, 'Fantasy');


----1.query---
select
M.title, 
M.imdb_rating, 
G.genre, 
D.name AS director, 
A.name AS actor 
from 
Movies M
join
Genres G ON M.id = G.movie_id
join 
Directors D ON M.director_id = D.id
join 
Actors A ON M.id = A.id
where 
M.imdb_rating > 6;

----2.query---
select
M.title, 
M.imdb_rating, 
G.genre 
from 
Movies M
join 
Genres G ON M.id = G.movie_id
where 
G.genre LIKE '%a%';
----4.query----
select
M.title, 
M.imdb_rating, 
G.genre, 
D.name AS director, 
A.name AS actor 
from 
Movies M
join 
Genres G ON M.id = G.movie_id
join 
Directors D ON M.director_id = D.id
join
Actors A ON M.id = A.id
where M.imdb_rating > (SELECT AVG(imdb_rating) FROM Movies)
order by M.imdb_rating DESC;



