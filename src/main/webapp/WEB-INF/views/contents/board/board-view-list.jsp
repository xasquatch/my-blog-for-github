<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<section>
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
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:changeBoardListCount(10);">10</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:changeBoardListCount(20);">20</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:changeBoardListCount(50);">50</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:changeBoardListCount(100);">100</a></li>
                </ul>
            </div>
            <button type="button" class="btn btn-success" onclick="location.href='${path}/board/create'">
                New
            </button>
        </div>
    </article>
    <article class="board-list-contents table-responsive">
        <table class="table table-hover table-condensed">
            <thead>
            <tr>
                <th>Title</th>
                <th width="200">Date Created</th>
                <th width="60">Update</th>
                <th width="60">Delete</th>
            </tr>
            </thead>
            <tbody>
<c:forEach var="list" items="${boardList}">
            <tr>
                <td style="cursor:pointer;" onclick="location.href='${path}/board/view/detail/${list.no}'">
                    ${list.title}
                </td>
                <td>
                    ${list.created_date}
                </td>
                <td align="center">
                    <span class="glyphicon glyphicon-cog"
                          style="cursor:pointer;" onclick="location.href='${path}/board/modify/${list.no}'"></span>
                </td>
                <td align="center">
                    <span class="glyphicon glyphicon-trash"
                          style="cursor:pointer;" onclick="deleteBoard(${list.no});"></span>
                </td>
            </tr>
</c:forEach>
            </tbody>
        </table>
    </article>
    <div class="btn-toolbar board-list-count" role="toolbar" style="margin: 0 auto">
        <div class="btn-group" role="group" aria-label="most left group">
            <button type="button" class="btn btn-default" onclick="location.href='#'">
                <span class="glyphicon glyphicon-backward"></span>
            </button>
        </div>
        <div class="btn-group" role="group" aria-label="left group">
            <button type="button" class="btn btn-default" onclick="location.href='#'">
                <span class="glyphicon glyphicon-chevron-left"></span>
            </button>
        </div>
        <div class="btn-group" role="group" aria-label="list group">
            <button type="button" class="btn btn-default" onclick="location.href='#'">
                1
            </button>
            <button type="button" class="btn btn-default">
                2
            </button>
            <button type="button" class="btn btn-default">
                3
            </button>
            <button type="button" class="btn btn-default">
                4
            </button>
            <button type="button" class="btn btn-default">
                5
            </button>
        </div>
        <div class="btn-group" role="group" aria-label="right group">
            <button type="button" class="btn btn-default" onclick="location.href='#'">
                <span class="glyphicon glyphicon-chevron-right"></span>
            </button>
        </div>
        <div class="btn-group" role="group" aria-label="most right group">
            <button type="button" class="btn btn-default" onclick="location.href='#'">
                <span class="glyphicon glyphicon-forward"></span>
            </button>
        </div>
    </div>
</section>


<script>
    function changeBoardListCount(count) {
        var boardListCount = document.querySelector('#board-list-count');
        boardListCount.innerHTML = count;

        //-----------그 다음 페이지 재호출하여 갯수 재지정
    }

    function deleteBoard(key) {
        if (window.confirm("정말 삭제하시겠습니까?"))
        location.href='${path}/board/delete/'+ key;

    }
</script>