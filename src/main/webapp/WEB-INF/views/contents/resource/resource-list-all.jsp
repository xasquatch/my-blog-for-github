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
                <div class="sr-only">${resource.mbr_name}</div>
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
        var prettyContents = null;
        try {
            prettyContents = JSON.stringify(JSON.parse(element.querySelector('p').innerText), null, 2);
        } catch (e) {
            prettyContents = element.querySelector('p').innerText;
        }
        var serialNumber = element.querySelector('label').innerText;
        var userName = element.querySelector('div').innerText;
        var textarea = document.createElement('textarea');
        var emptyContentsDiv = document.createElement('div');
        var emptyTitleDiv = document.createElement('div');
        var titleInput = document.createElement('input');
        titleInput.id = 'resource-title';
        textarea.id = 'resource-contents';

        textarea.style.width = '100%';
        textarea.style.height = '30vh';
        textarea.style.resize = 'none';
        textarea.innerHTML = prettyContents;

        titleInput.className = 'form-control';
        titleInput.type = 'text';
        titleInput.setAttribute('value', element.querySelector('h3').innerText);

        emptyTitleDiv.appendChild(titleInput)
        emptyContentsDiv.appendChild(textarea);

        modal.changeForm('[Serial Number:' + serialNumber + ' by ' + userName + '] ' + emptyTitleDiv.innerHTML,
            emptyContentsDiv.innerHTML);
    }

    function setClickEventDivContents() {
        var divBox = document.querySelectorAll('.resource-list-box>div');
        for (var box of divBox) {
            box.setAttribute('onclick', 'resourceViewSetting(this)');
        }
    }

    function moreLoad() {
        try {
            var lastNumber = document.querySelector('.resource-list-box>div:last-child>label').innerText;
        } catch (e) {
            window.alert('더이상 불러올 리소스가 없습니다.');
        }
        var uniform = uri.getUniform('/resource/', '/list');

        ajax.submit('GET', '${path}/resource/' + uniform + '/AdditionalList?lastNumber=' + lastNumber, function (data) {
            if (data === 'false') {
                window.alert('리소스 가져오기에 실패하였습니다. 잠시 후 다시 시도해주세요.')

            } else {
                var jsonData = JSON.parse(data);
                console.log(jsonData);
                if (jsonData.length !== 0) {
                    var resourceListBox = document.querySelector('.resource-list-box');

                    for (var resource of jsonData) {
                        // <div class="btn-link-red" data-toggle="modal" data-target="#myModal">
                        var divContainerElement = document.createElement('div');
                        divContainerElement.className = 'btn-link-red';
                        divContainerElement.setAttribute('data-toggle', 'modal')
                        divContainerElement.setAttribute('data-target', '#myModal')

                        var labelElement = document.createElement('label');
                        labelElement.className = 'sr-only';
                        labelElement.innerText = resource.no;

                        var divUserNameElement = document.createElement('div');
                        divUserNameElement.className = 'sr-only';
                        divUserNameElement.innerText = resource.mbr_name;

                        var h3Element = document.createElement('h3');
                        h3Element.innerText = resource.title;

                        var paragraphElement = document.createElement('p');
                        paragraphElement.innerText = resource.contents;

                        divContainerElement.appendChild(labelElement);
                        divContainerElement.appendChild(divUserNameElement);
                        divContainerElement.appendChild(h3Element);
                        divContainerElement.appendChild(paragraphElement);

                        resourceListBox.appendChild(divContainerElement);
                        setClickEventDivContents();
                    }

                } else {
                    window.alert('더이상 불러올 리소스가 없습니다.');

                }
            }

        });
    }

    setClickEventDivContents();

</script>