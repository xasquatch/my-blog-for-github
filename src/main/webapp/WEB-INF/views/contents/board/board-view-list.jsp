<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<section id="main-section">
    <article class="board-list-title">
        <div>
            <h1 class="dot-key">글 목록</h1>
        </div>
        <div style="display: flex; align-items: flex-end;">
            <div class="dropdown">
                <button class="btn btn-default dropdown-toggle" type="button" id="boardListViewCount" data-toggle="dropdown" aria-expanded="true">
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
            <button type="button" class="btn btn-success" onclick="location.href='${path}/board/${sessionMember.no}/create'">
                New
            </button>
        </div>
    </article>
    <article class="board-list-contents table-responsive">
        <table class="table table-hover table-condensed">
            <thead>
            <tr>
                <th style="width: 40px;">No</th>
                <th>Title</th>
                <th style="width: 200px;">Date</th>
                <th style="width: 60px;">Modify</th>
                <th style="width: 60px;">Delete</th>
            </tr>
            </thead>
            <tbody id="myblog-api-board-list">

            </tbody>
        </table>
    </article>

    <div id="board-list-toolbar" class="btn-group" role="group">
        <button type="button" class="btn btn-link active" onclick="boardListScript.MoveToThisPage(this)">
            1
        </button>
    </div>

</section>


<script>

    window.onload = function () {
        boardListScript.changeBoardList(document.querySelector('#board-list-count').innerText);

    }
</script>