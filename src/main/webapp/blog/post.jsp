

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


</head>
<body id="navbar-toggle-button">

<form method="get">
    <a href="/posts"><h1 style="display: inline">Quản lý nhân viên </h1></a>
    <input type="submit" value="search" name="action" style="display: inline; float: right">
    <input type="text" name="name"
           style="display: inline; float: right; width: 30%">
</form>
<table>
    <tr>
        <th> id</th>
        <th> userId</th>
        <th> title</th>
        <th> description</th>
        <th> content</th>
        <th> date</th>
        <th>status</th>
    </tr>
    <c:forEach items="${post}" var="p">
        <tr>
            <td>${p.id}</td>
            <td>${p.userId.username}</td>
            <td> ${p.title}</td>
            <td>${p.description}</td>
            <td>${p.content}</td>
            <td>${p.postDate}</td>
            <td>${p.status}</td>
            <td>
                    <a href="/posts?action=edit&id=${p.id}" class="btn btn-secondary">Sửa</a>

                <a href="/posts?action=delete&id=${p.id}" class="btn btn-primary">Xóa</a></h1>

<%--                <c:if test="${i.status==1}">--%>
<%--                    <form action="/posts" id="delete${i.id}" style="display: inline">--%>
<%--                        <input type="hidden" name="action" value="delete">--%>
<%--                        <input type="hidden" name="id" value="${i.id}">--%>
<%--                        <a class="btn btn-danger" onclick="acceptDelete(${i.id})" style="color: white">Khóa tài--%>
<%--                            khoản</a>--%>
<%--                    </form>--%>
<%--                </c:if>--%>
<%--                <c:if test="${i.status==2}">--%>
<%--                    <form action="/posts" id="unlock${i.id}" style="display: inline">--%>
<%--                        <input type="hidden" name="action" value="unlock">--%>
<%--                        <input type="hidden" name="id" value="${i.id}">--%>
<%--                        <a class="btn btn-primary" onclick="acceptUnlock(${i.id})" style="color: white">Xóa</a>--%>
<%--                    </form>--%>
<%--                </c:if>--%>
            </td>
        </tr>
    </c:forEach>
</table>
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
