<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<section id="myblog-main-section">
    <article id="board-details">
        <table class="table table-responsive table-hover">
            <thead>
            <tr>
                <th class="dot-key" colspan="2">
                    <section style="display: flex; justify-content: space-between;">
                        <h1>${board.title}</h1>
                        <c:if test="${sessionMember.rank eq 'manager' || sessionMember.no eq board.mbr_no}">
                            <h3>
                                <a href="javascript:board.GoModify(${board.mbr_no}, ${board.no})">
                                    <span class="glyphicon glyphicon-pencil"></span>
                                </a>
                                <a href="javascript:board.delete(${board.mbr_no}, ${board.no})">
                                    <span class="glyphicon glyphicon-trash"></span>
                                </a>
                            </h3>
                        </c:if>
                    </section>
                </th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td class="dot-key" style="width: 100px">게시판 ID</td>
                <td><kbd>${board.no}</kbd></td>
            </tr>
            <tr>
                <td class="dot-key">키워드</td>
                <td><kbd>${board.keyword}</kbd></td>
            </tr>
            <tr>
                <td class="dot-key">작성일자</td>
                <td><kbd>${board.created_date}</kbd></td>
            </tr>
            <tr>
                <td class="dot-key">IP</td>
                <td><kbd>${board.created_ip}</kbd></td>
            </tr>
            <tr>
                <td class="dot-key">미리보기</td>
                <td>${board.thumbnail}</td>
            </tr>
            </tbody>
        </table>
    </article>
    <article id="board-contents" style="padding: 10px">
        ${board.contents}
    </article>
    <article style="text-align: center; padding: 20px;">
        <button class="btn btn-link-red dot-key" onclick="window.history.back();">뒤로 가기</button>
    </article>
    <article>
        <table class="table table-hover table-condensed">
            <thead>
            <tr class="dot-key">
                <td width="200" style="text-align: center;">
                    <img style="max-width: 140px; max-height: 140px;" src="https://myblog.xasquatch.net/img/no_image.png">
                    <BR>
                    xasquatch masive
                </td>
                <td colspan="5">
                    <form>
                        <div style="display: grid; grid-template-columns: 1fr 100px; min-height: 200px;">
                            <textarea class="form-control" style="height: 100%; width: 100%; resize: none;"></textarea>
                            <button class="btn btn-link-red dot-key" type="button">댓글 등록</button>
                        </div>
                    </form>
                </td>
            </tr>
            <tr>
                <td colspan="5">
                    <BR><BR>
                </td>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td width="200" style="text-align: center;">
                    <a href="#">
                        <img style="max-width: 140px; max-height: 140px;" src="https://myblog.xasquatch.net/img/no_image.png">
                        <BR>
                        xasquatch masive
                    </a>
                    <div style="font-size: 0.8em;">
                        127.0.0.1
                    </div>
                    <div style="font-size: 0.8em;">
                        2021.01.25 11:11:11
                    </div>
                </td>
                <td style="vertical-align: middle;">dlfjskldjfklasjdfklasjdlfjaklsfjklsd</td>
                <td width="50" style="vertical-align: middle;">답글</td>
                <td width="50" style="vertical-align: middle;">삭제</td>

<%--          TODO:foreach중 if문 분기
      <td width="50" colspan="2" style="vertical-align: middle;">답글</td>--%>

            </tr>
            </tbody>
            <tfoot>
            <tr>
                <td colspan="5" style="text-align: center;">
                    1
                </td>
            </tr>
            </tfoot>
        </table>
    </article>
    <hr>
    <article style="text-align: center; padding: 20px;">
        <button class="btn btn-link-red dot-key" onclick="window.scroll(0,0);">맨 위로</button>
    </article>
</section>