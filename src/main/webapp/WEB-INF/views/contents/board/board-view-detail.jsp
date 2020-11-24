<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<section>
    <section id="board-details">
    </section>
    <section style="text-align: center; padding: 20px;">
        <button class="btn btn-link-red dot-key" onclick="window.history.back();">뒤로 가기</button>
    </section>
</section>

<script>
    window.onload = function () {
        BoardDetail(document.querySelector('#board-details'), ${requestScope.memberNo}, ${requestScope.boardNo});

    }

    function BoardDetail(element, memberNo, boardNo) {
        myBoard.getBoardData(memberNo, boardNo, function (data) {
            console.log('----------origin data--------------');
            console.log(data);
            var boardMap = JSON.parse(data).data.board;
            console.log('----------parsed data--------------');
            console.log(JSON.stringify(boardMap, null, 2));
            console.log('-----------------------------------');


            var container = document.createElement('section');

            var boardDetailTable = document.createElement('table');
            boardDetailTable.className = 'table table-hover table-responsive';
            boardDetailTable.style.margin = '0';

            boardDetailTable.innerHTML += '<tr><td class="dot-key" style="width: 100px">no</td><td><kbd>' + boardMap.no + '</kbd></td></tr>';
            boardDetailTable.innerHTML += '<tr><td class="dot-key" style="width: 100px">thumbnail</td><td>' + boardMap.thumbnail + '</td></tr>';
            boardDetailTable.innerHTML += '<tr><td class="dot-key" style="width: 100px">title</td><td><kbd>' + boardMap.title + '</kbd></td></tr>';
            boardDetailTable.innerHTML += '<tr><td class="dot-key" style="width: 100px">keyword</td><td><kbd>' + boardMap.keyword + '</kbd></td></tr>';
            boardDetailTable.innerHTML += '<tr><td class="dot-key" style="width: 100px">name</td><td><kbd>' + boardMap.name + '</kbd></td></tr>';
            boardDetailTable.innerHTML += '<tr><td class="dot-key" style="width: 100px">created_date</td><td><kbd>' + boardMap.created_date + '</kbd></td></tr>';
            boardDetailTable.innerHTML += '<tr><td class="dot-key" style="width: 100px">created_ip</td><td><kbd>' + boardMap.created_ip + '</kbd></td></tr>';

            container.appendChild(boardDetailTable);
            container.innerHTML += '<section id="board-view-contents">' + boardMap.contents + '</section>';
            element.appendChild(container);
        });

    }

</script>
