<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/20/2023
  Time: 2:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm Mới</title>
</head>
<body>
<form action="/book?action=create" method="post">

    <label for="id">Mã</label><br>
    <input type="number" name="id" id="id" required><br>

    <label for="title">Tên sách</label><br>
    <input type="text" name="title" id="title" required><br>

    <label for="pageSize">Số trang</label><br>
    <input type="number" name="pageSize" id="pageSize" required><br>

    <label for="author">Tác giả</label><br>
    <input type="text" name="author" id="author" required><br>

    <label for="category">Thể loại</label><br>
    <input type="text" name="category" id="category" required><br>
    <button type="submit">Thêm</button>
</form>

</body>
</html>
