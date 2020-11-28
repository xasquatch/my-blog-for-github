<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<section id="api-clipboard-section">
    <article>
        <h2 class="dot-key">게시글 조회</h2>
        <a class="btn btn-link-red" target="_blank"
           href="https://myblog.xasquatch.net/document/members/{member-number}/boards/{board-number}">Document Page</a>
        <div class="api-clipboard">
            <h4>URL:
                https://myblog.xasquatch.net/api/members/<i class="dot-key">{member-Number}</i>/boards
                /<i class="dot-key">{board-Number}</i>
            </h4>
            <hr>
            <h4 class="dot-key" style="text-decoration: underline ;color: darkred;">URL Explain</h4>
            <p>Method : GET</p>
            <p><i class="dot-key">{member-Number}</i> : My Information의 ID값(Long형 숫자타입)</p>
            <p><i class="dot-key">{board-Number}</i> : 해당 게시글의 ID값(Long형 숫자타입)</p>
            <h3 class="dot-key" style="color: darkred;">Example</h3>
            <h4 class="dot-key">결과 - Example: xmlHttpRequest 이용한 게시글 가져오기</h4>
            <pre>
<section id="example1">
</section>
<script>
    exampleBoardDetail(document.querySelector('#example1'), 1, 1);
    function exampleBoardDetail(element, memberNo, boardNo) {

        var xhr = new XMLHttpRequest();
        xhr.open('GET', 'https://myblog.xasquatch.net/api/members/' + memberNo + '/boards/' + boardNo);
        xhr.onreadystatechange = function () {
            if (xhr.readyState === xhr.DONE) {
                if (xhr.status === 200 || xhr.status === 201) {
                    var result = xhr.response;
                    console.log(result);
                    var boardMap = JSON.parse(result).data.board;

                    var container = document.createElement('section');
                    container.innerHTML += '<div><label>no</label><BR>' + boardMap.no + '</div>';
                    container.innerHTML += '<div><label>thumbnail</label><BR>' + boardMap.thumbnail + '</div>';
                    container.innerHTML += '<div><label>title</label><BR>' + boardMap.title + '</div>';
                    container.innerHTML += '<div><label>keyword</label><BR>' + boardMap.keyword + '</div>';
                    container.innerHTML += '<div><label>mbr_no</label><BR>' + boardMap.mbr_no + '</div>';
                    container.innerHTML += '<div><label>name</label><BR>' + boardMap.name + '</div>';
                    container.innerHTML += '<div><label>created_date</label><BR>' + boardMap.created_date + '</div>';
                    container.innerHTML += '<div><label>created_ip</label><BR>' + boardMap.created_ip + '</div>';
                    container.innerHTML += '<div><label>contents</label><BR>' + boardMap.contents + '</div>';
                    element.appendChild(container);

                } else {
                    alert('Fail');
                }
            }
        };
        xhr.send();
    }
</script>
</pre>
            <h4 class="dot-key">코드 - Example: xmlHttpRequest 이용한 게시글 가져오기</h4>
            <pre>
&lt;section id="example1"&gt;
&lt;/section&gt;
&lt;script&gt;
    exampleBoardDetail(document.querySelector('#example1'), 1, 1);
    function exampleBoardDetail(element, memberNo, boardNo) {

        var xhr = new XMLHttpRequest();
        xhr.open('GET', 'https://myblog.xasquatch.net/api/members/' + memberNo + '/boards/' + boardNo);
        xhr.onreadystatechange = function () {
            if (xhr.readyState === xhr.DONE) {
                if (xhr.status === 200 || xhr.status === 201) {
                    var result = xhr.response;
                    console.log(result);
                    var boardMap = JSON.parse(result).data.board;

                    var container = document.createElement('section');
                    container.innerHTML += '&lt;div&gt;&lt;label&gt;no&lt;/label&gt;&lt;BR&gt;' + boardMap.no + '&lt;/div&gt;';
                    container.innerHTML += '&lt;div&gt;&lt;label&gt;thumbnail&lt;/label&gt;&lt;BR&gt;' + boardMap.thumbnail + '&lt;/div&gt;';
                    container.innerHTML += '&lt;div&gt;&lt;label&gt;title&lt;/label&gt;&lt;BR&gt;' + boardMap.title + '&lt;/div&gt;';
                    container.innerHTML += '&lt;div&gt;&lt;label&gt;keyword&lt;/label&gt;&lt;BR&gt;' + boardMap.keyword + '&lt;/div&gt;';
                    container.innerHTML += '&lt;div&gt;&lt;label&gt;mbr_no&lt;/label&gt;&lt;BR&gt;' + boardMap.mbr_no + '&lt;/div&gt;';
                    container.innerHTML += '&lt;div&gt;&lt;label&gt;name&lt;/label&gt;&lt;BR&gt;' + boardMap.name + '&lt;/div&gt;';
                    container.innerHTML += '&lt;div&gt;&lt;label&gt;created_date&lt;/label&gt;&lt;BR&gt;' + boardMap.created_date + '&lt;/div&gt;';
                    container.innerHTML += '&lt;div&gt;&lt;label&gt;created_ip&lt;/label&gt;&lt;BR&gt;' + boardMap.created_ip + '&lt;/div&gt;';
                    container.innerHTML += '&lt;div&gt;&lt;label&gt;contents&lt;/label&gt;&lt;BR&gt;' + boardMap.contents + '&lt;/div&gt;';
                    element.appendChild(container);

                } else {
                    alert('Fail');
                }
            }
        };
        xhr.send();
    }
&lt;/script&gt;
</pre>
        </div>
    </article>

<!--게시글 리스트 조회-->

    <article>
        <h2 class="dot-key">게시글 리스트 조회</h2>
        <a class="btn btn-link-red" target="_blank"
           href="https://myblog.xasquatch.net/document/members/{member-number}/boards">Document Page</a>
        <div class="api-clipboard">
            <h4>URL: https://myblog.xasquatch.net/api/members/<i class="dot-key">{member-Number}</i>/boards</h4>
            <hr>
            <h4 class="dot-key" style="text-decoration: underline ;color: darkred;">URL Explain</h4>
            <p><i class="dot-key">{member-Number}</i> : My Information의 ID값(Long형 숫자타입)</p>
            <p>Method : GET</p>
            <p>Parameters Name : page-limit, current-page-block, {keyword, title, contents, title-and-contents}</p>
            <p>Parameters Count : 3</p>
            <h3 class="dot-key" style="color: darkred;">Example</h3>
            <h4 class="dot-key">결과 - Example: xmlHttpRequest 이용한 게시글목록 가져오기</h4>
            <pre>
<section id="example2">
</section>
<script>
    exampleBoardList(document.querySelector('#example2'), 1);
    function exampleBoardList(element, memberNo) {
        var xhr = new XMLHttpRequest();
        xhr.open('GET', 'https://myblog.xasquatch.net/api/members/' + memberNo + '/boards');
        xhr.onreadystatechange = function () {
            if (xhr.readyState === xhr.DONE) {
                if (xhr.status === 200 || xhr.status === 201) {
                    var result = xhr.response;
                    console.log(result);

                    var listMap = JSON.parse(result).data.boardList;
                    var listContainer = document.createElement('article');
                    for (var board of listMap) {
                        var boardContainer = document.createElement('div');
                        boardContainer.innerHTML += "no: "+board.no+"<BR>";
                        boardContainer.innerHTML += "mbr_no: "+board.mbr_no+"<BR>";
                        boardContainer.innerHTML += "thumbnail: "+board.thumbnail+"<BR>";
                        boardContainer.innerHTML += "row_number: "+board.row_number+"<BR>";
                        boardContainer.innerHTML += "title: "+board.title+"<BR>";
                        boardContainer.innerHTML += "created_date: "+board.created_date+"<BR>";
                        boardContainer.innerHTML += "<HR>";

                        listContainer.appendChild(boardContainer);
                    }

                    var pageBlockList = JSON.parse(result).data.pageBlockList;
                    var pageContainer = document.createElement('article');
                    for (var pageBlock of pageBlockList) {
                        pageContainer.innerHTML += pageContainer;
                    }

                    element.appendChild(listContainer);
                    element.appendChild(listContainer);

                } else {
                    alert('Fail');
                }
            }
        };
        xhr.send();
    }
</script>
</pre>
            <h4 class="dot-key">코드 - Example: xmlHttpRequest 이용한 게시글목록 가져오기</h4>
<pre>
&lt;section id="example2">
&lt;/section>
&lt;script>
    exampleBoardList(document.querySelector('#example2'), 1);
    function exampleBoardList(element, memberNo) {
        var xhr = new XMLHttpRequest();
        xhr.open('GET', 'https://myblog.xasquatch.net/api/members/' + memberNo + '/boards');
        xhr.onreadystatechange = function () {
            if (xhr.readyState === xhr.DONE) {
                if (xhr.status === 200 || xhr.status === 201) {
                    var result = xhr.response;
                    console.log(result);

                    var listMap = JSON.parse(result).data.boardList;
                    var listContainer = document.createElement('article');
                    for (var board of listMap) {
                        var boardContainer = document.createElement('div');
                        boardContainer.innerHTML += "no: "+board.no+"&lt;BR>";
                        boardContainer.innerHTML += "mbr_no: "+board.mbr_no+"&lt;BR>";
                        boardContainer.innerHTML += "thumbnail: "+board.thumbnail+"&lt;BR>";
                        boardContainer.innerHTML += "row_number: "+board.row_number+"&lt;BR>";
                        boardContainer.innerHTML += "title: "+board.title+"&lt;BR>";
                        boardContainer.innerHTML += "created_date: "+board.created_date+"&lt;BR>";
                        boardContainer.innerHTML += "&lt;HR>";

                        listContainer.appendChild(boardContainer);
                    }

                    var pageBlockList = JSON.parse(result).data.pageBlockList;
                    var pageContainer = document.createElement('article');
                    for (var pageBlock of pageBlockList) {
                        pageContainer.innerHTML += pageContainer;
                    }

                    element.appendChild(listContainer);
                    element.appendChild(listContainer);

                } else {
                    alert('Fail');
                }
            }
        };
        xhr.send();
    }
&lt;/script&gt;
</pre>
        </div>
    </article>


<!--리소스 조회-->

    <article>
        <h2 class="dot-key">리소스 조회</h2>
        <a class="btn btn-link-red" target="_blank"
           href="https://myblog.xasquatch.net/document/members/{member-number}/resources/{resource-number}">Document Page</a>
        <div class="api-clipboard">
            <h4>URL:
                https://myblog.xasquatch.net/api/members/<i class="dot-key">{member-Number}</i>/resources
                /<i class="dot-key">{resource-Number}</i>
            </h4>
            <hr>
            <h4 class="dot-key" style="text-decoration: underline ;color: darkred;">URL Explain</h4>
            <p>Method : GET</p>
            <p><i class="dot-key">{member-Number}</i> : My Information의 ID값(Long형 숫자타입)</p>
            <p><i class="dot-key">{resource-Number}</i> : 해당 리소스의 ID값(Long형 숫자타입)</p>
            <h3 class="dot-key" style="color: darkred;">Example</h3>
            <pre contenteditable="true" id="get-resource-pre">

</pre>

        </div>
    </article>
</section>