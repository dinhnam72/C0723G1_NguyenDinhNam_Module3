<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/20/2023
  Time: 10:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Tìm Kiếm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
          crossorigin="anonymous">
</head>
<body>
<c:choose>
    <c:when test="${books.size()!=0}">
        <table class="table table-light table-hover" style="width: 100%; text-align: center">
            <thead>
            <tr >
                <th>Stt</th>
                <th>Tên Sách</th>
                <th>Số Trang</th>
                <th>Tác Giả</th>
                <th>Thể Loại</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${books}" var="b" varStatus="look">
                <tr>
                    <td>${look.count}</td>
                    <td>${b.title}</td>
                    <td>${b.pageSize}</td>
                    <td>${b.author.authorName}</td>
                    <td>${b.category.categoryName}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

    </c:when>
    <c:otherwise>
        <h2 class="text-warning"> Không có sách nào được tìm thấy</h2>
    </c:otherwise>
</c:choose>
</body>
</html>
