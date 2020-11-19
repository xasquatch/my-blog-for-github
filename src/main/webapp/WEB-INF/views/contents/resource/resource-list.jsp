<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<section id="main-section">
    <article class="resource-list-title">
        <div>
            <h1 class="dot-key" style="width: 200px">내 저장소</h1>
        </div>
        <div>
            <div style="display: flex; align-items: flex-start; flex-wrap: nowrap; justify-content: flex-end;">
                <input type="text" class="form-control dot-key" id="search-value" placeholder="search!">
                <button class="btn-link-red dot-key" style="height: 35px" onclick="extracted();">
                    <span class="glyphicon glyphicon-search"></span>
                </button>
                <button type="button" class="btn btn-link-red dot-key" style="font-size: 15px;"
                        onclick="location.href='${path}/resource/${sessionMember.no}/create'">
                    New
                </button>
            </div>
        </div>
    </article>
    <article class="resource-list-box">
        <c:forEach items="${requestScope.resources}" var="resource">
            <div class="btn-link-red" data-toggle="modal" data-target="#myModal">
                <label class="sr-only">${resource.no}</label>
                <h3>${resource.title}</h3>
                <p>${resource.contents}</p>
            </div>
        </c:forEach>
    </article>
    <article>
        <BR><BR>
        <button type="button" class="btn btn-link-red dot-key" style="font-size: 30px; width: 100%" onclick="moreLoad()">
            More Load
        </button>
    </article>

</section>
<script>
    document.querySelector('#search-value').addEventListener('keypress', function (e) {

        if (e.keyCode === 13) extracted();
    });

    function extracted(data) {
        window.alert(data);
    }

    function resourceViewSetting(element) {

        var prettyContents = JSON.stringify(JSON.parse(element.querySelector('p').innerText), null, 2);
        var textarea = document.createElement('textarea');
        var emptyDiv = document.createElement('div');
        textarea.style.width = '100%';
        textarea.style.height = '30vh';
        textarea.style.resize = 'none';
        textarea.innerHTML = prettyContents;

        emptyDiv.appendChild(textarea);

        modal.changeForm("[Serial Number:" + element.querySelector('label').innerText + "] " + element.querySelector('h3').innerText, emptyDiv.innerHTML);

    }

    function setClickEventDivContents() {
        var divBox = document.querySelectorAll('.resource-list-box>div');
        for (var box of divBox) {
            box.setAttribute('onclick',
                'resourceViewSetting(this)');
        }
    }

    function moreLoad() {
        var lastNumber = document.querySelector('.resource-list-box>div:last-child>label').innerText;

        ajax.submit('GET',)
    }

    setClickEventDivContents();

</script>