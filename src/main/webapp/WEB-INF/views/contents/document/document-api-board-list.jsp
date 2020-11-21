<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<section>
    <h1 class="dot-key">API Document</h1>
    <h3>URL: https://myblog.xasquatch.net/api/members/<i class="dot-key">{member-Number}</i>/boards</h3>
    <section>
        <hr>
        <article>
            <h4 class="dot-key">URL Explain</h4>
            <p><i class="dot-key">{member-Number}</i> : My Information의 ID값(Long형 숫자타입)</p>
            <p>Method : GET</p>
            <p>Parameters Name : page-limit, current-page-block, {keyword, title, contents, title-and-contents}</p>
            <p>Parameters Count : 3</p>
        </article>
        <hr>
        <article>
            <h4 class="dot-key">Parameter Explain</h4>
            <p>Parameter를 생략하면 기본값으로 출력됩니다.</p>
            <p>page-limit(블록당 게시글 수)의 기본값은 10, current-page-block(현재페이지 블록번호)의 기본값은 1입니다.</p>
            <p>{keyword, title, contents, title-and-contents}</p>
            <p>keyword : 키워드에 해당문자열이 포함되어있는지 검색합니다.</p>
            <p>title : 타이틀에 해당문자열이 포함되어있는지 검색합니다.</p>
            <p>contents : 컨텐츠에 해당문자열이 포함되어있는지 검색합니다.</p>
            <p>title-and-contents : 타이틀 혹은 컨텐츠에 해당문자열이 포함되어있는지 검색합니다.</p>
        </article>
        <hr>
        <article>
            <h4 class="dot-key">Return Value Explain</h4>
            <h5 class="dot-key">boardList</h5>
            <p>- row_number: 작성일자 기준으로 정렬된 번호입니다. 최근 작성일자가 제일 앞으로 표시됩니다. 고유 ID 와는 무관합니다.</p>
            <p>- no: 해당 게시글의 고유 ID 입니다.</p>
            <p>- title: 해당 게시글의 제목입니다.</p>
            <p>- thumbnail: 해당 게시글의 썸네일 이미지입니다.</p>
            <p>- created_date: 해당 게시글의 작성일자입니다.</p>
            <h5 class="dot-key">pageBlockList</h5>
            <p>- 다음 페이지버튼 리스트입니다. </p>
            <p>- 페이지블록 5개와 다음, 이전페이지블록 2개를 포함해 총 7개의 리스트가 출력됩니다.");</p>
        </article>
        <hr>
    </section>
</section>