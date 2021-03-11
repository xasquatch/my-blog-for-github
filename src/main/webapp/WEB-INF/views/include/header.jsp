<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="mainContents" value="${requestScope.mainContents}"/>

<html>
<head>
    <%--meta data--%>
    <meta charset="UTF-8">
    <meta name="keyword" content="github, blog">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="xasquatch">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">

    <%--custom css --%>
    <link rel="stylesheet" href="${path}/css/style.css">
    <link rel="stylesheet" href="${path}/css/reset.css">
    <link rel="stylesheet" href="${path}/css/home-style.css">
    <link rel="stylesheet" href="${path}/css/list-style.css">
    <%--END: custom css --%>

    <link rel="stylesheet" href="${path}/webjars/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/webjars/bootstrap/3.3.5/css/bootstrap-theme.min.css">
    <script src="${path}/webjars/jquery/1.11.1/jquery.min.js"></script>
    <script src="${path}/webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <title>My Blog By Xasquatch</title>
</head>
<body>

<header id="main-header" class="dot-key">
    <a href="${path}/" id="header-left">
        <img src="${path}/img/Xasquatch.png"/>
        <h1 id="main-header-logo"></h1>
    </a>
    <div id="header-center" style="color: red;">

    </div>
    <div id="header-right">
        <c:if test="${mainContents != 'members' && sessionMember.no != null && sessionMember.no != ''
            && !(mainContents.contains('check')||mainContents.contains('find'))}">
            <button style="font-size: 20px;" type="button" id="mobile-hamburger" class="dot-key btn btn-link-red" onclick="popUpAside();">
                <B>More</B>
            </button>
        </c:if>
        <c:choose>
            <c:when test="${sessionMember.no != null && sessionMember.no != ''}">
                <button type="button" class="btn btn-link-red" style="font-size: 20px; color: black;"
                        onclick="if(confirm('로그아웃하시겠습니까?') === true)window.location.href='${path}/members/log-out'">
                    <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                </button>
            </c:when>
            <c:when test="${mainContents != 'members' && sessionMember.no == null && sessionMember.no != ''}">
                <button type="button" class="btn btn-link-red" style="font-size: 20px; color: black;"
                        onclick="window.location.href = '${path}/members'">
                    Members
                </button>
            </c:when>
        </c:choose>

    </div>
</header>