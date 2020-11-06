<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<section>
    <h1 class="dot-key"><B>Writing</B></h1>
    <div class="input-group">
        <div class="input-group-addon"><b>Keyword</b></div>
        <input type="text" class="form-control" id="board-keyword-fake" maxlength="25" placeholder="ex) Life, health....etc">
    </div>

    <input type="text" id="board-title-fake" class="form-control" placeholder="Title" maxlength="50">

    <div id="board-bar" class="well">

        <button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#myModal"
                onclick="window.scroll(0,0); uploadImages();">
            <span class="glyphicon glyphicon-picture"></span>
        </button>

        <div class="dropdown">
            <button type="button" class="btn btn-default btn btn-lg dropdown-toggle" id="board-font" data-toggle="dropdown" aria-expanded="true">
                <span class="glyphicon glyphicon-font" id="board-font-name"></span>
            </button>
            <ul class="dropdown-menu" role="menu" aria-labelledby="board-font">
                <li role="presentation"><a role="menuitem" style="font-family: Georgia;" tabindex="-1" href="#" onclick="board.changeFont(this);">Georgia</a></li>
                <li role="presentation"><a role="menuitem" style="font-family: Palatino Linotype;" tabindex="-1" href="#" onclick="board.changeFont(this);">Palatino Linotype</a></li>
                <li role="presentation"><a role="menuitem" style="font-family: Book Antiqua;" tabindex="-1" href="#" onclick="board.changeFont(this);">Book Antiqua</a></li>
                <li role="presentation"><a role="menuitem" style="font-family: Times New Roman;" tabindex="-1" href="#" onclick="board.changeFont(this);">Times New Roman</a></li>
                <li role="presentation"><a role="menuitem" style="font-family: Arial;" tabindex="-1" href="#" onclick="board.changeFont(this);">Arial</a></li>
                <li role="presentation"><a role="menuitem" style="font-family: Helvetica;" tabindex="-1" href="#" onclick="board.changeFont(this);">Helvetica</a></li>
                <li role="presentation"><a role="menuitem" style="font-family: Arial Black;" tabindex="-1" href="#" onclick="board.changeFont(this);">Arial Black</a></li>
                <li role="presentation"><a role="menuitem" style="font-family: Impact;" tabindex="-1" href="#" onclick="board.changeFont(this);">Impact</a></li>
                <li role="presentation"><a role="menuitem" style="font-family: Lucida Sans Unicode;" tabindex="-1" href="#" onclick="board.changeFont(this);">Lucida Sans Unicode</a></li>
                <li role="presentation"><a role="menuitem" style="font-family: Tahoma;" tabindex="-1" href="#" onclick="board.changeFont(this);">Tahoma</a></li>
                <li role="presentation"><a role="menuitem" style="font-family: Verdana;" tabindex="-1" href="#" onclick="board.changeFont(this);">Verdana</a></li>
                <li role="presentation"><a role="menuitem" style="font-family: Courier New;" tabindex="-1" href="#" onclick="board.changeFont(this);">Courier New</a></li>
                <li role="presentation"><a role="menuitem" style="font-family: Lucida Console;" tabindex="-1" href="#" onclick="board.changeFont(this);">Lucida Console</a></li>
                <li role="presentation"><a role="menuitem" style="font-family: 맑은 고딕;" tabindex="-1" href="#" onclick="board.changeFont(this);">맑은 고딕</a></li>
                <li role="presentation"><a role="menuitem" style="font-family: 궁서체;" tabindex="-1" href="#" onclick="board.changeFont(this);">궁서체</a></li>
                <li role="presentation"><a role="menuitem" style="font-family: 돋움체;" tabindex="-1" href="#" onclick="board.changeFont(this);">돋움체</a></li>
                <li role="presentation"><a role="menuitem" style="font-family: 굴림체;" tabindex="-1" href="#" onclick="board.changeFont(this);">굴림체</a></li>

            </ul>
        </div>

        <div class="flex-row">
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
        </div>

        <div class="flex-row">
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
    </div>

    <div id="board-contents-fake" class="form-control" contentEditable="true">
    </div>


    <div style="display: grid; grid-template-columns: 200px 1fr;">
        <div>
            <B>Thumbnail</B>
            <button class="btn btn-default" style="border-radius: 50%" onclick="removeThumbnailImage();">
                <span class="glyphicon glyphicon-refresh"></span>
            </button>
            <div id="board-contents-thumbnail" class="well" style="">
            </div>
        </div>

        <div>
            <B>Insert To Click</B>
            <button class="btn btn-default" style="border-radius: 50%" onclick="removeContentsImages();">
                <span class="glyphicon glyphicon-refresh"></span>
            </button>
            <div id="board-contents-image" class="well">
                <%--image here--%>
            </div>
        </div>
    </div>

    <script>
        // TODO: 세션스토리지 내에 저장

        document.querySelector('#board-keyword-fake').value = sessionStorage.getItem('sessionKeywordData');
        document.querySelector('#board-title-fake').value = sessionStorage.getItem('sessionTitleData');
        document.querySelector('#board-contents-fake').innerHTML = sessionStorage.getItem('sessionContentsData');
        document.querySelector('#board-contents-thumbnail').innerHTML = sessionStorage.getItem('sessionThumbnailData');
        document.querySelector('#board-contents-image').innerHTML = sessionStorage.getItem('sessionContentsImgData');
        document.querySelector('#board-contents-fake').onkeypress = function (e) {
            if (e.keyCode === 13) {
                e.preventDefault();
                document.execCommand('insertLineBreak');
            }
        }

    </script>

    <%--실제 전송폼--%>
    <form action="${path}/board/upload" enctype="multipart/form-data" id="board-form-tag" method="POST" style="text-align: center;">
        <input type="text" id="board-keyword-real" name="keyword" class="hidden" maxlength="25">
        <input type="text" id="board-title-real" name="title" class="hidden" maxlength="50">
        <textarea id="board-contents-real" name="contents" class="hidden"></textarea>
        <textarea id="board-thumbnail-real" name="thumbnailSrcDir" class="hidden"></textarea>
        <textarea id="board-images-real" name="thumbnailSrcDir" class="hidden"></textarea>
        <div id="board-files-real">

        </div>
        <input id="board-upload-btn" class="btn btn-danger" type="button" value="upload" onclick="board.upload()">
        <input id="board-reset-btn" class="btn btn-default" type="reset" value="reset" onclick="board.reset()">
        <input id="board-cancel-btn" class="btn btn-default" type="button" value="cancel"
               onclick="if (confirm('현재창을 임시저장하고 나가시겠습니까?'))board.save();history.back();">
    </form>

</section>

<script>
    function uploadImages() {
        modal.changeForm('Image Upload',
            '<h6><B>가로, 세로 720px을 초과하는 이미지는 720px PNG확장자로 저장됩니다</B></h6>' +
            '<input type="file" id="board-upload-files" class="btn btn-default" placeholder="upload" multiple onchange="addUploadImage(event); ">'+
            '<section id="board-upload">' +
            '' +
            '</section>' +
            '<section id="board-upload-origin">' +
            '' +
            '</section>'
        );
        var confirmBtn = document.querySelector('#modal-confirm-btn');
        confirmBtn.setAttribute('onclick', 'ConfirmUploadImages();');


    }

    function addUploadImage(e) {
        for (var image of e.target.files) {
            var reader = new FileReader();
            reader.onload = function (event) {
                var img = document.createElement("img");
                img.setAttribute("src", event.target.result);
                img.onload = function () {
                    var firstImg = resizeImg(this);
                    document.querySelector("#board-upload").appendChild(firstImg);
                    document.querySelector("#board-upload-origin").innerHTML = '';

                }


                document.querySelector("#board-upload-origin").appendChild(img);
            };
            reader.readAsDataURL(image);
        }
    }

    function resizeImg(img) {

        var canvas = document.createElement("canvas");
        var MAX_SIZE = 720;
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


    function ConfirmUploadImages() {
        document.querySelector('#board-contents-image').innerHTML += document.querySelector('#board-upload').innerHTML;
        document.querySelector('#modal-close-btn').click();
        SettingInsertImage();
    }

    // --------------------------

    function SettingInsertImage() {
        var contentsImgs = document.querySelectorAll('#board-contents-image > img');

        for (let i = 0; i < contentsImgs.length; i++) {
            contentsImgs[i].addEventListener('click', function (e) {
                document.execCommand('insertImage', false, this.src);
                document.querySelector('#board-contents-thumbnail').innerHTML = '<img src=\"' + this.src + '\">';

            });
        }
    }

    function removeThumbnailImage() {
        var thumbnailImg = document.querySelector('#board-contents-thumbnail');

        if (window.confirm('초기화 하시겠습니까?'))
            thumbnailImg.innerHTML = '';


    }

    function removeContentsImages() {
        var contentsImg = document.querySelector('#board-contents-image');

        if (window.confirm('초기화 하시겠습니까?'))
            contentsImg.innerHTML = '';


    }


    function boardInit() {
        SettingInsertImage();
    }

    boardInit();


</script>