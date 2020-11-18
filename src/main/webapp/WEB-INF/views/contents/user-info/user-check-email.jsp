<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<section class="wrap-min">
    <form class="form-horizontal" id="email-auth-form">
        <div id="check-pwd-explain" class="dot-key" style="font-size: 3rem;">
            <script>
                window.onload = function () {
                    textScript.insertText('#check-pwd-explain', '[Confirm Email]<BR>${requestScope.email}로<BR>전송된 인증번호를<BR>입력해주세요<hr>', 1);

                }
            </script>
        </div>
        <div style="text-align: center;">
            <div class="input-group form-group-lg">
                <div class="input-group-addon dot-key">Token</div>
                <input type="text" class="form-control" name="authorizationToken" placeholder="000000">
            </div>
            <hr>
            <button class="btn btn-link-red dot-key" style="font-size: 7rem;" type="button" onclick="submitToken();">CHECK!</button>
        </div>
    </form>
</section>
<script>
    function submitToken() {
        var authForm = document.querySelector("#email-auth-form");
        var authFormData = new FormData(authForm);
        ajax.submit('PATCH', '${path}/user/${sessionMember.no}/auth-email', function (data) {
            if (data === 'true') {
                window.alert('인증에 성공하였습니다. 다시 로그인해주세요.');
                window.location.href = '${path}/user/${sessionMember.no}/log-out';

            } else if (data === 'false') {
                window.alert('[인증 실패] 새로 인증요청을 진행합니다. 다시 시도해주세요.');
                window.location.href = '${path}/user/${sessionMember.no}/check-email';

            }

        }, 'FORMFILE', authFormData);

    }
</script>