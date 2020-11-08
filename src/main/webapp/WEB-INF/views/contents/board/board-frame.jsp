<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="memberNo" value="${1}"/>

<section>
    <div class="input-group">
        <div class="input-group-addon"><b>Keyword</b></div>
        <input type="text" class="form-control" id="board-keyword-fake" maxlength="25" placeholder="ex) Life, health....etc" value="${board.keyword}">
    </div>

    <input type="text" id="board-title-fake" class="form-control" placeholder="Title" maxlength="50" value="${board.title}">

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
        ${board.contents}
    </div>


    <div style="display: grid; grid-template-columns: 150px 1fr;">
        <div>
            <B>Thumbnail</B>
            <button class="btn btn-default" style="border-radius: 50%" onclick="removeThumbnailImage();">
                <span class="glyphicon glyphicon-refresh"></span>
            </button>
            <div id="board-contents-thumbnail" class="well" style="">
                ${board.thumbnail}
            </div>
        </div>

        <div>
            <B>Insert To Click</B>
            <button class="btn btn-default" style="border-radius: 50%" onclick="removeContentsImages();">
                <span class="glyphicon glyphicon-refresh"></span>
            </button>
            <div id="board-contents-image" class="well">
            </div>
        </div>
    </div>

    <script>
        document.querySelector('#board-contents-fake').onkeypress = function (e) {
            if (e.keyCode === 13) {
                e.preventDefault();
                document.execCommand('insertLineBreak');
            }
        }

    </script>

    <form action="${path}/board/${memberNo}/upload/${requestScope.boardNo}" method="POST" enctype="multipart/form-data" id="board-form-tag" style="text-align: center;">
        <input type="text" id="board-no" name="no" class="hidden" value="${requestScope.boardNo}">
        <input type="text" id="board-no-mbr" name="mbr_no" class="hidden">
        <input type="text" id="board-keyword-real" name="keyword" class="hidden" maxlength="25">
        <input type="text" id="board-title-real" name="title" class="hidden" maxlength="50">
        <textarea id="board-contents-real" name="contents" class="hidden"></textarea>
        <textarea id="board-thumbnail-real" name="thumbnail" class="hidden"></textarea>
        <div id="board-files-real">

        </div>
        <input id="board-upload-btn" class="btn btn-danger dot-key" type="button" value="업로드" onclick="uploadBoard()">
        <input id="board-storage-btn" class="btn btn-danger dot-key" type="button" value="불러오기" onclick="board.call()">
        <input id="board-cancel-btn" class="btn btn-default dot-key" type="button" value="돌아가기"
               onclick="board.save();history.back();">
    </form>

</section>

<script>

    function uploadImages() {
        modal.changeForm('Image Upload',
            '<form id="board-upload-image-form">' +
            '<input type="file" id="board-upload-image-items" class="btn btn-default" placeholder="upload" name="imgPackage" multiple onchange="addUploadImage(this); ">' +
            '</form>' +
            '<section id="board-upload">' +
            '' +
            '</section>'
        );
        var confirmBtn = document.querySelector('#modal-confirm-btn');
        confirmBtn.setAttribute('onclick', 'ConfirmUploadImages();');


    }

    function addUploadImage(element) {
        var boardUploadImageForm = document.querySelector('#board-upload-image-form');
        var imgFormData = new FormData(boardUploadImageForm);
        ajax.submit('POST','${path}/img/${memberNo}/board/${requestScope.boardNo}/upload',function (data) {

            alert(data);

        },'FORMFILE',imgFormData);

        element.value = '';
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
                var thumbnailImg = document.createElement("img");
                thumbnailImg.src = this.src;
                thumbnailImg.classList.add('xasquatch-board-img')
                thumbnailImg.style.maxWidth = '140px';
                thumbnailImg.style.maxHeight = '140px';
                thumbnailImg.addEventListener('click', function () {
                    if (window.confirm('썸네일 이미지에서 제외하시겠습니까?')) this.remove();
                });
                document.querySelector('#board-contents-thumbnail').innerHTML = '';
                document.querySelector('#board-contents-thumbnail').appendChild(thumbnailImg);
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

    function uploadBoard() {
        var boardFormTag = document.querySelector('#board-form-tag');
        var realKeyword = document.querySelector('#board-keyword-real');
        var realTitle = document.querySelector('#board-title-real');
        var realContents = document.querySelector('#board-contents-real');
        var realThumbnail = document.querySelector('#board-thumbnail-real');

        realKeyword.value = board.fakeKeyword.value;
        realTitle.value = board.fakeTitle.value;
        realContents.innerHTML = board.fakeContents.innerHTML;
        realThumbnail.innerHTML = board.fakeThumbnail.innerHTML;

        if (uri.isContainWordCurrentPath('/create')) {

            var formData = new FormData(boardFormTag);

            ajax.submit('POST', '${path}/board/${memberNo}/upload/' + board.boardNo.value, function (data) {
                if (data === 'false') {
                    window.alert('업로드에 실패하였습니다. 잠시 후 다시 시도해주세요.');
                    board.save();
                }else{
                    board.reset();
                    window.location.href = '${path}/board/${memberNo}/view/list';
                }

            }, 'FORMFILE', formData);



        } else if (uri.isContainWordCurrentPath('/update')) {
            console.log('${path}/board/${memberNo}/update/' + board.boardNo.value);
        } else {
            console.log(window.location.origin);
        }


    }

    function boardInit() {
        SettingInsertImage();
    }

    boardInit();


</script>

