<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sForm" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<ul id="home-page-container">
    <li id="home-page-section-one">
        <h1 class="dot-key"></h1>
    </li>
    <li id="home-page-section-two">

    </li>
    <li id="home-page-section-three">
        <section>
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
        textScript.insertText('#home-page-section-one h1', 'Welcome My Blog <BR>Develop By Xasquatch', 10);
    }

    function smoothScroll() {

        startPage1();
        var currentScrollY = window.scrollY;
        var page1 = document.querySelector('#home-page-section-one');
        var page2 = document.querySelector('#home-page-section-two');
        var page3 = document.querySelector('#home-page-section-three');

        window.addEventListener('scroll', function (e) {
            var scrollDirection = currentScrollY - window.scrollY;
            if (scrollDirection === 0) return;

            if (scrollDirection < 0) {
                console.log('아래로');
                $('#home-page-container>li:nth-child(1)').animate()
            } else if (scrollDirection > 0) {
                console.log('위로');

            }


            currentScrollY = window.scrollY;
        });
    }

    window.onload = function () {
        smoothScroll();
    }

</script>