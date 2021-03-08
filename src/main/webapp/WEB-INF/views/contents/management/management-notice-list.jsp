<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sForm" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<section id="myblog-main-section">
    <article style="width: 100%;">
        <div style="min-width: 150px">
            <h1 class="dot-key">공지사항</h1>
        </div>
        <div style="display: flex; align-items: flex-start; flex-wrap: nowrap; justify-content: flex-end;">
            <select class="dot-key" id="myblog-board-page-limit" style="margin: 1px;" onchange="changeViewSetting()">
                <option selected style="background: lightgray;">${pageLimit}</option>
                <option>10</option>
                <option>20</option>
                <option>50</option>
                <option>100</option>
            </select>
            <c:if test="${sessionMember.rank.equals('manager')}">
                <button class="btn-link-red dot-key" style="margin: 1px;" onclick="location.href='${path}/board/${sessionMember.no}/create?keyword=my-blog-notice'">
                    글쓰기
                </button>
            </c:if>
        </div>
    </article>
    <article id="myblog-board-list-contents" class="dot-key table-responsive">
        <table class="table table-hover table-condensed">
            <thead>
            <tr>
                <th>Title</th>
                <th style="width: 200px;">Date</th>
                <c:if test="${sessionMember.rank.equals('manager')}">
                    <th style="width: 60px;">Update</th>
                    <th style="width: 60px;">Delete</th>
                </c:if>
            </tr>
            </thead>
            <tbody id="myblog-api-board-list" class="dot-key">
            <c:forEach var="board" items="${boardList}">
                <tr>
                    <td>
                        <a href="${path}/board/${board.mbr_no}/read/${board.no}">
                            <span style="display: inline-block; width: 200px; overflow: hidden; text-overflow: ellipsis; word-break: break-all;">
                                    ${board.title}
                            </span>
                        </a>
                    </td>
                    <td style="vertical-align: middle;">
                            ${board.created_date}
                    </td>
                    <c:if test="${sessionMember.rank.equals('manager')}">
                        <td style="vertical-align: middle; text-align: center;">
                            <a href="javascript:board.GoModify(${board.mbr_no}, ${board.no},'${sessionMember.name}')">
                                <span class="glyphicon glyphicon-pencil"></span>
                            </a>
                        </td>
                        <td style="vertical-align: middle; text-align: center;">
                            <a href="javascript:board.delete(${board.mbr_no}, ${board.no},'${sessionMember.name}')">
                                <span class="glyphicon glyphicon-trash"></span>
                            </a>
                        </td>
                    </c:if>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </article>

    <div id="myblog-board-list-toolbar" style="text-align: center;">
        <c:forEach var="pageBlock" items="${pageBlockList}">
            ${pageBlock}
        </c:forEach>
    </div>

</section>

<script>
    var toolbarBtn = document.querySelectorAll('#myblog-board-list-toolbar>a');
    for (var btn of toolbarBtn) {
        btn.classList.add('dot-key');
        btn.classList.add('btn');
        btn.classList.add('btn-link-red');

    }

    function changeViewSetting() {
        var searchTarget = document.querySelector('#myblog-search-target');
        var searchValue = document.querySelector('#myblog-search-value');
        var pageLimit = document.querySelector('#myblog-board-page-limit');

        window.location.href = '${path}/board/all/list?page-limit=' + pageLimit.value + '&' + searchTarget.value + '=' + searchValue.value;
    }


</script>