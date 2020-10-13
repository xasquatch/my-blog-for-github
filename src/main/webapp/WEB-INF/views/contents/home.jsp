<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sForm" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<article id="home-banner">
    무언가 장황한 설명
</article>
<section class="wrap-min">


    <form class="form-horizontal">
        <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
            <div class="col-sm-10">
                <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
            </div>
        </div>
        <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
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
        <button type="button" class="btn btn-default ">
            <img class="xasquatch-btn-logo" src="${path}/img/oauth-img/google.png"><BR>
            &nbsp;Google&nbsp;
        </button>
        <button type="button" class="btn btn-default">
            <img class="xasquatch-btn-logo" src="${path}/img/oauth-img/GitHub-Mark-32px.png"><BR>
            &nbsp;Github&nbsp;
        </button>
        <button type="button" class="btn btn-default ">
            <img class="xasquatch-btn-logo" src="${path}/img/oauth-img/facebook.png"> <BR>
            Facebook
        </button>
        <button type="button" class="btn btn-danger " data-toggle="modal" data-target="#myModal" onclick="singUp();">
            <img class="xasquatch-btn-logo" src="${path}/favicon.ico" width="32" height="32"><BR>
            Sing Up
        </button>
    </div>

</section>

<script>
    function singUp() {
        modal.changeForm('Sign Up',
            '<form class="" action="${path}/user/sign-up" method="POST">' +
            '<div class="input-group">' +
            '<div class="input-group-addon">Email</div>' +
            '<input class="form-control" type="text"  placeholder="xxxxxxx@xxxxx.com" path="email">' +
            '</div>' +
            '<form>');
        var confirmBtn = document.querySelector('#modal-confirm-btn');
        confirmBtn.setAttribute('onclick', 'ConfirmSignUp();');
    }

    function ConfirmSignUp() {
        //여기에 submit버튼
        document.querySelector("#modal-close-btn").click();
        document.querySelector("#modal-close-btn").click();
    }


</script>