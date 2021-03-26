<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sForm" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<section id="myblog-main-section">
    <article class="community-keyword-container">
        <a><span>#</span>springframework</a>
        <a><span>#</span>DispatcherServlet</a>
        <a><span>#</span>SimpleUrlHandlerMapping</a>
        <a><span>#</span>ResourceHttpRequestHandler</a>
        <a><span>#</span>Tomcat</a>
        <a><span>#</span>JetBrains</a>
        <a><span>#</span>CATALINA_BASE</a>
        <a><span>#</span>parameters</a>
        <a><span>#</span>CATALINA_HOME</a>
    </article>
    <article id="myblog-board-list-contents" class="dot-key table-responsive">
        <table class="table table-hover table-condensed">
            <thead>
            <tr>
                <th style="width: 40px;">No</th>
                <th>Title</th>
                <th style="width: 200px;">Date</th>
            </tr>
            </thead>
            <tbody id="myblog-api-board-list" class="dot-key">
            <c:forEach var="board" items="${boardList}">
                <tr>
                    <td style="text-align:center; vertical-align: middle;">
                            ${board.row_number}<BR><BR>
                        ❤${board.like}
                    </td>
                    <td>
                        <a href="${path}/boards/${board.no}">
                                ${board.thumbnail}
                            <span style="display: inline-block; width: 200px; overflow: hidden; text-overflow: ellipsis; word-break: break-all;">
                                    ${board.title}
                            </span>
                        </a>
                    </td>
                    <td style="vertical-align: middle;">
                            ${board.created_date}
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </article>

    <div id="myblog-board-list-toolbar" style="text-align: center;">
        <c:forEach var="pageBlock" items="${pageBlockList}">
            ${pageBlock}
        </c:forEach>
    </div>

</section>