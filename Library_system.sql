
use library_system;

CREATE TABLE Books( 
  book_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(50), 
  author VARCHAR(50), 
  genre VARCHAR(30), 
  published_year DATE,
  is_available BOOLEAN DEFAULT TRUE
);

INSERT INTO Books (title, author, genre, published_year, is_available) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', '1925-04-10', TRUE),
('1984', 'George Orwell', 'Dystopian', '1949-01-01', TRUE),
('To Kill a Mockingbird', 'Harper Lee', 'Classic', '1960-06-11', TRUE);

CREATE TABLE Members ( 
  member_id INT PRIMARY KEY AUTO_INCREMENT, 
  name VARCHAR(50), 
  email VARCHAR(50) UNIQUE, 
  phone_number VARCHAR(15), 
  join_date DATE DEFAULT (CURRENT_DATE)
);
-- Insert member records into the Members table
INSERT INTO Members ( name, email, phone_number) VALUES
('Alen King', 'alenking@example.com', '1234567890'),
('Alece Hofman', 'alecehofman@example.com', '9876543210');
 

CREATE TABLE Librarians(
  librarian_id INT PRIMARY KEY AUTO_INCREMENT, 
  name VARCHAR(50), 
  email VARCHAR(50) UNIQUE, 
  phone_number VARCHAR(15), 
  hire_date DATE DEFAULT (CURRENT_DATE)
);

-- Insert librarian records into the Librarians table
INSERT INTO Librarians (name, email, phone_number) VALUES 
('Nail Horn', 'nail@example.com', '4567891230'), 
('Garden McGraw', 'garden@example.com', '7894561230');


CREATE TABLE Borrowing (
  loan_id INT PRIMARY KEY AUTO_INCREMENT,
  book_id INT,
  member_id INT,
  borrow_date DATE DEFAULT (CURRENT_DATE),
  return_date DATE,
  librarian_id INT,
  FOREIGN KEY (book_id) REFERENCES Books(book_id),
  FOREIGN KEY (member_id) REFERENCES Members(member_id),
  FOREIGN KEY (librarian_id) REFERENCES Librarians(librarian_id)
);

#Basic functionaties includes:
#Add books, members, and borrowing transactions.
#Track books that are available or borrowed.
#Track loan history for members.

#Q1: Borrow a book (insert into borrwing table and update availability)
#inserting new record into borrowing table

insert into Borrowing (book_id, member_id, librarian_id, borrow_date)
VALUES (1, 1, 1, CURRENT_DATE);

#updating books table to mark its unavailability 

update books 
set is_available = False
where book_id = 1;

#Q2: Return a book: 
#lets update borrowing table
update Borrowing
set return_date = current_date
where loan_id = 1;

#lets update the book table for its availability

update books 
set is_available = True 
where book_id =1;

#Q3 lets check how many books are available

select * from books 
where is_available = True;

#Q4 lets view loan member history 

select m.name, b.title, br.borrow_date, br.return_date
from borrowing br
join members m on m.member_id = br.member_id
join books b on b.book_id = br.book_id
#filter the results to show borrowing member history 
where m.member_id = 1;

#Q5 list all the over_due books
select m.name, b.title, br.borrow_date
from borrowing br 
join members m on m.member_id = br.member_id 
join books b on b.book_id = br.book_id
#filter books that haven't been returned
where return_date is null
#suppose you cant keep a book for more than 14 days
and br.borrow_date < current_date - interval 14 day;

#Q6 list books by specific authors
select title, genre, published_year
from books where author = 'Harper Lee';

#Q7 find the books published after certain year 
select title, published_year from books 
where published_year > 2000-01-01;

#q8 count total books in the libarary

select count(book_id) as total_books
from books;

#Q9 view members who borrowed specific books 
select m.name, br.borrow_date, br.return_date
from borrowing br
join members m on m.member_id = br.member_id
join books b on b.book_id = br.book_id 
where b.title = '1984';

#Q10 find borrowing histroy of a specific member 

select b.title, br.borrow_date, br.return_date 
from borrowing br
join books b on b.book_id = br.book_id 
where br.member_id = 2;


#Q11 List all the book that are available of specific genre
select title, genre 
from books where genre = 'Fiction' and 
is_available = True;

#Q12 Calculate the total number of books borrowed by each members 
select m.name, count(br.loan_id) as total_books_borrowed 
from borrowing br
join members m on br.member_id = m.member_id 
group by m.name;

#Q13 List All Overdue Books Not Yet Returned
select m.name, b.title, br.borrow_date 
from borrowing br 
join members m on m.member_id = br.member_id
join books b on b.book_id = br.member_id 
where br.return_date is null
and br.borrow_date < (current_date) - interval 20 day;

#Q15  List the Librarians Who Processed the Most Borrowings
select l.name, count(br.loan_id) as total_borrowings
from borrowing br
join librarians l on l.librarian_id = br.librarian_id
group by l.name
order by total_borrowings desc;





