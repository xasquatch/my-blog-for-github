<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<section>
    <h2>Title</h2>
    <kbd><%=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()) %>
    </kbd>
    <HR>
    <div id="board-view-contents">

        <jsp:include page="../TestBoardContents.jsp"/>


    </div>
</section>