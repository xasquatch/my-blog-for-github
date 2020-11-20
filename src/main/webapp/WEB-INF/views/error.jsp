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
    textScript.insertText('#error-explain',
        '${requestScope.error}<BR>알 수 없는 원인으로<BR> 페이지를 찾지 못하였습니다.<BR> 잠시 후 다시 시도해주세요.',1,);

</script>
