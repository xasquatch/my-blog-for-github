<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <%--meta data--%>
    <meta charset="UTF-8">
    <meta name="keyword" content="github, blog">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <%--custom css --%>
    <link rel="stylesheet" href="${path}/css/style.css">
    <link rel="stylesheet" href="${path}/css/reset.css">
    <link rel="stylesheet" href="${path}/css/board-style.css">
    <%--END: custom css --%>

    <link rel="stylesheet" href="${path}/webjars/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/webjars/bootstrap/3.3.5/css/bootstrap-theme.min.css">
    <script src="${path}/webjars/jquery/1.11.1/jquery.min.js"></script>
    <script src="${path}/webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <title>my blog for github</title>
</head>
<body>

<header id="main-header">
    <a href="${path}/" id="header-left">
        <img src="${path}/img/Xasquatch.png"/>
        <h1 id="test">My Blog</h1>
    </a>
    <div id="header-right">
        <div>
            <button type="button" class="btn btn-lg btn-danger" onclick="location.href='${path}/board/view'">
                <span class="glyphicon glyphicon-comment" aria-hidden="true"></span>
            </button>
            <button type="button" class="btn btn-lg btn-danger" onclick="location.href='${path}/user/information'">
                <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
            </button>
        </div>

    </div>
</header>
