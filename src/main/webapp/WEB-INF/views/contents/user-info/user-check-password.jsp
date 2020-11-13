<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<section class="wrap-min">
    <form class="form-horizontal" action="${path}/user/${sessionMember.no}/information" method="POST">
        <div id="check-pwd-explain" class="dot-key" style="font-size: 7vw;">
            <script>
                window.onload =function (){
                    textScript.insertText('#check-pwd-explain', '[Confirm Password]<BR>비밀번호를 입력해주세요', 1);

                }
            </script>
        </div>
        <div style="text-align: center;">
            <div class="input-group">
                <div class="input-group-addon dot-key">Password</div>
                <input type="password" class="form-control" name="checkPassword" placeholder="your Password">
            </div>
            <button class="btn btn-link dot-key" style="font-size: 7rem;" type="submit">CHECK!</button>
        </div>
    </form>
</section>