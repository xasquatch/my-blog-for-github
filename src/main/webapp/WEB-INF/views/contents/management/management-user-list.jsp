<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sForm" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<section id="myblog-main-section">
    <article>
        <h1 class="dot-key" style="margin: 0;">회원 관리 목록</h1>
        <div style="display: flex; align-items: flex-start; flex-wrap: wrap; justify-content: flex-end;">
            <select id="myblog-search-target" class="dot-key" style="margin: 1px;">
                <option selected style="background: lightgray;">${searchTarget}</option>
                <option>member-number</option>
                <option>member-email</option>
                <option>member-name</option>
            </select>
            <input type="text" id="myblog-search-value" class="dot-key" style="width: 70px; margin: 1px 0 1px 1px;" placeholder="search!" value="${searchValue}">
            <button id="myblog-search-btn" class="dot-key btn-link-red" style="margin: 1px 1px 1px 0;" onclick="changeViewSetting()">
                <span class="glyphicon glyphicon-search"></span>
            </button>
            <select class="dot-key" id="myblog-page-limit" style="margin: 1px;" onchange="changeViewSetting()">
                <option selected style="background: lightgray;">${pageLimit}</option>
                <option>50</option>
                <option>100</option>
                <option>200</option>
            </select>
        </div>
    </article>
    <article class="table-responsive">
        <table class="table table-hover table-condensed">
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
                <tbody>
                <td style="text-align: center; width: 80px;">${member.no}</td>
                <td style="width: 120px;">${member.authorization}</td>
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
    </article>
</section>
<script>
    function changeViewSetting() {
        var searchTarget = document.querySelector('#myblog-search-target').value;
        var searchValue = document.querySelector('#myblog-search-value').value;
        var pageLimit = document.querySelector('#myblog-page-limit').value;
        window.location.href = '${path}/management/users'
            + '?pageLimit=' + pageLimit
            + '&' + searchTarget + '=' + searchValue;
    }
</script>