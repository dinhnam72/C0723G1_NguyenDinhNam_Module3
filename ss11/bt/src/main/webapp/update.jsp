<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/20/2023
  Time: 10:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Sửa</title>
</head>
<body>
<form action="/book?action=update" method="post">
    <input type="hidden" name="id" value="${book.id}" >

    <label for="title">Tên sách</label><br>
    <input type="text" name="title" id="title" value="${book.title}" required><br>

    <label for="pageSize">Số trang</label><br>
    <input type="number" name="pageSize" id="pageSize" value="${book.pageSize}" required><br>

    <label for="author">Tác giả</label><br>
    <input type="text" name="author" id="author" value="${book.author}" required><br>

    <label for="category">Thể loại</label><br>
    <input type="text" name="category" id="category" value="${book.category}" required><br>
    <button type="submit">Sửa</button>
</form>
</body>
</html>
