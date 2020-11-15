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

        <c:when test="${mainContents == 'board-view-list'}">
            <jsp:include page="contents/board/board-view-list.jsp"/>
        </c:when>

        <c:when test="${mainContents == 'board-view-detail'}">
            <jsp:include page="contents/board/board-view-detail.jsp"/>
        </c:when>

        <c:when test="${mainContents == 'change-email'}">
            <jsp:include page="contents/user-info/user-change-email.jsp"/>
        </c:when>

        <c:when test="${mainContents == 'check-email'}">
            <jsp:include page="contents/user-info/user-check-email.jsp"/>
        </c:when>

        <c:when test="${mainContents == 'check-password'}">
            <jsp:include page="contents/user-info/user-check-password.jsp"/>
        </c:when>

        <c:when test="${mainContents == 'user-info'}">
            <jsp:include page="contents/user-info/user-information.jsp"/>
        </c:when>

        <c:when test="${mainContents == 'user-api'}">
            <jsp:include page="contents/user-info/user-api.jsp"/>
        </c:when>

        <c:when test="${mainContents == 'user-log-out'}">
            <jsp:include page="contents/user-info/user-log-out.jsp"/>
        </c:when>

        <c:when test="${mainContents == 'repository-list'}">
            <jsp:include page="contents/repository/repository-list.jsp"/>
        </c:when>

        <c:when test="${mainContents == 'repository-create'}">
            <jsp:include page="contents/repository/repository-create.jsp"/>
        </c:when>

        <c:when test="${mainContents == 'repository-view'}">
            <jsp:include page="contents/repository/repository-view.jsp"/>
        </c:when>
    </c:choose>

</section>


<jsp:include page="include/footer.jsp"/>