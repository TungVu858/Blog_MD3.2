<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Blog v2.2</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div id="wrapper">
    <div class="container">
        <div class="row justify-content-around">
            <form method="post" class="col-md-6 bg-light p-3 my-3">
                <h1 class="text-center text-uppercase h3">Thông tin tài khoản</h1>
                <input type="hidden" name="action" value="create">
                <input type="hidden" name="id">
                <div class="form-group">
                    <label for="username">Tên tài khoản</label>
                    <span  name="username" id="username" class="form-control" >${users.username}</span>
                </div>
                <div class="form-group">
                    <label for="password">Mật khẩu</label>
                    <input type="password" name="password" id="password" class="form-control" value="${users.password}" required pattern="^\w+$">
                </div>
                <div class="form-group">
                    <label for="name">Tên hiển thị</label>
                    <input type="text" name="name" id="name" class="form-control" value="${users.name}">
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" name="email" id="email" class="form-control" value="${email}">
                </div>
                <input type="hidden" name="roleId" value="${roleId}">
                <input type="hidden" name="status" value="1">
                <br>
                <input type="submit" value="Sửa" class="btn-primary btn-block btn" href="/">
            </form>
        </div>
    </div>
</div>
</body>
</html>