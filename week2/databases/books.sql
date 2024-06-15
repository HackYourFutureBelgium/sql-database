/* DROP DATABASE IF EXISTS books*/;
DROP DATABASE IF EXISTS books;

CREATE DATABASE `books` DEFAULT CHARACTER SET utf8mb4;

USE `books`;

CREATE TABLE authors (
    id INTEGER,
    name TEXT NOT NULL,
    country TEXT,
    date_of_birth DATE,
    PRIMARY KEY (id)
);

CREATE TABLE publishers (
    id INTEGER,
    publisher TEXT,
    PRIMARY KEY(id)
);

CREATE TABLE books (
    id INTEGER, 
    isbn TEXT NOT NULL,
    title TEXT, 
    pages INTEGER,
    published_on DATE DEFAULT (CURRENT_DATE),
    publisher_id INTEGER, 
    PRIMARY KEY(id),
    FOREIGN KEY(publisher_id) REFERENCES publishers(id) 
);

CREATE TABLE authored (
    author_id INTEGER,
    book_id INTEGER,
    FOREIGN KEY(author_id) REFERENCES authors(id), 
    FOREIGN KEY(book_id) REFERENCES books(id),      
    PRIMARY KEY (author_id, book_id)
);

CREATE TABLE ratings (
    book_id INTEGER,
    rating INTEGER CHECK (rating > 0 and rating <= 5),
    FOREIGN KEY(book_id) REFERENCES books(id)
);

CREATE TABLE translators (
    id INTEGER,
    name TEXT,
    PRIMARY KEY(id)
);

CREATE TABLE translated (
    translator_id INTEGER,
    book_id INTEGER,
    language TEXT,
    FOREIGN KEY(translator_id) REFERENCES translators(id),
    FOREIGN KEY(book_id) REFERENCES books(id)
);

-- Insert statements for authors
INSERT INTO authors (id, name, country, date_of_birth) VALUES
(1, 'Gabriel Garcia Marquez', 'Colombia', '1927-03-06'),
(2, 'Haruki Murakami', 'Japan', '1949-01-12'),
(3, 'George Orwell', 'United Kingdom', '1903-06-25'),
(4, 'J.K. Rowling', 'United Kingdom', '1965-07-31'),
(5, 'J.R.R. Tolkien', 'United Kingdom', '1892-01-03'),
(6, 'F. Scott Fitzgerald', 'United States', '1896-09-24'),
(7, 'Herman Melville', 'United States', '1819-08-01'),
(8, 'Jane Austen', 'United Kingdom', '1775-12-16'),
(9, 'Leo Tolstoy', 'Russia', '1828-09-09'),
(10, 'Mark Twain', 'United States', '1835-11-30'),
(11, 'Fyodor Dostoevsky', 'Russia', '1821-11-11'),
(12, 'Charles Dickens', 'United Kingdom', '1812-02-07'),
(13, 'Ernest Hemingway', 'United States', '1899-07-21'),
(14, 'James Joyce', 'Ireland', '1882-02-02'),
(15, 'Franz Kafka', 'Czech Republic', '1883-07-03');

-- Insert statements for publishers
INSERT INTO publishers (id, publisher) VALUES
(1, 'HarperCollins'),
(2, 'Shinchosha'),
(3, 'Secker & Warburg'),
(4, 'Bloomsbury'),
(5, 'Allen & Unwin'),
(6, 'Charles Scribner\'s Sons'),
(7, 'Richard Bentley'),
(8, 'T. Egerton'),
(9, 'The Russian Messenger'),
(10, 'Chatto & Windus'),
(11, 'The Russian Messenger'),
(12, 'Chapman & Hall'),
(13, 'Charles Scribner\'s Sons'),
(14, 'Sylvia Beach'),
(15, 'Martin Secker');

INSERT INTO books (id, isbn, title, pages, published_on, publisher_id) VALUES
(1, '9780060883287', 'One Hundred Years of Solitude', 417, '1967-05-30', 1),
(2, '9784101001547', 'Norwegian Wood', 296, '1987-09-04', 2),
(3, '9780451524935', '1984', 328, '1949-06-08', 3),
(4, '9780747532743', 'Harry Potter', 223, '1997-06-26', 4),
(5, '9780261103573', 'The Hobbit', 310, '1937-09-21', 5),
(6, '9780743273565', 'The Great Gatsby', 180, '1925-04-10', 6),
(7, '9780553213119', 'Moby Dick', 635, '1851-11-14', 7),
(8, '9781503290563', 'Pride and Prejudice', 279, '1813-01-28', 8),
(9, '9780199536061', 'War and Peace', 1225, '1869-01-01', 9),
(10, '9780486415864', 'Adventures of Huckleberry Finn', 366, '1884-12-10', 10),
(11, '9780140449136', 'Crime and Punishment', 671, '1866-01-01', 11),
(12, '9780141439563', 'Great Expectations', 505, '1860-01-01', 12),
(13, '9780684830490', 'The Old Man and The Sea', 127, '1952-09-01', 13),
(14, '9780141182803', 'Ulysses', 732, '1922-02-02', 14),
(15, '9780805209990', 'The Metamorphosis', 201, '1915-01-01', 15);

INSERT INTO authored (author_id, book_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15);

-- Insert ratings
INSERT INTO ratings (book_id, rating) VALUES
(1, 5),
(2, 4),
(3, 5),
(4, 5),
(5, 5),
(6, 4),
(7, 3),
(8, 4),
(9, 5),
(10, 3),
(11, 5),
(12, 4),
(13, 3),
(14, 5),
(15, 4);

-- Insert translators
INSERT INTO translators (id, name) VALUES
(1, 'Gregory Rabassa'),
(2, 'Jay Rubin'),
(3, 'Michael Glenny'),
(4, 'Edith Grossman'),
(5, 'Philip Gabriel'),
(6, 'Constance Garnett'),
(7, 'Peter Constantine'),
(8, 'Richard Pevear'),
(9, 'Louise Maude'),
(10, 'David McDuff'),
(11, 'Alan Myers'),
(12, 'Michael Henry Heim'),
(13, 'William Weaver'),
(14, 'Helen Lowe-Porter'),
(15, 'Ronald Meyer');

-- Insert translations (associative table for translators and books)
INSERT INTO translated (translator_id, book_id, language) VALUES
(1, 1, 'English'),
(2, 2, 'English'),
(3, 3, 'Russian'),
(4, 4, 'Spanish'),
(5, 5, 'English'),
(6, 6, 'Russian'),
(7, 7, 'French'),
(8, 8, 'German'),
(9, 9, 'English'),
(10, 10, 'Swedish'),
(11, 11, 'Finnish'),
(12, 12, 'Italian'),
(13, 13, 'Spanish'),
(14, 14, 'German'),
(15, 15, 'Japanese');
