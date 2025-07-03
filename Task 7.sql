use data;
CREATE TABLE authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(100)
);

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(200),
    author_id INT,
    published_year INT,
    genre VARCHAR(50),
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

CREATE TABLE loans (
    loan_id INT PRIMARY KEY,
    book_id INT,
    borrower_name VARCHAR(100),
    loan_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

INSERT INTO authors (author_id, author_name) VALUES
(1, 'George Orwell'),
(2, 'J.K. Rowling'),
(3, 'J.R.R. Tolkien');

INSERT INTO books (book_id, title, author_id, published_year, genre) VALUES
(1, '1984', 1, 1949, 'Dystopian'),
(2, 'Harry Potter and the Sorcerer\'s Stone', 2, 1997, 'Fantasy'),
(3, 'The Hobbit', 3, 1937, 'Fantasy'),
(4, 'Animal Farm', 1, 1945, 'Political Satire');

INSERT INTO loans (loan_id, book_id, borrower_name, loan_date, return_date) VALUES
(1, 1, 'Alice Johnson', '2023-01-15', '2023-02-15'),
(2, 2, 'Bob Smith', '2023-01-20', NULL),  -- Currently on loan
(3, 3, 'Charlie Brown', '2023-01-25', '2023-02-25'),
(4, 4, 'Diana Prince', '2023-01-30', '2023-02-05');

use data;

CREATE VIEW AvailableBooks AS
SELECT 
    b.book_id,
    b.title,
    a.author_name,
    b.published_year,
    b.genre
FROM 
    books b
JOIN 
    authors a ON b.author_id = a.author_id
WHERE 
    b.book_id NOT IN (SELECT book_id FROM loans WHERE return_date IS NULL); 
    

select * from availablebooks;


    