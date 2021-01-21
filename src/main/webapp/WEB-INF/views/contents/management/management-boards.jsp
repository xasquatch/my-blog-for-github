<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<section id="myblog-main-section">
    <article style="width: 100%;">
        <div style="min-width: 150px">
            <h1 class="dot-key">글 목록</h1>
        </div>
        <div style="display: flex; align-items: flex-start; flex-wrap: nowrap; justify-content: flex-end;">
            <select id="myblog-search-target" class="dot-key" style="width: 70px;">
                <option selected style="background: lightgray;">${searchTarget}</option>
                <option>keyword</option>
                <option>title</option>
                <option>contents</option>
                <option>title-or-contents</option>
            </select>
            <input type="text" id="myblog-search-value" class="dot-key" style="width: 70px;" placeholder="search!" value="${searchValue}">
            <button id="myblog-search-btn" class="dot-key btn-link-red" onclick="changeViewSetting()">
                <span class="glyphicon glyphicon-search"></span>
            </button>
            <select class="dot-key" id="myblog-board-page-limit" onchange="changeViewSetting()">
                <option selected style="background: lightgray;">${pageLimit}</option>
                <option>10</option>
                <option>20</option>
                <option>50</option>
                <option>100</option>
            </select>
        </div>
    </article>
    <article id="myblog-board-list-contents" class="dot-key table-responsive">
        <table class="table table-hover table-condensed">
            <thead>
            <tr>
                <th style="width: 40px;">No</th>
                <th>Title</th>
                <th style="width: 200px;">Date</th>
                <th style="width: 60px;">User Name</th>
                <th style="width: 60px;">Update</th>
                <th style="width: 60px;">Delete</th>
            </tr>
            </thead>
            <tbody id="myblog-api-board-list" class="dot-key">
            <c:forEach var="board" items="${boardList}">
                <tr>
                    <td style="vertical-align: middle;">
                            ${board.row_number}
                    </td>
                    <td>
                        <a href="${path}/board/${board.mbr_no}/read/${board.no}">
                                ${board.thumbnail}
                            <span style="display: inline-block; width: 200px; overflow: hidden; text-overflow: ellipsis; word-break: break-all;">
                                    ${board.title}
                            </span>
                        </a>
                    </td>
                    <td style="vertical-align: middle;">
                            ${board.created_date}
                    </td>
                    <td style="vertical-align: middle;">
                            ${board.mbr_nickname}
                    </td>
                    <td style="vertical-align: middle; text-align: center;">
                        <a href="javascript:board.GoModify('all', ${board.no})">
                            <span class="glyphicon glyphicon-pencil"></span>
                        </a>
                    </td>
                    <td style="vertical-align: middle; text-align: center;">
                        <a href="javascript:board.delete('all', ${board.no})">
                            <span class="glyphicon glyphicon-trash"></span>
                        </a>
                    </td>
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