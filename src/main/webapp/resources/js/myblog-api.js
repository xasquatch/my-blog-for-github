var myAjax = {

    json: 'application/json',
    form: 'application/x-www-form-urlencoded',
    formFile: 'multipart/form-data',

    setContentsType: function (inputContentsType) {
        var contentsType = 'text/plain';

        if (inputContentsType.toUpperCase() === 'FORM') {
            contentsType = myAjax.form;

        } else if (inputContentsType.toUpperCase() === 'FORMFILE') {
            contentsType = myAjax.formFile;

        } else if (inputContentsType.toUpperCase() === 'JSON') {
            contentsType = myAjax.json;

        }
        return contentsType;
    },


    submit: function (method, url, callback, inputContentsType, sendData) {
        var xhr = new XMLHttpRequest();

        var result = null;
        var contentsType = null;

        xhr.onreadystatechange = function () {
            if (xhr.readyState === xhr.DONE) {
                footerEffect.loadingToggle();
                if (xhr.status === 200 || xhr.status === 201) {
                    result = xhr.response;
                    callback(result);
                } else {
                    result = xhr.response;
                    alert('잘못 된 접근 입니다 다시 시도해주세요');
                }
            } else {
                footerEffect.addLoadingState();
            }
        };

        if (method.toUpperCase() === 'GET') {
            xhr.open(method, url);
            xhr.send();
        } else if (method.toUpperCase() === 'POST' || method.toUpperCase() === 'PUT' || method.toUpperCase() === 'DELETE' || method.toUpperCase() === 'PATCH') {
            method = method.toUpperCase();
            contentsType = myAjax.setContentsType(inputContentsType);
            xhr.open(method, url, true);
            if (contentsType !== myAjax.formFile)
                xhr.setRequestHeader('Content-type', contentsType);
            xhr.send(sendData);
        }

    }

}
var url = {
    parsing: function (target) {
        return window.location.href.slice(window.location.origin.length);

    },
    isContainWord: function (url, word) {
        return url.indexOf(word) > 0;
    },
    isContainWordCurrentPath: function (word) {
        return window.location.href.slice(window.location.origin.length).indexOf(word) > 0;
    },
    getUniform(startUrl, endUrl) {
        var i = url.parsing();
        return i.slice(i.indexOf(startUrl) + startUrl.length, i.indexOf(endUrl));
    }
}
var uri = {
    isContainWord: function (url, word) {
        return url.indexOf(word) > 0;
    },
    getUniform(target, startUrl, endUrl) {
        return target.slice(target.indexOf(startUrl) + startUrl.length, target.indexOf(endUrl));
    }
}


var myBoard = {

    getBoardData: function (callback, memberNo, boardNo) {
        myAjax.submit('GET', 'https://myblog.xasquatch.net/api/members/' + memberNo + '/boards/' + boardNo, callback);

    },

    recursiveGetBoardList: function (memberNo, url, boardListContainerQuery, pageBlockContainerQuery) {
        myBoard.getBoardList(function (data) {
            myBoard.pageBlockDecoration(data, boardListContainerQuery);
            myBoard.boardListDecoration(data, pageBlockContainerQuery);
            var pageBlockList = document.querySelectorAll('.myblog-page-block');
            for (var pageBlock of pageBlockList) {
                pageBlock.addEventListener('click', function (e) {
                    e.preventDefault();
                    var href = this.getAttribute('href');
                    if (href !== null) {
                        memberNo = uri.getUniform(href, '/members/', '/boards');
                        myBoard.pageBlockDecoration(data, boardListContainerQuery);
                        myBoard.boardListDecoration(data, pageBlockContainerQuery);
                        myBoard.recursiveGetBoardList(memberNo, 'https://myblog.xasquatch.net' + href, boardListContainerQuery, pageBlockContainerQuery);

                    }
                });
            }

        }, url);

    },

    getBoardList: function (callback, url) {
        myAjax.submit('GET', url, callback);

    },

    pageBlockDecoration: function (data, pageBlockContainerQuery) {
        var pageBlockList = JSON.parse(data).data.pageBlockList;

        document.querySelector(pageBlockContainerQuery).innerHTML = '';

        for (var pageBlock of pageBlockList) {
            document.querySelector(pageBlockContainerQuery).innerHTML += pageBlock;

        }
        var blockList = document.querySelectorAll(pageBlockContainerQuery + '>a');
        for (var block of blockList) {
            block.classList.add('btn');
            block.classList.add('btn-link-red');
        }
    },
    boardListDecoration: function (data, boardListContainerQuery) {
        var boardList = JSON.parse(data).data.boardList;
    }


}
