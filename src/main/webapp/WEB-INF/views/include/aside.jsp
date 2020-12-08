<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="mainContents" value="${requestScope.mainContents}"/>

<aside id="main-aside" class="forward-to-top dot-key">
    <c:if test="${mainContents != 'login' && mainContents != 'main' && sessionMember != null && !(mainContents.contains('check')||mainContents.contains('find'))}">
        <h2 style="font-weight: bold;">
            블로그 관리
        </h2>
        <hr>
        <ul class="nav nav-pills nav-stacked nav-pills-stacked-example">
            <li role="presentation">
                <a href="${path}/board/${sessionMember.no}/create">
                    <img style="width: 30px; height: auto;" src="${path}/img/banner-black/writeBoard.png">
                    새 글 쓰기
                </a>
            </li>
            <li role="presentation">
                <a href="${path}/resource/${sessionMember.no}/create">
                    <img style="width: 30px; height: auto;" src="${path}/img/banner-black/add-resource.png">
                    새 저장소 만들기
                </a>
            </li>
            <li role="presentation">
                <a href="${path}/board/all/list">
                    <img style="width: 30px; height: auto;" src="${path}/img/banner-black/all-boards.png">
                    전체 글 목록
                </a>
            </li>
        </ul>
        <h2 style="font-weight: bold;">
            마이 페이지
        </h2>
        <hr>
        <ul class="nav nav-pills nav-stacked nav-pills-stacked-example">
            <li role="presentation">
                <a href="${path}/members/${sessionMember.no}/api/clipboard">
                    <img style="width: 30px; height: auto;" src="${path}/img/banner-black/api.png">
                    My API
                </a>
            </li>
            <li role="presentation">
                <a href="${path}/members/${sessionMember.no}/information">
                    <img style="width: 30px; height: auto;" src="${path}/img/banner-black/user.png">
                    내 정보
                </a>
            </li>
            <li role="presentation">
                <a href="${path}/board/${sessionMember.no}/list">
                    <img style="width: 30px; height: auto;" src="${path}/img/banner-black/boardList.png">
                    내 글 목록
                </a>
            </li>
            <li role="presentation">
                <a href="${path}/resource/${sessionMember.no}/list">
                    <img style="width: 30px; height: auto;" src="${path}/img/banner-black/resource.png">
                    내 저장소 목록
                </a>
            </li>
        </ul>
    </c:if>
</aside>


<script>




</script>