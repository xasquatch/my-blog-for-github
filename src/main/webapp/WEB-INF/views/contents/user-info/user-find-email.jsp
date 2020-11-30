<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<section class="wrap-min">
    <form class="form-horizontal" id="search-email-form">
        <div id="search-email-explain" class="dot-key" style="font-size: 3rem;">
            <script>
                window.onload = function () {
                    textScript.insertText('#search-email-explain', '[Search Email]<BR>회원가입시 등록하였던 이름을<BR>입력해주세요<hr>', 1);
                }
            </script>
        </div>
        <div style="text-align: center;">
            <div class="input-group form-group-lg">
                <div class="input-group-addon dot-key">Name</div>
                <input type="text" class="form-control" id="search-email-input" name="name" placeholder="Jhon">
            </div>
            <hr>
            <button class="btn btn-link-red dot-key" style="font-size: 7rem;" type="button" onclick="searchEmail()">Search!</button>
        </div>
    </form>
</section>
<script>

    document.querySelector('#search-email-input').addEventListener('keypress', function (e) {
        if (e.keyCode === 13) {
            e.preventDefault();
            searchEmail();
        }
    })

    function searchEmail() {

        var searchEmailForm = document.querySelector('#search-email-form');
        var searchFormData = new FormData(searchEmailForm)

        myAjax.submit('POST', '${path}/members/search/email', function (data) {
            if (data !== ''){
                window.alert('회원님의 이메일은 \"' + data + '\"입니다.');

            }else{
                window.alert('존재하지 않는 이름입니다.');

            }

        }, 'FORMFILE', searchFormData)

    }

</script>