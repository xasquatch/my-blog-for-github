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
    }
}

var board = {


    boardNo : document.querySelector('#board-no'),
    boardMbrNo : document.querySelector('#board-no-mbr'),
    fakeKeyword: document.querySelector('#board-keyword-fake'),
    fakeTitle: document.querySelector('#board-title-fake'),
    fakeContents: document.querySelector('#board-contents-fake'),
    fakeThumbnail: document.querySelector('#board-contents-thumbnail'),
    fakeImages: document.querySelector('#board-contents-image'),

    save: function () {
        try{

            sessionStorage.setItem('sessionBoardNoData', board.boardNo.value);
            sessionStorage.setItem('sessionBoardMbrNoData', board.boardMbrNo.value);
            sessionStorage.setItem('sessionKeywordData', board.fakeKeyword.value);
            sessionStorage.setItem('sessionTitleData', board.fakeTitle.value);
            sessionStorage.setItem('sessionContentsData', board.fakeContents.innerHTML);
            sessionStorage.setItem('sessionThumbnailData', board.fakeThumbnail.innerHTML);
            sessionStorage.setItem('sessionContentsImgData', board.fakeImages.innerHTML);
        }catch (e){
            console.log('FAILED SAVE')
        }
    },
    call: function(){
        if (window.confirm('임시저장된 정보를 불러오시겠습니까?')){
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

var ajax = {

    json : 'application/json;charset=UTF-8',
    form : 'application/x-www-form-urlencoded;charset=UTF-8',
    formFile : 'multipart/form-data;charset=UTF-8',

    SetContentsType: function (inputContentsType) {
        var contentsType = 'text/plain;charset=UTF-8';

        if (inputContentsType.toUpperCase() === 'FORM') {
            contentsType = ajax.form;

        } else if (inputContentsType.toUpperCase() === 'FORMFILE') {
            contentsType = ajax.formFile;

        } else if (inputContentsType.toUpperCase() === 'JSON') {
            contentsType = ajax.json;

        }
        return contentsType;
    },


    submit: function (method, url, callback, inputContentsType, sendData) {
        var xhr = new XMLHttpRequest();

        var result = null;
        var contentsType = null;

        xhr.onreadystatechange = function () {
            if (xhr.readyState === xhr.DONE) {
                if (xhr.status === 200 || xhr.status === 201) {
                    result = xhr.response;
                    callback(result);

                } else {
                    result = xhr.response;
                    alert('잘못 된 접근 입니다 다시 시도해주세요');
                }
            }
        };

        if (method.toUpperCase() === 'GET') {
            xhr.open(method, url);
            xhr.send();
        } else if (method.toUpperCase() === 'POST') {
            method = 'POST';
            contentsType = ajax.SetContentsType(inputContentsType);
            xhr.open(method, url);
            xhr.setRequestHeader('Content-type', contentsType);
            xhr.send(sendData);
        }

    }
}
