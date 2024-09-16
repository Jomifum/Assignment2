CREATE DATABASE movie_db;

USE `jose.fuentes10`;

CREATE TABLE movie_ratings (
    movie VARCHAR(255),
    Carlos INT,
    Daniel INT,
    Alex INT,
    Ronald INT,
    Aidde INT
);

INSERT INTO movie_ratings (movie, Carlos, Daniel, Alex, Ronald, Aidde)
VALUES 
('Dead pool and Wolverine', 5, 4, 3, 5, 4),
('Inside Out 2', 4, 5, 5, 4, 5),
('Exorcist Believer', 4, 4, 3, 4, 3),
('The Super Mario Bros. Movie', 3, 4, 5, 3, 4),
('Abigail', 3, 4, 2, 3, 3),
('Mean Girls (2024)', 2, 3, 4, 4, 3);

SELECT * FROM movie_ratings;

SHOW TABLES;
