<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/6/2022
  Time: 5:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- include libraries(jQuery, bootstrap) -->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

    <!-- include summernote css/js-->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>
</head>
<body>
<div class="row justify-content-around">
    <form method="post" class="col-md-6 bg-light p-3 my-3" id="myForm">
        <c:forEach items="${comment}" var="c">
        <input type="hidden" name="action" value="create">
        <input type="hidden" name="id">
        <div class="form-group">
            <label for="postId">Tiêu đề</label>
            <span name="postId" id="postId" class="form-control">
                <a href="/comments?action=search&id=${c.postId.id}">${c.postId.title}</a>
            </span>
            </c:forEach>
    </form>
</div>
</body>
</html>
