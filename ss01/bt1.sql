CREATE DATABASE book_management;
USE book_management;
CREATE TABLE books(
id INT PRIMARY KEY AUTO_INCREMENT,
name_book VARCHAR(100) NOT NULL,
page_size INT,
author VARCHAR (100) NOT NULL
);
INSERT INTO books(name_book,page_size,author)
VALUES ('Toán',45,'Nguyễn Thái Học'),
('Văn',34,'Trần Minh Hoàng'),
('Sử',56,'Dương Trung Quốc'),
('Địa',76,'Lê Văn Hiến'),
('Hóa',32,'Hà Văn Minh');


UPDATE books
SET page_size = 50
WHERE name_book='Sử';

DELETE FROM books
WHERE id=5;

DROP TABLE books;

DROP DATABASE book_management;
