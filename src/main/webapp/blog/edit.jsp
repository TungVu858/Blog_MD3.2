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
    <title>Blog v2.2</title>
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
<body>
<div class="nav-fixed">
    <nav class="logo">
        <!--        đăng nhập, đăng kí-->
        <c:if test="${name==null}">
            <a href="/logins">Đăng nhập</a>
            <a href="/registers">Đăng kí</a>
        </c:if>
        <c:if test="${name != null}">
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
                <c:if test="${name != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="/logins?action=view">${name}</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="/posts" id="navbarDropdown" role="button"
                           data-toggle="dropdown" aria-expanded="false">
                            Bài đăng
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="/posts?action=create">Tạo mới bài viết</a>
                            <a class="dropdown-item" href="/posts?action=search$&id=${p.user.id}">Các bài viết của mình</a>
                        </div>
                    </li>
                </c:if>
                <c:if test="${name != null && roleId==1}">
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
        <div class="row justify-content-around">
            <form method="post" class="col-md-6 bg-light p-3 my-3" id="myForm">
                <h1 class="text-center text-uppercase h3">Sửa bài viết</h1>
                <input type="hidden" name="action" value="edit">
                <input type="hidden" name="id">
                <input type="hidden" name="userId" value="${roleId}">
                <span class="form-control" type="text" name="name">${name}</span><br>
                <div class="form-group">
                    <label for="title">Tiêu đề</label>
                    <input type="text" name="title" id="title" class="form-control" value="${post.title}">
                </div>
                <div class="form-group">
                    <label for="description">Description</label>
                    <input type="text" name="description" id="description" class="form-control" value="${post.description}">
                </div>
                <label for="content">Nội dung</label>
                <div id="content">${post.content}</div>
                <textarea name="content" style="display:none;"></textarea>
                <select name="status"><br>
                    <option value="0"> Công khai</option>
                    <option value="1"> Riêng tư</option>
                </select>
                <c:if test="${userId != null && (roleId==1 || post.user.id==userId)}">
                    <input type="submit"/>
                </c:if>
            </form>
        </div>
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
