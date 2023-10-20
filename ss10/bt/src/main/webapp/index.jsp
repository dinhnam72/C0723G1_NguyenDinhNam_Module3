<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Hoc Vien</title>
</head>
<body>
<c:choose>
    <c:when test="${studentList.size()!=0}">
        <table border="1px solid" >
            <tr>
                <th>Stt</th>
                <th>Tên học viên</th>
                <th>Giới tính</th>
                <th>Điểm</th>
                <th>Xếp loại</th>
            </tr>
            <c:forEach items="${studentList}" var="s" varStatus="look">
                <tr>
                    <td>${look.count}</td>
                    <td>${s.name}</td>
                    <c:if test="${s.gender==true}">
                        <td>Nam</td>
                    </c:if>
                    <c:if test="${s.gender==false}">
                        <td>Nữ</td>
                    </c:if>
                    <td>${s.point}</td>
                    <c:choose>
                        <c:when test="${s.point>=90}">
                            <td>Giỏi</td>
                        </c:when>
                        <c:when test="${s.point>=80}">
                            <td>Khá</td>
                        </c:when>
                        <c:when test="${s.point>=60}">
                            <td>Trung Bình</td>
                        </c:when>
                        <c:otherwise>
                            <td>Yếu</td>
                        </c:otherwise>
                    </c:choose>
                </tr>
            </c:forEach>

        </table>
    </c:when>
    <c:otherwise>
        <h3>Danh sach rỗng</h3>
    </c:otherwise>
</c:choose>
</body>
</html>