<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<section>
    <h1 class="dot-key">API Document</h1>
    <h3>URL:
        https://myblog.xasquatch.net/api/members/<i class="dot-key">{member-Number}</i>/boards
        /<i class="dot-key">{board-Number}</i>
    </h3>
    <section>
        <hr>
        <article>
            <h4 class="dot-key">URL Explain</h4>
            <p><i class="dot-key">{member-Number}</i> : My Information의 ID값(Long형 숫자타입)</p>
            <p><i class="dot-key">{board-Number}</i> : 해당 게시글의 ID값(Long형 숫자타입)</p>
        </article>
        <hr>
        <article>
            <h4 class="dot-key">Return Value Explain</h4>
            <h5 class="dot-key">board</h5>
            <p>- no: 해당 게시글의 고유 ID 입니다.(<i class="dot-key">{board-Number}</i>와 동일)</p>
            <p>- thumbnail: 해당 게시글의 썸네일 이미지입니다.</p>
            <p>- contents: 해당 게시글의 내용입니다.</p>
            <p>- member_no: 해당 게시글의 작성자입니다.
                (<i class="dot-key">{Member-Number}</i>와 동일)
            </p>
            <p>- created_date: 해당 게시글의 작성일자입니다.</p>
            <p>- keyword: 해당 게시글의 키워드입니다.</p>
            <p>- title: 해당 게시글의 제목입니다.</p>
            <p>- created_ip: 해당 게시글 작성자의 IP address입니다. 뒷자리는 마스킹처리되어 반환됩니다.</p>
        </article>
        <hr>
    </section>
</section>