<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<section>
    <article>
        <h1>${boardInfo.title}</h1>
        <table class="table table-hover table-responsive" style="margin: 0;">
            <tr>
                <td class="dot-key" style="width: 100px">
                    Keyword
                </td>
                <td>
                    <kbd>${boardInfo.keyword}</kbd>
                </td>
            </tr>
        </table>
        <table class="table table-hover table-responsive" style="margin: 0;">
            <tr>
                <td class="dot-key" style="width: 100px">
                    작성일자
                </td>
                <td>
                    <kbd>${boardInfo.created_date}</kbd>
                </td>
            </tr>
        </table>
        <table class="table table-hover table-responsive" style="margin: 0;">
            <tr>
                <td class="dot-key" style="width: 100px">
                    IP
                </td>
                <td>
                    <kbd>${boardInfo.created_ip}</kbd>
                </td>
            </tr>
        </table>
    </article>
    <article>
        <div id="board-view-contents">
            ${boardInfo.contents}

        </div>
    </article>
    <article>
        <section class="board-list-contents table-responsive">
            <table class="table table-hover table-condensed">
                <thead>
                <tr>
                    <th>Title</th>
                    <th style="width: 200px;">Date Created</th>
                    <th style="width: 60px;">Update</th>
                    <th style="width: 60px;">Delete</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="list" items="${boardList}">
                    <tr>
                        <td style="cursor:pointer;" onclick="location.href='${path}/board/${sessionMember.no}/view/detail/${list.no}'">
                                ${list.title}
                        </td>
                        <td>
                                ${list.created_date}
                        </td>
                        <td align="center">
                    <span class="glyphicon glyphicon-cog"
                          style="cursor:pointer;" onclick="location.href='${path}/board/${sessionMember.no}/modify/${list.no}'"></span>
                        </td>
                        <td align="center">
                    <span class="glyphicon glyphicon-trash"
                          style="cursor:pointer;" onclick="deleteBoard(${list.no});"></span>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </section>
        <div class="btn-toolbar board-list-count" role="toolbar" style="margin: 0 auto">
            <div class="btn-group" role="group" aria-label="most left group">
                <button type="button" class="btn btn-default" onclick="location.href='#'">
                    <span class="glyphicon glyphicon-backward"></span>
                </button>
            </div>
            <div class="btn-group" role="group" aria-label="left group">
                <button type="button" class="btn btn-default" onclick="location.href='#'">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                </button>
            </div>
            <div class="btn-group" role="group" aria-label="list group">
                <button type="button" class="btn btn-default" onclick="location.href='#'">
                    1
                </button>
                <button type="button" class="btn btn-default">
                    2
                </button>
                <button type="button" class="btn btn-default">
                    3
                </button>
                <button type="button" class="btn btn-default">
                    4
                </button>
                <button type="button" class="btn btn-default">
                    5
                </button>
            </div>
            <div class="btn-group" role="group" aria-label="right group">
                <button type="button" class="btn btn-default" onclick="location.href='#'">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                </button>
            </div>
            <div class="btn-group" role="group" aria-label="most right group">
                <button type="button" class="btn btn-default" onclick="location.href='#'">
                    <span class="glyphicon glyphicon-forward"></span>
                </button>
            </div>
        </div>
    </article>
</section>