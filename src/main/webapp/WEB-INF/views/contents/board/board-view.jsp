<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<section>
    <article class="board-list-title">
        <div>
            <h1>그럴싸한 제목</h1>
        </div>
        <div style="display: flex; align-items: flex-end;">
            <div class="dropdown">
                <button class="btn btn-default dropdown-toggle" type="button" id="boardListViewCount" data-toggle="dropdown" aria-expanded="true">
                    <span id="board-list-count">10</span>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="boardListViewCount">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:ChangeBoardListCount(10);">10</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:ChangeBoardListCount(20);">20</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:ChangeBoardListCount(50);">50</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:ChangeBoardListCount(100);">100</a></li>
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
            </tr>
            </thead>
            <tbody>
            <tr style="cursor:pointer;" onclick="location.href='#'">
                <td>
                    마 이게 타이틀이다! 알겠나! 잘 보고 배우자 열심히하자 화이팅

                </td>
                <td>
                    <%= new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date())%>
                </td>
            </tr>
            </tbody>
        </table>
    </article>
        <div class="btn-toolbar" role="toolbar" style="margin: 0 auto">
            <div class="btn-group" role="group" aria-label="left group">
                <button type="button" class="btn btn-default" onclick="">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                </button>
            </div>
            <div class="btn-group" role="group" aria-label="list group">
                <button type="button" class="btn btn-default">
                    1
                </button>
                <button type="button" class="btn btn-default">2</button>
                <button type="button" class="btn btn-default">3</button>
                <button type="button" class="btn btn-default">4</button>
                <button type="button" class="btn btn-default">5</button>
            </div>
            <div class="btn-group" role="group" aria-label="right group">
                <button type="button" class="btn btn-default" onclick="">
                    <span class="glyphicon glyphicon-chevron-right"></span>

                </button>
            </div>
        </div>
</section>


<script>
    function ChangeBoardListCount(count) {
        var boardListCount = document.querySelector('#board-list-count');
        boardListCount.innerHTML = count;

        //-----------그 다음 페이지 재호출하여 갯수 재지정
    }

</script>