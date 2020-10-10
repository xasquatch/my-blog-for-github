<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="include/header.jsp"/>

<jsp:include page="contents/home.jsp"/>
<img src="${path}/img/Xasquatch.png"/>
<jsp:include page="include/footer.jsp"/>