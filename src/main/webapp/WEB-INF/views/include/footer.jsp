<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<script>
    // ---header
    window.addEventListener('DOMContentLoaded', function () {

        textScript.insertText('#main-header-logo', 'My Blog', 20);

    });

    // ---aside
    var mainAside = document.querySelector('#main-aside');

    function popUpAside() {
        mainAside.classList.toggle('forward-to-top');
        mainAside.style.marginTop = 0;
    }

/*
    window.addEventListener('scroll', function () {
        if (mainAside.classList.contains('forward-to-top')) {
            mainAside.style.marginTop = window.pageYOffset;
        }
    });
*/

    var aTags = document.querySelectorAll('a');
    for (var aTag of aTags) {
        var href = aTag.href;
        var target = aTag.target;

        if (href != null && href !== 'undefined'
            && href.indexOf('javascript:') === -1 && href.indexOf('#') === -1
            && target !== '_blank') {
            aTag.addEventListener('click', function () {
                footerEffect.addLoadingState();
                setTimeout(function (event) {
                    footerEffect.removeLoadingState();
                },3000)

            });
        }
    }

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
</body>
</html>
