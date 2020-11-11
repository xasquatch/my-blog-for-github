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
            <div class="input-group-addon" onclick="alert('hi');"><B>변경</B></div>
        </div>
        <div class="input-group">
            <div class="input-group-addon">Password</div>
            <input class="form-control" type="password" name="pwd" placeholder="your Password" required>
            <input class="form-control" type="password" name="pwdConfirm" placeholder="Password Confirm" required>
        </div>
        <div class="input-group">
            <div class="input-group-addon">Name</div>
            <input class="form-control" type="text" name="name" value="${sessionMember.name}" required>
        </div>
        <div class="input-group">
            <div class="input-group-addon">Profile Image</div>
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
            <button class="btn btn-danger" onclick="modifyProfile()">Submit</button>
        </div>
    </form>
</section>

<script>

    function modifyProfile() {
        var userForm = document.querySelector('#user-info');
        var userFormData = new FormData(userForm);
        ajax.submit('POST', '${path}/user/${sessionMember.no}/modify', function (data) {
            if (data === 'false') {
                window.alert('회원정보 수정에 실패하였습니다.')

            } else {
                window.alert('회원정보 수정이 완료되었습니다.')

            }

        }, 'FORMFILE', userFormData);

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