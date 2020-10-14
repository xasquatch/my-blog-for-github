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
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">10</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">20</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">50</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">100</a></li>
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
                <th>Contents</th>
                <th width="200">Date Created</th>
            </tr>
            </thead>
            <tbody>
            <tr style="cursor:pointer;" onclick="location.href='#'">
                <td>
                    마 이게 타이틀이다! 알겠나! 잘 보고 배우자 열심히하자 화이팅

                </td>
                <td>
                    <img src="${path}/img/Xasquatch.png">
                    마 이게 콘텐츠다! 아나! 아냐고! 내 아픔을 아나! 뭐아는데!
                </td>
                <td>
                    <%= new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date())%>
                </td>
            </tr>
            </tbody>
        </table>
    </article>
</section>