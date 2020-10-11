<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<section id="board">
    <div id="board-bar" class="well">

        <button type="button" class="btn btn-default btn-lg" onclick="insertImage();">
            <span class="glyphicon glyphicon-picture"></span>
        </button>

        <div class="dropdown">
            <button type="button" class="btn btn-default btn btn-lg dropdown-toggle" id="board-font" data-toggle="dropdown"
                    aria-expanded="true">
                <span class="glyphicon glyphicon-font" id="board-font-name"></span>
            </button>
            <ul class="dropdown-menu" role="menu" aria-labelledby="board-font">
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#" onclick="changeFont(this);">Georgia</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#" onclick="changeFont(this);">Palatino Linotype</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#" onclick="changeFont(this);">Book Antiqua</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#" onclick="changeFont(this);">Times New Roman</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#" onclick="changeFont(this);">Arial</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#" onclick="changeFont(this);">Helvetica</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#" onclick="changeFont(this);">Arial Black</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#" onclick="changeFont(this);">Impact</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#" onclick="changeFont(this);">Lucida Sans Unicode</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#" onclick="changeFont(this);">Tahoma</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#" onclick="changeFont(this);">Verdana</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#" onclick="changeFont(this);">Courier New</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#" onclick="changeFont(this);">Lucida Console</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#" onclick="changeFont(this);">initial</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#" onclick="changeFont(this);">맑은 고딕</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#" onclick="changeFont(this);">궁서체</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#" onclick="changeFont(this);">돋움체</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#" onclick="changeFont(this);">굴림체</a></li>

            </ul>
        </div>

        <button type="button" class="btn btn-default btn btn-lg" onclick="document.execCommand('bold');">
            <span class="glyphicon glyphicon-bold"></span>
        </button>

        <button type="button" class="btn btn-default btn btn-lg" onclick="document.execCommand('Italic');">
            <span class="glyphicon glyphicon-italic"></span>
        </button>

        <button type="button" class="btn btn-default btn btn-lg" onclick="document.execCommand('indent');">
            <span class="glyphicon glyphicon-indent-left"></span>
        </button>

        <button type="button" class="btn btn-default btn btn-lg" onclick="document.execCommand('outdent');">
            <span class="glyphicon glyphicon-indent-right"></span>
        </button>

        <button type="button" class="btn btn-default btn btn-lg" onclick="document.execCommand('justifyLeft');">
            <span class="glyphicon glyphicon-align-left"></span>
        </button>

        <button type="button" class="btn btn-default btn btn-lg" onclick="document.execCommand('justifyCenter')">
            <span class="glyphicon glyphicon-align-center"></span>
        </button>

        <button type="button" class="btn btn-default btn btn-lg" onclick="document.execCommand('justifyRight')">
            <span class="glyphicon glyphicon-align-right"></span>
        </button>

        <button type="button" class="btn btn-default btn btn-lg" onclick="document.execCommand('justifyFull')">
            <span class="glyphicon glyphicon-align-justify"></span>
        </button>

    </div>
    <div id="board-contents-fake" class="well" contentEditable="true">
    </div>
    <form action="${path}/board/upload" id="board-form-tag" method="POST">
        <textarea id="board-contents-real" class="hidden"></textarea>
        <input id="board-upload-btn" class="btn btn-default" type="button" value="upload" onclick="uploadBoard()">
    </form>

</section>

<script>
    function uploadBoard() {
        var boardForm = document.querySelector('#board-form-tag');
        var realContents = document.querySelector('#board-contents-real');
        // var uploadFormBtn = document.querySelector('#board-upload-btn');
        realContents.innerHTML = document.querySelector('#board-contents-fake').innerHTML

        boardForm.submit();
    }

    function changeFont(element) {
        var fontName = document.querySelector('#board-font');
        fontName.value = element.innerText;
        document.execCommand('fontName', false, fontName.value);
    }

    function insertImage() {

    }


</script>