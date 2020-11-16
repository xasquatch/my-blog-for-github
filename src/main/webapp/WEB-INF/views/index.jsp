<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="mainContents" value="${requestScope.mainContents}"/>

<jsp:include page="include/header.jsp"/>

<c:choose>
    <c:when test="${mainContents == 'login'}">
        <jsp:include page="contents/login.jsp"/>

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

        <c:when test="${mainContents.contains('board-')}">
            <jsp:include page="contents/board/${mainContents}.jsp"/>
        </c:when>

        <c:when test="${mainContents.contains('user-')}">
            <jsp:include page="contents/user-info/${mainContents}.jsp"/>
        </c:when>

        <c:when test="${mainContents == 'repository-list'}">
            <jsp:include page="contents/repository/${mainContents}.jsp"/>
        </c:when>

        <c:when test="${mainContents == 'repository-create'}">
            <jsp:include page="contents/repository/${mainContents}.jsp"/>
        </c:when>

        <c:when test="${mainContents == 'repository-view'}">
            <jsp:include page="contents/repository/${mainContents}.jsp"/>
        </c:when>
    </c:choose>

</section>


<jsp:include page="include/footer.jsp"/>