var modal = {

    myModalTitle: document.querySelector('.modal-title'),
    myModalBody: document.querySelector('.modal-body'),

    changeForm: function (title, body) {
        console.log(modal.myModalTitle);
        console.log(modal.myModalBody);
        modal.myModalTitle.innerHTML = title;
        modal.myModalBody.innerHTML = body;

    },


}

var board = {

    fakeContents: document.querySelector('#board-contents-fake'),

    upload: function () {
        var boardForm = document.querySelector('#board-form-tag');
        var realContents = document.querySelector('#board-contents-real');
        realContents.innerHTML = board.fakeContents.innerHTML

        boardForm.submit();

    },
    save: function () {
        var sessionData = board.fakeContents.innerHTML;
        sessionStorage.setItem('sessionData', sessionData);

    },
    changeFont: function (element) {
        var fontName = document.querySelector('#board-font');
        fontName.value = element.innerText;
        document.execCommand('fontName', false, fontName.value);

    }

}


// -------------------------------------------


function SettingInsertImage() {
    var contentsImgs = document.querySelectorAll('#board-contents-image > img');

    for (let i = 0; i < contentsImgs.length; i++) {
        contentsImgs[i].addEventListener('click', function () {
            document.execCommand('insertImage', false, this.src);

        });
    }
}


function init() {
    SettingInsertImage();
}

init();
