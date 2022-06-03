<%--
  Created by IntelliJ IDEA.
  User: sonvu
  Date: 02/06/2022
  Time: 2:54 CH
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row justify-content-around">
        <form method="post" class="col-md-6 bg-light p-3 my-3" id="edit${users.id}">
            <h1 class="text-center text-uppercase h3">Sửa thông tin nhân viên</h1>
            <input type="hidden" name="action" value="edit">
            <input type="hidden" name="id">
            <div class="form-group">
                <label for="username" >Tên tài khoản</label>
                <span type="text" name="username" id="username" class="form-control" required pattern="^\w+$">${users.username}</span>
            </div>
            <div class="form-group">
                <label for="password" >Mật khẩu</label>
                <input type="text" name="password" id="password" class="form-control" value="${users.password}" required pattern="^\w+$">
            </div>
            <div class="form-group">
                <label for="name">Tên hiển thị</label>
                <input type="text" name="name" id="name" class="form-control" value="${users.name}">
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" name="email" id="email" class="form-control" value="${users.email}">
            </div>
            <input type="hidden" name="status" value="${users.status}">
            <input type="submit" value="Sửa" class="btn-primary btn-block btn">
        </form>
    </div>
</div>

</body>
</html>
