<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<section id="board">
    <div id="board-bar">

        <button type="button" class="btn btn-default" onclick="">
            <span class="glyphicon glyphicon-picture"></span>
        </button>

        <button type="button" class="btn btn-default" onclick="document.execCommand('bold');">
            <span class="glyphicon glyphicon-font"></span>
        </button>

        <button type="button" class="btn btn-default" onclick="document.execCommand('bold');">
            <span class="glyphicon glyphicon-bold"></span>
        </button>

        <button type="button" class="btn btn-default" onclick="document.execCommand('Italic');">
            <span class="glyphicon glyphicon-italic"></span>
        </button>

        <button type="button" class="btn btn-default" onclick="document.execCommand('indent');">
            <span class="glyphicon glyphicon-indent-left"></span>
        </button>

        <button type="button" class="btn btn-default" onclick="document.execCommand('outdent');">
            <span class="glyphicon glyphicon-indent-right"></span>
        </button>

        <button type="button" class="btn btn-default" onclick="document.execCommand('justifyLeft');">
            <span class="glyphicon glyphicon-align-left"></span>
        </button>

        <button type="button" class="btn btn-default" onclick="document.execCommand('justifyCenter')">
            <span class="glyphicon glyphicon-align-center"></span>
        </button>

        <button type="button" class="btn btn-default" onclick="document.execCommand('justifyRight')">
            <span class="glyphicon glyphicon-align-right"></span>
        </button>

        <button type="button" class="btn btn-default" onclick="document.execCommand('justifyFull')">
            <span class="glyphicon glyphicon-align-justify"></span>
        </button>

    </div>
    <div id="board-contents-fake" class="well" contentEditable="true">

    </div>
    <form action="${path}/board/upload" id="board-form-tag" method="POST">
        <textarea id="board-contents-real" class="hidden"></textarea>
        <input id="board-upload-btn" class="btn btn-default" value="upload" onclick="uploadBoard()">
    </form>

</section>

<script>
    function uploadBoard() {
        var boardForm = document.querySelector('#board-form-tag');
        var realContents = document.querySelector('#board-contents-real');
        // var uploadFormBtn = document.querySelector('#board-upload-btn');
        realContents.innerHTML = document.querySelector('#board-contents-fake').innerHTML

        alert(realContents.innerHTML);
        boardForm.submit();
    }


</script>