<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sForm" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<section class="banner login-banner dot-key">

    <script>
        var banner = document.querySelector('.banner');
        banner.style.backgroundImage = 'url("${path}/img/banner/11.gif")';
        /*
                var bannerCount = 1;
                setInterval(function () {
                    var xhrBanner = new XMLHttpRequest();
                    xhrBanner.onreadystatechange = function () {
                        if (xhrBanner.readyState === xhrBanner.DONE) {
                            if (xhrBanner.status === 200 || xhrBanner.status === 201) {

                                banner.style.backgroundImage = 'url("${path}/img/banner/' + bannerCount + '.gif")';
                        bannerCount++;
                    } else {

                        banner.style.backgroundImage = 'url("${path}/img/banner/1.gif")';
                        bannerCount = 1;

                    }
                }
            };
            xhrBanner.open('GET', '${path}/img/banner/' + bannerCount + '.gif');
            xhrBanner.send();

        }, 3000)
*/

    </script>

</section>
<section class="wrap-min dot-key">


    <form class="form-horizontal" id="home-login">
        <div class="form-group">
            <label for="home-login-email" class="col-sm-2 control-label">Email</label>
            <div class="col-sm-10">
                <input type="email" class="form-control" id="home-login-email" name="email" placeholder="Email">
                <script>
                    <%--로그인 이메일 정보 로컬스토리지에서 로드--%>
                    document.querySelector('#home-login-email').value = localStorage.getItem('homeLoginEmail');
                </script>
            </div>
        </div>
        <div class="form-group">
            <label for="home-login-pwd" class="col-sm-2 control-label">Password</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" id="home-login-pwd" name="pwd" placeholder="Password">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" id="home-login-checkbox"> Remember me
                    </label>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <label>
                    <a href="${path}/members/find/email" target="_blank" class="btn btn-link-red" tabindex="-1">이메일 찾기</a>
                </label>
                <label>
                    <a href="${path}/members/find/password" target="_blank" class="btn btn-link-red" tabindex="-1">비밀번호 찾기</a>
                </label>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button class="btn btn-link-red" type="button" onclick="loginInput()" style="">
                    <h2 style="margin: 0;">Log In</h2>
                </button>
            </div>
        </div>
    </form>
    <BR>
    <div id="user-sign-contents">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="button" class="btn btn-link-red" style="width: 75px;" onclick="oAuth.google.signInAndUp(this)">
                <img class="xasquatch-btn-logo" src="${path}/img/oauth-img/google.png" width="32" height="32"><BR>
                Google
            </button>
            <button type="button" class="btn btn-link-red" style="width: 75px;"
                    data-toggle="modal" data-target="#myModal" onclick="singUp();">
                <img class="xasquatch-btn-logo" src="${path}/img/oauth-img/Xasquatch.png" width="32" height="32"><BR>
                Sing Up
            </button>
        </div>
    </div>
</section>
<script>

    document.querySelector('#home-login-pwd').addEventListener('keypress', function (e) {
        if (e.keyCode === 13) loginInput();
    })

    function loginInput() {
        var loginEmail = document.querySelector('#home-login-email');
        if (isAvailableEmailRegExp(loginEmail.value)) {
            var checkbox = document.querySelector('#home-login-checkbox');
            if (checkbox.checked === true) localStorage.setItem('homeLoginEmail', loginEmail.value);

            var loginForm = document.querySelector('#home-login');
            var formData = new FormData(loginForm);
            myAjax.submit('POST', '${path}/members/login', function (data) {

                if (data === 'false') {
                    window.alert('로그인에 실패하였습니다. email, password를 확인해주세요');

                } else if (url.isContainWord(data, '/check-email')) {
                    window.location.href = '${path}' + data;

                } else {
                    window.location.replace('${path}/');

                }

            }, 'FORMFILE', formData);

        } else {
            window.alert('이메일을 다시 확인해주세요');
        }

    }

    function singUp() {
        modal.changeForm('Sign Up',
            '<form class="form-horizontal" id="user-signup">                                                                                             ' +
            '<div class="input-group">                                                                                                                   ' +
            '<div class="input-group-addon">Email</div>                                                                                                  ' +
            '<input class="form-control" type="email" id="user-signup-email" name="email" placeholder="xxxxxxx@gmail.com" required onchange="CheckUsedEmail(this)">' +
            '<div class="form-control form-explain" id="user-signup-explain-email">승인코드를 보낼 Email을 입력해주세요</div>                                 ' +
            '</div>                                                                                                                                      ' +
            '<div class="input-group">                                                                                                                   ' +
            '<div class="input-group-addon">Password</div>                                                                                               ' +
            '<input class="form-control" type="password" id="user-signup-pwd" name="pwd" required placeholder="your Password" onchange="checkPwd(this)"> ' +
            '<input class="form-control" type="password" name="pwdConfirm" placeholder="Password Confirm" required onchange="confirmPwd(this)">          ' +
            '<div class="form-control form-explain" id="user-signup-explain-pwd">영문또는 숫자로 8~20자이내 입력해주세요</div>                                 ' +
            '</div>                                                                                                                                      ' +
            '<div class="input-group">                                                                                                                   ' +
            '<div class="input-group-addon">Nick Name</div>                                                                                              ' +
            '<input class="form-control" type="text" name="name" placeholder="ex) Jordan" required onchange="checkName(this)">                           ' +
            '<div class="form-control form-explain" id="user-signup-explain-name">영문또는 숫자로 3~20자이내 입력해주세요</div>                                ' +
            '</div>                                                                                                                                      ' +
            '<div class="input-group">                                                                                                                   ' +
            '<div class="input-group-addon">Profile<BR>Image</div>                                                                                       ' +
            '<input type="file" class="form-control" onchange="addUploadImage(event)">                                                                   ' +
            '<textarea class="hidden" id="imgFile" name="imgFile" ></textarea>                                                                           ' +
            '<div class="form-control" id="user-signup-imageFit" style="height: auto;">                                                                  ' +
            '<img id="user-signup-img" src="${path}/img/login/default-profile.png" alt="Default Image">                                                  ' +
            '</div>                                                                                                                                      ' +
            '<div class="form-control form-explain">업로드된 파일은 PNG확장자로 사이즈 자동리사이징 되어 저장됩니다.</div>                                         ' +
            '</div>                                                                                                                                      ' +
            '<div class="input-group">                                                                                                                   ' +
            '<div class="input-group-addon">Agreement</div>                                                                                              ' +
            '<div class="form-control" style="height: auto;">                                                                                            ' +
            '<a class="btn-link" style="font-weight:bold;" target="_blank" href="${path}/html/sign-up/agreement.html" role="button">회원약관 [전문보기]</a><BR>' +
            '<label><input type="checkbox" id="user-signup-membersAgreement" name="membersAgreement" value="true" required>I agree</label>               ' +
            '<HR style="margin-top: 3px; margin-bottom: 3px;">                                                                                           ' +
            '<a class="btn-link" style="font-weight:bold;" target="_blank" href="${path}/html/sign-up/collection-and-use.html" role="button">개인정보 수집 및 이용 안내 [전문보기]</a><BR>' +
            '<label><input type="checkbox" id="user-signup-collectionAndUse" name="collectionAndUse" value="true" required>I agree</label>               ' +
            '</div>                                                                                                                                      ' +
            '</div>                                                                                                                                      ' +
            '<input type="submit" class="hidden" id="user-signup-submit">                                                                                ' +
            '</form>');
        var confirmBtn = document.querySelector('#modal-confirm-btn');
        confirmBtn.setAttribute('onclick', 'confirmSignUp();');
    }

    function CheckUsedEmail(element) {
        var userEmailExplain = document.querySelector('#user-signup-explain-email');

        if (!isAvailableEmailRegExp(element.value)) {
            userEmailExplain.innerHTML = element.value + '은(는) 사용불가능한 이메일 형식입니다.';
            userEmailExplain.style.color = 'RED';
            element.value = '';
            return;
        }

        myAjax.submit('POST', '${path}/members/sign-up/email', function (data) {
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
            userNameExplain.innerHTML = element.value + '은(는) 사용불가능한 이름 형식입니다. 영문또는 숫자로 3~20자이내 입력해주세요';
            userNameExplain.style.color = 'RED';
            element.value = '';

        } else {
            userNameExplain.innerHTML = '사용가능한 이름입니다.';
            userNameExplain.style.color = 'GREEN';

        }

        myAjax.submit('POST', '${path}/members/sign-up/name', function (data) {
            if (data === 'true') {
                userNameExplain.innerHTML = element.value + '은(는) 이미 존재하는 이름입니다.';
                userNameExplain.style.color = 'RED';
                element.value = '';

            } else {
                userNameExplain.innerHTML = element.value + '은(는) 사용가능한 이름입니다.';
                userNameExplain.style.color = 'GREEN';

            }

        }, 'FORM', 'name=' + element.value);


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

    function confirmSignUp() {
        if (checkAgreement() === false) {
            alert('이용약관에 동의해주시기바랍니다.')
            return;
        }
        var signupForm = document.querySelector('#user-signup');
        var signupFormData = new FormData(signupForm);

        myAjax.submit('POST', '${path}/members/sign-up', function (data) {
            if (data === 'false') {
                window.alert('회원가입에 실패하였습니다. 잠시 후 다시 시도해주세요.');

            } else {
                window.alert('회원가입에 성공하였습니다.');
                document.querySelector('#modal-close-btn').click();
            }
        }, 'FORMFILE', signupFormData);

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