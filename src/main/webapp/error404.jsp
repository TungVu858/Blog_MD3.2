<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Blog v2.2</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


    <link rel="stylesheet" href="/assets/css/style.css"  type="text/css">
    <link rel="shortcut icon" type="image/png" href="/favicon.png">

</head>
<body>
<!--Nav-->
<div class="nav-fixed">
    <nav class="logo">

        <!--        đăng nhập, đăng kí-->
        <c:if test="${username==null}">
            <div style="    margin-right: 2%;
    float: right;
    display: inline-block;">
                <form action="/logins">
                    <button class="btn btn-light">Đăng Nhập</button>
                </form>
            </div>
            <div style="    margin-right: 10px;
    display: inline-block;
    float: right;">
                <form action="/registers">
                    <button class="btn btn-primary">Đăng Ký</button>
                </form>
            </div>
        </c:if>
        <c:if test="${username != null}">
            <div style="    margin-right: 2%;float: right; display: inline-block;">

                <a  href="/logins?action=logout"><button class="btn btn-success">Đăng Xuất</button></a>
            </div>
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
                <li class="nav-item">
                    <a class="nav-link" href="/logins?action=view">${name}</a>
                </li>
                <c:if test="${username != null}">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="/posts" id="navbarDropdown" role="button"
                           data-toggle="dropdown" aria-expanded="false">
                            Bài đăng
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="/posts?action=create">Tạo mới bài viết</a>
                            <a class="dropdown-item" href="/posts?action=search&userId=${userId}">Các bài viết của
                                mình</a>
                        </div>
                    </li>
                </c:if>
                <c:if test="${username!=null && roleId==1}">
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

<%--            thẻ search--%>
            <div style="    display: inline-block;float: right;">
                <form class="form-inline my-2 my-lg-0" method="get" action="posts">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search"
                           name="title"
                    >
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit" name="action"
                    >Search
                    </button>
                </form>
            </div>
        </div>
    </nav>

<%--    main--%>
</div>

<div class="container">
    <div class="row">

        <!--    main  -->
        <div class="col-12">
           <h1 style="text-align: center; font-weight: bold">ERROR 404</h1>


        </div>

        <!--    global chat-->

    </div>


</div>
</div>


</body>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
</html>