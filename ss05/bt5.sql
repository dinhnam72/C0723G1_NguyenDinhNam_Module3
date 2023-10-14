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
student_name VARCHAR(100) NOT NULL,
class_name VARCHAR(100) NOT NULL,
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
INSERT INTO category(name_category)
VALUES ('Tự nhiên'),
('Xã Hội'),
('Truyện'),
('Tiểu Thuyết'),
('Khác');

INSERT INTO authors(name_authors)
VALUES ('Nguyễn Thái Học'),
('Trần Mình Hoàng'),
('Dương Trung Quốc'),
('Lê Văn Hiến'),
('Hà Văn Minh');

INSERT INTO books(id_category,id_author,title,page_size)
VALUES (1,1,'Toán',45),
(2,2,'Văn',34),
(2,3,'Sử',56),
(2,4,'Địa',76),
(1,5,'Hóa',32);

INSERT INTO students(student_name,class_name,birthday)
VALUES ('Nguyễn Văn A','C0822G1','1999-12-12'),
('Nguyễn Văn B','C0822G1','1999-12-13'),
('Nguyễn Văn C','C0822G1','1999-12-14'),
('Nguyễn Văn D','C0922G1','1999-12-15'),
('Nguyễn Văn E','C1022G1','1999-12-16');
INSERT INTO borrows(id_book,id_student,borrow_date,return_date)
VALUES (1,1,'2022-12-12','2022-12-13'),
(2,2,'2022-12-12','2022-12-15'),
(3,3,'2022-12-12','2022-12-15'),
(4,4,'2022-12-15','2022-12-12'),
(5,1,'2022-12-13','2022-12-15'),
(5,1,'2022-12-14','2022-12-14'),
(4,3,'2022-12-15','2022-12-29'),
(3,3,'2022-12-8','2022-12-14'),
(2,1,'2022-12-6','2022-12-30');


-- Tao index cho cột  title của bảng books
 CREATE  UNIQUE INDEX index_title ON books(title); 
 
 

--  Tạo 1 view để lấy ra danh sách các quyển sách đã được mượn, có hiển thị thêm cột số lần đã được mượn
CREATE VIEW books_view AS
SELECT bk.title,COUNT(b.id_book) so_luong
FROM books bk
JOIN borrows b ON bk.id_book = b.id_book
GROUP BY b.id_book;

-- Viết 1 stored procedure thêm mới book trong database với tham số kiểu IN
DELIMITER //
CREATE PROCEDURE procedure_books (add_id_category INT,add_id_author INT,add_title VARCHAR(200),add_page_size INT)
 BEGIN
 INSERT INTO books(id_category,id_author,index_title,page_size)
 VALUES (add_id_category,add_id_author,add_title,add_page_size);
 END //
DELIMITER ;

CALL procedure_books(3,2,'SV',72);




