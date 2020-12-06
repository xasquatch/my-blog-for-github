<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<script>
// ---header
    window.addEventListener('DOMContentLoaded', function () {

        textScript.insertText('#main-header-logo', 'My Blog', 20);
        textScript.insertText('#header-center','현재 테스트중인 서버입니다.',1);

    });

// ---aside
    var mainAside = document.querySelector('#main-aside');

    function popUpAside() {
        mainAside.classList.toggle('forward-to-top');
        mainAside.style.marginTop = 0;
    }

    // css sticky 속성이 부모태그가 그리드인 상태에서는 적용되지가 않아서
    // TOP padding값을 주는 것으로 sticky 구현
    window.addEventListener('scroll', function () {
        if (mainAside.classList.contains('forward-to-top')) {
            mainAside.style.marginTop = window.pageYOffset;
        }
    });

</script>


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
    <div></div>
</footer>

<%--custom script--%>
<script src="${path}/js/myblog-api.js"></script>
<script src="${path}/js/script.js"></script>
<%--END: custom script--%>
<script src="https://apis.google.com/js/platform.js" async defer></script>
</body>
</html>
