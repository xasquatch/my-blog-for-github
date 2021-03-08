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
                                <a href="javascript:board.GoModify(${board.mbr_no}, ${board.no},'${sessionMember.name}')">
                                    <span class="glyphicon glyphicon-pencil"></span>
                                </a>
                                <a href="javascript:board.delete(${board.mbr_no}, ${board.no},'${sessionMember.name}')">
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
            <c:if test="${sessionMember ne null}">
                <tr class="dot-key">
                    <td width="200" style="text-align: center;">
                        <img style="max-width: 140px; max-height: 140px;" src="${sessionMember.img}" onerror="this.src = '${path}/img/login/default-profile.png';">
                        <BR>
                            ${sessionMember.name}
                    </td>
                    <td colspan="5">
                        <form id="comment-form">
                            <div style="display: grid; grid-template-columns: 1fr 100px; min-height: 200px;">
                                <textarea class="form-control" name="contents" minlength="3" maxlength="220" style="height: 100%; width: 100%; resize: none;"></textarea>
                                <button class="btn btn-link-red dot-key" type="button" onclick="createBoardComment();">댓글 등록</button>
                            </div>
                        </form>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <BR><BR>
                    </td>
                </tr>
            </c:if>
            </thead>
            <tbody id="comment-list-table">
            <%--댓글삽입--%>
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

<script>
    function createBoardComment() {
        var commentForm = document.querySelector('#comment-form');

        var writerExplainMessage = '작성에 실패하였습니다\n' +
            ' 1. 3~255자 이내로 입력가능합니다\n' +
            ' 2. html태그는 사용하실 수 없습니다.';

        var commentContents = commentForm.querySelector('textarea[name="contents"]');
        if (commentContents.value.length < 3 || commentContents.value.length > 255) {
            window.alert(writerExplainMessage);
            return;

        }

        var formData = new FormData(commentForm);

        if ('${sessionMember.name}' === 'GUEST') {
            var pwd = window.prompt('비밀번호를 설정해주세요.\n (기본값: 0000)', '0000');
            if (pwd === null) return;
            formData.append("pwd", pwd);

        }

        myAjax.submit('POST', "${path}/board/${board.no}/comments", function (data) {
            if (data === 'false') {
                alert('댓글작성에 실패하였습니다. 잠시 후 다시 시도해주시기바랍니다');

            } else {
                commentContents.value = '';
                getCommentList();

            }

        }, 'FORMFILE', formData);
    }

    function deleteBoardComment(url) {
        var pwd = '0000';

        if (!window.confirm('정말 삭제를 진행하시겠습니까?')) return;

        if ('${sessionMember.name}' === 'GUEST')
            pwd = window.prompt('GUEST: 설정하였던 비밀번호를 입력해주세요.', '0000');

        myAjax.submit('DELETE', url + "?pwd=" + pwd, function (data) {
            if (data === 'false') {
                window.alert('삭제 실패: 틀린 비밀번호');

            } else {
                getCommentList();

            }

        });
    }

    function getCommentList() {
        myAjax.submit('GET', "${path}/api/members/${board.mbr_no}/boards/${board.no}/comments", function (data) {
            var dataList = JSON.parse(data);
            var commentListTable = document.querySelector('#comment-list-table');
            commentListTable.innerHTML = '';

            for (var comment of dataList) {
                var trTag = document.createElement('tr');
                var tdProfileTag = document.createElement('td');
                tdProfileTag.width = '200';
                tdProfileTag.style.textAlign = 'center';
                tdProfileTag.innerHTML =
                    '<img style="max-width: 140px; max-height: 140px;" src="' + comment.img + '"' +
                    'onerror="this.src = \'${path}/img/login/default-profile.png\';"><BR>'
                    + comment.mbr_name + '<BR>'
                    + comment.created_ip + '<BR>' + comment.created_date;

                var tdContentsTag = document.createElement('td');
                tdContentsTag.style.verticalAlign = 'middle';
                tdContentsTag.innerHTML = comment.contents;

                var tdDeleteTag = document.createElement('td');
                tdDeleteTag.width = '50';
                tdDeleteTag.style.verticalAlign = 'middle';

                var sessionNo = ${sessionMember.no} +0;
                if (sessionNo === comment.mbr_no)
                    tdDeleteTag.innerHTML = '<a href="javascript:deleteBoardComment(\'${path}\/board\/${board.no}\/members\/${sessionMember.no}\/comments\/' + comment.no + '\')">삭제</a>';


                commentListTable.appendChild(trTag);
                trTag.appendChild(tdProfileTag);
                trTag.appendChild(tdContentsTag);
                trTag.appendChild(tdDeleteTag);

            }


        });
    }

    window.onload = function () {

        getCommentList();
    }
</script>