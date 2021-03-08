<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="mainContents" value="${requestScope.mainContents}"/>

<jsp:include page="include/header.jsp"/>

<c:choose>
    <c:when test="${mainContents == 'members'}">
        <jsp:include page="contents/members.jsp"/>

    </c:when>
    <c:when test="${mainContents == 'main'}">
        <jsp:include page="contents/main.jsp"/>

    </c:when>

</c:choose>

<section class="wrap-grid">
    <jsp:include page="include/aside.jsp"/>

    <c:choose>
        <c:when test="${mainContents == 'board-create' || mainContents == 'board-modify'}">
            <jsp:include page="contents/board/board-frame.jsp"/>
        </c:when>

        <c:when test="${mainContents.indexOf('board-')==0}">
            <jsp:include page="contents/board/${mainContents}.jsp"/>
        </c:when>

        <c:when test="${mainContents.indexOf('user-')==0}">
            <jsp:include page="contents/user-info/${mainContents}.jsp"/>
        </c:when>

        <c:when test="${mainContents.indexOf('resource-')==0}">
            <jsp:include page="contents/resource/${mainContents}.jsp"/>
        </c:when>

        <c:when test="${mainContents.indexOf('document-')==0}">
            <jsp:include page="contents/document/${mainContents}.jsp"/>
        </c:when>

        <c:when test="${mainContents.indexOf('management-')==0}">
            <jsp:include page="contents/management/${mainContents}.jsp"/>
        </c:when>

    </c:choose>

</section>


<jsp:include page="include/footer.jsp"/>