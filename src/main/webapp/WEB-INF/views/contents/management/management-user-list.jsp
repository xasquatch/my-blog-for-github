<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sForm" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<section id="myblog-main-section">
    <table class="table table-hover table-responsive">
        <thead>
        <tr>
            <th>Serial<BR>Number</th>
            <th>Authorization</th>
            <th>Nick Name</th>
            <th>email</th>
            <th>Edit</th>
        </tr>
        </thead>
        <c:forEach var="member" items="${memberList}">
            ${member}<BR>

            <tbody>
            <td style="text-align: center;">${member.no}</td>
            <td>${member.authorization}</td>
            <td>
                <img src="${path}${member.img}"/>
                <BR>
                    ${member.mbr_nickname}
            </td>
            <td>${member.email}</td>
            <td style="text-align: center; width: 50px;">
                <a class="btn btn-link-red"
                   href="${path}/management/members/${member.email}/edit">
                    <span class="glyphicon glyphicon-user"></span>
                </a>
            </td>
            </tbody>
        </c:forEach>
        <tfoot>
        <tr>
            <td colspan="5" style="text-align: center;">
                <c:forEach var="pageBlock" items="${pageBlockList}">
                    ${pageBlock}
                </c:forEach>
            </td>
        </tr>
        </tfoot>
    </table>
</section>