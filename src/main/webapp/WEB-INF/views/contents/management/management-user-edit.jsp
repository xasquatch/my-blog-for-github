<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<section class="dot-key">
    <h1 class="dot-key">${member.name}(${member.email})</h1>
    <form class="form-horizontal" id="user-info">
        <div class="input-group">
            <div class="input-group-addon">ID</div>
            <input class="form-control" type="text" name="no" value="${member.no}" readonly>
        </div>
        <div class="input-group">
            <div class="input-group-addon">Rank</div>
            <select class="form-control" id="user-info-rank" name="rank">
                <option selected style="background: lightgray;">temporary</option>
                <option>temporary</option>
                <option>regular</option>
            </select>
            <div class="form-explain" id="user-info-explain-rank">
                Current Rank: <span style="color: red;">${member.rank}</span>
                ➡
                <c:choose>
                    <c:when test="${member.rank eq 'manager'}">현재 관리자 권한을 갖고있습니다.</c:when>
                    <c:when test="${member.rank eq 'regular'}">일반회원입니다.</c:when>
                    <c:when test="${member.rank eq 'temporary'}">이메일인증을 하지않은 준회원입니다.</c:when>
                </c:choose>
            </div>
        </div>
        <div class="input-group">
            <div class="input-group-addon">Email</div>
            <input class="form-control" id="user-info-email" type="email" name="email" value="${member.email}">
            <div class="form-explain" id="user-info-explain-email">xxxxxx@xxxxxxx.xxx 이메일형식에 맞게 입력해주세요</div>
            <a class="input-group-addon black-hover-btn dot-key"
               href="javascript:CheckUsedEmail(document.querySelector('#user-info-email'));">
                Email<BR>Check
            </a>
        </div>
        <div class="input-group">
            <div class="input-group-addon">Password</div>
            <input class="form-control pwd-group" id="user-info-pwd" type="password" name="pwd" placeholder="your Password" onchange="checkPwd(this)">
            <input class="form-control pwd-group" type="password" name="pwdConfirm" placeholder="Password Confirm" onchange="confirmPwd(this)">
            <div class="form-explain" id="user-info-explain-pwd">패스워드란을 공백으로 수정완료하면 패스워드 변경없이 나머지 내용만 수정됩니다.</div>
            <div class="input-group-addon black-hover-btn" onclick="changeVisiblePwd();"><B>비밀번호<BR>표시</B></div>
        </div>
        <div class="input-group">
            <div class="input-group-addon">Nick Name</div>
            <input class="form-control" type="text" name="name" value="${member.name}" required onchange="checkName(this)">
            <div class="form-control form-explain" id="user-info-explain-name">영문또는 숫자로 3~20자이내 입력해주세요</div>
        </div>
        <div class="input-group">
            <div class="input-group-addon">Profile<BR>Image</div>
            <input type="file" class="form-control" onchange="addUploadImage(event);">
            <textarea class="hidden" id="imgFile" name="imgFile"></textarea>
            <div class="form-control" id="user-info-imageFit" style="height: auto;">
                <img src="${path}${member.img}">
            </div>
            <div class="form-control form-explain">업로드된 파일은 PNG확장자로 사이즈 자동리사이징 되어 저장됩니다.</div>
        </div>
        <div class="input-group" style="text-align: center;">
            <BR>
            <button type="button" class="btn btn-danger" onclick="modifyProfile()">Submit</button>
            &nbsp;
            <button type="button" id="delete-member" class="dot-key btn btn-link-red" onclick="deleteMember(${member.no})">
                Delete
            </button>
        </div>
    </form>
</section>

<script>

    function deleteMember(memberNo) {
        if (!window.confirm('회원 삭제를 진행하시겠습니까?')) return;
        myAjax.submit('DELETE', '${path}/management/members/' + memberNo, function (data) {
            if (data === 'true') {
                window.alert('[회원탈퇴완료]\nnick name: ${member.name}\nemail: ${member.email}\n해당 계정의 삭제가 완료되었습니다');
                window.history.back();
            } else {
                window.alert('회원탈퇴 과정에 오류가 발생하였습니다.\n잠시 후 다시 시도해주세요.');

            }
        }, '');

    }

    function modifyProfile(e) {
        if (!window.confirm('회원 정보를 수정하시겠습니까?')) return;

        document.querySelector('#imgFile').innerHTML = document.querySelector('#user-info-imageFit').innerHTML;

        var userForm = document.querySelector('#user-info');
        var userFormData = new FormData(userForm);
        myAjax.submit('PUT', '${path}/management/members/${member.no}', function (data) {
            if (data === 'false') {
                window.alert('정보 수정에 실패하였습니다.');

            } else {
                window.alert('정보 수정이 완료되었습니다.');
                window.history.back();
            }

        }, 'FORMFILE', userFormData);

    }

    function CheckUsedEmail(element) {
        var userEmailExplain = document.querySelector('#user-info-explain-email');
        myAjax.submit('POST', '${path}/members/sign-up/email', function (data) {
            if (data === 'true') {
                userEmailExplain.innerHTML = element.value + '은(는) 이미 존재하는 이메일계정입니다.';
                userEmailExplain.style.color = 'RED';

            } else {
                userEmailExplain.innerHTML = element.value + '은(는) 사용가능한 이메일계정입니다.';
                userEmailExplain.style.color = 'GREEN';

            }


        }, 'FORM', 'email=' + element.value);

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