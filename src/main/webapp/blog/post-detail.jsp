<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/6/2022
  Time: 5:16 PM
  To change this template use File | Settings | File Templates.
--%>
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

<div class="container" style="overflow: auto; margin-top: 0">
    <div class="" style="margin: 10px">
        <a href="/" class="btn btn-primary">Trang chủ</a>
    </div>
    <div class="col-12">
        <form method="post"  id="myForm"
              action="posts?action=edit&id=${post.id}">
            <c:if test="${username != null && (roleId==1 || post.user.id==userId)}">
                <h1 class="text-center text-uppercase h3">Sửa bài viết</h1>
            </c:if>
            <input type="hidden" name="action" value="edit">
            <input type="hidden" name="id">
            <input type="hidden" name="userId" value="${roleId}">
            <span class="form-control" type="text" name="name">${post.user.name}</span><br>
            <div class="form-group">
                <c:if test="${username == null}">
                    <label for="title">Tiêu đề</label>
                    <span type="text" name="title" id="title" class="form-control">${post.title}</span>
                </c:if>
                <c:if test="${username != null && post.user.id!=userId &&roleId!=1}">
                    <label for="title">Tiêu đề</label>
                    <span type="text" name="title" id="title" class="form-control">${post.title}</span>
                </c:if>
                <c:if test="${username != null && (roleId==1 || post.user.id==userId)}">
                    <label for="title">Tiêu đề</label>
                    <input type="text" name="title" id="title" class="form-control" value="${post.title}">
                </c:if>
            </div>
            <div class="form-group">
                <c:if test="${username == null}">
                    <label for="description">Mô tả bài viết</label>
                    <span type="text" name="description" id="description"
                          class="form-control">${post.description}</span>
                </c:if>
                <c:if test="${username != null && post.user.id !=userId &&roleId!=1}">
                    <label for="description">Mô tả bài viết</label>
                    <span type="text" name="description" id="description"
                          class="form-control">${post.description}</span>
                </c:if>
                <c:if test="${username != null && (roleId==1 || post.user.id==userId)}">
                    <label for="description">Mô tả bài viết</label>
                    <input type="text" name="description" id="description" class="form-control"
                           value="${post.description}">
                </c:if>
            </div>
            <c:if test="${username == null}">
                <label for="content">Nội dung</label>
                <span class="form-control" type="text" name="content">${post.content}</span>
            </c:if>
            <c:if test="${username != null && post.user.id !=userId &&roleId!=1}">

                <label for="content">Nội dung</label>
                <span class="form-control" type="text" name="content">${post.content}</span>
            </c:if>
            <c:if test="${username != null && (roleId==1 || post.user.id==userId)}">
                <label for="content">Nội dung</label>
                <div id="content">${post.content}</div>
                <textarea name="content" style="    display:none;"></textarea>
            </c:if>
            <c:if test="${username != null && (roleId==1 || post.user.id==userId)}">
                <select name="status"><br>
                    <option value="0"> Công khai</option>
                    <option value="1"> Riêng tư</option>
                </select>
                <input type="submit" class="btn btn-primary" value="Sửa"/>
                <a href="/posts?action=delete&id=${p.id}" class="btn btn-danger">Xóa</a></h1>
            </c:if>
            <c:if test="${username != null}">
                <a href="/comments?action=create&id=${post.id}" class="btn btn-light">Phản hồi</a>
                <a href="/comments?action=search&id=${post.id}" class="btn btn-light">Xem phản hồi</a>
                <c:if test="${comments ==null && p.id==idFind}">
                    <span>${mess}</span>
                </c:if>
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
