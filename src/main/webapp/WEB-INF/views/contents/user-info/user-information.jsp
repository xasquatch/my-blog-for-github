<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="memberNo" value="${1}"/>
<section class="dot-key">

    <h1 class="dot-key">My Information</h1>
    <form class="form-horizontal" id="user-signup" action="${path}/user/${memberNo}/update" enctype="multipart/form-data" method="POST">
        <div class="input-group">
            <div class="input-group-addon">ID</div>
            <input class="form-control" type="text" name="no" value="${memberNo}" readonly>
        </div>
        <div class="input-group">
            <div class="input-group-addon">Email</div>
            <input class="form-control" type="email" name="email" value="" readonly>
        </div>
        <div class="input-group">
            <div class="input-group-addon">Password</div>
            <input class="form-control" type="password" name="pwd" placeholder="your Password" required>
            <input class="form-control" type="password" name="pwdConfirm" placeholder="Password Confirm" required>
        </div>
        <div class="input-group">
            <div class="input-group-addon">Name</div>
            <input class="form-control" type="text" name="name" placeholder="ex) Jordan" required>
        </div>
        <div class="input-group">
            <div class="input-group-addon">Profile Image</div>
            <input type="file" class="form-control" onchange="addUploadImage(event);">
            <textarea class="hidden" id="imgFile" name="imgFile"></textarea>
            <div class="form-control" id="user-signup-imageFit" style="height: auto;">
                <img id="user-signup-img" src="${path}/img/login/default-profile.png" alt="Default Image" style="max-width:100%">
            </div>
        </div>
        <div>
            <%--        <button class="btn btn-default" onclick="location.href='${path}/user/view'">Reset</button>--%>
            <button class="btn btn-default" type="reset">Reset</button>
            <button class="btn btn-danger" type="submit">Submit</button>
        </div>
    </form>
</section>

<script>
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