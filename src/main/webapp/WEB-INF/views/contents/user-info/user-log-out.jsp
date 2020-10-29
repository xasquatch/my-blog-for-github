<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<script>
    window.alert('정상적으로 로그아웃완료되었습니다.');
    window.location.href = '${path}/';

</script>