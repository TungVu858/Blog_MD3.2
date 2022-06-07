<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/6/2022
  Time: 3:28 PM
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
    <form method="post" class="col-md-6 bg-light p-3 my-3" id="myForm">
        <input type="hidden" name="action" value="create">
        <input type="hidden" name="id">
        <input type="hidden" name="userId" value="${userId}">
        <input type="hidden" name="postId" value="${postId}">
        <input type="hidden" name="status" value="1">
        <label for="content">Nội dung</label>
        <div id="content">Bạn nghĩ gì</div>
        <textarea name="content" style="display:none;"></textarea>
        <button class="btn btn-success">Gửi</button>
    </form>
</div>
</body>
<script>
    $(document).ready(function () {
        $('#content').summernote();

        // copy the html-text from summernote to the hidden textarea
        // and let the browser submit it
        $('#myForm').submit(function () {
            $('textarea[name=content]').val($('#content').summernote('code'));
        });
    });
</script>
</html>
