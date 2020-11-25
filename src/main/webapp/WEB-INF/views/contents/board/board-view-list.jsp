<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<section id="main-section">
    <article class="board-list-title">
        <div style="min-width: 150px">
            <h1 class="dot-key">글 목록</h1>
        </div>
        <div style="display: flex; align-items: baseline; flex-wrap: wrap; justify-content: flex-end;">
            <div style="display: flex;">
                <select class="form-control dot-key" id="search-range" style="max-width: 150px">
                    <option>keyword</option>
                    <option>title</option>
                    <option>contents</option>
                    <option>titleOrContents</option>
                </select>
                <input type="text" class="form-control dot-key" id="search-value" placeholder="search!">
                <button class="btn-link-red dot-key" onclick="boardListScript.ChangeMoveToThisPage(1)">
                    <span class="glyphicon glyphicon-search"></span>
                </button>
            </div>
            <div style="display: flex; align-items: baseline;">
                <div class="dropdown">
                    <button class="form-control dropdown-toggle" type="button" id="boardListViewCount" data-toggle="dropdown" aria-expanded="true">
                        <span id="board-list-count">10</span>
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="boardListViewCount">
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:boardListScript.changeBoardList(10);">10</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:boardListScript.changeBoardList(20);">20</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:boardListScript.changeBoardList(50);">50</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:boardListScript.changeBoardList(100);">100</a></li>
                    </ul>
                </div>
                <button type="button" class="btn btn-link-red dot-key" style="font-size: 15px;"
                        onclick="location.href='${path}/board/${sessionMember.no}/create'">
                    New
                </button>
            </div>
        </div>
    </article>
    <article id="board-list-contents">

    </article>
    <article id="board-list-toolbar">

    </article>

</section>


<script>
    window.onload = function () {
        var memberNo = 1;
        var pageLimit = 1;
        var searchTarget = document.querySelector('#search-range').value;
        var searchValue = document.querySelector('#search-value').value;
        myBoard.recursiveGetBoardList(memberNo,
            'https://myblog.xasquatch.net/api/members/' + memberNo + '/boards?page-limit=' + pageLimit + '&' + searchTarget + '=' + searchValue,
            '#board-list-contents', '#board-list-toolbar');
    }
</script>