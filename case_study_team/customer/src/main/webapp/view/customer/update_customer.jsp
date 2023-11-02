<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/26/2023
  Time: 10:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Update_Customer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" href="customer.css">
</head>
<body>
<div class="main">
    <div class="container">
        <div class="row mt-5">
            <div class="col-lg-3 col-12 left ">
                <div class="accordion accordion-flush" id="accordionFlushExample">
                    <div class="accordion-item">
                        <img src="8391901.jpg" style="width: 100%">
                        <h2 class="accordion-header" id="flush-headingOne">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#flush-collapseOne" aria-expanded="false"
                                    aria-controls="flush-collapseOne" style="font-weight: bold">
                                ${customer.name}
                            </button>
                        </h2>
                        <div id="flush-collapseOne" class="accordion-collapse collapse "
                             aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                            <div class="accordion-body ">
                                <a href="/customer"
                                   class="list-group-item list-group-item-action mb-3 btn btn-warning">Thông
                                    tin cá nhân</a>
                                <a href="/customer?action=update&id=${customer.id}"
                                   class="list-group-item list-group-item-action mb-3  btn btn-warning">Chỉnh
                                    sửa thông tin</a>

                                <a href="#" class="list-group-item list-group-item-action mb-3  btn btn-warning">Lịch
                                    sử
                                    booking</a>
                                <a href="#"
                                   class="list-group-item list-group-item-action mb-3 btn btn-outline-warning text-danger">Xóa
                                    tài khoản</a>
                                <a href="#"
                                   class="list-group-item list-group-item-action btn btn-outline-warning text-danger">Đăng
                                    xuất</a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-lg-9 col-12 right row  " id="right">
                <div class="update">
                    <h2 class="mt-3">Sửa đổi thông tin </h2>
                </div>
                <form action="/customer?action=update" method="post">
                    <div class="mb-5 row">
                        <label for="name" class="col-sm-2 col-form-label">Họ và tên</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="name" name="name" value="${customer.name}" required>
                        </div>
                        <div class="col-sm-2"></div>
                        <div class="col-sm-10 text-danger">
                            <span><small>${errorName}</small></span>
                        </div>
                    </div>

                    <div class="mb-5 row">
                        <label for="birthday" class="col-sm-2 col-form-label">Ngày sinh</label>
                        <div class="col-sm-10">
                            <input type="date" class="form-control" id="birthday" name="birthday" value="${customer.birthday}" required>
                        </div>
                    </div>

                    <div class="mb-5 row">
                        <label for="telephone" class="col-sm-2 col-form-label">Số điện thoại</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="telephone" name="telephone" value="${customer.telephone}"
                                   required>
                        </div>
                        <div class="col-sm-2"></div>
                        <div class="col-sm-10 text-danger">
                            <span><small>${errorTelephone}</small></span>
                        </div>
                    </div>
                    <div class="mb-5 row">
                        <label for="email" class="col-sm-2 col-form-label">Email</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="email" name="email" value="${customer.email}" required>
                        </div>
                        <div class="col-sm-2"></div>
                        <div class="col-sm-10 text-danger">
                            <span><small>${errorEmail}</small></span>
                        </div>
                    </div>

                    <div class="mb-5 row">
                        <label for="address" class="col-sm-2 col-form-label">Địa chỉ</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="address" name="address" value="${customer.address}" required>
                        </div>
                    </div>
                    <div class="mb-5 row">
                        <label class="col-sm-2 col-form-label">Giới tính</label>
                        <div class="col-sm-10 " id="radio">
                            <label><input name="gender" value="1" type="radio" checked/> Nam</label>
                            <label><input name="gender" value="0" type="radio"/> Nữ</label>
                        </div>
                    </div>

                    <div class="row" >
                        <div class="col-6">
                            <a href="#" class="btn btn-warning " style="margin-left: 20px">Trang chủ</a>
                        </div>
                        <div class="col-6">
                            <button type="submit" class="btn btn-warning " style="margin-left: 20px">Lưu</button>
                        </div>
                    </div>
                    <input type="hidden" name="id" value="${customer.id}">
<%--                    id account--%>
                    <input type="hidden" name="idAccount" value="1">
<%--                    <input type="hidden" name value="1">--%>
                </form>
            </div>
        </div>

    </div>
</div>

</body>
</html>
