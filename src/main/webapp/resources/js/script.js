var oAuth = {
    google: {
        signInAndUp: function () {
            myAjax.submit('GET', 'https://myblog.xasquatch.net/oauth/google/information', function (data) {
                window.location.href = 'https://accounts.google.com/o/oauth2/v2/auth?' + data;

            });
        },

        verifyToken: function (token) {

            myAjax.submit('POST', '/oauth/google/token', function (data) {
                if (data !== 'false') window.location.href = 'https://myblog.xasquatch.net';

            }, 'form', 'oauth-token=' + token);
        }

    }
}

var modal = {

    myModalTitle: document.querySelector('.modal-title'),
    myModalBody: document.querySelector('.modal-body'),

    changeForm: function (title, body) {
        modal.myModalTitle.innerHTML = title;
        modal.myModalBody.innerHTML = body;

    },

}

var board = {

    boardNo: document.querySelector('#board-no'),
    boardMbrNo: document.querySelector('#board-no-mbr'),
    fakeKeyword: document.querySelector('#board-keyword-fake'),
    fakeTitle: document.querySelector('#board-title-fake'),
    fakeContents: document.querySelector('#board-contents'),
    fakeThumbnail: document.querySelector('#board-contents-thumbnail'),
    fakeImages: document.querySelector('#board-contents-image'),

    save: function () {
        try {

            sessionStorage.setItem('sessionBoardNoData', board.boardNo.value);
            sessionStorage.setItem('sessionBoardMbrNoData', board.boardMbrNo.value);
            sessionStorage.setItem('sessionKeywordData', board.fakeKeyword.value);
            sessionStorage.setItem('sessionTitleData', board.fakeTitle.value);
            sessionStorage.setItem('sessionContentsData', board.fakeContents.innerHTML);
            sessionStorage.setItem('sessionThumbnailData', board.fakeThumbnail.innerHTML);
            sessionStorage.setItem('sessionContentsImgData', board.fakeImages.innerHTML);
        } catch (e) {
            console.log('FAILED SAVE')
        }
    },
    call: function () {
        if (window.confirm('임시저장된 정보를 불러오시겠습니까?')) {
            board.boardNo.value = sessionStorage.getItem('sessionBoardNoData');
            board.boardMbrNo.value = sessionStorage.getItem('sessionBoardMbrNoData');
            document.querySelector('#board-keyword-fake').value = sessionStorage.getItem('sessionKeywordData');
            document.querySelector('#board-title-fake').value = sessionStorage.getItem('sessionTitleData');
            document.querySelector('#board-contents').innerHTML = sessionStorage.getItem('sessionContentsData');
            document.querySelector('#board-contents-thumbnail').innerHTML = sessionStorage.getItem('sessionThumbnailData');
            document.querySelector('#board-contents-image').innerHTML = sessionStorage.getItem('sessionContentsImgData');
        }
    },
    changeFont: function (element) {
        var fontName = document.querySelector('#board-font');
        fontName.value = element.innerText;
        document.execCommand('fontName', false, fontName.value);

    },
    changeFontSize: function (element) {
        var fontName = document.querySelector('#board-font-size');
        fontName.value = element.innerText;
        document.execCommand('fontSize', false, fontName.value);

    },
    reset: function () {
        if (confirm('작성 중인 내용을 초기화 하시겠습니까?')) {
            board.fakeKeyword.value = '';
            board.fakeTitle.value = '';
            board.fakeContents.innerHTML = '';
            board.fakeThumbnail.innerHTML = '';
            board.fakeImages.innerHTML = '';
        }

    },
    delete: function (memberKey, boardKey, sessionMemberName) {
        if (window.confirm("정말 삭제하시겠습니까?")) {
            var pwd;
            if (sessionMemberName === 'GUEST') {
                pwd = window.prompt('비밀번호를 설정해주세요.\n (기본값: 0000)', '0000');
                if (pwd === null) return;

            }
            myAjax.submit('DELETE', 'https://myblog.xasquatch.net/boards/' + boardKey + '?memberNo=' + memberKey + '&pwd=' + pwd, function (data) {
                if (data === 'false') {
                    console.log('잘못 된 요청입니다.');

                } else if (data === 'true') {
                    console.log('삭제가 완료되었습니다.');
                    window.history.go(0);

                }
            }, '', '');
        }

    },
    GoModify: function (memberKey, boardKey, sessionMemberName) {
        if (window.confirm("수정 페이지로 이동하시겠습니까?")) {
            var pwd;
            if (sessionMemberName === 'GUEST') {
                pwd = window.prompt('비밀번호를 설정해주세요.\n (기본값: 0000)', '0000');
                if (pwd === null) return;

            }
            location.href = '/boards/blob/' + boardKey + '?pwd=' + pwd + '&memberNo=' + memberKey + '&method=modify';

        }
    }
}

var resources = {

    resourceViewSetting: function (element) {
        var prettyContents = null;
        try {
            prettyContents = JSON.stringify(JSON.parse(element.querySelector('textarea').value), null, 2);
        } catch (e) {
            prettyContents = element.querySelector('textarea').value;
        }
        var serialNumber = element.querySelector('label').innerText;
        var textarea = document.createElement('textarea');
        var emptyContentsDiv = document.createElement('div');
        var emptyTitleDiv = document.createElement('div');
        var titleInput = document.createElement('input');
        titleInput.id = 'resource-title';
        textarea.id = 'resource-contents';

        textarea.style.width = '100%';
        textarea.style.height = '30vh';
        textarea.style.resize = 'none';
        textarea.innerHTML = prettyContents;

        titleInput.className = 'form-control';
        titleInput.type = 'text';
        titleInput.setAttribute('value', element.querySelector('h3').innerText);

        var modifyForm = resources.createModifyForm(serialNumber);

        emptyTitleDiv.appendChild(titleInput)
        emptyContentsDiv.appendChild(textarea);
        emptyContentsDiv.appendChild(modifyForm);

        modal.changeForm('[Serial Number:' + serialNumber + '] ' +
            '<button type="button" class="btn-link-red" onclick="resources.removeResource(' + serialNumber + ')">' +
            '<span class="glyphicon glyphicon-trash"></span>' +
            '</button>' +
            emptyTitleDiv.innerHTML,
            emptyContentsDiv.innerHTML);
        var confirmBtn = document.querySelector('#modal-confirm-btn');
        confirmBtn.setAttribute('onclick', 'resources.modifyResource(' + serialNumber + ');');
    },

    createModifyForm: function (serialNumber) {
        var form = document.createElement('form');
        form.id = "resource-target-form";
        form.className = 'hidden';
        var no = document.createElement('input');
        no.name = 'no';
        var title = document.createElement('input');
        title.name = 'title';
        title.id = 'resource-target-title';
        var contents = document.createElement('textarea');
        contents.name = 'contents';
        contents.id = 'resource-target-contents';

        no.setAttribute('value', serialNumber);

        form.appendChild(no);
        form.appendChild(title);
        form.appendChild(contents);

        return form;
    },

    modifyResource: function (resourceNo) {
        if (window.confirm('현재 내용으로 수정하시겠습니까?') === false) {
            return;
        }
        var targetForm = document.querySelector('#resource-target-form');
        var title = document.querySelector('#resource-target-title');
        var contents = document.querySelector('#resource-target-contents');

        title.value = document.querySelector('#resource-title').value;
        contents.value = document.querySelector('#resource-contents').value;
        try {
            JSON.stringify(JSON.parse(contents.value));
        } catch (e) {
            if (!window.confirm('수정된 내용은 JSON 형식에 어긋납니다. 업로드하시겠습니까?')) {
                return;
            }
        }

        var formData = new FormData(targetForm);

        //세션값으로 member no 넘김
        myAjax.submit('PUT', '/resources/' + resourceNo, function (data) {
            console.log(data);
            if (data === 'false') {
                window.alert('수정에 실패하였습니다. 잠시 후 다시시도해주세요')

            } else if (data === 'true') {
                window.location.reload(true);

            }

        }, 'FORMFILE', formData);


    },

    removeResource: function (resourceNo) {
        if (window.confirm('정말 삭제하시겠습니까?')) {
            var targetForm = document.querySelector('#resource-target-form');
            var title = document.querySelector('#resource-target-title');
            var contents = document.querySelector('#resource-target-contents');

            title.value = document.querySelector('#resource-title').value;
            contents.value = document.querySelector('#resource-contents').value;

            var formData = new FormData(targetForm);

            //세션값으로 member no 넘김
            myAjax.submit('DELETE', '/resources/' + resourceNo, function (data) {
                if (data === 'false') {
                    window.alert('삭제에 실패하였습니다. 잠시 후 다시시도해주세요')

                } else if (data === 'true') {
                    window.location.reload(true);

                }

            }, 'FORMFILE', formData);
        }
    },

    setClickEventDivContents: function () {
        var divBox = document.querySelectorAll('.resource-list-box>div');
        for (var box of divBox) {
            box.setAttribute('onclick',
                'resources.resourceViewSetting(this)');
        }
    },
    searchResource: function (memberNo) {
        var resourceBox = document.querySelector('.resource-list-box');
        resourceBox.innerHTML = '';
        this.moreLoad(memberNo);

    },
    moreLoad: function (memberNo) {
        try {
            var searchValue = document.querySelector('#resource-search-value').value;
            var lastNumber = document.querySelector('.resource-list-box>div:last-child>label').innerText;

        } catch (e) {
        }

        if (searchValue === undefined) searchValue = '';
        if (lastNumber === undefined) lastNumber = Number.MAX_SAFE_INTEGER;


        myAjax.submit('GET', '/resources/more?last-number=' + lastNumber + '&search=' + searchValue, function (data) {
            if (data === 'false') {
                window.alert('리소스 가져오기에 실패하였습니다. 잠시 후 다시 시도해주세요.')

            } else {
                var jsonData = JSON.parse(data);
                if (jsonData.length !== 0) {
                    var resourceListBox = document.querySelector('.resource-list-box');

                    for (var resource of jsonData) {
                        // <div class="btn-link-red" data-toggle="modal" data-target="#myModal">
                        var divContainerElement = document.createElement('div');
                        divContainerElement.className = 'btn-link-red';
                        divContainerElement.setAttribute('data-toggle', 'modal')
                        divContainerElement.setAttribute('data-target', '#myModal')

                        var labelElement = document.createElement('label');
                        labelElement.className = 'sr-only';
                        labelElement.innerText = resource.no;
                        var h3Element = document.createElement('h3');
                        h3Element.innerText = resource.title;
                        var paragraphElement = document.createElement('textarea');
                        paragraphElement.style.width = '100%';
                        paragraphElement.style.height = '120px';
                        paragraphElement.style.resize = 'none';
                        paragraphElement.disabled = 'disabled';
                        paragraphElement.value = resource.contents;

                        divContainerElement.appendChild(labelElement);
                        divContainerElement.appendChild(h3Element);
                        divContainerElement.appendChild(paragraphElement);

                        resourceListBox.appendChild(divContainerElement);
                        resources.setClickEventDivContents();
                    }

                } else {
                    window.alert('더이상 불러올 리소스가 없습니다.');

                }
            }

        });
    }

}

var textScript = {

    insertText: function (tagName, insertTextValue, interval, callback) {

        var frontSpan = document.createElement('span');
        var backSpan = document.createElement('span');
        backSpan.className = 'input-character';
        document.querySelector(tagName).appendChild(frontSpan);
        document.querySelector(tagName).appendChild(backSpan);

        var timeCount = true;
        var loopCount = 0;
        var intervalAddr = setInterval(function () {
            try {

                var character = insertTextValue.charAt(loopCount);

                if (insertTextValue.length === loopCount) {
                    throw 'go catch';

// 문자중에 lessthan이 나올 떄 greater than을 찾아 태그로 묶어서 삽입

                } else if (character === '<') {
                    var insertTextsubstr = insertTextValue.substr(loopCount, insertTextValue.length);
                    var tagEnd = insertTextsubstr.indexOf('>');
                    var substrText = insertTextsubstr.substr(0, tagEnd + 1);

                    var closeTag = '</' + substrText.substr(1, substrText.length);
                    var localTagName = substrText.substr(1, substrText.length - 2);

                    if (insertTextsubstr.indexOf(closeTag) !== -1) {
                        var localTag = document.createElement(localTagName);
                        // localTag.id = 'localTag' + intervalAddr;
                        frontSpan.appendChild(localTag);

                        var localInsertText = insertTextsubstr.substr(substrText.length, insertTextsubstr.indexOf(closeTag) - substrText.length);
                        // new Textjs.insertText('#'+localTag.id, localInsertText, 1);
                        localTag.innerHTML = localInsertText;

                        timeCount = true;
                        loopCount += insertTextsubstr.indexOf(closeTag) + closeTag.length;


                    } else {
                        frontSpan.innerHTML += substrText;
                        timeCount = true;
                        loopCount += substrText.length;

                    }

                } else if (timeCount === true) {
                    backSpan.innerHTML = insertTextValue.charAt(loopCount);
                    timeCount = false;

                } else {
                    frontSpan.innerHTML += backSpan.innerHTML;
                    backSpan.innerHTML = '';
                    timeCount = true;
                    loopCount++;

                }

            } catch (error) {
                clearInterval(intervalAddr);
                intervalAddr = null;
                try {
                    callback();
                } catch (error) {
                }
            }
        }, interval);
    }
};

var footerEffect = {
    loadingToggle: function () {
        var loadingFooter = document.querySelector('#main-footer');
        var loadingImg = document.querySelector('#main-footer>img');

        loadingFooter.classList.toggle('padding-100vh-align-center');
        loadingFooter.classList.toggle('opacity-half');
        loadingImg.classList.toggle('visible');
    },

    addLoadingState: function () {
        var loadingFooter = document.querySelector('#main-footer');
        var loadingImg = document.querySelector('#main-footer>img');

        loadingFooter.classList.add('padding-100vh-align-center');
        loadingFooter.classList.add('opacity-half');
        loadingImg.classList.add('visible');
    },
    removeLoadingState: function () {
        var loadingFooter = document.querySelector('#main-footer');
        var loadingImg = document.querySelector('#main-footer>img');

        loadingFooter.classList.remove('padding-100vh-align-center');
        loadingFooter.classList.remove('opacity-half');
        loadingImg.classList.remove('visible');
    },
    addFooterState: function () {
        var loadingFooter = document.querySelector('#main-footer');

        loadingFooter.classList.add('padding-100vh-align-center');
        loadingFooter.classList.add('opacity-half');
    },
    removeFooterState: function () {
        var loadingFooter = document.querySelector('#main-footer');

        loadingFooter.classList.remove('padding-100vh-align-center');
        loadingFooter.classList.remove('opacity-half');
    }


}
var boardListScript = {

    forwardUrl: function (url, callback) {
        myAjax.submit('GET', url, callback);

    },
    getPagination: function (jsonData) {
        var boardListToolbar = document.querySelector('#board-list-toolbar');
        boardListToolbar.innerHTML = '';
        console.log(jsonData);
        if (jsonData.pageBlockList.prevPageBlock !== 0) {
            boardListToolbar.innerHTML += '<button type="button" class="btn btn-link-red" onclick="boardListScript.ChangeMoveToThisPage(' + jsonData.pageBlockList.prevPageBlock + ');">' +
                '            <span class="glyphicon glyphicon-chevron-left"></span>' +
                '        </button>'
        }

        var forCount = (jsonData.pageBlockList.endPageBlock % 5 > 0) ? jsonData.pageBlockList.endPageBlock % 5 : 5;
        if (jsonData.pageBlockList.endPageBlock === 0) forCount = 1;

        for (var i = (jsonData.pageBlockList.startPageBlock % 5) - 1; i < forCount; i++) {
            if (jsonData.pageBlockList.startPageBlock + i === jsonData.pageBlockList.currentPageBlock) {
                boardListToolbar.innerHTML +=
                    '<button type="button" class="btn btn-link-red active" onclick="boardListScript.MoveToThisPage(this)">' + jsonData.pageBlockList.currentPageBlock + '</button>';

            } else {
                boardListToolbar.innerHTML +=
                    '<button type="button" class="btn btn-link-red" onclick="boardListScript.MoveToThisPage(this)">' + (jsonData.pageBlockList.startPageBlock + i) + '</button>';

            }
        }

        if (jsonData.pageBlockList.nextPageBlock !== jsonData.pageBlockList.totalPageBlock) {
            boardListToolbar.innerHTML += '<button type="button" class="btn btn-link-red" onclick="boardListScript.ChangeMoveToThisPage(' + jsonData.pageBlockList.nextPageBlock + ');">' +
                '            <span class="glyphicon glyphicon-chevron-right"></span>' +
                '        </button>'
        }
    },
    getBoardList: function (jsonData, uniform) {
        var boardList = document.querySelector('#myblog-api-board-list');
        boardList.innerHTML = '';

        for (var map of jsonData.boardList) {
            var trTag = document.createElement('tr');
            var titleInput = document.createElement('td');
            titleInput.innerHTML = '<a href="/boards/' + uniform + '/detail/' + map.no + '">' + map.thumbnail + map.title + '</a>';
            var rowNoInput = document.createElement('td');
            rowNoInput.innerText = map.rowno;
            var dateInput = document.createElement('td');
            dateInput.innerText = boardListScript.getFormatDate(map.created_date);
            var modifyInput = document.createElement('td');
            modifyInput.innerHTML = '<span class="glyphicon glyphicon-cog" style="cursor:pointer;" onclick="location.href=\'/boards/' + uniform + '/modify/' + map.no + '\'"></span>';
            var deleteInput = document.createElement('td');
            deleteInput.innerHTML = '<span class="glyphicon glyphicon-trash" style="cursor:pointer;" onclick="boardListScript.deleteBoard(' + map.no + ');"></span>';

            trTag.appendChild(rowNoInput)
            trTag.appendChild(titleInput)
            trTag.appendChild(dateInput);
            trTag.appendChild(modifyInput);
            trTag.appendChild(deleteInput);
            boardList.appendChild(trTag);

        }
    },
    getAllBoardList: function (jsonData, uniform) {
        var boardList = document.querySelector('#myblog-api-board-list');
        boardList.innerHTML = '';

        for (var map of jsonData.boardList) {
            var trTag = document.createElement('tr');
            var titleInput = document.createElement('td');
            titleInput.innerHTML = '<a href="/boards/' + uniform + '/detail/' + map.no + '">' + map.thumbnail + map.title + '</a>';
            var rowNoInput = document.createElement('td');
            rowNoInput.innerText = map.rowno;
            var dateInput = document.createElement('td');
            dateInput.innerText = boardListScript.getFormatDate(map.created_date);
            var userNameInput = document.createElement('td');
            userNameInput.innerHTML = map.mbr_no;

            trTag.appendChild(rowNoInput)
            trTag.appendChild(titleInput)
            trTag.appendChild(dateInput);
            trTag.appendChild(userNameInput);
            boardList.appendChild(trTag);

        }
    },
    changeAllBoardList: function (count) {
        var currentPageBlock = document.querySelector('#board-list-toolbar .active').innerText;
        var uniform = url.getUniform('/boards/', '/list');

        boardListScript.forwardUrl('/my-blog/members/' + uniform + '/boards/list?pageLimit=' + count + '&currentPageBlock=' + currentPageBlock, function (data) {
            document.querySelector('#board-list-count').innerHTML = count;
            var jsonData = JSON.parse(data);
            boardListScript.getAllBoardList(jsonData, uniform);
            boardListScript.getPagination(jsonData);

            window.scrollTo(0, 0);
        });
    },

    changeBoardList: function (count) {
        var currentPageBlock = document.querySelector('#board-list-toolbar .active').innerText;
        var uniform = url.getUniform('/boards/', '/list');

        boardListScript.forwardUrl('/my-blog/members/' + uniform + '/boards/list?pageLimit=' + count + '&currentPageBlock=' + currentPageBlock, function (data) {
            document.querySelector('#board-list-count').innerHTML = count;
            var jsonData = JSON.parse(data);
            boardListScript.getBoardList(jsonData, uniform);
            boardListScript.getPagination(jsonData);

            window.scrollTo(0, 0);
        });
    },

    MoveToThisPage: function (element) {
        var boardListToolbar = document.querySelector('#board-list-toolbar');
        var currentPageBlock = element.innerText;

        if (!element.classList.contains('active')) {
            for (var btn of boardListToolbar.querySelectorAll('button')) {
                btn.classList.remove('active');
            }
            element.classList.add('active');
            boardListScript.ChangeMoveToThisPage(currentPageBlock);
        }

    },
    ChangeMoveToThisPage: function (currentPageBlock) {
        var limitCount = document.querySelector('#board-list-count').innerText;
        var uniform = url.getUniform('/boards/', '/list');
        var searchRange = document.querySelector('#search-range').value;
        var searchValue = document.querySelector('#search-value').value;

        boardListScript.forwardUrl('/my-blog/members/' + uniform + '/boards/list?pageLimit=' + limitCount + '&currentPageBlock=' + currentPageBlock + '&' + searchRange + '=' + searchValue,
            function (data) {
                var jsonData = JSON.parse(data);
                boardListScript.getBoardList(jsonData, uniform);
                boardListScript.getPagination(jsonData);

            });

    },

    getFormatDate: function (targetDate) {
        var date = new Date(targetDate);
        var year = date.getFullYear();
        var month = (1 + date.getMonth());
        month = month >= 10 ? month : '0' + month;
        var day = date.getDate();
        day = day >= 10 ? day : '0' + day;
        var hour = date.getHours();
        hour = hour >= 10 ? hour : '0' + hour;
        var minute = date.getMinutes();
        minute = minute >= 10 ? minute : '0' + minute;

        return year + '-' + month + '-' + day + ' ' + hour + ':' + minute;
    }

}
