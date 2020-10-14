<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<aside id="main-aside" class="forward-to-top">
    <a href="javascript:alert('hi')">greet</a>


</aside>

<script>
    function popUpAside() {
        document.querySelector('#main-aside').classList.toggle('forward-to-top');
    }

</script>