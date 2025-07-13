DROP TABLE IF EXISTS Ratings;
DROP TABLE IF EXISTS Movies;
DROP TABLE IF EXISTS Users;

CREATE TABLE Users (
	user_id INTEGER PRIMARY KEY,
	name TEXT,
	email TEXT,
	created_at date
);

CREATE TABLE Movies (
	movie_id INTEGER PRIMARY KEY,
	title TEXT,
	genre TEXT,
	release_year INT
);

CREATE TABLE Ratings (
	rating_id INTEGER PRIMARY KEY,
	user_id INTEGER,
	movie_id INTEGER,
	rating INTEGER, --1 to 5
	review TEXT,
	rating_date DATE,
	FOREIGN KEY (user_id) REFERENCES Users(user_id),
	FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);	

INSERT INTO Users (user_id, name, email, created_at) VALUES
(1, 'Alice', 'alice@email.com', '2024-01-01'),
(2, 'Bob', 'bob@email.com', '2024-01-02');

INSERT INTO Movies (movie_id, title, genre, release_year) VALUES
(1, 'The Matrix', 'Sci-Fi', 1999),
(2, 'Inception', 'Sci-Fi', 2010),
(3, 'The Lion King', 'Animation', 1994);

INSERT INTO Ratings (rating_id, user_id, movie_id, rating, review, rating_date) VALUES
(1, 1, 1, 5, 'Amazing action and concept!', '2024-01-03'),
(2, 1, 2, 4, 'Great but a little conusing,', '2024-01-04'),
(3, 2, 3, 5, 'Childhood favorite!', '2024-01-05'),
(4, 2, 1, 3, 'Cool but outdated.', '2024-01-06');

SELECT * FROM Ratings;

SELECT
	u.name,
	ROUND(AVG(r.rating), 2) AS average_rating
FROM Ratings r
JOIN Users u ON r.user_id = u.user_id
GROUP BY u.user_id, u.name;	