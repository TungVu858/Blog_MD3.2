<%--
  Created by IntelliJ IDEA.
  User: Windows 10
  Date: 6/2/2022
  Time: 3:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1></h1>
<form method="post">
    <c:if test="${name != null}">
        <h5> Tên tài khoản </h5>
        <span class="form-control" type="text" name="name">${name}</span><br>
        <h5>Title</h5>
        <input type="hidden" name="userId" value="${userId}">
        <input type="text" name="title"><br>
        <h5>Description</h5>
        <input type="text" name="description"><br>

        <h5>Content</h5>
        <input type="text" name="content"><br>

        <select name="status"><br>
            <option value="0"> Public </option>
            <option value="1"> Private </option>
        </select>
        <button >Create</button>
    </c:if>
</form>

</body>
</html>
