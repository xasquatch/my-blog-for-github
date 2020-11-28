<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<section class="dot-key">

    <h1 class="dot-key">My Information</h1>
    <form class="form-horizontal" id="user-info">
        <div class="input-group">
            <div class="input-group-addon">ID</div>
            <input class="form-control" type="text" name="no" value="${sessionMember.no}" readonly>
        </div>
        <div class="input-group">
            <div class="input-group-addon">Email</div>
            <input class="form-control" id="user-info-email" type="email" name="email" value="${sessionMember.email}" readonly>
            <a class="input-group-addon black-hover-btn" href="javascript:window.location.replace('${path}/members/${sessionMember.no}/change-email');">변경</a>
        </div>
        <div class="input-group">
            <div class="input-group-addon">Password</div>
            <input class="form-control pwd-group" id="user-info-pwd" type="password" name="pwd" placeholder="your Password" required onchange="checkPwd(this)">
            <input class="form-control pwd-group" type="password" name="pwdConfirm" placeholder="Password Confirm" required onchange="confirmPwd(this)">
            <div class="form-explain" id="user-info-explain-pwd">영문또는 숫자로 8~20자이내 입력해주세요</div>
            <div class="input-group-addon black-hover-btn" onclick="changeVisiblePwd();"><B>비밀번호<BR>표시</B></div>
        </div>
        <div class="input-group">
            <div class="input-group-addon">Name</div>
            <input class="form-control" type="text" name="name" value="${sessionMember.name}" required onchange="checkName(this)">
            <div class="form-control form-explain" id="user-info-explain-name">영문또는 숫자로 3~20자이내 입력해주세요</div>
        </div>
        <div class="input-group">
            <div class="input-group-addon">Profile<BR>Image</div>
            <input type="file" class="form-control" onchange="addUploadImage(event);">
            <textarea class="hidden" id="imgFile" name="imgFile"></textarea>
            <div class="form-control" id="user-info-imageFit" style="height: auto;">
                <img src="${path}${sessionMember.img}">
            </div>
            <div class="form-control form-explain">업로드된 파일은 PNG확장자로 사이즈 자동리사이징 되어 저장됩니다.</div>
        </div>
        <div class="input-group" style="text-align: center;">
            <BR>
            <button class="btn btn-default" type="reset">Reset</button>
            &nbsp;
            <button type="button" class="btn btn-danger" onclick="modifyProfile()">Submit</button>
        </div>
    </form>
</section>

<script>

    function modifyProfile(e) {
        // e.preventDefault();

        document.querySelector('#imgFile').innerHTML = document.querySelector('#user-info-imageFit').innerHTML;

        var userForm = document.querySelector('#user-info');
        var userFormData = new FormData(userForm);
        myAjax.submit('PATCH', '${path}/my-blog/members/${sessionMember.no}', function (data) {

            if (data === 'false') {
                window.alert('정보 수정에 실패하였습니다. 수정조건을 확인 후 다시 시도해주세요.');

            } else {
                window.alert('정보 수정이 완료되었습니다. 다시 로그인 해주세요');
                window.location.href = "${path}/members/${sessionMember.no}/log-out"

            }


        }, 'FORMFILE', userFormData);

    }

    function changeVisiblePwd() {
        var pwdTags = document.querySelectorAll('.pwd-group');
        for (var pwdTag of pwdTags) {
            if (pwdTag.getAttribute('type') === 'password') {
                pwdTag.setAttribute('type', 'text');

            } else if (pwdTag.getAttribute('type') === 'text') {
                pwdTag.setAttribute('type', 'password');

            }
        }

    }


    function checkPwd(element) {
        var userPwdExplain = document.querySelector('#user-info-explain-pwd');

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
        var pwd = document.querySelector('#user-info-pwd');
        var userPwdExplain = document.querySelector('#user-info-explain-pwd');

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
        var userNameExplain = document.querySelector('#user-info-explain-name');

        if (!isAvailableNameRegExp(element.value)) {
            userNameExplain.innerHTML = element.value + '은(는) 사용불가능한 이름 형식입니다. 영문또는 숫자로 3~20자이내 입력해주세요';
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


    function addUploadImage(e) {
        var imgFit = document.querySelector('#user-info-imageFit');
        for (var image of e.target.files) {
            var reader = new FileReader();
            reader.onload = function (event) {
                imgFit.innerHTML = '';
                var img = document.createElement('img');
                img.setAttribute('src', event.target.result);
                img.onload = function () {
                    var firstImg = resizeImg(this);
                    document.querySelector('#imgFile').innerText = firstImg.src;
                    imgFit.innerHTML = '';
                    imgFit.appendChild(firstImg);

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