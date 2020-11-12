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
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:boardListScript.changeBoardListCount(10);">10</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:boardListScript.changeBoardListCount(20);">20</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:boardListScript.changeBoardListCount(50);">50</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:boardListScript.changeBoardListCount(100);">100</a></li>
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
    <div class="btn-toolbar" role="toolbar" style="margin: 0 auto">
        <div class="btn-group" role="group" aria-label="left group">
            <button type="button" class="btn btn-link" onclick="location.href='#'">
                <span class="glyphicon glyphicon-chevron-left"></span>
            </button>
        </div>
        <div id="board-list-toolbar" class="btn-group" role="group">
            <button type="button" class="btn btn-link active" onclick="boardListScript.changeActivateToolbar(this)">
                1
            </button>
            <button type="button" class="btn btn-link" onclick="boardListScript.changeActivateToolbar(this)">
                2
            </button>
            <button type="button" class="btn btn-link" onclick="boardListScript.changeActivateToolbar(this)">
                3
            </button>
            <button type="button" class="btn btn-link" onclick="boardListScript.changeActivateToolbar(this)">
                4
            </button>
            <button type="button" class="btn btn-link" onclick="boardListScript.changeActivateToolbar(this)">
                5
            </button>
        </div>
        <div class="btn-group" role="group" aria-label="right group">
            <button type="button" class="btn btn-link" onclick="location.href='#'">
                <span class="glyphicon glyphicon-chevron-right"></span>
            </button>
        </div>
    </div>
</section>


<script>

    window.onload =function(){
        boardListScript.changeBoardListCount(10);

    }
</script>