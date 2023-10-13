CREATE DATABASE library;
USE library;
CREATE TABLE category(
	id_category INT PRIMARY KEY AUTO_INCREMENT,
    name_category VARCHAR(200) NOT NULL
);
CREATE TABLE authors(
id_author INT PRIMARY KEY AUTO_INCREMENT,
name_authors VARCHAR(200) NOT NULL
);

CREATE TABLE books(
id_book INT PRIMARY KEY AUTO_INCREMENT,
id_category INT,
id_author INT,
title VARCHAR(200),
page_size INT,
FOREIGN KEY (id_category) REFERENCES category(id_category),
FOREIGN KEY (id_author) REFERENCES authors(id_author)
);

CREATE TABLE students(
id_student INT PRIMARY KEY AUTO_INCREMENT,
class_name VARCHAR(100) NOT NULL,
student_name VARCHAR(100) NOT NULL,
birthday DATE 
);

CREATE TABLE borrows(
id_borrow INT PRIMARY KEY AUTO_INCREMENT,
id_book INT,
id_student INT,
borrow_date DATE,
return_date DATE,
FOREIGN KEY (id_book) REFERENCES books(id_book),
FOREIGN KEY (id_student) REFERENCES students(id_student)
);
