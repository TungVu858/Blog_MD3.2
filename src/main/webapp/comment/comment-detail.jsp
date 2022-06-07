<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/6/2022
  Time: 4:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!-- Latest compiled and minified CSS -->
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
    <form class="col-md-6 bg-light p-3 my-3" id="myForm">
            <div class="form-group">
                <label for="postId">Tiêu đề</label>
                <span name="postId" id="postId" class="form-control">${title}</span>
            </div>
        <c:forEach items="${comment}" var="c">
                <label for="userId">Người gửi</label>
                <span name="userId" id="userId" class="form-control">${c.userId.name}: ${c.content}</span>
<%--                <span class="form-control" name="content" id="content">${c.content}</span>--%>
        </c:forEach>
    </form>
</div>
</body>
<%--<script>--%>
<%--    $(document).ready(function () {--%>
<%--        $('#content').summernote();--%>

<%--        // copy the html-text from summernote to the hidden textarea--%>
<%--        // and let the browser submit it--%>
<%--        $('#myForm').submit(function () {--%>
<%--            $('textarea[name=content]').val($('#content').summernote('code'));--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>
</html>