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
    <title>Blog v2.2</title>
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
        <c:if test="${username==null}">
            <a href="/logins">Đăng nhập</a>
            <a href="/registers">Đăng kí</a>
        </c:if>
        <c:if test="${username != null}">
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
                <c:if test="${username != null}">
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
                <c:if test="${username != null && roleId==1}">
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
        <div class="col-12">
            <form method="get">
                <a href="/posts" class="col-3"><h1 style="display: inline">Tất cả bài viết</h1></a>
                <a href="posts?action=searchTime" style="display: inline" class="col-4">Sắp xếp theo bài đăng mới nhất</a>
                <input type="submit" value="search" name="action" style="display: inline; float: right">
                <input type="text" name="title"
                       style="display: inline; float: right; width: 30%" placeholder="Nhập tiêu đề bạn muốn tìm">
            </form>
            <c:if test="${username != null}">
                <table>
                    <tr>
                        <th>Tên người đăng</th>
                        <th>Tiêu đề</th>
                        <th>Mô tả</th>
                        <th>Thời gian</th>
                        <th>Trạng thái</th>
                    </tr>
                    <c:forEach items="${post}" var="p">
                        <tr>
                            <td>${p.user.name}</td>
                            <td><a href="/post-details?id=${p.id}">${p.title} </a></td>
                            <td>${p.description}</td>
                            <td>${p.postDate}</td>
                            <c:if test="${p.status==0}">
                                <td>Công khai</td>
                            </c:if>
                            <c:if test="${p.status==1}">
                                <td>Riêng tư</td>
                            </c:if>
                            <c:if test="${roleId==1 ||p.user.id == userId}">
                                <td>
                                    <a href="/posts?action=edit&id=${p.id}" class="btn btn-primary">Sửa</a>
                                    <a href="/posts?action=delete&id=${p.id}" class="btn btn-danger">Xóa</a></h1>
                                </td>
                            </c:if>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
            <c:if test="${username == null}">
                <table>
                    <tr>
                        <th>Tên người đăng</th>
                        <th>Tiêu đề</th>
                        <th>Mô tả</th>
                        <th>Thời gian</th>
                        <th>Trạng thái</th>
                    </tr>
                    <c:forEach items="${posts}" var="p">
                        <tr>
                            <td>${p.user.name}</td>
                            <td><a href="/post-details?id=${p.id}">${p.title} </a></td>
                            <td>${p.description}</td>
                            <td>${p.postDate}</td>
                            <c:if test="${p.status==0}">
                                <td>Công khai</td>
                            </c:if>
                            <c:if test="${p.status==1}">
                                <td>Riêng tư</td>
                            </c:if>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
        </div>
    </div>
</div>
<%--<script>--%>
<%--    function acceptDelete(id) {--%>
<%--        if (confirm("Bạn có xác nhận khoá tài khoản này không")){--%>
<%--            alert("Khoá thành công")--%>
<%--            document.getElementById("delete" + id).submit();--%>
<%--        }--%>
<%--        else alert("Thất bại")--%>
<%--    }--%>

<%--    function acceptUnlock(id) {--%>
<%--        document.getElementById("unlock" + id).submit();--%>
<%--    }--%>
<%--</script>--%>
</body>
</html>
