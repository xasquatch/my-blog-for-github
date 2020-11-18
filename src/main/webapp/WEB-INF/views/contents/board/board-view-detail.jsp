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
    <article style="overflow: auto">
        <div id="board-view-contents">
            ${boardInfo.contents}

        </div>
    </article>
    <article>
        <section style="text-align: center; padding: 20px;">
            <button class="btn btn-link-red dot-key" onclick="window.history.back();">뒤로 가기</button>
        </section>
    </article>
</section>