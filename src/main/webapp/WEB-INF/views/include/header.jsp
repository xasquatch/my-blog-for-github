<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <%--custom css --%>
    <link rel="stylesheet" href="${path}/css/style.css">
    <link rel="stylesheet" href="${path}/css/reset.css">
    <link rel="stylesheet" href="${path}/css/board-style.css">
    <%--END: custom css --%>

    <link rel="stylesheet" href="${path}/webjars/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/webjars/bootstrap/3.3.5/css/bootstrap-theme.min.css">
    <script src="${path}/webjars/jquery/1.11.1/jquery.min.js"></script>
    <script src="${path}/webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <%--custom script--%>
    <script src="${path}/js/script.js"></script>
    <%--END: custom script--%>

    <title>my blog for github</title>
</head>
<body>

<header id="main-header">
    <a href="${path}/" id="header-left">
        <img src="${path}/img/Xasquatch.png"/>
        <h1>My Blog</h1>
    </a>
    <div id="header-right">
        <div class="dropdown">
            <button class="btn btn-lg btn-default dropdown-toggle" type="button" id="board-font"
                    data-toggle="dropdown" aria-expanded="true">
                <span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span>
            </button>
            <ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="board-font">
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
            </ul>
        </div>
        <div>
            <button type="button" class="btn btn-lg btn-primary" onclick="location.href='${path}/board'">
                <span class="glyphicon glyphicon-comment" aria-hidden="true"></span>
            </button>
        </div>

    </div>
</header>
