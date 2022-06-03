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

    <style>
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            padding-top: 100px; /* Location of the box */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0, 0, 0); /* Fallback color */
            background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
        }

        /* Modal Content */
        .modal-content {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }

        /* The Close Button */
        .close {
            color: #aaaaaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: #000;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>
<body id="navbar-toggle-button">

    <form method="get">
        <a href="/users"><h1 style="display: inline">Quản lý nhân viên </h1></a>
        <input type="submit" value="search" name="action" style="display: inline; float: right">
        <input type="text" name="name"
               style="display: inline; float: right; width: 30%">
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
                        <a class="btn btn-danger" onclick="acceptDelete(${i.id})" style="color: white">Khóa tài
                            khoản</a>
                    </form>
                </c:if>
                <c:if test="${i.status==2}">
                    <form action="/users" id="unlock${i.id}" style="display: inline">
                        <input type="hidden" name="action" value="unlock">
                        <input type="hidden" name="id" value="${i.id}">
                        <a class="btn btn-primary" onclick="acceptUnlock(${i.id})" style="color: white">Mở khóa tài khoản</a>
                    </form>
                </c:if>
            </td>
        </tr>
    </c:forEach>
</table>
<script>
    function acceptDelete(id) {
        if (confirm("Bạn có xác nhận khoá tài khoản này không")){
            alert("Khoá thành công")
            document.getElementById("delete" + id).submit();
        }
        else alert("Thất bại")
    }

    function acceptUnlock(id) {
        document.getElementById("unlock" + id).submit();
    }
</script>
</body>
</html>
