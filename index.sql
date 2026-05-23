2. Index in SQL
What is an Index?

Imagine 10 lakh records in a table.

Without index:
DB checks every row one by one.

This is called:

Full Table Scan

Slow.

With index:
DB jumps directly to data.

Like:

book index
phone contacts
YouTube search optimization

Instagram users table:
users
------
id
username
email
phone

CREATE INDEX idx_email
ON users(email);

CREATE TABLE students1 (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

create index sts_email on students1(email) ;
select * from students1 where email='pradeep42@example.com';
INSERT INTO students1 (name, email) VALUES
('Aarav Sharma', 'aarav1@example.com'),
('Bhavya Reddy', 'bhavya2@example.com'),
('Charan Kumar', 'charan3@example.com'),
('Deepika Rao', 'deepika4@example.com'),
('Esha Patel', 'esha5@example.com'),
('Farhan Ali', 'farhan6@example.com'),
('Gopal Verma', 'gopal7@example.com'),
('Harini Devi', 'harini8@example.com'),
('Ishaan Mehta', 'ishaan9@example.com'),
('Jyothi Singh', 'jyothi10@example.com'),
('Karan Das', 'karan11@example.com'),
('Lavanya Sai', 'lavanya12@example.com'),
('Manoj Kumar', 'manoj13@example.com'),
('Nisha Rani', 'nisha14@example.com'),
('Om Prakash', 'om15@example.com'),
('Pooja Sharma', 'pooja16@example.com'),
('Qadir Hussain', 'qadir17@example.com'),
('Rakesh Gupta', 'rakesh18@example.com'),
('Sneha Reddy', 'sneha19@example.com'),
('Tarun Kumar', 'tarun20@example.com'),
('Usha Devi', 'usha21@example.com'),
('Vikram Rao', 'vikram22@example.com'),
('Waseem Khan', 'waseem23@example.com'),
('Xavier Paul', 'xavier24@example.com'),
('Yamini Sharma', 'yamini25@example.com'),
('Zoya Ali', 'zoya26@example.com'),
('Anil Kumar', 'anil27@example.com'),
('Bindu Priya', 'bindu28@example.com'),
('Chetan Reddy', 'chetan29@example.com'),
('Divya Sri', 'divya30@example.com'),
('Eswar Rao', 'eswar31@example.com'),
('Fathima Noor', 'fathima32@example.com'),
('Ganesh Babu', 'ganesh33@example.com'),
('Hema Latha', 'hema34@example.com'),
('Indu Priya', 'indu35@example.com'),
('Jagan Mohan', 'jagan36@example.com'),
('Kavya Rani', 'kavya37@example.com'),
('Lokesh Sai', 'lokesh38@example.com'),
('Madhavi Devi', 'madhavi39@example.com'),
('Naveen Kumar', 'naveen40@example.com'),
('Oviya Raj', 'oviya41@example.com'),
('Pradeep Kumar', 'pradeep42@example.com'),
('Queen Mary', 'queen43@example.com'),
('Rohit Sharma', 'rohit44@example.com'),
('Sravani Reddy', 'sravani45@example.com'),
('Teja Varma', 'teja46@example.com'),
('Uma Mahesh', 'uma47@example.com'),
('Varsha Patel', 'varsha48@example.com'),
('Wasim Akram', 'wasim49@example.com'),
('Yash Kumar', 'yash50@example.com');