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
<pre contenteditable="true" id="get-board-pre">
</pre>

        </div>
    </article>
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
<pre contenteditable="true" id="get-board-list-pre">
</pre>

        </div>
    </article>
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
<pre contenteditable="true"  id="get-resource-pre">

</pre>

        </div>
    </article>
</section>
<script>
    window.onload = function (){
        myAjax.submit('GET','https://myblog.xasquatch.net/html/form/get-board-pre.html',function (data) {
            document.querySelector('#get-board-pre').innerText = data;

        });
        myAjax.submit('GET','https://myblog.xasquatch.net/html/form/get-board-list-pre.html',function (data) {
            document.querySelector('#get-board-list-pre').innerText = data;

        });
        myAjax.submit('GET','https://myblog.xasquatch.net/html/form/get-resource-pre.html',function (data) {
            document.querySelector('#get-resource-pre').innerText = data;

        });
    };

</script>