var modal = {

    myModalTitle: document.querySelector('.modal-title'),
    myModalBody: document.querySelector('.modal-body'),

    changeForm: function (title, body) {
        modal.myModalTitle.innerHTML = title;
        modal.myModalBody.innerHTML = body;

    },


}


var board = {

    fakeKeyword: document.querySelector('#board-keyword-fake'),
    fakeTitle: document.querySelector('#board-title-fake'),
    fakeContents: document.querySelector('#board-contents-fake'),

    upload: function () {
        var boardForm = document.querySelector('#board-form-tag');

        var realKeyword = document.querySelector('#board-keyword-real');
        var realTitle = document.querySelector('#board-title-real');
        var realContents = document.querySelector('#board-contents-real');

        realKeyword.value = board.fakeKeyword.value;
        realTitle.value = board.fakeTitle.value;
        realContents.innerHTML = board.fakeContents.innerHTML;
console.log(realContents.innerHTML);
        board.save();

        boardForm.submit();

        window.alert('completed upload!');
    },
    save: function () {
        sessionStorage.setItem('sessionKeywordData', board.fakeKeyword.value);
        sessionStorage.setItem('sessionTitleData', board.fakeTitle.value);
        sessionStorage.setItem('sessionContentsData', board.fakeContents.innerHTML);

    },
    changeFont: function (element) {
        var fontName = document.querySelector('#board-font');
        fontName.value = element.innerText;
        document.execCommand('fontName', false, fontName.value);

    },
    reset: function () {
        if (confirm('작성 중인 내용을 초기화 하시겠습니까?')) {
            board.fakeKeyword.innerHTML = '';
            board.fakeTitle.innerHTML = '';
            board.fakeContents.innerHTML = '';
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
