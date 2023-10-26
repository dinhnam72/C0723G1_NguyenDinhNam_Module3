<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/20/2023
  Time: 2:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Thêm Mới</title>
</head>
<body>
<form action="/book?action=create" method="post">
    <label for="title">Tên sách</label><br>
    <input type="text" name="title" id="title" required><br>

    <label for="pageSize">Số trang</label><br>
    <input type="number" name="pageSize" id="pageSize" required><br>

    <label for="author">Tác Giả</label><br>
    <select name="author" id="author">
        <c:forEach items="${author}" var="a">
            <option value="${a.authorId}">${a.authorName}</option>
        </c:forEach>
    </select><br>

    <label for="category">Thể loại</label><br>
    <select name="category" id="category">
        <c:forEach items="${category}" var="c">
            <option value="${c.categoryId}">${c.categoryName}</option>
        </c:forEach>
    </select><br>
    <button type="submit">Thêm</button>
</form>

</body>
</html>
