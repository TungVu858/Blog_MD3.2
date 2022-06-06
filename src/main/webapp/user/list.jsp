<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: sonvu
  Date: 02/06/2022
  Time: 2:03 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!-- Latest compiled and minified CSS -->
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="assets/css/main.css"/>
    <noscript>
        <link rel="stylesheet" href="assets/css/noscript.css"/>
    </noscript>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/style.css">

</head>
<body id="navbar-toggle-button">
<!--Nav-->
<div class="nav-fixed">
    <nav class="logo">

        <!--        đăng nhập, đăng kí-->
        <c:if test="${name==null}">
            <a href="/logins">Đăng nhập</a>
            <a href="/registers">Đăng kí</a>
        </c:if>
        <c:if test="${name != null}">
            <a href="/logins?action=logout">Đăng xuất</a>
        </c:if>
    </nav>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="/">Trang chủ</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/logins?action=view">${name}</a>
                    </li>
                <c:if test="${name != null}">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="/posts" id="navbarDropdown" role="button"
                           data-toggle="dropdown" aria-expanded="false">
                            Bài đăng
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="/posts?action=create">Tạo mới bài viết</a>
                            <a class="dropdown-item" href="/posts?action=search$&id=${p.user.id}">Các bài viết của
                                mình</a>
                        </div>
                    </li>
                </c:if>
                <c:if test="${name != null && roleId==1}">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button"
                           data-toggle="dropdown" aria-expanded="false">
                            Quản lý
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
                            <a class="dropdown-item" href="/users">Quản lý tài khoản</a>
                            <a class="dropdown-item" href="/posts">Quản lý bài viết</a>
                        </div>
                    </li>
                </c:if>
            </ul>

        </div>
    </nav>
</div>
<div class="container">
    <div class="row">
        <!--    main  -->
        <div class="col-9">
            <form method="get">
                <a href="/users"><h1 style="display: inline">Quản lý tài khoản </h1></a>
                <input type="submit" value="search" name="action" style="display: inline; float: right">
                <input type="text" name="name"
                       style="display: inline; float: right; width: 30%" placeholder="Nhập tên tài khoản muốn tìm">
            </form>
            <table>
                <tr>
                    <th> Tên Tài khoản</th>
                    <th> Mật Khẩu</th>
                    <th> Tên</th>
                    <th> Email</th>
                    <th> Trạng Thái</th>
                    <th></th>
                </tr>
                <c:forEach items="${users}" var="i">
                    <tr>
                        <td>${i.username}</td>
                        <td>${i.password}</td>
                        <td> ${i.name}</td>
                        <td>${i.email}</td>
                        <td>
                            <c:if test="${i.status==1}">
                                <span style="color: green">Đang hoạt động</span>
                            </c:if>
                            <c:if test="${i.status==2}">
                                <span style="color: red">Bị khóa</span>
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${i.status==1}">
                                <a href="/users?action=edit&id=${i.id}" class="btn btn-secondary">Sửa</a>
                            </c:if>
                            <c:if test="${i.status==1}">
                                <form action="/users" id="delete${i.id}" style="display: inline">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="id" value="${i.id}">
                                    <a class="btn btn-danger" onclick="acceptDelete(${i.id})" style="color: white">Khóa
                                        tài
                                        khoản</a>
                                </form>
                            </c:if>
                            <c:if test="${i.status==2}">
                                <form action="/users" id="unlock${i.id}" style="display: inline">
                                    <input type="hidden" name="action" value="unlock">
                                    <input type="hidden" name="id" value="${i.id}">
                                    <a class="btn btn-primary" onclick="acceptUnlock(${i.id})" style="color: white">Mở
                                        khóa tài khoản</a>
                                </form>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
<script>
    function acceptDelete(id) {
        if (confirm("Bạn có xác nhận khoá tài khoản này không")) {
            alert("Khoá thành công")
            document.getElementById("delete" + id).submit();
        } else alert("Thất bại")
    }

    function acceptUnlock(id) {
        document.getElementById("unlock" + id).submit();
    }
</script>
</body>
</html>
