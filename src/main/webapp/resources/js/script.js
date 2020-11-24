var modal = {

    myModalTitle: document.querySelector('.modal-title'),
    myModalBody: document.querySelector('.modal-body'),

    changeForm: function (title, body) {
        modal.myModalTitle.innerHTML = title;
        modal.myModalBody.innerHTML = body;

    },

}

var uri = {
    parsing: function () {
        return window.location.href.slice(window.location.origin.length);

    },
    isContainWord: function (url, word) {
        return url.indexOf(word) > 0;
    },
    isContainWordCurrentPath: function (word) {
        return window.location.href.slice(window.location.origin.length).indexOf(word) > 0;
    },
    getUniform(startUrl, endUrl) {
        var i = uri.parsing();
        return i.slice(i.indexOf(startUrl) + startUrl.length, i.indexOf(endUrl));
    }
}

var board = {


    boardNo: document.querySelector('#board-no'),
    boardMbrNo: document.querySelector('#board-no-mbr'),
    fakeKeyword: document.querySelector('#board-keyword-fake'),
    fakeTitle: document.querySelector('#board-title-fake'),
    fakeContents: document.querySelector('#board-contents-fake'),
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
            document.querySelector('#board-contents-fake').innerHTML = sessionStorage.getItem('sessionContentsData');
            document.querySelector('#board-contents-thumbnail').innerHTML = sessionStorage.getItem('sessionThumbnailData');
            document.querySelector('#board-contents-image').innerHTML = sessionStorage.getItem('sessionContentsImgData');
        }
    },
    changeFont: function (element) {
        var fontName = document.querySelector('#board-font');
        fontName.value = element.innerText;
        document.execCommand('fontName', false, fontName.value);

    },
    reset: function () {
        if (confirm('작성 중인 내용을 초기화 하시겠습니까?')) {
            board.fakeKeyword.value = '';
            board.fakeTitle.value = '';
            board.fakeContents.innerHTML = '';
            board.fakeThumbnail.innerHTML = '';
            board.fakeImages.innerHTML = '';
        }

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
            titleInput.innerHTML = '<a href="/board/' + uniform + '/detail/' + map.no + '">' + map.thumbnail + map.title + '</a>';
            var rowNoInput = document.createElement('td');
            rowNoInput.innerText = map.rowno;
            var dateInput = document.createElement('td');
            dateInput.innerText = boardListScript.getFormatDate(map.created_date);
            var modifyInput = document.createElement('td');
            modifyInput.innerHTML = '<span class="glyphicon glyphicon-cog" style="cursor:pointer;" onclick="location.href=\'/board/' + uniform + '/modify/' + map.no + '\'"></span>';
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
            titleInput.innerHTML = '<a href="/board/' + uniform + '/detail/' + map.no + '">' + map.thumbnail + map.title + '</a>';
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
        var uniform = uri.getUniform('/board/', '/list');

        boardListScript.forwardUrl('/my-blog/members/' + uniform + '/board/list?pageLimit=' + count + '&currentPageBlock=' + currentPageBlock, function (data) {
            document.querySelector('#board-list-count').innerHTML = count;
            var jsonData = JSON.parse(data);
            boardListScript.getAllBoardList(jsonData, uniform);
            boardListScript.getPagination(jsonData);

            window.scrollTo(0, 0);
        });
    },

    changeBoardList: function (count) {
        var currentPageBlock = document.querySelector('#board-list-toolbar .active').innerText;
        var uniform = uri.getUniform('/board/', '/list');

        boardListScript.forwardUrl('/my-blog/members/' + uniform + '/board/list?pageLimit=' + count + '&currentPageBlock=' + currentPageBlock, function (data) {
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
        var uniform = uri.getUniform('/board/', '/list');
        var searchRange = document.querySelector('#search-range').value;
        var searchValue = document.querySelector('#search-value').value;

        boardListScript.forwardUrl('/my-blog/members/' + uniform + '/board/list?pageLimit=' + limitCount + '&currentPageBlock=' + currentPageBlock + '&' + searchRange + '=' + searchValue,
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
    },

    deleteBoard: function (key) {
        var uniform = uri.getUniform('/board/', '/list');
        if (window.confirm("정말 삭제하시겠습니까?"))
            location.href = '/board/' + uniform + '/delete/' + key;

    }


}
