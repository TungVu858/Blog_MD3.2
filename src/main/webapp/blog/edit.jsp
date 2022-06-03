<%--
  Created by IntelliJ IDEA.
  User: Windows 10
  Date: 6/2/2022
  Time: 8:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

<body>
<c:if test="">

</c:if>
<form method="post"><h5> Tên tài khoản </h5>
    <span class="form-control" type="text" name="name">${name}</span><br>
    <input type="hidden" name="userId" value="${userId}">
    <input type="hidden" name="id" value="${post.id}">
    <h5>Title</h5>
    <input type="text" name="title" value="${post.title}"><br>
    <h5>Description</h5>
    <input type="text" name="description" value="${post.description}"><br>
    <h5>Content</h5>
    <input type="text" name="content" value="${post.content}"><br>


    <select name="status"><br>
        <option value="0"> Public </option>
        <option value="1"> Private </option>
    </select>
    <button>Edit</button>
</form>


</body>
</html>
