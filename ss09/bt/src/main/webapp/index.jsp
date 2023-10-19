<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>

<form action="/login?action=create" method="post">
    <label for="user">Username</label><br>
    <input name="userName" type="text" id="user"><br>
    <label for="pass">Passwork</label><br>
    <input name="pass" type="password" id="pass"><br>
    <button type="submit">Đăng nhập</button>
</form>
    <h2 style="color: red">${error}</h2>
</body>
</html>