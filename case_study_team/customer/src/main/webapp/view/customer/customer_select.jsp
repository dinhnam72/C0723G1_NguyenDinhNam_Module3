<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/26/2023
  Time: 5:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
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

                                <a href="" class="list-group-item list-group-item-action mb-3  btn btn-warning">Lịch
                                    sử
                                    booking</a>
                                <button type="button"  class="list-group-item list-group-item-action mb-3 btn btn-outline-warning text-danger">Xóa
                                    tài khoản</button>
                                <a href="#"
                                   class="list-group-item list-group-item-action btn btn-outline-warning text-danger">Đăng
                                    xuất</a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-lg-9 col-12 right row  " id="right">
                <div>
                    <h2 class="mb-5 mt-3" style="">Thông tin quý khách ${customer.name}</h2>
                </div>

                <div class="border row">
                    <div class="col-lg-3 col-md-5 col-12 mb-3">
                        <input class="form-control-plaintext " disabled value="Họ và tên:"/>
                    </div>
                    <div class="col-lg-9 col-md-7 col-12 mb-3">
                        <input class="form-control-plaintext" disabled value="${customer.name}"/>
                    </div>
                </div>
                <div class="border row">
                    <div class="col-lg-3 col-md-5 col-12 mb-3">
                        <input class="form-control-plaintext " disabled value="Ngày sinh:"/>
                    </div>
                    <div class="col-lg-9 col-md-7 col-12 mb-3">
                        <input type="date" class="form-control-plaintext" disabled value="${customer.birthday}"/>
                    </div>
                </div>
                <div class="border row">
                    <div class="col-lg-3 col-md-5 col-12 mb-3">
                        <input class="form-control-plaintext" disabled value="Số điện thoại:"/>
                    </div>
                    <div class="col-lg-9 col-md-7 col-12 mb-3">
                        <input class="form-control-plaintext" disabled value="${customer.telephone}"/>
                    </div>
                </div>
                <div class="border row">
                    <div class="col-lg-3 col-md-5 col-12 mb-3">
                        <input class="form-control-plaintext" disabled value="Email:"/>
                    </div>
                    <div class="col-lg-9 col-md-7 col-12 mb-3">
                        <input class="form-control-plaintext" disabled value="${customer.email}"/>
                    </div>
                </div>
                <div class="border row">
                    <div class="col-lg-3 col-md-5 col-12 mb-3">
                        <input style="opacity: 1" class="form-control-plaintext" disabled value="Địa chỉ:"/>
                    </div>
                    <div class="col-lg-9 col-md-7 col-12 mb-3">
                        <input style="opacity: 1" class="form-control-plaintext" disabled value="${customer.address}"/>
                    </div>
                </div>
                <div class="border row">
                    <div class="col-lg-3 col-md-5 col-12 mb-3">
                        <input style="opacity: 1" class="form-control-plaintext" disabled value="Giới tính:"/>
                    </div>
                    <div class="col-lg-9 col-md-7 col-12 mb-3">
                        <c:if test="${customer.gender==0}">
                            <input style="opacity: 1" class="form-control-plaintext" disabled value="Nữ"/>
                        </c:if>
                        <c:if test="${customer.gender==1}">
                            <input style="opacity: 1" class="form-control-plaintext" disabled value="Nam"/>
                        </c:if>
                    </div>
                </div>
                <div class="row mt-3" >
                    <div class="col-6">
                        <a href="#" class="btn btn-warning"  style="margin-left: 20px">Trang chủ</a>
                    </div>
                    <div class="col-6">
                        <a href="/customer?action=update&id=${customer.id}" type="submit" class="btn btn-warning "
                           style="margin-left: 20px">Chỉnh sửa</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>
