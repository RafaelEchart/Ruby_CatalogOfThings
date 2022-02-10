CREATE DATABASE IF NOT EXISTS ruby_catalog_of_things;

CREATE TABLE IF NOT EXISTS genre (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS label (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS author (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS book (
  id SERIAL PRIMARY KEY,
  publisher VARCHAR(255) NOT NULL,
  cover_state VARCHAR(255) NOT NULL,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL DEFAULT FALSE,
  genre_id INT REFERENCES genre(id),
  label_id INT REFERENCES label(id),
  author_id INT REFERENCES author(id)
);

CREATE TABLE IF NOT EXISTS musicalbum (
  id SERIAL PRIMARY KEY,
  on_spotify BOOLEAN NOT NULL,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL DEFAULT FALSE,
  genre_id INT REFERENCES genre(id),
  label_id INT REFERENCES label(id),
  author_id INT REFERENCES author(id)
);

CREATE TABLE IF NOT EXISTS game (
  id SERIAL PRIMARY KEY,
  multiplayer 
  last_played DATE NOT NULL,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL DEFAULT FALSE,
  genre_id INT REFERENCES genre(id),
  label_id INT REFERENCES label(id),
  author_id INT REFERENCES author(id)
);
