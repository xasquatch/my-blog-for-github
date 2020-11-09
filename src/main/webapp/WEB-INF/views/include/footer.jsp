<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>


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

<c:if test="${requestScope.systemMsg != null}">
    <script>
        window.alert('${requestScope.systemMsg}');
        <c:if test="${requestScope.locationPage != null}">
        location.href='${path}${requestScope.locationPage}';
        </c:if>
    </script>
</c:if>


<div id="main-footer-proto">
    &nbsp;
</div>
<footer id="main-footer" class="dot-key">
    <img src="${path}/img/loading.gif">
    Develop by Xasquatch, https://xasquatch.net
</footer>

<%--custom script--%>
<script src="${path}/js/script.js"></script>
<%--END: custom script--%>
</body>
</html>
