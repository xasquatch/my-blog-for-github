<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<section class="wrap-min">
    <form class="form-horizontal" id="search-pwd-form">
        <div id="search-pwd-explain" class="dot-key" style="font-size: 3rem;">
            <script>
                window.onload = function () {
                    textScript.insertText('#search-pwd-explain', '[Search pwd]<BR>회원가입시 등록하였던 이름을<BR>입력해주세요<hr>', 1);
                }
            </script>
        </div>
        <div style="text-align: center;">
            <div class="input-group form-group-lg">
                <div class="input-group-addon dot-key" style="width: 100px;">email</div>
                <input type="email" class="form-control" id="search-pwd-input-email" name="email" placeholder="xxxxx@xxxx.com">
            </div>
            <div class="input-group form-group-lg">
                <div class="input-group-addon dot-key" style="width: 100px;">Name</div>
                <input type="text" class="form-control" id="search-pwd-input-name" name="name" placeholder="Jhon">
            </div>
            <hr>
            <button class="btn btn-link-red dot-key" style="font-size: 7rem;" type="button" onclick="searchPwd()">Search!</button>
        </div>
    </form>
</section>
<script>

    document.querySelector('#search-pwd-input-name').addEventListener('keypress', function (e) {
        if (e.keyCode === 13) {
            e.preventDefault();
            searchPwd();
        }
    })

    function searchPwd() {

        var searchPwdInputName = document.querySelector('#search-pwd-input-name');
        var searchPwdForm = document.querySelector('#search-pwd-form');
        var searchFormData = new FormData(searchPwdForm)

        ajax.submit('POST', '${path}/user/search/password', function (data) {
            if (data !== 'false'){
                window.alert('\"'+searchPwdInputName.value+'\"으로 임시 비밀번호를 전송하였습니다.')
                
            }else{
                window.alert('등록되지 않은 회원정보입니다. 입력한 양식을 다시 확인해주세요')

            }

        }, 'FORMFILE', searchFormData);

    }

</script>