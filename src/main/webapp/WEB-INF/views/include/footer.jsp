<%@ page import="net.xasquatch.myblog.model.Member" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

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
        if (${sessionMember.no eq null}) return window.alert('로그인 후 이용해주시기바랍니다.');
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


    // ---header
    window.addEventListener('DOMContentLoaded', function () {

        textScript.insertText('#main-header-logo', 'My Blog', 20);

    });

    // ---aside
    var mainAside = document.querySelector('#main-aside');

    function popUpAside() {
        mainAside.classList.toggle('aside-hide');
    }

    var aTags = document.querySelectorAll('a');
    for (var aTag of aTags) {
        var href = aTag.href;
        var target = aTag.target;

        if (href != null && href !== 'undefined'
            && href.indexOf('javascript:') === -1 && href.indexOf('#') === -1
            && target !== '_blank') {
            aTag.addEventListener('click', function () {
                footerEffect.addLoadingState();
                setTimeout(function (event) {
                    footerEffect.removeLoadingState();
                }, 3000)

            });
        }
    }

</script>


<!-- Modal -->
<div class="modal fade dot-key" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel"></h4>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">
                <button type="button" id="modal-close-btn" class="btn btn-default" data-dismiss="modal" onclick="modal.changeForm('','');">Close</button>
                <button type="button" id="modal-confirm-btn" class="btn btn-danger">Confirm</button>
            </div>
        </div>
    </div>
</div>

<div id="main-footer-proto">
    &nbsp;
</div>
<footer id="main-footer" class="dot-key">
    <img src="${path}/img/loading.gif">
    Develop by Xasquatch, https://xasquatch.net
    <div>
        <c:if test="${requestScope.errorMsg ne null && requestScope.errorMsg ne ''}">
            <script>
                window.onload = function () {
                    <c:choose>
                    <c:when test="${sessionMember.no eq null}">
                    window.history.replaceState(null, null, '${path}/members');

                    </c:when>
                    <c:otherwise>
                    window.history.replaceState(null, null, '${path}/members/${sessionNo}');

                    </c:otherwise>
                    </c:choose>
                    footerEffect.addFooterState();
                }
            </script>
            <div>
                    ${requestScope.errorMsg}<BR>
                <a class="dot-key btn btn-link-red" href="javascript:footerEffect.removeFooterState();">Close</a>
            </div>
        </c:if>
    </div>
</footer>

<%--custom script--%>
<script src="${path}/js/myblog-api.js"></script>
<script src="${path}/js/script.js"></script>
<%--END: custom script--%>
</body>
</html>
