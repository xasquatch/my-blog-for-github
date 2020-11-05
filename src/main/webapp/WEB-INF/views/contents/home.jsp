<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sForm" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<section id="home-banner" class="dot-key">

    <script>
        var banner = document.querySelector('#home-banner');
        banner.style.backgroundImage = 'url("${path}/img/가자.gif")';
        banner.style.backgroundPositionX = 'center';
        banner.style.backgroundRepeat = 'no-repeat';
        banner.style.backgroundSize = 'auto 30vh';
        banner.style.height = '30vh';
    </script>

</section>
<section class="wrap-min dot-key">


    <form class="form-horizontal" id="home-login" action="${path}/user/login" method="POST">
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
            <img class="xasquatch-btn-logo" src="${path}/img/oauth-img/Xasquatch.png" width="32" height="32"><BR>
            Sing Up
        </button>
    </div>

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
            '<form class="form-horizontal" id="user-signup" action="${path}/user/sign-up" method="POST"  enctype="multipart/form-data">                  ' +
            '<div class="input-group">                                                                                                                   ' +
            '<div class="input-group-addon">Email</div>                                                                                                  ' +
            '<input class="form-control" type="email" id="user-signup-email" name="email" placeholder="xxxxxxx@gmail.com" required onchange="CheckUsedEmail(this)">                                             ' +
            '<div class="form-control form-explain" id="user-signup-explain-email">승인코드를 보낼 Email을 입력해주세요</div>                                 ' +
            '</div>                                                                                                                                      ' +
            '<div class="input-group">                                                                                                                   ' +
            '<div class="input-group-addon">Password</div>                                                                                               ' +
            '<input class="form-control" type="password" id="user-signup-pwd" name="pwd" required placeholder="your Password" onchange="checkPwd(this)"> ' +
            '<input class="form-control" type="password" name="pwdConfirm" placeholder="Password Confirm" required onchange="confirmPwd(this)">          ' +
            '<div class="form-control form-explain" id="user-signup-explain-pwd">영문또는 숫자로 8~20자이내 입력해주세요</div>                   ' +
            '</div>                                                                                                                                      ' +
            '<div class="input-group">                                                                                                                   ' +
            '<div class="input-group-addon">Name</div>                                                                                                   ' +
            '<input class="form-control" type="text" name="name" placeholder="ex) Jordan" required onchange="checkName(this)">                           ' +
            '<div class="form-control form-explain" id="user-signup-explain-name">영문또는 숫자로 3~20자이내 입력해주세요</div>                   ' +
            '</div>                                                                                                                                      ' +
            '<div class="input-group">                                                                                                                   ' +
            '<div class="input-group-addon">Profile Image</div>                                                                                          ' +
            '<input type="file" class="form-control" onchange="addUploadImage(event)">                                                  ' +
            '<textarea class="hidden" id="imgFile" name="imgFile" ></textarea>                                                  ' +
            '<div class="form-control" id="user-signup-imageFit" style="height: auto;">                                                                                            ' +
            '<img id="user-signup-img" src="${path}/img/login/default-profile.png" alt="Default Image">                           ' +
            '</div>                                                                                                                                      ' +
            '</div>                                                                                                                                      ' +
            '<div class="input-group">                                                                                                                   ' +
            '<div class="input-group-addon">Agreement</div>                                                                                              ' +
            '<div class="form-control" style="height: auto;">                                                                                            ' +
            '<a class="btn-link" style="font-weight:bold;" target="_blank" href="${path}/html/sign-up/agreement.html" role="button">회원약관 [전문보기]</a><BR>                                       ' +
            '<label><input type="checkbox" id="user-signup-membersAgreement" name="membersAgreement" value="true" required>I agree</label>                                                                       ' +
            '<HR style="margin-top: 3px; margin-bottom: 3px;">                                                                                           ' +
            '<a class="btn-link" style="font-weight:bold;" target="_blank" href="${path}/html/sign-up/collection-and-use.html" role="button">개인정보 수집 및 이용 안내 [전문보기]</a><BR>              ' +
            '<label><input type="checkbox" id="user-signup-collectionAndUse" name="collectionAndUse" value="true" required>I agree</label>                                                                       ' +
            '</div>                                                                                                                                      ' +
            '</div>                                                                                                                                                                                            ' +
            '<input type="submit" class="hidden" id="user-signup-submit">                                                                       ' +
            '</form>');
        var confirmBtn = document.querySelector('#modal-confirm-btn');
        confirmBtn.setAttribute('onclick', 'ConfirmSignUp();');
    }

    function CheckUsedEmail(element) {
        var userEmailExplain = document.querySelector('#user-signup-explain-email');

        if (!isAvailableEmailRegExp(element.value)) {
            userEmailExplain.innerHTML = element.value + '은(는) 사용불가능한 이메일 형식입니다.';
            userEmailExplain.style.color = 'RED';
            element.value = '';
            return;
        }

        ajax.submit('POST', '${path}/user/sign-up/email', function (data) {
            if (data === 'true') {
                userEmailExplain.innerHTML = element.value + '은(는) 이미 존재하는 이메일계정입니다.';
                userEmailExplain.style.color = 'RED';
                element.value = '';

            } else {
                userEmailExplain.innerHTML = element.value + '은(는) 사용가능한 이메일계정입니다.';
                userEmailExplain.style.color = 'GREEN';

            }


        }, 'FORM', 'email=' + element.value);

    }

    function isAvailableEmailRegExp(data) {
        var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
        return regExp.test(data);
    }

    function checkPwd(element) {
        var userPwdExplain = document.querySelector('#user-signup-explain-pwd');

        if (!isAvailablePwdRegExp(element.value)) {
            userPwdExplain.innerHTML = element.value + '은(는) 사용불가능한 비밀번호 형식입니다. 영문또는 숫자로 8~20자이내 입력해주세요';
            userPwdExplain.style.color = 'RED';
            element.value = '';

        } else {
            userPwdExplain.innerHTML = '사용가능한 비밀번호입니다.';
            userPwdExplain.style.color = 'GREEN';

        }

    }

    function isAvailablePwdRegExp(data) {
        var regExp = /^[A-Za-z0-9]{8,20}$/;
        return regExp.test(data);
    }


    function confirmPwd(element) {
        var pwd = document.querySelector('#user-signup-pwd');
        var userPwdExplain = document.querySelector('#user-signup-explain-pwd');

        if (pwd.value === element.value) {
            userPwdExplain.innerHTML = '사용가능한 비밀번호, 일치하는 비밀번호입니다.';
            userPwdExplain.style.color = 'GREEN';

        } else {
            userPwdExplain.innerHTML = '비밀번호가 일치하지않습니다.';
            userPwdExplain.style.color = 'RED';
            element.value = '';
        }


    }

    function checkName(element) {
        var userNameExplain = document.querySelector('#user-signup-explain-name');

        if (!isAvailableNameRegExp(element.value)) {
            userNameExplain.innerHTML = element.value + '은(는) 사용불가능한 비밀번호 형식입니다. 영문또는 숫자로 3~20자이내 입력해주세요';
            userNameExplain.style.color = 'RED';
            element.value = '';

        } else {
            userNameExplain.innerHTML = '사용가능한 이름입니다.';
            userNameExplain.style.color = 'GREEN';

        }
    }


    function isAvailableNameRegExp(data) {
        var regExp = /^[A-Za-z0-9가-힣]{3,20}$/;
        return regExp.test(data);

    }

    function checkAgreement() {
        var membersAgreement = document.querySelector('#user-signup-membersAgreement');
        var collectionAndUse = document.querySelector('#user-signup-collectionAndUse');

        if (!membersAgreement.checked || !collectionAndUse.checked) return false;

    }

    function ConfirmSignUp() {
        if (checkAgreement() === false) {
            alert('이용약관에 동의해주시기바랍니다.')
            return;
        }

        document.querySelector('#user-signup-submit').click();

    }

    function addUploadImage(e) {
        var imgFit = document.querySelector('#user-signup-imageFit');
        for (var image of e.target.files) {
            var reader = new FileReader();
            reader.onload = function (event) {
                imgFit.innerHTML = '';
                var img = document.createElement('img');
                img.setAttribute('src', event.target.result);
                img.onload = function () {
                    var firstImg = resizeImg(this);
                    imgFit.innerHTML = '';
                    imgFit.appendChild(firstImg);
                    document.querySelector('#imgFile').innerText = imgFit.innerHTML;

                }

                imgFit.appendChild(img);


            };


            reader.readAsDataURL(image);
        }


    }

    function resizeImg(img) {

        var canvas = document.createElement("canvas");
        var MAX_SIZE = 150;
        var width = img.width;
        var height = img.height;

        if (width > height && width > MAX_SIZE) {
            height *= MAX_SIZE / width;
            width = MAX_SIZE;

        } else if (height > MAX_SIZE) {
            width *= MAX_SIZE / height;
            height = MAX_SIZE;

        }
        canvas.width = width;
        canvas.height = height;
        canvas.getContext("2d").drawImage(img, 0, 0, width, height);


        var resultImg = document.createElement("img");
        resultImg.setAttribute("src", canvas.toDataURL("image/png"));

        return resultImg;

    }


</script>