<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<section>
    <h2>${boardInfo.title}</h2>
    <kbd>${boardInfo.created_date}</kbd>
    <kbd>${boardInfo.created_ip}</kbd>
    <HR>
    <div id="board-view-contents">
        ${boardInfo.contents}

    </div>
</section>