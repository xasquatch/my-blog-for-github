<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<section>
    <form class="form-horizontal" id="user-signup" action="${path}/user/update" method="POST">
        <div class="input-group">
            <div class="input-group-addon">Email</div>
            <input class="form-control" type="email" placeholder="xxxxxxx@gmail.com" value="231324354" required>
        </div>
        <div class="input-group">
            <div class="input-group-addon">Password</div>
            <input class="form-control" type="password" placeholder="your Password" required>
            <input class="form-control" type="password" placeholder="Password Confirm" required>
        </div>
        <div class="input-group">
            <div class="input-group-addon">Name</div>
            <input class="form-control" type="text" placeholder="ex) Jordan" required>
        </div>
        <div class="input-group">
            <div class="input-group-addon">Profile Image</div >
            <input type="file" class="form-control" onchange="addUploadImage(event);" required>
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
        for (var image of event.target.files) {
            var reader = new FileReader();
            reader.onload = function (event) {
                var img = document.querySelector("#user-signup-img");
                img.setAttribute("src", event.target.result);
            };
            reader.readAsDataURL(image);
        }
    }
</script>