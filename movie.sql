-- Create Movie table
CREATE TABLE Movie (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255),
    release_date DATE,
    description TEXT
);

-- Create Media table
CREATE TABLE Media (
    media_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    type ENUM('Video', 'Image'),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);

-- Create Genre table
CREATE TABLE Genre (
    genre_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255)
);

-- Create Movie_Genre table
CREATE TABLE Movie_Genre (
    movie_id INT,
    genre_id INT,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
    FOREIGN KEY (genre_id) REFERENCES Genre(genre_id)
);

-- Create Review table
CREATE TABLE Review (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    username VARCHAR(255),
    rating DECIMAL(3,1),
    comment TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);

-- Create Artist table
CREATE TABLE Artist (
    artist_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255)
);

-- Create Skill table
CREATE TABLE Skill (
    skill_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255)
);

-- Create Artist_Skill table 
CREATE TABLE Artist_Skill (
    artist_id INT,
    skill_id INT,
    PRIMARY KEY (artist_id, skill_id),
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id),
    FOREIGN KEY (skill_id) REFERENCES Skill(skill_id)
);

-- Create Role table
CREATE TABLE Role (
    role_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255)
);

-- Create Film_Role table
CREATE TABLE Film_Role (
    movie_id INT,
    artist_id INT,
    role_id INT,
    PRIMARY KEY (movie_id, artist_id, role_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id),
    FOREIGN KEY (role_id) REFERENCES Role(role_id)
);

-- Insert sample data into Movie table
INSERT INTO Movie (title, release_date, description) VALUES
('Inception', '2010-07-16', 'A thief who enters the dreams of others to steal secrets from their subconscious.'),
('The Shawshank Redemption', '1994-10-14', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.');

-- Insert sample data into Media table
INSERT INTO Media (movie_id, type) VALUES
(1, 'Video'),
(1, 'Image'),
(2, 'Image');

-- Insert  into Genre table
INSERT INTO Genre (name) VALUES
('Action'),
('Sci-Fi'),
('Drama');

-- Insert  into Movie_Genre table
INSERT INTO Movie_Genre (movie_id, genre_id) VALUES
(1, 1),
(1, 2),
(2, 3);

-- Insert  into Review table
INSERT INTO Review (movie_id, username, rating, comment) VALUES
(1, 'user1', 8.0, 'Good'),
(2, 'user2', 10.0, 'A timeless classic.');

-- Insert  into Artist table
INSERT INTO Artist (name) VALUES
('Vijay'),
('Raj');

-- Insert s into Skill table
INSERT INTO Skill (name) VALUES
('Singing'),
('Dancing');

-- Insert  into Artist_Skill table
INSERT INTO Artist_Skill (artist_id, skill_id) VALUES
(1, 1),
(1, 2),
(2, 1);

-- Insert into Role table
INSERT INTO Role (name) VALUES
('Hero'),
('Villian');

-- Insert  into Film_Role table
INSERT INTO Film_Role (movie_id, artist_id, role_id) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 1, 1);

-- fetch

SELECT * FROM Media WHERE movie_id = 1;

SELECT * FROM Movie;

SELECT g.name 
FROM Genre g
JOIN Movie_Genre mg ON g.genre_id = mg.genre_id
WHERE mg.movie_id = 1;

SELECT * FROM Review WHERE movie_id = 1;

SELECT a.name, r.name AS role
FROM Artist a
JOIN Film_Role fr ON a.artist_id = fr.artist_id
JOIN Role r ON fr.role_id = r.role_id
WHERE fr.movie_id = 1;
