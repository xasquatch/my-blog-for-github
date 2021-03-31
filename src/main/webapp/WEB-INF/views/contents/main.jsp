<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sForm" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<section class="banner main-banner dot-key">
    <section>
        <div onclick="itemFocus(this)">
            <img src="${path}/img/banner-white/star.png">
            <p>고객지원</p>
        </div>
        <div onclick="itemFocus(this)">
            <img src="${path}/img/banner-white/user.png">
            <p>My Page</p>
        </div>
        <div onclick="itemFocus(this)">
            <img src="${path}/img/banner-white/boardList.png">
            <p>My Blog</p>
        </div>
        <c:if test="${sessionMember.rank.contains('temp') && !sessionMember.name.equals('GUEST')}">
            <div onclick="itemFocus(this)">
                <img src="${path}/img/banner-white/email.png">
                <p>Email Verification</p>
            </div>
        </c:if>
    </section>
    <c:if test="${sessionMember.name.equals('GUEST')}">
        <section>
            <div onclick="itemFocus(this)">
                <p>Guest Account</p>
                <p>1. 본 게스트용 페이지는 이용에 제한이 있을 수 있습니다.</p>
                <p>2. 개인정보 수집 및 이용 안내의 기술한 내용에 의거</p>
                <p>비매너행위 및 가이드 위반 시 수집된 ip 및 개인정보를 필요에 따라</p>
                <p>법적조치에 활용될 수 있음을 안내드립니다.</p>
                <p>(클릭시 전문보기 활성화)</p>
            </div>
        </section>
    </c:if>
    <script>
        var mainBannerImgTags = document.querySelectorAll('.main-banner img');
        var mainBannerParagraphTags = document.querySelectorAll('.main-banner p');

        function itemFocus(element) {
            var inputData = element.querySelector('p').innerText;

            for (var p of mainBannerParagraphTags) {
                p.classList.remove('main-banner-font-focus');
            }
            element.querySelector('p').classList.add('main-banner-font-focus');
            document.querySelector('#main-footer').classList.add('footer-stretch');
            document.querySelector('#main-footer>div').innerHTML = '';

            // element의 케이스에 맞춰 분기
            if (inputData === '고객지원') {
                itemFocusStar();

            } else if (inputData === 'My Page') {
                itemFocusUserInfo();

            } else if (inputData === 'My Blog') {
                itemFocusBlog();

            } else if (inputData === 'Email Verification') {
                itemFocusVerification();

            } else if (inputData === 'Guest Account') {
                itemFocusGuestInfo();

            }

        }

        function itemFocusStar() {
            var footerTarget = document.querySelector('#main-footer>div');

            var contents1 = document.createElement('a');
            contents1.setAttribute('href', '${path}/management/notice');
            footerTarget.appendChild(contents1);
            textScript.insertText('#main-footer>div>a:nth-child(1)',
                '<img src="${path}/img/banner-white/info.png" style="max-height : 100px; max-width:100px;"><BR>공지사항<BR>여러분의 피드백으로<BR>개선된 점을 안내해드립니다.', 10);
            var contents2 = document.createElement('a');
            contents2.setAttribute('href', '${path}/community');
            footerTarget.appendChild(contents2);
            textScript.insertText('#main-footer>div>a:nth-child(2)',
                '<img src="${path}/img/banner-white/talk.png" style="max-height : 100px; max-width:100px;"><BR>커뮤니티<BR>여러 유저분들이 <BR>작성한 게시글을 구경해보세요', 10);

            var contentsLast = document.createElement('a');
            contentsLast.setAttribute('href', 'javascript:');
            contentsLast.setAttribute('onclick', 'changeFeedbackForm()');
            footerTarget.appendChild(contentsLast);
            textScript.insertText('#main-footer>div>a:last-child',
                '<img src="${path}/img/banner-white/paper-plane.png" style="max-height : 100px; max-width:100px;"><BR>피드백보내기<BR>불편한 점을 개선하기위해<BR> 여러분이 참여해주세요', 10);


        }

        function itemFocusUserInfo() {
            var footerTarget = document.querySelector('#main-footer>div');

            <c:if test="${!sessionMember.name.equals('GUEST')}">
            var contents1 = document.createElement('a');
            contents1.setAttribute('href', '${path}/members/${sessionMember.no}/information');
            footerTarget.appendChild(contents1);
            textScript.insertText('#main-footer>div>a:nth-child(1)',
                '<img src="${path}/img/banner-white/user.png" style="max-height : 100px; max-width:100px;"><BR>내 정보<BR>정보확인과 함께<BR>이메일 및 패스워드를<BR>변경 하실 수 있습니다.', 10);

            </c:if>

            var contentsLast = document.createElement('a');
            contentsLast.setAttribute('href', '${path}/members/${sessionMember.no}/api/clipboard');
            footerTarget.appendChild(contentsLast);
            textScript.insertText('#main-footer>div>a:last-child',
                '<img src="${path}/img/banner-white/api.png" style="max-height : 100px; max-width:100px;"><BR>API<BR>나만의 글과 저장소를<BR>다른 페이지로<BR> 공유할 수 있는<BR>API를 제공합니다.', 10);

        }

        function itemFocusBlog() {
            var footerTarget = document.querySelector('#main-footer>div');

            var contents1 = document.createElement('a');
            contents1.setAttribute('href', '${path}/boards?memberNo=${sessionMember.no}');
            footerTarget.appendChild(contents1);
            textScript.insertText('#main-footer>div>a:nth-child(1)',
                '<img src="${path}/img/banner-white/boardList.png" style="max-height : 100px; max-width:100px;"><BR>글 목록<BR>작성한 글목록을<BR>확인할 수 있습니다.', 10);

            var contents2 = document.createElement('a');
            contents2.setAttribute('href', '${path}/resources?memberNo=${sessionMember.no}');
            footerTarget.appendChild(contents2);
            textScript.insertText('#main-footer>div>a:nth-child(2)',
                '<img src="${path}/img/banner-white/all-resources.png" style="max-height : 100px; max-width:100px;"><BR>리소스 목록<BR>작성한 리소스 목록을<BR>확인할 수 있습니다.', 10);
        }


        function itemFocusVerification() {
            <c:if test="${sessionMember.rank.contains('temp')}">
            var footerTarget = document.querySelector('#main-footer>div');

            var contentsLast = document.createElement('a');
            contentsLast.setAttribute('href', '${path}/members/${sessionMember.no}/check-email');
            footerTarget.appendChild(contentsLast);
            textScript.insertText('#main-footer>div>a:last-child',
                '<img src="${path}/img/banner-white/email.png" style="max-height : 100px; max-width:100px;"><BR>이메일 인증<BR>나만의 서비스를 제공받기 위해<BR>인증을 진행해주세요', 10);
            </c:if>

        }

        function itemFocusGuestInfo() {
            <c:if test="${sessionMember.name.equals('GUEST')}">
            var footerTarget = document.querySelector('#main-footer>div');

            var contents1 = document.createElement('a');
            contents1.setAttribute('href', '${path}/html/sign-up/agreement.html');
            contents1.setAttribute('target', '_blank');
            footerTarget.appendChild(contents1);
            textScript.insertText('#main-footer>div>a:nth-child(1)',
                '<img src="${path}/img/banner-white/book.png" style="max-height : 100px; max-width:100px;"><BR>회원약관', 10);

            var contents2 = document.createElement('a');
            contents2.setAttribute('href', '${path}/html/sign-up/collection-and-use.html');
            contents2.setAttribute('target', '_blank');
            footerTarget.appendChild(contents2);
            textScript.insertText('#main-footer>div>a:nth-child(2)',
                '<img src="${path}/img/banner-white/book.png" style="max-height : 100px; max-width:100px;"><BR>개인정보 수집 및 이용 안내', 10);
            </c:if>
        }

    </script>

</section>
