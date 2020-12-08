<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<section>
    <h1 class="dot-key">API Document</h1>
    <h3>URL:
        https://myblog.xasquatch.net/api/members/<i class="dot-key">{member-Number}</i>/resources
        /<i class="dot-key">{resource-Number}</i>
    </h3>
    <section>
        <hr>
        <article>
            <h4 class="dot-key">URL Explain</h4>
            <p>Method : GET</p>
            <p><i class="dot-key">{member-Number}</i> : My Information의 ID값(Long형 숫자타입)</p>
            <p><i class="dot-key">{resource-Number}</i> : 해당 리소스의 ID값(Long형 숫자타입)</p>
        </article>
        <hr>
        <article>
            <h4 class="dot-key">Return Value Explain</h4>
            <h5 class="dot-key">resource</h5>
            <p>- no: 해당 리소스의 고유 ID 입니다.(<i class="dot-key">{resource-Number}</i>와 동일)</p>
            <p>- contents: 해당 리소스의 내용입니다.</p>
            <p>- mbr_no: 해당 리소스의 작성자입니다.
                (<i class="dot-key">{Member-Number}</i>와 동일)
            </p>
            <p>- title: 해당 리소스의 제목입니다.</p>
        </article>
        <hr>
    </section>
</section>