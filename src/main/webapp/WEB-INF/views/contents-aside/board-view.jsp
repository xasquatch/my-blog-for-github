<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<section>

    hi board-view
    <button type="button" class="btn btn-lg btn-danger" onclick="location.href='${path}/board/create'">
        <span class="glyphicon glyphicon-comment" aria-hidden="true"></span>
    </button>
</section>