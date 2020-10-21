<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <%--meta data--%>
    <meta charset="UTF-8">
    <meta name="keyword" content="github, blog">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">

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

<header id="main-header" class="dot-key">
    <a href="${path}/" id="header-left">
        <img src="${path}/img/Xasquatch.png"/>
        <h1 id="main-header-logo"></h1>
    </a>
    <div id="header-right">
        <button type="button" id="mobile-hamburger" class="btn btn-danger" onclick="popUpAside();">
            <script>
                window.onload = function () {
                    if (!document.querySelector('#main-aside') || document.querySelector('#main-aside').innerText === '')
                        document.querySelector('#mobile-hamburger').style.display = 'none';
                }
            </script>
            <span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span>
        </button>
<%--TODO:세션에따라 표시--%>
        <button type="button" class="btn btn-danger" onclick="if(confirm('로그아웃하시겠습니까?') === true)location.href='${path}/user/log-out'">
            <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
        </button>
        <button type="button" class="btn btn-danger header-menu-btn" onclick="location.href='${path}/board/view/list'">
            <span class="glyphicon glyphicon-comment" aria-hidden="true"></span>
        </button>
        <button type="button" class="btn btn-danger header-menu-btn" onclick="location.href='${path}/user/information'">
            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
        </button>


    </div>
</header>
<script>
    window.addEventListener('DOMContentLoaded', function(){

        textScript.insertText('#main-header-logo', 'My Blog', 20);
    });

    var mainHeader = document.querySelector('#main-header');

    // TOP padding값을 주는 것으로 sticky 구현
    window.addEventListener('scroll', function () {
        if (mainHeader.style.marginTop < window.pageYOffset) {
            mainHeader.style.position='fixed';
            mainHeader.style.top=0;
            mainHeader.style.zIndex=2000;

        }else{
            mainHeader.style.position='static';
            mainHeader.style.top='';

        }
    });



</script>