<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="mainContents" value="${requestScope.mainContents}"/>

<aside id="main-aside" class="forward-to-top">
<c:choose>
    <c:when test="${mainContents == 'board-view-detail' || mainContents == 'board-view-list' || mainContents == 'board-create'}">
    <h2 style="font-weight: bold;">
        Board<BR>Management
    </h2>
    <hr>
    <ul class="nav nav-pills nav-stacked nav-pills-stacked-example">
        <li role="presentation">
            <a href="${path}/board/create">Write on a Blog</a>
        </li>
        <li role="presentation">
            <a href="${path}/board/view/list">My Writing List</a>
        </li>
        <li role="presentation">
            <a href="#">.beta</a>
        </li>
    </ul>
    </c:when>

    <c:when test="${mainContents == 'user-info'}">
        <h2 style="font-weight: bold;">
            My Page
        </h2>
        <hr>
        <ul class="nav nav-pills nav-stacked nav-pills-stacked-example">
            <li role="presentation">
                <a href="${path}/user/information">My Information</a>
            </li>
            <li role="presentation">
                <a href="#">.beta</a>
            </li>
            <li role="presentation">
                <a href="#">.beta</a>
            </li>
        </ul>
    </c:when>

</c:choose>

</aside>


<script>
    function popUpAside() {
        document.querySelector('#main-aside').classList.toggle('forward-to-top');
    }

</script>