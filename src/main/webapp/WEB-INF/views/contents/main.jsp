<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sForm" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<section class="banner main-banner dot-key">
    <section>
        <div onclick="itemFocus(this)">
            <img src="${path}/img/banner-white/user.png">
            <p>My Page</p>
        </div>
        <div onclick="itemFocus(this)">
            <img src="${path}/img/banner-white/boardList.png">
            <p>My Blog</p>
        </div>
    </section>
    <section>
        <div onclick="itemFocus(this)">
            <img src="${path}/img/banner-white/repository.png">
            <p>My Repository</p>
        </div>
        <div onclick="itemFocus(this)">
            <img src="${path}/img/banner-white/api.png">
            <p>API</p>
        </div>
    </section>

    <script>
        var mainBannerImgTags = document.querySelectorAll('.main-banner img');
        var mainBannerParagraphTags = document.querySelectorAll('.main-banner p');

        function itemFocus(element) {
            var inputData = element.querySelector('p').innerText;

            for (var img of mainBannerImgTags) {
                img.classList.remove('main-banner-img-focus');
            }
            for (var p of mainBannerParagraphTags) {
                p.classList.remove('main-banner-font-focus');
            }
            element.querySelector('img').classList.add('main-banner-img-focus');
            element.querySelector('p').classList.add('main-banner-font-focus');
            document.querySelector('#main-footer').classList.add('footer-height-30vh');
            document.querySelector('#main-footer>div').innerHTML = '';

            // element의 케이스에 맞춰 분기
            if (inputData === 'My Page') {
                itemFocusUserInfo();

            } else if (inputData === 'My Blog') {
                itemFocusBoard();

            } else if (inputData === 'My Repository') {
                itemFocusRepository();

            } else if (inputData === 'API') {
                itemFocusApi();

            }
        }

        function itemFocusUserInfo() {
            var footerTarget = document.querySelector('#main-footer>div');

            var contents1 = document.createElement('a');
            var contents2 = document.createElement('a');
            contents1.setAttribute('href', '${path}/user/${sessionMember.no}/information');
            contents2.setAttribute('href', '${path}/user/${sessionMember.no}/check-email');
            footerTarget.appendChild(contents1);
            footerTarget.appendChild(contents2);
            textScript.insertText('#main-footer>div>a:nth-child(1)',
                '<img src="${path}/img/banner-white/user.png" style="max-height : 100px; max-width:100px;"><BR>내 정보<BR>정보확인과 함께<BR>이메일 및 패스워드를<BR>변경 하실 수 있습니다.', 10);
            textScript.insertText('#main-footer>div>a:nth-child(2)',
                '<img src="${path}/img/banner-white/email.png" style="max-height : 100px; max-width:100px;"><BR>이메일 인증<BR>서비스를 제공받기 위해<BR>인증을 해주세요', 10);
        }

        function itemFocusBoard() {
            var footerTarget = document.querySelector('#main-footer>div');

            var contents1 = document.createElement('a');
            var contents2 = document.createElement('a');
            contents1.setAttribute('href', '${path}/board/${sessionMember.no}/create');
            contents2.setAttribute('href', '${path}/board/${sessionMember.no}/view/list');
            footerTarget.appendChild(contents1);
            footerTarget.appendChild(contents2);
            textScript.insertText('#main-footer>div>a:nth-child(1)',
                '<img src="${path}/img/banner-white/writeBoard.png" style="max-height : 100px; max-width:100px;"><BR>글 쓰기<BR>페이지에 꾸밀 게시판글을<BR>작성할 수 있습니다.', 10);
            textScript.insertText('#main-footer>div>a:nth-child(2)',
                '<img src="${path}/img/banner-white/boardList.png" style="max-height : 100px; max-width:100px;"><BR>글 목록<BR>작성한 글목록을<BR>확인할 수 있습니다.', 10);

        }

        function itemFocusRepository() {
            var footerTarget = document.querySelector('#main-footer>div');

            var contents1 = document.createElement('a');
            contents1.setAttribute('href', '${path}/repository/${sessionMember.no}/list');
            footerTarget.appendChild(contents1);
            textScript.insertText('#main-footer>div>a:nth-child(1)',
                '<img src="${path}/img/banner-white/repository.png" style="max-height : 100px; max-width:100px;"><BR>내 저장소<BR>JSON형식으로 나만의 저장소를 만들어<BR>사용 할 수 있습니다.', 10);
        }

        function itemFocusApi() {
            var footerTarget = document.querySelector('#main-footer>div');

            var contents1 = document.createElement('a');
            contents1.setAttribute('href', '${path}/user/${sessionMember.no}/api');
            footerTarget.appendChild(contents1);
            textScript.insertText('#main-footer>div>a:nth-child(1)',
                '<img src="${path}/img/banner-white/api.png" style="max-height : 100px; max-width:100px;"><BR>API<BR>나만의 글과 저장소를 다른 페이지로<BR>공유할 수 있는 API를 제공합니다.', 10);
        }

    </script>

</section>
