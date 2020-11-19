<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<section>
    <section style="display: flex; flex-wrap: nowrap; flex-direction: row; justify-content: space-between;">
        <h1 class="dot-key">저장소 생성<BR>(only supported JSON)</h1>
    </section>
    <form id="resource-form">
        <div class="input-group">
            <div class="input-group-addon">Title</div>
            <input type="text" class="form-control" name="title" placeholder="Insert your resource name" maxlength="100">
        </div>
        <textarea id="resource-json-real" name="contents" hidden></textarea>
    </form>
    <section id="resource-section">
<textarea id="resource-json-input"
          placeholder='{
    "key0":"value",
    "key1":["value1","value2"],
    "key2":"value",
    "key3":"value"
}'>
</textarea>
        <div class="resource-manipulation-btn">
            <button type="button" class="btn btn-link-red" style="width: 120px; height: fit-content;" onclick="uploadJSON()">
                <span class="glyphicon glyphicon-hdd" style="font-size: 30px"></span>
                Upload<BR>JSON
            </button>
            <button type="button" class="btn btn-link-red" style="width: 120px; height: fit-content;" onclick="convertJSON()">
                <span class="glyphicon glyphicon-refresh" style="font-size: 30px"></span>
                Convert<BR>JSON
            </button>
        </div>

        <textarea id="resource-json-convert" class="dot-key" readonly>
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
    document.querySelector('#resource-json-input').addEventListener('keypress', function (e) {
        console.log(e.keyCode);
    })


    function uploadJSON() {
        convertJSON();

        if (window.confirm('변환되는 JSON객체로 업로드됩니다. 이대로 진행하시겠습니까?')) {
            var convertedData = document.querySelector('#resource-json-convert');
            var realContents = document.querySelector('#resource-json-real');
            realContents.value = convertedData.value;

            var resourceForm = document.querySelector('#resource-form');
            var formData = new FormData(resourceForm);

            ajax.submit('post', '${path}/resource/${sessionMember.no}/upload', function (data) {

                if (data === 'false') {
                    window.alert('리소스 업로드에 실패하였습니다. 다시 시도해주세요.');

                } else if (data === 'true') {
                    window.location.href = '${path}/resource/${sessionMember.no}/list'

                }


            }, 'FORMFILE', formData);

        }


    }

    function convertJSON() {
        var inputData = document.querySelector('#resource-json-input');
        var convertedData = document.querySelector('#resource-json-convert');
        try {
            convertedData.style.color = 'inherit';
            convertedData.value = JSON.stringify(JSON.parse(inputData.value), null, 2);

        } catch (e) {
            convertedData.style.color = 'red';
            convertedData.value = e;

        }
    }


</script>