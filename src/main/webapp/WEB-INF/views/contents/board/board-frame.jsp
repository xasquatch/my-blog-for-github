<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<section>
    <h1 class="dot-key">게시글 쓰기</h1>
    <div class="input-group">
        <div class="input-group-addon dot-key"><b>글제목</b></div>
        <input type="text" id="board-title-fake" class="form-control" placeholder="[Empty Title]" maxlength="50" value="${board.title}">
    </div>
    <div class="input-group">
        <div class="input-group-addon dot-key"><b>키워드</b></div>
        <input type="text" class="form-control" id="board-keyword-fake" maxlength="25" placeholder="ex) Life, health....etc" value="${board.keyword}">
    </div>
    <div id="board-bar" class="well">

        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal" tabindex="-1"
                onclick="window.scroll(0,0); uploadImages();">
            <span class="glyphicon glyphicon-picture"></span>
        </button>

        <div class="dropdown">
            <button type="button" class="btn btn-default dropdown-toggle" id="board-font" data-toggle="dropdown" aria-expanded="true" tabindex="-1">
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

            <div class="dropdown">
                <button type="button" class="btn btn-default dropdown-toggle" id="board-font-size" data-toggle="dropdown" aria-expanded="true" tabindex="-1">
                    <span class="glyphicon glyphicon-text-size" id="board-font-size-name"></span>
                </button>
                <ul class="dropdown-menu" role="menu" aria-labelledby="board-font-size">
                    <li role="presentation"><a style="font-size: xxx-large;" role="menuitem" tabindex="-1" href="#" onclick="board.changeFontSize(this);">7</a></li>
                    <li role="presentation"><a style="font-size: xx-large;" role="menuitem" tabindex="-1" href="#" onclick="board.changeFontSize(this);">6</a></li>
                    <li role="presentation"><a style="font-size: x-large;" role="menuitem" tabindex="-1" href="#" onclick="board.changeFontSize(this);">5</a></li>
                    <li role="presentation"><a style="font-size: large;" role="menuitem" tabindex="-1" href="#" onclick="board.changeFontSize(this);">4</a></li>
                    <li role="presentation"><a style="font-size: medium; color: darkred !important; font-weight: bold;" role="menuitem" tabindex="-1" href="#"
                                               onclick="board.changeFontSize(this);">3</a></li>
                    <li role="presentation"><a style="font-size: small;" role="menuitem" tabindex="-1" href="#" onclick="board.changeFontSize(this);">2</a></li>
                    <li role="presentation"><a style="font-size: x-small;" role="menuitem" tabindex="-1" href="#" onclick="board.changeFontSize(this);">1</a></li>
                </ul>
            </div>

            <button type="button" class="btn btn-default" tabindex="-1" onclick="document.execCommand('bold');">
                <span class="glyphicon glyphicon-bold"></span>
            </button>

            <button type="button" class="btn btn-default" tabindex="-1" onclick="document.execCommand('Italic');">
                <span class="glyphicon glyphicon-italic"></span>
            </button>

            <button type="button" class="btn btn-default" tabindex="-1" onclick="document.execCommand('indent');">
                <span class="glyphicon glyphicon-indent-left"></span>
            </button>

            <button type="button" class="btn btn-default" tabindex="-1" onclick="document.execCommand('outdent');">
                <span class="glyphicon glyphicon-indent-right"></span>
            </button>
        </div>

        <div class="flex-row">
            <button type="button" class="btn btn-default" tabindex="-1" onclick="document.execCommand('justifyLeft');">
                <span class="glyphicon glyphicon-align-left"></span>
            </button>

            <button type="button" class="btn btn-default" tabindex="-1" onclick="document.execCommand('justifyCenter')">
                <span class="glyphicon glyphicon-align-center"></span>
            </button>

            <button type="button" class="btn btn-default" tabindex="-1" onclick="document.execCommand('justifyRight')">
                <span class="glyphicon glyphicon-align-right"></span>
            </button>

            <button type="button" class="btn btn-default" tabindex="-1" onclick="document.execCommand('justifyFull')">
                <span class="glyphicon glyphicon-align-justify"></span>
            </button>
        </div>
        <div class="flex-row">
            <div class="dropdown">
                <button type="button" class="btn btn-default dot-key dropdown-toggle" id="board-html-management" data-toggle="dropdown" aria-expanded="true" tabindex="-1">
                    HTML모드
                </button>
                <ul class="dropdown-menu" role="menu" aria-labelledby="board-html-management">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#" onclick="convertHtml();">
                        convert
                    </a></li>
                </ul>
            </div>
            <button type="button" class="btn btn-default dot-key" tabindex="-1" onclick="callLocalHistory()">
                임시저장 목록
            </button>
        </div>
    </div>
    <div id="board-contents-fake" class="form-control" contentEditable="true">
        ${board.contents}
    </div>


    <div style="display: grid; grid-template-columns: 150px 1fr;">
        <div>
            <B>Thumbnail</B>
            <button class="btn btn-default" tabindex="-1" onclick="removeThumbnailImage();">
                <span class="glyphicon glyphicon-refresh"></span>
            </button>
            <div id="board-contents-thumbnail" class="well" style="">
                ${board.thumbnail}
            </div>
        </div>

        <div>
            <B>Insert To Click</B>
            <button class="btn btn-default" tabindex="-1" onclick="removeContentsImages();">
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

    <form action="${path}/board/${sessionMember.no}/upload/${requestScope.boardNo}" method="POST" enctype="multipart/form-data" id="board-form-tag" style="text-align: center;">
        <input type="text" id="board-no" name="no" class="hidden" value="${requestScope.boardNo}">
        <input type="text" id="board-no-mbr" name="mbr_no" class="hidden" value="${sessionMember.no}">
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

    function temporarySave() {
        var i = sessionStorage.getItem('tempSavedBoard');
        var boardContents = document.querySelector('#board-contents-fake').innerHTML;
        var boardTitle = document.querySelector('#board-title-fake').value;
        var boardKeyword = document.querySelector('#board-keyword-fake').value;
        var boardThumbnail = document.querySelector('#board-contents-thumbnail').innerHTML;
        var currentDate = new Date().toLocaleString();
        var parsedTempBoard = {};
        try{
            if (i !== null) parsedTempBoard = JSON.parse(i);
        }catch (e) {
            console.log('call by sessionStorage: 해당 "tempSavedBoard 내용없음"');
        }
        if (boardTitle.trim() === '') boardTitle = '[EMPTY TITLE]';
        parsedTempBoard[currentDate] = {
            'title': boardTitle, 'contents': boardContents,
            'keyword': boardKeyword, 'thumbnail': boardThumbnail
        };
        sessionStorage.setItem('tempSavedBoard', JSON.stringify(parsedTempBoard));

    }

    setInterval(function () {
        temporarySave();
    }, 1000 * 60 * 10);


    function convertHtml() {
        var convertLang = document.querySelector('#board-html-management');
        if (window.confirm(convertLang.innerText.trim() + '로 변경하시겠습니까?')) {
            alert('변경할 랭귀지는 ' + convertLang.innerText.trim() + '입니다');
        }

    }

    function callLocalHistory() {
        var tempSavedBoard;
        try {
            tempSavedBoard = JSON.parse(sessionStorage.getItem('tempSavedBoard'));

        } catch (e) {
            tempSavedBoard = {};
        }

        var boardListTagStart = '<div style="text-align: right">' +
            '<button type="button" onclick="if (window.confirm(\'임시저장 목록을 초기화 하시겠습니까?\')){ sessionStorage.setItem(\'tempSavedBoard\',\'\'); callLocalHistory();}">목록 초기화</button>' +
            '<button type="button" onclick="if (window.confirm(\'임시저장하시겠습니까?\')){temporarySave(); callLocalHistory();}">임시저장</button>' +
            '</div><HR>' +
            '<table class="table table-hover table-condensed">' +
            '<thead style="text-align: center;">' +
            '<tr><td>글제목</td><td>시간</td></tr>' +
            '</thead>' +
            '<tbody>';
        for (var key in tempSavedBoard) {
            var targetObject = JSON.parse(JSON.stringify(tempSavedBoard[key]));
            boardListTagStart += '<tr>' +
                '<td><a href="javascript:window.alert(JSON.stringify(JSON.parse(sessionStorage.getItem(\'tempSavedBoard\'))[\'' + key + '\']))">' +
                targetObject['title'] +
                '</a></td>' +
                '<td style="width: 200px; font-size: 0.8em;">' + key + '</td>' +
                '</tr>'
        }
        boardListTagStart += '</tbody></table>';
        modal.changeForm('임시 저장 목록',
            boardListTagStart
        );
        $('#myModal').modal('show');
    }

    function uploadImages() {
        modal.changeForm('Image Upload',
            '<form id="board-upload-image-form">' +
            '<input type="file" id="board-upload-image-items" class="btn btn-default" placeholder="upload" name="imgPackage" multiple onchange="addUploadFile(this); ">' +
            '</form>' +
            '<section id="board-upload">' +
            '' +
            '</section>'
        );
        var confirmBtn = document.querySelector('#modal-confirm-btn');
        confirmBtn.setAttribute('onclick', 'confirmUploadFiles();');


    }

    function addUploadFile(element) {
        var boardUploadImageForm = document.querySelector('#board-upload-image-form');
        var boardUploadTag = document.querySelector('#board-upload');
        var imgFormData = new FormData(boardUploadImageForm);

        myAjax.submit('POST', '${path}/img/${sessionMember.no}/board/${requestScope.boardNo}/upload', function (data) {
            var requestData = data.slice(1, data.length - 1);
            var imgArray = requestData.split(',');
            for (var i of imgArray) {
                var file
                if (i.indexOf('mp4') !== -1 || i.indexOf('avi') !== -1 || i.indexOf('wmv') !== -1) {
                    file = document.createElement('video');
                    file.controls = true;
                    file.style.maxWidth = '100%';

                } else {
                    file = document.createElement('img');

                }
                file.src = 'https://myblog.xasquatch.net' + i.trim();
                boardUploadTag.appendChild(file);
            }

        }, 'FORMFILE', imgFormData);

        element.value = '';
    }


    function confirmUploadFiles() {
        document.querySelector('#board-contents-image').innerHTML += document.querySelector('#board-upload').innerHTML;
        document.querySelector('#modal-close-btn').click();
        SettingInsertFiles();
    }

    // --------------------------

    function SettingInsertFiles() {
        var contentsFiles = document.querySelectorAll('#board-contents-image>*');

        for (let i = 0; i < contentsFiles.length; i++) {
            contentsFiles[i].addEventListener('click', function (e) {
// 썸네일처리
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
//END: 썸네일처리
                var temporaryContainer = document.createElement('div');
                temporaryContainer.appendChild(this.cloneNode());
                document.execCommand('insertHTML', false, temporaryContainer.innerHTML);

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

        var formData = new FormData(boardFormTag);

        if (url.isContainWordCurrentPath('/create')) {

            myAjax.submit('POST', '${path}/board/${sessionMember.no}/upload/' + board.boardNo.value + '/create', function (data) {
                if (data === 'false') {
                    window.alert('업로드에 실패하였습니다. 잠시 후 다시 시도해주세요.');
                    board.save();

                } else if (data === 'true') {
                    window.location.href = '${path}/board/${sessionMember.no}/list';

                }

            }, 'FORMFILE', formData);


        } else if (url.isContainWordCurrentPath('/modify')) {

            myAjax.submit('POST', '${path}/board/${sessionMember.no}/upload/' + board.boardNo.value + '/modify', function (data) {
                if (data === 'false') {
                    window.alert('수정에 실패하였습니다. 잠시 후 다시 시도해주세요.');

                } else if (data === 'true') {
                    window.alert('수정에 성공하였습니다.');
                    window.location.href = '${path}/board/${sessionMember.no}/list';

                }

            }, 'FORMFILE', formData);

        }


    }

    function contentsCssResizeInit() {
        document.querySelector('#board-contents-fake').addEventListener('click', function (e) {
            var target = e.target
            if (target.localName === 'img' || target.localName === 'video') {
                var originTargetWidth = target.width;
                var inputWidthData = window.prompt('가로길이를 몇으로 설정하시겠습니까?(현재 길이: ' + originTargetWidth + 'px, 숫자만 입력해주세요)', 'auto');

                if (new RegExp('[^0-9]').test(inputWidthData)) {
                    window.alert('숫자만 입력해주세요');
                    return;
                }
                if (inputWidthData !== 'auto' && inputWidthData !== null) {
                    target.width = inputWidthData;

                }
            }
        });
    }


    function boardInit() {
        SettingInsertFiles();
        contentsCssResizeInit();
    }

    boardInit();

</script>