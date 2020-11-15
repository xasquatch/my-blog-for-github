<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<section class="wrap-min">
    <form class="form-horizontal" action="${path}/user/${sessionMember.no}/check-email" method="POST">
        <div id="check-pwd-explain" class="dot-key" style="font-size: 3rem;">
            <script>
                window.onload =function (){
                    textScript.insertText('#check-pwd-explain', '[Change Email]<BR>${requestScope.msg}<BR>변경할 이메일을<BR>입력해주세요<hr>', 1);
                }
            </script>
        </div>
        <div style="text-align: center;">
            <div class="input-group form-group-lg">
                <div class="input-group-addon dot-key">Email</div>
                <input type="email" class="form-control" name="checkEmail" placeholder="${sessionMember.email}">
            </div>
            <hr>
            <button class="btn btn-link dot-key" style="font-size: 7rem;" type="submit">CHECK!</button>
        </div>
    </form>
</section>