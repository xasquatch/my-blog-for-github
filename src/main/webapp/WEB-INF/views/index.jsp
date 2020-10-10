<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="mainContents" value="${requestScope.mainContents}"/>
<jsp:include page="include/header.jsp"/>

<c:choose>
    <c:when test="${mainContents == 'home'}">
        <jsp:include page="contents/home.jsp"/>

    </c:when>


</c:choose>

<jsp:include page="include/footer.jsp"/>