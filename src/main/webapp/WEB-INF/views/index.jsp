<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="mainContents" value="${requestScope.mainContents}"/>
<jsp:include page="include/header.jsp"/>

<c:choose>
    <c:when test="${mainContents == 'home'}">
        <jsp:include page="contents/home.jsp"/>

    </c:when>

    <c:when test="${mainContents == 'board'}">
        <jsp:include page="contents/boarder-create.jsp"/>

    </c:when>

</c:choose>

<c:choose>
    <c:when test="${mainContents == 'board-view'}">
        <section class="wrap-grid">
            <jsp:include page="include/aside.jsp"/>
            <jsp:include page="contents-aside/board-view.jsp"/>
        </section>
    </c:when>

    <c:when test="${mainContents == 'user-info'}">
        <section class="wrap-grid">
            <jsp:include page="include/aside.jsp"/>
            <jsp:include page="contents-aside/user-information.jsp"/>
        </section>
    </c:when>

</c:choose>

<jsp:include page="include/footer.jsp"/>