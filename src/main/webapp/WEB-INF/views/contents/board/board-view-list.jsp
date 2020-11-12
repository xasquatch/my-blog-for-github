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
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:changeBoardListCount(10);">10</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:changeBoardListCount(20);">20</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:changeBoardListCount(50);">50</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:changeBoardListCount(100);">100</a></li>
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
            <c:forEach var="list" items="${boardList}">
                <tr>
                    <td>
                            ${list.rowno}
                    </td>
                    <td>
                        <a href="${path}/board/${sessionMember.no}/view/detail/${list.no}">
                                ${list.thumbnail} ${list.title}
                        </a>
                    </td>
                    <td>
                            ${list.created_date}
                    </td>
                    <td>
                    <span class="glyphicon glyphicon-cog"
                          style="cursor:pointer;" onclick="location.href='${path}/board/${sessionMember.no}/modify/${list.no}'"></span>
                    </td>
                    <td>
                    <span class="glyphicon glyphicon-trash"
                          style="cursor:pointer;" onclick="deleteBoard(${list.no});"></span>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </article>
    <div id="board-list-toolbar" class="btn-toolbar" role="toolbar" style="margin: 0 auto">
        <div class="btn-group" role="group" aria-label="left group">
            <button type="button" class="btn btn-link" onclick="location.href='#'">
                <span class="glyphicon glyphicon-chevron-left"></span>
            </button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" class="btn btn-link" onclick="location.href='#'">
                1
            </button>
            <button type="button" class="btn btn-link">
                2
            </button>
            <button type="button" class="btn btn-link">
                3
            </button>
            <button type="button" class="btn btn-link">
                4
            </button>
            <button type="button" class="btn btn-link">
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
    function changeBoardListCount(count) {
        document.querySelector('#board-list-count').innerHTML = count;
        var boardList = document.querySelector('#myblog-api-board-list');

        ajax.submit('GET', '${path}/api/members/${sessionMember.no}/board/list?pageLimit=' + count + '&currentBlock=' + 1, function (data) {

            boardList.innerHTML = '';
            var jsonData = JSON.parse(data);
            for (var map of jsonData) {
                var trTag = document.createElement('tr');
                var titleInput = document.createElement('td');
                titleInput.innerHTML = '<a href="${path}/board/${sessionMember.no}/view/detail/' + map.no + '">' + map.thumbnail + map.title + '</a>';
                var rowNoInput = document.createElement('td');
                rowNoInput.innerText = map.rowno;
                var dateInput = document.createElement('td');
                dateInput.innerText = getFormatDate(map.created_date);
                var modifyInput = document.createElement('td');
                modifyInput.innerHTML = '<span class="glyphicon glyphicon-cog" style="cursor:pointer;" onclick="location.href=\'${path}/board/${sessionMember.no}/modify/' + map.no + '\'"></span>';
                var deleteInput = document.createElement('td');
                deleteInput.innerHTML = '<span class="glyphicon glyphicon-trash" style="cursor:pointer;" onclick="deleteBoard(' + map.no + ');"></span>';

                trTag.appendChild(rowNoInput)
                trTag.appendChild(titleInput)
                trTag.appendChild(dateInput);
                trTag.appendChild(modifyInput);
                trTag.appendChild(deleteInput);
                boardList.appendChild(trTag);

            }
        });

    }

    function getFormatDate(targetDate) {
        var date = new Date(targetDate);
        var year = date.getFullYear();
        var month = (1 + date.getMonth());
        month = month >= 10 ? month : '0' + month;
        var day = date.getDate();
        day = day >= 10 ? day : '0' + day;
        var hour = date.getHours();
        hour = hour >= 10 ? hour : '0' + hour;
        var minute = date.getMinutes();
        minute = minute >= 10 ? minute : '0' + minute;

        return year + '-' + month + '-' + day + ' ' + hour + ':' + minute;
    }

    function deleteBoard(key) {
        if (window.confirm("정말 삭제하시겠습니까?"))
            location.href = '${path}/board/${sessionMember.no}/delete/' + key;

    }

    changeBoardListCount(10);
</script>