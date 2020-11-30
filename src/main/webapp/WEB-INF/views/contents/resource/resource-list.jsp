<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<section id="myblog-main-section">
    <article class="resource-list-title">
        <div>
            <h1 class="dot-key" style="width: 200px">내 저장소</h1>
        </div>
        <div>
            <div style="display: flex; align-items: flex-start; flex-wrap: nowrap; justify-content: flex-end;">
                <input type="text" class="dot-key" id="resource-search-value" placeholder="search!" value="">
                <button class="btn-link-red dot-key" onclick="resources.searchResource(${sessionMember.no});">
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
        <button type="button" class="btn btn-link-red dot-key" style="font-size: 30px; width: 100%" onclick="resources.moreLoad(${sessionMember.no})">
            More Load
        </button>
    </article>

</section>
<script>
    document.querySelector('#resource-search-value').addEventListener('keypress', function (e) {
        if (e.keyCode === 13) resources.searchResource(${sessionMember.no});

    });

    window.onload = function () {
        resources.setClickEventDivContents();

    }

</script>