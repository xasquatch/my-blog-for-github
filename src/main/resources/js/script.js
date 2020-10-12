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

        realKeyword.value = board.fakeKeyword.value
        realTitle.value = board.fakeTitle.value
        realContents.innerHTML = board.fakeContents.innerHTML


        console.log('Keyword: '+ realKeyword.value);
        console.log('Title: '+ realTitle.value);
        console.log('Contents: '+ realContents.innerHTML);

        board.save();

        boardForm.submit();

        window.alert('completed upload!')
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
}