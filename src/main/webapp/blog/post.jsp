<%--
  Created by IntelliJ IDEA.
  User: Windows 10
  Date: 6/2/2022
  Time: 2:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="get">
    <a href="/posts"><h1 style="display: inline">Quản lý nhân viên </h1></a>
    <input type="submit" value="search" name="action" style="display: inline; float: right">
    <input type="text" name="title"
           style="display: inline; float: right; width: 30%">
</form>
<c:forEach items="${post}" var="p">
    <h1>${p.id},${p.userId.username},${p.title},${p.description},
    ${p.content},${p.postDate},${p.status}
        <a href="/posts?action=edit&id=${p.id}">Edit</a>
        <a href="/posts?action=delete&id=${p.id}">Delete</a></h1>
</c:forEach>

</body>
</html>
