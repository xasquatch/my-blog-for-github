<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="mainContents" value="${requestScope.mainContents}"/>

<aside id="main-aside" class="aside-hide dot-key">
    <c:if test="${mainContents != 'members'
        && sessionMember.no != null && sessionMember.no != ''
        && !(mainContents.contains('check')||mainContents.contains('find'))}">
        <c:if test="${sessionMember.rank.contains('manager')}">
            <h2 style="font-weight: bold;">
                Members<BR>Management
            </h2>
            <hr>
            <ul class="nav nav-pills nav-stacked nav-pills-stacked-example">
                <li role="presentation">
                    <a href="${path}/notice/list">
                        <img style="width: 30px; height: auto;" src="${path}/img/banner-black/light-bulb.png">
                        공지 사항 관리
                    </a>
                </li>
                <li role="presentation">
                    <a href="${path}/${sessionMember.no}/management/users">
                        <img style="width: 30px; height: auto;" src="${path}/img/banner-black/members.png">
                        회원 목록
                    </a>
                </li>
                <li role="presentation">
                    <a href="${path}/board/all/list">
                        <img style="width: 30px; height: auto;" src="${path}/img/banner-black/all-boards.png">
                        전체 글 목록
                    </a>
                </li>
            </ul>
        </c:if>
        <c:if test="${sessionMember.no ne '' && sessionMember.no ne null}">
            <hr>
            <a class="dot-key btn btn-link-red" style="font-size: 20px"
               href="${path}/members/${sessionMember.no}">
                메인화면으로 이동<BR>
                (Members: 회원전용)
            </a>
            <hr>
        </c:if>
        <h2 style="font-weight: bold;">
            Notice
        </h2>
        <hr>
        <ul class="nav nav-pills nav-stacked nav-pills-stacked-example">
            <li role="presentation">
                <a href="${path}/notice/list">
                    <img style="width: 30px; height: auto;" src="${path}/img/banner-black/light-bulb.png">
                    공지 사항
                </a>
            </li>
            <li role="presentation">
                <a href="javascript:" onclick="changeFeedbackForm()">
                    <img style="width: 30px; height: auto;" src="${path}/img/banner-black/paper-plane.png">
                    피드백 보내기
                </a>
            </li>
        </ul>
        <h2 style="font-weight: bold;">
            블로그 관리
        </h2>
        <hr>
        <ul class="nav nav-pills nav-stacked nav-pills-stacked-example">
            <li role="presentation">
                <a href="${path}/board/${sessionMember.no}/create">
                    <img style="width: 30px; height: auto;" src="${path}/img/banner-black/writeBoard.png">
                    새 글 쓰기
                </a>
            </li>
            <li role="presentation">
                <a href="${path}/resource/${sessionMember.no}/create">
                    <img style="width: 30px; height: auto;" src="${path}/img/banner-black/add-resource.png">
                    새 저장소 만들기
                </a>
            </li>
            <li role="presentation">
                <a href="${path}/board/${sessionMember.no}/list">
                    <img style="width: 30px; height: auto;" src="${path}/img/banner-black/boardList.png">
                    내 글 목록
                </a>
            </li>
            <li role="presentation">
                <a href="${path}/resource/${sessionMember.no}/list">
                    <img style="width: 30px; height: auto;" src="${path}/img/banner-black/resource.png">
                    내 저장소 목록
                </a>
            </li>
        </ul>
        <h2 style="font-weight: bold;">
            마이 페이지
        </h2>
        <hr>
        <ul class="nav nav-pills nav-stacked nav-pills-stacked-example">
            <li role="presentation">
                <a href="${path}/members/${sessionMember.no}/api/clipboard">
                    <img style="width: 30px; height: auto;" src="${path}/img/banner-black/api.png">
                    My API
                </a>
            </li>
            <c:if test="${!sessionMember.name.equals('GUEST')}">
                <li role="presentation">
                    <a href="${path}/members/${sessionMember.no}/information">
                        <img style="width: 30px; height: auto;" src="${path}/img/banner-black/user.png">
                        내 정보
                    </a>
                </li>
            </c:if>
            <li role="presentation">
                <a href="${path}/html/sign-up/agreement.html" target="_blank">
                    <img style="width: 30px; height: auto;" src="${path}/img/banner-black/agreement.png">
                    서비스 약관
                </a>
            </li>
            <li role="presentation">
                <a href="${path}/html/sign-up/collection-and-use.html" target="_blank">
                    <img style="width: 30px; height: auto;" src="${path}/img/banner-black/collection-and-use.png">
                    개인정보 처리방침
                </a>
            </li>
        </ul>
    </c:if>
</aside>


<script>

    function changeFeedbackForm() {
        modal.changeForm('<div class="dot-key">피드백보내기</div>',
            '<form id="feedback-form">' +
            '<h5 class="dot-key">제목</h5>' +
            '<input class="form-control" type="text" name="feedbackTitle"' +
            'placeholder="제목을 입력해주세요" value="Send Feedback">' +
            '<h5 class="dot-key">피드백 내용</h5>' +
            '<textarea class="form-control" name="feedbackContents"' +
            ' style="resize: none; min-height: 200px;"' +
            'placeholder="상세한 내용을 작성해주세요:)"></textarea>' +
            '</form>')

        var confirmBtn = document.querySelector('#modal-confirm-btn');
        confirmBtn.setAttribute('onclick', 'sendFeedback();');

        $('#myModal').modal('show');
    }


    function sendFeedback() {
        if (window.confirm('작성한 피드백을 전송하시겠습니까?')) {
            var feedbackForm = document.querySelector('#feedback-form');
            var feedback = new FormData(feedbackForm);
            myAjax.submit('POST', '${path}/feedback/${sessionMember.no}', function (data) {

                if (data.includes('Failed')) {
                    switch (data) {
                        case 'Failed Check Session':
                            window.alert('[' + data + ']\n' + '세션정보가 일치하지않습니다.\n다시 로그인 후 시도해주시기바랍니다.');
                            break;
                        case 'Failed feedback':
                            window.alert('[' + data + ']\n' + '알 수 없는 원인으로 인해 전송에 실패하였습니다.\n 잠시 후 다시 시도해주세요');
                            break;
                    }
                } else {
                    window.alert('[' + data + ']\n' + '피드백 전송이 완료되었습니다');

                }
            }, "FORMFILE", feedback)

            $('#myModal').modal('hide');
        }
    }


</script>