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

<div class="container" style="overflow: auto; margin-top: 0">
    <div class="" style="margin: 10px">
        <a href="/" class="btn btn-primary">Trang chủ</a>
    </div>
    <div class="row">
        <!--    main  -->
        <div class="col-12">
            <form method="get">
                <a href="/posts" class="col-3"><h1 style="display: inline">Tất cả bài viết</h1></a>
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
                        <th></th>
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
                            <td>
                                <c:if test="${roleId==1 ||p.user.id == userId}">
                                    <a href="/post-details?id=${p.id}" class="btn btn-primary">Sửa</a>
                                    <a href="/posts?action=delete&id=${p.id}" class="btn btn-danger">Xóa</a></h1>
                                </c:if>
                                <a href="/comments?action=create&id=${p.id}" class="btn btn-secondary">Phản hồi</a>
                                <a href="/comments?action=search&id=${p.id}" class="btn btn-secondary">Xem phản hồi</a>
                                <c:if test="${comments ==0 && p.id==idFind}">
                                    <span style="color: red">${mess}</span>
                                </c:if>
                            </td>
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
</body>
</html>
