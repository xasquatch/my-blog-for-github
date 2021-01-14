<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sForm" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<section>
    <h1 style="margin: 0; text-align: center">NOTICE</h1>
    <table class="table table-hover table-condensed">
        <thead>
        <tr>
            <c:if test="">
            <td colspan="2" style="text-align: right;">
                <button class="btn btn-link-red" onclick="alert('공지사항')">
                    More
                </button>
            </td>
            </c:if>
        </tr>
        <tr>
            <th style="text-align: center;">Title</th>
            <th style="text-align: center;" width="200">Date</th>
        </tr>
        </thead>
        <tbody>
        ${noticeList}
        <tr>
            <td>타이틀</td>
            <td>시간</td>
        </tr>
        </tbody>
    </table>

</section>