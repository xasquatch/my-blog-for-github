<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<section>
    <section style="display: flex; flex-wrap: nowrap; flex-direction: row; justify-content: space-between;">
        <h1 class="dot-key">저장소 생성<BR>(only supported JSON)</h1>
    </section>
    <form id="repository-form">
        <div class="input-group">
            <div class="input-group-addon">Title</div>
            <input type="text" class="form-control" name="title" placeholder="Insert your repository name">
        </div>
        <textarea id="repository-json-real" name="contents" hidden></textarea>
    </form>
    <section id="repository-section">
<textarea id="repository-json-input"
placeholder='{
    "key0":"value",
    "key1":["value1","value2"]
    "key2":"value",
    "key3":"value",
}'>
</textarea>
        <div class="repository-manipulation-btn">
            <button type="button" class="btn btn-link-red" style="width: 120px; height: fit-content;" onclick="uploadJSON()">
                <span class="glyphicon glyphicon-hdd" style="font-size: 30px"></span>
                Upload<BR>JSON
            </button>
            <button type="button" class="btn btn-link-red" style="width: 120px; height: fit-content;" onclick="convertJSON()">
                <span class="glyphicon glyphicon-refresh" style="font-size: 30px"></span>
                Convert<BR>JSON
            </button>
        </div>

        <textarea id="repository-json-convert" class="dot-key" readonly>
        </textarea>
    </section>
<div class="dot-key" style="text-align: center;">
    본 페이지에서는 <b style="color: darkred">JSON</b>형식만을 지원합니다.<BR>
    하단 URL을 통해 JSON에 대해 간략히 알아보실 수 있습니다.<BR>
    <a href="https://developer.mozilla.org/ko/docs/Learn/JavaScript/Objects/JSON" target="_blank" style="color: #4d9be2 !important; word-break: break-all">
        https://developer.mozilla.org/ko/docs/Learn/JavaScript/Objects/JSON(새 창으로 열기)
    </a>
</div>
</section>

<script>
    document.querySelector('#repository-json-input').addEventListener('keypress', function (e) {
        console.log(e.keyCode);
    })


    function uploadJSON() {
        convertJSON();

        if (window.confirm('변환되는 JSON객체로 업로드됩니다. 이대로 진행하시겠습니까?')) {
            var convertedData = document.querySelector('#repository-json-convert');
            var realContents = document.querySelector('#repository-json-real');
            realContents.value = convertedData.value;

            var repositoryForm = document.querySelector('#repository-form');
            var formData = new FormData(repositoryForm);

            ajax.submit('post', '${path}/repository/${sessionMember.no}/upload', function (data) {
                console.log(data);

            }, 'FORMFILE', formData);

        }


    }

    function convertJSON() {
        var inputData = document.querySelector('#repository-json-input');
        var convertedData = document.querySelector('#repository-json-convert');
        try {
            convertedData.style.color = 'inherited';
            convertedData.value = JSON.stringify(JSON.parse(inputData.value));
        } catch (e) {
            console.log(e);
            convertedData.style.color = 'red';
            convertedData.value = e;

        }
    }


</script>