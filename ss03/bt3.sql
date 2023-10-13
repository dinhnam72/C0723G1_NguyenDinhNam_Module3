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
PRIMARY KEY(id_book,id_student),
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

-- Lấy ra toàn bộ sách có trong thư viện, cùng với tên thể loại và tác giả
SELECT b.id_book,b.title,c.name_category,a.name_authors
FROM books b
JOIN category c ON c.id_category=b.id_category
JOIN authors a ON a.id_author = b.id_author;

--  Lấy ra danh sách các học viên đã từng mượn sách và sắp xếp danh sách theo tên từ a->z
SELECT s.student_name, books.title
FROM students s
JOIN borrows b ON s.id_student=b.id_student
JOIN books ON books.id_book = b.id_book
ORDER BY s.student_name;

-- Lấy ra  2 quyển sách được mượn nhiều nhất
SELECT 
 title,COUNT(b.id_book) AS so_luong
FROM books
JOIN borrows b ON books.id_book = b.id_book
GROUP BY b.id_book
ORDER BY so_luong DESC
LIMIT 2;