<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<section id="api-clipboard-section">
<h2 class="dot-key">Quick Guide</h2>
<h4 class="dot-key">결과 - Example: 게시판 만들기</h4>
<pre>
<section id="myblog-main-section">
</section>
<script src="https://myblog.xasquatch.net/js/myblog-api.js"></script>
<script>
    myBoard.recursiveGetBoardList(${memberNo}, 'https://myblog.xasquatch.net/api/members/${memberNo}/boards');
</script>

</pre>

    <h4 class="dot-key">코드 -  Example: 게시판 만들기</h4>
<pre>
&lt;section id="myblog-main-section">
&lt;/section>
&lt;script src="https://myblog.xasquatch.net/js/myblog-api.js">&lt;/script>
&lt;script>
    myBoard.recursiveGetBoardList(${memberNo}, 'https://myblog.xasquatch.net/api/members/${memberNo}/boards');
&lt;/script>
</pre>

</section>