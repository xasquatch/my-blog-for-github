<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sForm" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<ul id="home-page-container">
    <li id="home-page-section-one">
        <h1 class="dot-key"></h1>
        <div style="color: white;">
            <h3 class="dot-key"></h3>
            <a class="dot-key btn btn-link-red" href="#home-page-section-two">다음장</a>
            &nbsp;
            <a class="dot-key btn btn-link-red" href="#home-page-section-three">공지사항</a>
        </div>
    </li>
    <li id="home-page-section-two">
        <div class="dot-key" style="font-size:2em; padding-left: 20px;"></div>
    </li>
    <li id="home-page-section-three">
        <section style="background: rgba(255,255,255,0.5);">
            <div style="margin: 0 auto; max-width: 800px; padding: 5px;" class="dot-key">
                <h1 style="margin: 0; text-align: center">NOTICE</h1>
                <table class="table table-hover table-condensed">
                    <thead>
                    <tr>
                        <td colspan="2" style="text-align: right;">
                            <button class="btn btn-link-red" type="button"
                                    onclick="window.location.href='${path}/notice/list'">
                                More
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <th style="text-align: center;">Title</th>
                        <th style="text-align: center;" width="200">Date</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${noticeList}" var="notice">
                        <tr>
                            <td>
                                <a href="${path}/board/${notice.mbr_no}/read/${notice.no}">
                                        ${notice.title}
                                </a>
                            </td>
                            <td>${notice.created_date}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

        </section>
    </li>
</ul>
<script>

    function resetPage(elementTagName) {
        document.querySelector(elementTagName).innerHTML = '';
    }

    function startPage1() {
        resetPage('#home-page-section-one h1');
        resetPage('#home-page-section-one h3');
        textScript.insertText('#home-page-section-one h1', 'Welcome My Blog <BR>Develop By Xasquatch', 10);
        textScript.insertText('#home-page-section-one h3', '바로가기<BR>', 10);
    }

    function startPage2() {
        var pageTwoContents = document.querySelector('#home-page-section-two>div');
        if (pageTwoContents.innerHTML !== '') return;

        textScript.insertText('#home-page-section-two>div',
            '<h1 class="opacity-0" style="font-size: 3em; transition: 1s all;"></h1><BR>' +
            '1. 나만의 블로그를 만들 수 있습니다.<BR>' +
            '2. 만든 나만의 블로그를 REST API를 이용하여 직접 코딩하고 공유할 수 있습니다.<BR>' +
            '3. REST API를 이용하여 블로그 외 JSON형식 데이터를 만들고 사용 할 수 있습니다.<BR>' +
            '<BR>' +
            '테스트로 제공해드리는 GUEST계정을 통해 미리 경험해 보세요!<BR><BR>'
            ,1,function (e) {
                pageTwoContents.innerHTML += '<a class="dot-key btn btn-link-red" href="${path}/members">Members로 이동하기</a>';

                var homePageSectionTwoTitle = pageTwoContents.querySelector('h1');
                homePageSectionTwoTitle.innerHTML = 'My Blog By Xasquatch';
                homePageSectionTwoTitle.style.opacity = '1';
            });
    }

    function smoothScroll() {
        startPage1();
        var currentScrollY = window.scrollY;
        // var page1 = document.querySelector('#home-page-section-one');
        var page2 = document.querySelector('#home-page-section-two');
        // var page3 = document.querySelector('#home-page-section-three');

        window.addEventListener('scroll', function (e) {
            var scrollDirection = currentScrollY - window.scrollY;
            if (scrollDirection === 0) return;

            // 아래로 스크롤 시
            if (scrollDirection < 0) {
                // if (currentScrollY >= page1.offsetTop && currentScrollY <= (page1.offsetTop + page1.offsetHeight)) {
                //     console.log('1페이지 아래로 스크롤');
                //     forwardPageSection('#home-page-section-two');
                //
                // } else if (currentScrollY >= page2.offsetTop && currentScrollY <= (page2.offsetTop + page2.offsetHeight)) {
                //     console.log('2페이지 아래로 스크롤');
                //
                // }
                if (!(currentScrollY >= page2.offsetTop && currentScrollY <= (page2.offsetTop + page2.offsetHeight))) {
                    startPage2();

                }

                // 위로 스크롤 시
            } else if (scrollDirection > 0) {
                if (!(currentScrollY >= page2.offsetTop && currentScrollY <= (page2.offsetTop + page2.offsetHeight))) {
                    startPage2();

                }
                // if (currentScrollY >= page2.offsetTop && currentScrollY <= (page2.offsetTop + page2.offsetHeight)) {
                //     console.log('2페이지 위로 스크롤');
                //
                //} else if (currentScrollY >= page3.offsetTop && currentScrollY <= (page3.offsetTop + page3.offsetHeight)) {
                //     console.log('3페이지 위로 스크롤');
                //     forwardPageSection('#home-page-section-two');
                //
                // }


            }


            currentScrollY = window.scrollY;
        });
    }

    window.onload = function () {
        smoothScroll();
    }

</script>