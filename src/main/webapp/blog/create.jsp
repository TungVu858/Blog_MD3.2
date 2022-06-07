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
    <title>Bài viết mới</title>
    <!-- Latest compiled and minified CSS -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- include libraries(jQuery, bootstrap) -->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

    <!-- include summernote css/js-->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body id="navbar-toggle-button">
<div class="container" style="margin-top: 0">
<div class="" style="margin: 10px">
    <a href="/" class="btn btn-primary">Trang chủ</a>
</div>
<div class="row">
<div class="col-12">
    <form method="post" class="col-12 " id="myForm">
        <h1 class="text-center text-uppercase h3">Tạo bài viết mới</h1>
        <input type="hidden" name="action" value="create">
        <input type="hidden" name="id">
        <input type="hidden" name="userId" value="${userId}">
        <span class="form-control" type="text" name="name">${name}</span><br>
        <div class="form-group">
            <label for="title">Tiêu đề</label>
            <input type="text" name="title" id="title" class="form-control">
        </div>
        <div class="form-group">
            <label for="description">Mô tả</label>
            <input type="text" name="description" id="description" class="form-control">
        </div>
        <label for="content">Nội dung</label>
        <div id="content"></div>
        <textarea name="content" style="display:none;"></textarea>
        <select name="status"><br>
            <option value="0"> Công khai</option>
            <option value="1"> Riêng tư</option>
        </select>
        <button class="btn btn-success">Gửi</button>
    </form>
</div>
</div>
</div>
</body>
<script>
    $(document).ready(function () {
        $('#content').summernote();

        $('#myForm').submit(function () {
            $('textarea[name=content]').val($('#content').summernote('code'));
        });
    });
</script>
</html>
