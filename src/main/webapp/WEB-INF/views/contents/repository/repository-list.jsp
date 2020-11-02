<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<section>
    <h1 class="dot-key">My Repository</h1>
    <div>
        상단 검색바
        <form action="${path}/repository/search">
            <label>
                검색: <input type="text">
            </label>
        </form>
    </div>
    <div>
        하단 리스트
    </div>


</section>