var ajax = {

    json: 'application/json',
    form: 'application/x-www-form-urlencoded',
    formFile: 'multipart/form-data',

    setContentsType: function (inputContentsType) {
        var contentsType = 'text/plain';

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
            contentsType = ajax.setContentsType(inputContentsType);
            xhr.open(method, url, true);
            if (contentsType !== ajax.formFile)
                xhr.setRequestHeader('Content-type', contentsType);
            xhr.send(sendData);
        }

    }

}


