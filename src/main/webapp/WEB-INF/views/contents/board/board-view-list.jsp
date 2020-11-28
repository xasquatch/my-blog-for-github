<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<section id="myblog-main-section">

</section>


<script>
    window.onload = function () {
        myBoard.recursiveGetBoardList(${memberNo}, 'https://myblog.xasquatch.net/api/members/' + ${memberNo} +'/boards');

    }

</script>