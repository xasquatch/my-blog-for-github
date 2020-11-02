<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="mainContents" value="${requestScope.mainContents}"/>

<aside id="main-aside" class="forward-to-top dot-key">
    <c:if test="${mainContents != 'home' && mainContents != 'user-log-out' }">
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
        </ul>
        <BR>
        <BR>
        <h2 style="font-weight: bold;">
            My Page
        </h2>
        <hr>
        <ul class="nav nav-pills nav-stacked nav-pills-stacked-example">
            <li role="presentation">
                <a href="${path}/user/information">Information</a>
            </li>
            <li role="presentation">
                <a href="${path}/user/dashBoard">DashBoard</a>
            </li>
        </ul>
        <BR>
        <BR>
        <h2 style="font-weight: bold;">
            My Repository
        </h2>
        <hr>
        <ul class="nav nav-pills nav-stacked nav-pills-stacked-example">
            <li role="presentation">
                <a href="${path}/repository/list">Repository</a>
            </li>
        </ul>
    </c:if>
</aside>


<script>

    var mainAside = document.querySelector('#main-aside');

    function popUpAside() {
        mainAside.classList.toggle('forward-to-top');
        mainAside.style.marginTop = 0;
    }

    // css sticky 속성이 부모태그가 그리드인 상태에서는 적용되지가 않아서
    // TOP padding값을 주는 것으로 sticky 구현
    window.addEventListener('scroll', function () {
        if (mainAside.classList.contains('forward-to-top')) {
            mainAside.style.marginTop = window.pageYOffset;
        }
    });


</script>