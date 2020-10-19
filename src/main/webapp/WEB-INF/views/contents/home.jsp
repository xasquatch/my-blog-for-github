<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sForm" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<section id="home-banner" class="dot-key">

    something special

</section>
<section class="wrap-min dot-key">


    <form class="form-horizontal" id="home-login">
        <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
            <div class="col-sm-10">
                <input type="email" class="form-control" id="inputEmail3" placeholder="Email" required>
            </div>
        </div>
        <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" id="inputPassword3" placeholder="Password" required>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <div class="checkbox">
                    <label>
                        <input type="checkbox"> Remember me
                    </label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">Sign in</button>
            </div>
        </div>
    </form>

    <div id="user-sign-contents">
        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal" onclick="oAuth(this);">
            <img class="xasquatch-btn-logo" src="${path}/img/oauth-img/google.png"><BR>
            &nbsp;Google&nbsp;
        </button>
        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal" onclick="oAuth(this);">
            <img class="xasquatch-btn-logo" src="${path}/img/oauth-img/GitHub-Mark-32px.png"><BR>
            &nbsp;Github&nbsp;
        </button>
        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal" onclick="oAuth(this);">
            <img class="xasquatch-btn-logo" src="${path}/img/oauth-img/facebook.png"> <BR>
            Facebook
        </button>
        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal" onclick="singUp();">
            <img class="xasquatch-btn-logo" src="${path}/favicon.ico" width="32" height="32"><BR>
            Sing Up
        </button>
    </div>

    <form>


    </form>

</section>

<script>

    function oAuth(target) {
//회원인지 확인먼저 필요(미구현)

        modal.changeForm('Sign Up',
            '<form class="form-horizontal" id="user-signup" action="${path}/user/sign-up" method="POST">                                                 ' +
            '<div align="center">                                                                                                                   ' +
            target.innerHTML +
            '</div>                                                                                                                   ' +
            '<div class="input-group">                                                                                                                   ' +
            '<div class="input-group-addon">Agreement</div>                                                                                              ' +
            '<div class="form-control" style="height: auto;">                                                                                            ' +
            '<a class="btn-link" style="font-weight:bold;" target="_blank" href="${path}/html/sign-up/agreement.html" role="button">회원약관 [전문보기]</a><BR>                                       ' +
            '<label><input type="checkbox" name="membersAgreement">I agree</label>                                                                       ' +
            '<HR style="margin-top: 3px; margin-bottom: 3px;">                                                                                           ' +
            '<a class="btn-link" style="font-weight:bold;" target="_blank" href="${path}/html/sign-up/collection-and-use.html" role="button">개인정보 수집 및 이용 안내 [전문보기]</a><BR>              ' +
            '<label><input type="checkbox" name="collectionAndUse">I agree</label>                                                                       ' +
            '</div>                                                                                                                                      ' +
            '</div>                                                                                                                                      ' +
            '</form>');
        var confirmBtn = document.querySelector('#modal-confirm-btn');
        confirmBtn.setAttribute('onclick', 'ConfirmSignUp();');

    }

    function singUp() {
        modal.changeForm('Sign Up',
            '<form class="form-horizontal" id="user-signup" action="${path}/user/sign-up" method="POST" enctype="multipart/form-data">                   ' +
            '<div class="input-group">                                                                                                                   ' +
            '<div class="input-group-addon">Email</div>                                                                                                  ' +
            '<input class="form-control" type="email" name="email" placeholder="xxxxxxx@gmail.com" required>                                             ' +
            '</div>                                                                                                                                      ' +
            '<div class="input-group">                                                                                                                   ' +
            '<div class="input-group-addon">Password</div>                                                                                               ' +
            '<input class="form-control" type="password" id="user-signup-pwd" name="pwd" required placeholder="your Password">                           ' +
            '<input class="form-control" type="password" name="pwdConfirm" placeholder="Password Confirm" required onchange="confirmPwd(this)">          ' +
            '</div>                                                                                                                                      ' +
            '<div class="input-group">                                                                                                                   ' +
            '<div class="input-group-addon">Name</div>                                                                                                   ' +
            '<input class="form-control" type="text" name="name" placeholder="ex) Jordan" required>                                                      ' +
            '</div>                                                                                                                                      ' +
            '<div class="input-group">                                                                                                                   ' +
            '<div class="input-group-addon">Profile Image</div>                                                                                          ' +
            '<input type="file" class="form-control" name="img" onchange="addUploadImage(event, this)">                                                  ' +
            '<div class="form-control" style="height: auto;">                                                                                            ' +
            '<img id="user-signup-img" src="${path}/img/login/default-profile.png" alt="Default Image" style="max-width:100%">                           ' +
            '</div>                                                                                                                                      ' +
            '</div>                                                                                                                                      ' +
            '<div class="input-group">                                                                                                                   ' +
            '<div class="input-group-addon">Agreement</div>                                                                                              ' +
            '<div class="form-control" style="height: auto;">                                                                                            ' +
            '<a class="btn-link" style="font-weight:bold;" target="_blank" href="${path}/html/sign-up/agreement.html" role="button">회원약관 [전문보기]</a><BR>                                       ' +
            '<label><input type="checkbox" name="membersAgreement" required>I agree</label>                                                                       ' +
            '<HR style="margin-top: 3px; margin-bottom: 3px;">                                                                                           ' +
            '<a class="btn-link" style="font-weight:bold;" target="_blank" href="${path}/html/sign-up/collection-and-use.html" role="button">개인정보 수집 및 이용 안내 [전문보기]</a><BR>              ' +
            '<label><input type="checkbox" name="collectionAndUse" required>I agree</label>                                                                       ' +
            '</div>                                                                                                                                      ' +
            '</div>                                                                                                                                                                                            ' +
            '</form>');
        var confirmBtn = document.querySelector('#modal-confirm-btn');
        confirmBtn.setAttribute('onclick', 'signUpAjax();');
    }

    function confirmPwd(element) {
        var pwd = document.querySelector('#user-signup-pwd');
        if (pwd.value === element.value) {
        } else {
            element.value = '';
        }


    }


    function addUploadImage(event, element) {
        var reader = new FileReader();
        reader.onload = function (event) {
            var img = document.querySelector('#user-signup-img');
            img.setAttribute('src', event.target.result);
            element.setAttribute('src', event.target.result);
        };
        reader.readAsDataURL(event.target.files[0]);
        console.log(element);

    }

    function ConfirmSignUp() {
        document.querySelector("#user-signup").submit();

    }

    function serializedForm(targetForm) {
        var aParams = new Array();

        for (var i = 0; i < targetForm.elements.length; i++) {
            var data = encodeURIComponent(targetForm.elements[i].name);
            data += "=";
            data += encodeURIComponent(targetForm.elements[i].value);
            aParams.push(data)
        }

        return aParams.join("&");
    }


    function signUpAjax() {
        ajax.submit('POST', '${path}/user/sign-up', '', function (result) {

            alert(result);

        }, serializedForm(document.querySelector("#user-signup")));

    }

</script>