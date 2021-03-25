<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="include/header.jsp"/>
<section class="error-body">
    <section id="error-section" class="dot-key">
        <div>
            ERROR
        </div>
        <div id="error-explain">

        </div>
    </section>
</section>
<jsp:include page="include/footer.jsp"/>
<script>
    textScript.insertText('#error-explain', '예상치 못한 오류가 발생하였습니다.<BR>' +
        '계정 로그인 후<BR>' +
        '오류가 발생하게된 과정을 피드백주시면 빠른 시간내에 조치드리겠습니다<BR>', 1, function (event) {
        document.querySelector('#error-explain').innerHTML += '<BR><BR><a href="javascript:;" onclick="changeFeedbackForm();">' +
            '<img src="${path}/img/banner-white/paper-plane.png" style="max-height : 100px; max-width:100px;"><BR>' +
            '피드백보내기' +
            '</a>'

    });

</script>
