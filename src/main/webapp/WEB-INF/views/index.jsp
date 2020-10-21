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

<section class="wrap-grid">
    <jsp:include page="include/aside.jsp"/>

    <c:choose>
        <c:when test="${mainContents == 'board-create'}">
            <jsp:include page="contents/board/board-create.jsp"/>
        </c:when>

        <c:when test="${mainContents == 'board-view-list'}">
            <jsp:include page="contents/board/board-view-list.jsp"/>
        </c:when>

        <c:when test="${mainContents == 'board-view-detail'}">
            <jsp:include page="contents/board/board-view-detail.jsp"/>
        </c:when>

        <c:when test="${mainContents == 'user-info'}">
            <jsp:include page="contents/user-info/user-information.jsp"/>
        </c:when>

        <c:when test="${mainContents == 'user-dashBoard'}">
            <jsp:include page="contents/user-info/user-dashBoard.jsp"/>
        </c:when>

        <c:when test="${mainContents == 'user-log-out'}">
            <jsp:include page="contents/user-info/user-log-out.jsp"/>
        </c:when>

    </c:choose>

</section>


<jsp:include page="include/footer.jsp"/>