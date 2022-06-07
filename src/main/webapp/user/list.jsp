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
    <link rel="stylesheet" href="/assets/css/style.css"  type="text/css">

</head>
<body id="navbar-toggle-button">


<div class="container" style="margin-top: 0">
    <div class="" style="margin: 10px">
        <a href="/" class="btn btn-primary">Trang chủ</a>
    </div>
    <div class="row">
        <!--    main  -->
        <div class="col-12">
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
