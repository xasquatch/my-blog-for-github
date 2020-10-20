<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<section class="dot-key">
    <form class="form-horizontal" id="user-signup" action="${path}/user/update" enctype="multipart/form-data" method="POST">
        <div class="input-group">
            <div class="input-group-addon">Email</div>
            <input class="form-control" type="email" name="email" placeholder="xxxxxxx@gmail.com" value="" readonly>
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
            <input type="file" class="form-control" name="imgFile" onchange="addUploadImage(event);">
            <div class="form-control" style="height: auto;">
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
    function addUploadImage(event) {
        var reader = new FileReader();
        reader.onload = function (event) {
            var img = document.querySelector("#user-signup-img");
            img.setAttribute("src", event.target.result);
        };
        reader.readAsDataURL(event.target.files[0]);

    }
</script>