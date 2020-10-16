<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<section>
    <h2>Title</h2>
    <kbd><%=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()) %></kbd>
    <HR>
    <div id="board-view-contents">

        <div class="col-md-9" role="main" style="height: auto !important; min-height: 0px !important;">
            <div class="bs-docs-section">
                <h1 id="overview" class="page-header">개요<a class="anchorjs-link" href="#overview"><span class="anchorjs-icon"></span></a></h1>

                <p class="lead">웹개발을 더 좋고, 빠르고, 강력하게 접근하는 방법을 가진 부트스트랩의 기반시설의 핵심적인 부분을 알아보세요.</p>

                <h3 id="overview-doctype">HTML5 doctype<a class="anchorjs-link" href="#overview-doctype"><span class="anchorjs-icon"></span></a></h3>
                <p>부트스트랩은 HTML5 doctype 의 사용을 필요로 하는 HTML 요소와 CSS 속성을 이용합니다. 당신의 프로젝트들을 시작할 때 그것들 포함하세요.</p>
                <div class="zero-clipboard"><span class="btn-clipboard btn-clipboard-hover">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="cp">&lt;!DOCTYPE html&gt;</span>
<span class="nt">&lt;html</span> <span class="na">lang=</span><span class="s">"ko"</span><span class="nt">&gt;</span>
  ...
<span class="nt">&lt;/html&gt;</span></code></pre></div>

                <h3 id="overview-mobile">모바일 우선<a class="anchorjs-link" href="#overview-mobile"><span class="anchorjs-icon"></span></a></h3>
                <p>부트스트랩2 에서 우리는 모바일 친화적인 스타일을 프레임워크의 중요한 부분으로 추가했었습니다. 부트스트랩3 에서는 시작부터 모바일 친화적으로 다시 만들었습니다. 모바일은 부가적인 부분이 아닌 핵심적인 부분으로 만들어졌습니다. 말하자면, <strong>부트스트랩은 모바일 우선입니다</strong>. 모바일 우선 스타일은 전 독립된 파일들이 아닌 전 영역을 걸쳐 확인할 수 있습니다.</p>
                <p>적절한 렌더링과 확대/축소를 위해, 당신의 <code>&lt;head&gt;</code> 에 <strong>viewport 메타태그를 추가하세요</strong>.</p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;meta</span> <span class="na">name=</span><span class="s">"viewport"</span> <span class="na">content=</span><span class="s">"width=device-width, initial-scale=1"</span><span class="nt">&gt;</span></code></pre></div>
                <p>당신은 viewport 메타태그에 <code>user-scalable=no</code> 를 추가하여 모바일 기기에서 확대/축소 기능을 끌 수 있습니다. 확대/축소를 끈다는 것은, 사용자들이 오직 스크롤만 할 수 있음을 의미합니다. 그리고 당신의 사이트가 좀더 네이티브 어플같이 느껴지도록 합니다. 종합적으로 봤을때 우리는 모든 사이트에 이것을 추천하지 않습니다. 그러므로 조심히 사용하세요!</p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;meta</span> <span class="na">name=</span><span class="s">"viewport"</span> <span class="na">content=</span><span class="s">"width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"</span><span class="nt">&gt;</span></code></pre></div>

                <h3 id="overview-type-links">타이포그래피와 링크<a class="anchorjs-link" href="#overview-type-links"><span class="anchorjs-icon"></span></a></h3>
                <p>부트스트랩은 기본적인 전역적인 표시, 타이포그래피, 링크 스타일이 설정되어 있습니다. 구체적으로, 우리는::</p>
                <ul>
                    <li><code>body</code> 에서 <code>background-color: #fff;</code> 를 설정합니다.</li>
                    <li>기본 타이포그래피로 속성 <code>@font-family-base</code>, <code>@font-size-base</code>, <code>@line-height-base</code> 를 사용합니다.</li>
                    <li>전역 링크의 색은 <code>@link-color</code> 에 설정하고 밑줄효과는 <code>:hover</code> 에만 적용되어 있습니다.</li>
                </ul>
                <p>이 스타일들은 <code>scaffolding.less</code> 내에서 찾을 수 있습니다.</p>

                <h3 id="overview-normalize">CSS 초기화<a class="anchorjs-link" href="#overview-normalize"><span class="anchorjs-icon"></span></a></h3>
                <p>향상된 크로스 브라우징을 위해, 우리는 <a href="https://twitter.com/necolas" target="_blank">Nicolas Gallagher</a> 와 <a href="https://twitter.com/jon_neal" target="_blank">Jonathan Neal</a> 의 프로젝트인 <a href="http://necolas.github.io/normalize.css/" target="_blank">Normalize.css</a> 를 사용합니다.</p>

                <h3 id="overview-container">콘테이너<a class="anchorjs-link" href="#overview-container"><span class="anchorjs-icon"></span></a></h3>
                <p>부트스트랩은 사이트 콘텐츠를 감싸고 그리드 시스템을 만들 콘테이너 요소가 필요합니다. 당신은 당신의 프로젝트에 2가지 콘테이너 중 하나를 선택할 수 있습니다. 주목할 점은, <code>padding</code> 등의 문제로 어느 것도 중첩할 수는 없다는 것이다.</p>
                <p>반응형 고정폭 콘테이너를 위해 <code>.container</code> 를 사용하세요.</p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"container"</span><span class="nt">&gt;</span>
  ...
<span class="nt">&lt;/div&gt;</span></code></pre></div>
                <p>당신의 뷰포트 전체폭까지 늘어나는 최대폭 콘테이너를 위해 <code>.container-fluid</code> 을 사용하세요.</p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"container-fluid"</span><span class="nt">&gt;</span>
  ...
<span class="nt">&lt;/div&gt;</span></code></pre></div>
            </div>

            <div class="bs-docs-section">
                <h1 id="grid" class="page-header">그리드 시스템<a class="anchorjs-link" href="#grid"><span class="anchorjs-icon"></span></a></h1>

                <p class="lead">부트스트랩은 기기나 뷰포트 크기가 증가함에 따라 12 열이 적절하게 확대되는 반응형, 모바일 우선 유동 그리드 시스템입니다. 그것은 쉬운 레이아웃을 위해 <a href="#grid-example-basic">미리 정해진 클래스들</a> 뿐만 아니라 강력한 <a href="#grid-less">더 시멘틱한 레이아웃을 생성하기 위한 믹스인</a> 을 포함하고 있습니다.</p>

                <h3 id="grid-intro">소개<a class="anchorjs-link" href="#grid-intro"><span class="anchorjs-icon"></span></a></h3>
                <p>그리드 시스템은 당신의 콘텐츠를 보관할 행과 열 시리즈를 통해 페이지 레이아웃들 만드는데 사용되어집니다. 부트스트랩의 그리드 시스템이 어떻게 작동하는지 여기에 있습니다:</p>
                <ul>
                    <li>행은 반드시 적절한 정렬과 패딩을 위해서 <code>.container</code> (fixed-width) 나 <code>.container-fluid</code> (full-width) 안에 위치해야 합니다.</li>
                    <li>열들의 수평그룹을 만드는데 행을 이용하세요.  <!-- TODO: Use rows to create horizontal groups of columns. --></li>
                    <li>콘텐츠는 열안에 위치해야 합니다. 그리고 열들만이 행의 바로 아래에 올 수 있습니다. <!-- TODO: and only columns may be immediate children of rows.--></li>
                    <li><code>.row</code> 과 <code>.col-xs-4</code> 같은 사전정의된 그리드 클래스들은 간편하게 그리드 레이아웃 만드는 것을 가능하게 합니다. Less 믹스인은 좀 더 시멘틱한 레이아웃을 위해 사용되어질 수 있습니다.</li>
                    <li>열은 <code>padding</code> 으로 사이 간격을 만듭니다. 패딩은 행 내에서 첫열과 마지막열을 위해 <code>.row</code> 내에 음수 마진으로 offset 되어 있습니다.</li>
                    <li>음수 마진은 아래의 예제들이 내어쓰기가 되어 있는 이유입니다. 그것은 그리드 열 내의 콘텐츠는 비그리드 콘텐츠와 정렬되기 위함입니다. <!-- FIXME: It's so that content within grid columns is lined up with non-grid content. --></li>
                    <li>그리드 열은 12개의 가능한 열들을 원하는 만큼 명시하는 것으로 만들어집니다. 예를 들면, 같은 크기의 3개 열은 <code>.col-xs-4</code> 를 3개 사용할 수 있습니다. <!-- TODO: Grid columns are created by specifying the number of twelve available columns you wish to span. For example, three equal columns would use three .col-xs-4. --></li>
                    <li>만약 한 행에 12열보다 더 많이 배치된다면, 남은 열들은, 하나의 유닛으로, 새로운 라인에 감싸집니다. <!-- TOFIX: If more than 12 columns are placed within a single row, each group of extra columns will, as one unit, wrap onto a new line.---></li>
                    <li>그리드 클래스는 분기점 크기보다 크거나 같은 너비의 화면을 가진 기기에 적용됩니다. 그리고 보다 작은 기기의 그리드 클래스가 오버라이드 됩니다. 그리하여, 예를 들어 요소에 <code>.col-md-*</code> 클래스를 적용하는 것은 중간 기기에 스타일이 효과가 있는 것뿐만 아니라 <code>.col-lg-*</code> 클래스가 없다면 큰 기기에도 효과가 있게 됩니다.</li>
                </ul>
                <p>당신의 코드에 이 원칙들이 적용되는 것을 위해 예제를 보세요.</p>

                <h3 id="grid-media-queries">미디어 쿼리<a class="anchorjs-link" href="#grid-media-queries"><span class="anchorjs-icon"></span></a></h3>
                <p>우리는 우리의 그리드 시스템에서 주요 분기점을 만들기 위해 다음의 미디어 쿼리들을 사용합니다.</p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="cm">/* 매우 작은 기기들 (모바일폰, 768px 보다 작은) */</span>
<span class="cm">/* 부트스트랩에서 이것은 기본이므로 미디어쿼리가 없습니다. */</span>

<span class="cm">/* 작은 기기들 (태블릿, 768px 이상) */</span>
<span class="k">@media</span> <span class="o">(</span><span class="nt">min-width</span><span class="nd">:</span> <span class="o">@</span><span class="nt">screen-sm-min</span><span class="o">)</span> <span class="p">{</span> <span class="nc">...</span> <span class="p">}</span>

<span class="cm">/* 중간 기기들 (데스크탑, 992px 이상) */</span>
<span class="k">@media</span> <span class="o">(</span><span class="nt">min-width</span><span class="nd">:</span> <span class="o">@</span><span class="nt">screen-md-min</span><span class="o">)</span> <span class="p">{</span> <span class="nc">...</span> <span class="p">}</span>

<span class="cm">/* 큰 기기들 (큰 데스크탑, 1200px 이상) */</span>
<span class="k">@media</span> <span class="o">(</span><span class="nt">min-width</span><span class="nd">:</span> <span class="o">@</span><span class="nt">screen-lg-min</span><span class="o">)</span> <span class="p">{</span> <span class="nc">...</span> <span class="p">}</span></code></pre></div>
                <p>우리는 가끔 기기들에 CSS 를 좁게 적용하기 위해 미디어쿼리에 <code>max-width</code> 를 포함하여 부연합니다.</p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="k">@media</span> <span class="o">(</span><span class="nt">max-width</span><span class="nd">:</span> <span class="o">@</span><span class="nt">screen-xs-max</span><span class="o">)</span> <span class="p">{</span> <span class="nc">...</span> <span class="p">}</span>
<span class="k">@media</span> <span class="o">(</span><span class="nt">min-width</span><span class="nd">:</span> <span class="o">@</span><span class="nt">screen-sm-min</span><span class="o">)</span> <span class="nt">and</span> <span class="o">(</span><span class="nt">max-width</span><span class="nd">:</span> <span class="o">@</span><span class="nt">screen-sm-max</span><span class="o">)</span> <span class="p">{</span> <span class="nc">...</span> <span class="p">}</span>
<span class="k">@media</span> <span class="o">(</span><span class="nt">min-width</span><span class="nd">:</span> <span class="o">@</span><span class="nt">screen-md-min</span><span class="o">)</span> <span class="nt">and</span> <span class="o">(</span><span class="nt">max-width</span><span class="nd">:</span> <span class="o">@</span><span class="nt">screen-md-max</span><span class="o">)</span> <span class="p">{</span> <span class="nc">...</span> <span class="p">}</span>
<span class="k">@media</span> <span class="o">(</span><span class="nt">min-width</span><span class="nd">:</span> <span class="o">@</span><span class="nt">screen-lg-min</span><span class="o">)</span> <span class="p">{</span> <span class="nc">...</span> <span class="p">}</span></code></pre></div>

                <h3 id="grid-options">그리드 옵션<a class="anchorjs-link" href="#grid-options"><span class="anchorjs-icon"></span></a></h3>
                <p>다양한 기기들을 넘나드는 부트스트랩 그리드 시스템을 간단한 테이블로 살펴보세요.</p>
                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th></th>
                            <th>
                                매우 작은 기기
                                <small>모바일폰 (&lt;768px)</small>
                            </th>
                            <th>
                                작은 기기
                                <small>태블릿 (≥768px)</small>
                            </th>
                            <th>
                                중간 기기
                                <small>데스크탑 (≥992px)</small>
                            </th>
                            <th>
                                큰 기기
                                <small>데스크탑 (≥1200px)</small>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th class="text-nowrap" scope="row">그리드 적용</th>
                            <td>항상 <!-- TODO: Horizontal at all times --></td>
                            <td colspan="3">분기점보다 크면 적용 <!-- TODO: Collapsed to start, horizontal above breakpoints --></td>
                        </tr>
                        <tr>
                            <th class="text-nowrap" scope="row">콘테이너 너비</th>
                            <td>없음 (auto)</td>
                            <td>750px</td>
                            <td>970px</td>
                            <td>1170px</td>
                        </tr>
                        <tr>
                            <th class="text-nowrap" scope="row">클래스 접두사</th>
                            <td><code>.col-xs-</code></td>
                            <td><code>.col-sm-</code></td>
                            <td><code>.col-md-</code></td>
                            <td><code>.col-lg-</code></td>
                        </tr>
                        <tr>
                            <th class="text-nowrap" scope="row">컬럼 수</th>
                            <td colspan="4">12</td>
                        </tr>
                        <tr>
                            <th class="text-nowrap" scope="row">컬럼 너비</th>
                            <td class="text-muted">Auto</td>
                            <td>~62px</td>
                            <td>~81px</td>
                            <td>~97px</td>
                        </tr>
                        <tr>
                            <th class="text-nowrap" scope="row">사이 너비</th>
                            <td colspan="4">30px (컬럼의 양쪽에 15px 씩)</td>
                        </tr>
                        <tr>
                            <th class="text-nowrap" scope="row">중첩</th>
                            <td colspan="4">예</td>
                        </tr>
                        <tr>
                            <th class="text-nowrap" scope="row">오프셋</th>
                            <td colspan="4">예</td>
                        </tr>
                        <tr>
                            <th class="text-nowrap" scope="row">컬럼 순서정하기</th>
                            <td colspan="4">예</td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <h3 id="grid-example-basic">예제: 쌓이다가 수평으로<a class="anchorjs-link" href="#grid-example-basic"><span class="anchorjs-icon"></span></a></h3>
                <p>그리드 클래스인 <code>.col-md-*</code> 싱글 세트를 사용하여, 당신은 데스크탑(중간) 기기에서 수평으로 되기전까지, 모바일 기기와 태블릿 기기(매우 작음에서 작음까지)에서 쌓이기 시작하는 기본 그리드 시스템을 만들 수 있다. <code>.row</code> 안에 그리드 컬럼을 놓으세요.</p>
                <div class="bs-docs-grid">
                    <div class="row show-grid">
                        <div class="col-md-1">.col-md-1</div>
                        <div class="col-md-1">.col-md-1</div>
                        <div class="col-md-1">.col-md-1</div>
                        <div class="col-md-1">.col-md-1</div>
                        <div class="col-md-1">.col-md-1</div>
                        <div class="col-md-1">.col-md-1</div>
                        <div class="col-md-1">.col-md-1</div>
                        <div class="col-md-1">.col-md-1</div>
                        <div class="col-md-1">.col-md-1</div>
                        <div class="col-md-1">.col-md-1</div>
                        <div class="col-md-1">.col-md-1</div>
                        <div class="col-md-1">.col-md-1</div>
                    </div>
                    <div class="row show-grid">
                        <div class="col-md-8">.col-md-8</div>
                        <div class="col-md-4">.col-md-4</div>
                    </div>
                    <div class="row show-grid">
                        <div class="col-md-4">.col-md-4</div>
                        <div class="col-md-4">.col-md-4</div>
                        <div class="col-md-4">.col-md-4</div>
                    </div>
                    <div class="row show-grid">
                        <div class="col-md-6">.col-md-6</div>
                        <div class="col-md-6">.col-md-6</div>
                    </div>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"row"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-md-1"</span><span class="nt">&gt;</span>.col-md-1<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-md-1"</span><span class="nt">&gt;</span>.col-md-1<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-md-1"</span><span class="nt">&gt;</span>.col-md-1<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-md-1"</span><span class="nt">&gt;</span>.col-md-1<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-md-1"</span><span class="nt">&gt;</span>.col-md-1<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-md-1"</span><span class="nt">&gt;</span>.col-md-1<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-md-1"</span><span class="nt">&gt;</span>.col-md-1<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-md-1"</span><span class="nt">&gt;</span>.col-md-1<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-md-1"</span><span class="nt">&gt;</span>.col-md-1<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-md-1"</span><span class="nt">&gt;</span>.col-md-1<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-md-1"</span><span class="nt">&gt;</span>.col-md-1<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-md-1"</span><span class="nt">&gt;</span>.col-md-1<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"row"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-md-8"</span><span class="nt">&gt;</span>.col-md-8<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-md-4"</span><span class="nt">&gt;</span>.col-md-4<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"row"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-md-4"</span><span class="nt">&gt;</span>.col-md-4<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-md-4"</span><span class="nt">&gt;</span>.col-md-4<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-md-4"</span><span class="nt">&gt;</span>.col-md-4<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"row"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-md-6"</span><span class="nt">&gt;</span>.col-md-6<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-md-6"</span><span class="nt">&gt;</span>.col-md-6<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span></code></pre></div>

                <h3 id="grid-example-fluid">예제: 유동 콘테이너<a class="anchorjs-link" href="#grid-example-fluid"><span class="anchorjs-icon"></span></a></h3>
                <p>가장 바깥쪽의 <code>.container</code> 을 <code>.container-fluid</code> 으로 바꿈으로서, 고정폭 그리드 레이아웃을 최대폭 레이아웃으로 전환하세요.</p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"container-fluid"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"row"</span><span class="nt">&gt;</span>
    ...
  <span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span></code></pre></div>

                <h3 id="grid-example-mixed">예제: 모바일과 데스크탑<a class="anchorjs-link" href="#grid-example-mixed"><span class="anchorjs-icon"></span></a></h3>
                <p>보다 작은 기기들에서 당신의 컬럼들이 간단하게 쌓이는 것을 원하세요? 당신의 컬럼에 <code>.col-xs-*</code> <code>.col-md-*</code> 를 추가하여 매우 작은 기기와 중간 기기 그리드 클래스들을 사용하세요. 그것이 어떻게 작동되는지 아래의 예제를 보세요.</p>
                <div class="bs-docs-grid">
                    <div class="row show-grid">
                        <div class="col-xs-12 col-md-8">.col-xs-12 .col-md-8</div>
                        <div class="col-xs-6 col-md-4">.col-xs-6 .col-md-4</div>
                    </div>
                    <div class="row show-grid">
                        <div class="col-xs-6 col-md-4">.col-xs-6 .col-md-4</div>
                        <div class="col-xs-6 col-md-4">.col-xs-6 .col-md-4</div>
                        <div class="col-xs-6 col-md-4">.col-xs-6 .col-md-4</div>
                    </div>
                    <div class="row show-grid">
                        <div class="col-xs-6">.col-xs-6</div>
                        <div class="col-xs-6">.col-xs-6</div>
                    </div>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="c">&lt;!-- 모바일에서 컬럼들이 하나는 꽉찬너비로, 다른 하나는 절반너비로 쌓이게 합니다 --&gt;</span>
<span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"row"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-xs-12 col-md-8"</span><span class="nt">&gt;</span>.col-xs-12 .col-md-8<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-xs-6 col-md-4"</span><span class="nt">&gt;</span>.col-xs-6 .col-md-4<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span>

<span class="c">&lt;!-- 컬럼들은 모바일에서 50% 너비로 시작하고 데스크탑에서는 33.3% 너비가 됩니다 --&gt;</span>
<span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"row"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-xs-6 col-md-4"</span><span class="nt">&gt;</span>.col-xs-6 .col-md-4<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-xs-6 col-md-4"</span><span class="nt">&gt;</span>.col-xs-6 .col-md-4<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-xs-6 col-md-4"</span><span class="nt">&gt;</span>.col-xs-6 .col-md-4<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span>

<span class="c">&lt;!-- 컬럼들은 모바일과 데스크탑에서 항상 50% 너비가 됩니다 --&gt;</span>
<span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"row"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-xs-6"</span><span class="nt">&gt;</span>.col-xs-6<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-xs-6"</span><span class="nt">&gt;</span>.col-xs-6<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span></code></pre></div>

                <h3 id="grid-example-mixed-complete">예제: 모바일, 태블릿, 데스크탑<a class="anchorjs-link" href="#grid-example-mixed-complete"><span class="anchorjs-icon"></span></a></h3>
                <p>이전 예제를 태블릿 <code>.col-sm-*</code> 클래스들과 함께 좀더 역동적이고 힘찬 레이아웃들로 만들어보자.</p>
                <div class="bs-docs-grid">
                    <div class="row show-grid">
                        <div class="col-xs-12 col-sm-6 col-md-8">.col-xs-12 .col-sm-6 .col-md-8</div>
                        <div class="col-xs-6 col-md-4">.col-xs-6 .col-md-4</div>
                    </div>
                    <div class="row show-grid">
                        <div class="col-xs-6 col-sm-4">.col-xs-6 .col-sm-4</div>
                        <div class="col-xs-6 col-sm-4">.col-xs-6 .col-sm-4</div>
                        <!-- Optional: clear the XS cols if their content doesn't match in height -->
                        <div class="clearfix visible-xs-block"></div>
                        <div class="col-xs-6 col-sm-4">.col-xs-6 .col-sm-4</div>
                    </div>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"row"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-xs-12 col-sm-6 col-md-8"</span><span class="nt">&gt;</span>.col-xs-12 .col-sm-6 .col-md-8<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-xs-6 col-md-4"</span><span class="nt">&gt;</span>.col-xs-6 .col-md-4<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"row"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-xs-6 col-sm-4"</span><span class="nt">&gt;</span>.col-xs-6 .col-sm-4<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-xs-6 col-sm-4"</span><span class="nt">&gt;</span>.col-xs-6 .col-sm-4<span class="nt">&lt;/div&gt;</span>
  <span class="c">&lt;!-- Optional: clear the XS cols if their content doesn't match in height --&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"clearfix visible-xs-block"</span><span class="nt">&gt;&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-xs-6 col-sm-4"</span><span class="nt">&gt;</span>.col-xs-6 .col-sm-4<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span></code></pre></div>

                <h3 id="grid-example-wrapping">예제: 열 감싸기<a class="anchorjs-link" href="#grid-example-wrapping"><span class="anchorjs-icon"></span></a></h3>
                <p>만약 한행에 12열보다 많이 배치된다면, 남은 열은, 하나의 유닛처럼 새로운 라인에 감싸지게 됩니다. <!-- TODO: If more than 12 columns are placed within a single row, each group of extra columns will, as one unit, wrap onto a new line.--></p>
                <div class="bs-docs-grid">
                    <div class="row show-grid">
                        <div class="col-xs-9">.col-xs-9</div>
                        <div class="col-xs-4">.col-xs-4<br>Since 9 + 4 = 13 &gt; 12, this 4-column-wide div gets wrapped onto a new line as one contiguous unit.</div>
                        <div class="col-xs-6">.col-xs-6<br>Subsequent columns continue along the new line.</div>
                    </div>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"row"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-xs-9"</span><span class="nt">&gt;</span>.col-xs-9<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-xs-4"</span><span class="nt">&gt;</span>.col-xs-4<span class="nt">&lt;br&gt;</span>Since 9 + 4 = 13 <span class="ni">&amp;gt;</span> 12, this 4-column-wide div gets wrapped onto a new line as one contiguous unit.<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-xs-6"</span><span class="nt">&gt;</span>.col-xs-6<span class="nt">&lt;br&gt;</span>Subsequent columns continue along the new line.<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span></code></pre></div>

                <h3 id="grid-responsive-resets">반응형 컬럼 초기화<a class="anchorjs-link" href="#grid-responsive-resets"><span class="anchorjs-icon"></span></a></h3>
                <p>사용가능한 4등급의 그리드들과 특정 분기점에서, 컬럼들이 하나가 다른 컬럼보다 긴 경우 명확하게 클리어 되지 않을 수 있다. 그걸 고치기 위해서는, <code>.clearfix</code> 와 우리의 <a href="#responsive-utilities">responsive utility classes</a> 의 조합을 사용하면 됩니다.</p>
                <div class="bs-docs-grid">
                    <div class="row show-grid">
                        <div class="col-xs-6 col-sm-3">
                            .col-xs-6 .col-sm-3
                            <br>
                            Resize your viewport or check it out on your phone for an example.
                        </div>
                        <div class="col-xs-6 col-sm-3">.col-xs-6 .col-sm-3</div>

                        <!-- 필요한 뷰포트에만 clearfix 를 추가하세요 -->
                        <div class="clearfix visible-xs-block"></div>

                        <div class="col-xs-6 col-sm-3">.col-xs-6 .col-sm-3</div>
                        <div class="col-xs-6 col-sm-3">.col-xs-6 .col-sm-3</div>
                    </div>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"row"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-xs-6 col-sm-3"</span><span class="nt">&gt;</span>.col-xs-6 .col-sm-3<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-xs-6 col-sm-3"</span><span class="nt">&gt;</span>.col-xs-6 .col-sm-3<span class="nt">&lt;/div&gt;</span>

  <span class="c">&lt;!-- 필요한 뷰포트에만 clearfix 를 추가하세요 --&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"clearfix visible-xs-block"</span><span class="nt">&gt;&lt;/div&gt;</span>

  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-xs-6 col-sm-3"</span><span class="nt">&gt;</span>.col-xs-6 .col-sm-3<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-xs-6 col-sm-3"</span><span class="nt">&gt;</span>.col-xs-6 .col-sm-3<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span></code></pre></div>
                <p>반응형 분기점에서 컬럼을 초기화하는 것과 더불어, 당신은 <strong>offset, push, pull 초기화</strong>가 필요할 수 있습니다. 이것에 대해서는 <a href="../examples/grid/">그리드 예제</a> 를 보세요. <!-- TODO: In addition to column clearing at responsive breakpoints, you may need to <strong>reset offsets, pushes, or pulls</strong>. See this in action in <a href="../examples/grid/">the grid example</a>.--></p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"row"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-sm-5 col-md-6"</span><span class="nt">&gt;</span>.col-sm-5 .col-md-6<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-sm-5 col-sm-offset-2 col-md-6 col-md-offset-0"</span><span class="nt">&gt;</span>.col-sm-5 .col-sm-offset-2 .col-md-6 .col-md-offset-0<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span>

<span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"row"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-sm-6 col-md-5 col-lg-6"</span><span class="nt">&gt;</span>.col-sm-6 .col-md-5 .col-lg-6<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-sm-6 col-md-5 col-md-offset-2 col-lg-6 col-lg-offset-0"</span><span class="nt">&gt;</span>.col-sm-6 .col-md-5 .col-md-offset-2 .col-lg-6 .col-lg-offset-0<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span></code></pre></div>


                <h3 id="grid-offsetting">컬럼 오프셋하기<a class="anchorjs-link" href="#grid-offsetting"><span class="anchorjs-icon"></span></a></h3>
                <p><code>.col-md-offset-*</code> 클래스를 사용하여 컬럼을 우측으로 옮기세요. 이 클래스들은 <code>*</code> 컬럼만큼 한 컬럼의 좌측마진을 증가하게 합니다. 예를 들어, <code>.col-md-offset-4</code> 는 <code>.col-md-4</code> 을 4컬럼만큼 이동시킵니다.</p>
                <div class="bs-docs-grid">
                    <div class="row show-grid">
                        <div class="col-md-4">.col-md-4</div>
                        <div class="col-md-4 col-md-offset-4">.col-md-4 .col-md-offset-4</div>
                    </div>
                    <div class="row show-grid">
                        <div class="col-md-3 col-md-offset-3">.col-md-3 .col-md-offset-3</div>
                        <div class="col-md-3 col-md-offset-3">.col-md-3 .col-md-offset-3</div>
                    </div>
                    <div class="row show-grid">
                        <div class="col-md-6 col-md-offset-3">.col-md-6 .col-md-offset-3</div>
                    </div>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"row"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-md-4"</span><span class="nt">&gt;</span>.col-md-4<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-md-4 col-md-offset-4"</span><span class="nt">&gt;</span>.col-md-4 .col-md-offset-4<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"row"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-md-3 col-md-offset-3"</span><span class="nt">&gt;</span>.col-md-3 .col-md-offset-3<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-md-3 col-md-offset-3"</span><span class="nt">&gt;</span>.col-md-3 .col-md-offset-3<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"row"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-md-6 col-md-offset-3"</span><span class="nt">&gt;</span>.col-md-6 .col-md-offset-3<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span></code></pre></div>


                <h3 id="grid-nesting">컬럼 중첩하기<a class="anchorjs-link" href="#grid-nesting"><span class="anchorjs-icon"></span></a></h3>
                <p>기본그리드로 당신의 콘텐츠를 중첩하려면, 존재하는 <code>.col-md-*</code> 컬럼 내에 새로운 <code>.row</code> 와 <code>.col-md-*</code> 컬럼 세트를 추가하세요. 중첩된 행은 합쳐서 12 가 되는 하나의 컬럼 세트를 포함해야 합니다. <!-- TODO: To nest your content with the default grid, add a new <code>.row</code> and set of <code>.col-sm-*</code> columns within an existing <code>.col-sm-*</code> column. Nested rows should include a set of columns that add up to 12 or fewer (it is not required that you use all 12 available columns). --></p>
                <div class="row show-grid">
                    <div class="col-sm-9">
                        Level 1: .col-sm-9
                        <div class="row show-grid">
                            <div class="col-xs-8 col-sm-6">
                                Level 2: .col-xs-8 .col-sm-6
                            </div>
                            <div class="col-xs-4 col-sm-6">
                                Level 2: .col-xs-4 .col-sm-6
                            </div>
                        </div>
                    </div>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"row"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-sm-9"</span><span class="nt">&gt;</span>
    Level 1: .col-sm-9
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"row"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-xs-8 col-sm-6"</span><span class="nt">&gt;</span>
        Level 2: .col-xs-8 .col-sm-6
      <span class="nt">&lt;/div&gt;</span>
      <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-xs-4 col-sm-6"</span><span class="nt">&gt;</span>
        Level 2: .col-xs-4 .col-sm-6
      <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span></code></pre></div>

                <h3 id="grid-column-ordering">컬럼 순서정하기<a class="anchorjs-link" href="#grid-column-ordering"><span class="anchorjs-icon"></span></a></h3>
                <p><code>.col-md-push-*</code> 와 <code>.col-md-pull-*</code> 수식클래스들로 우리의 그리드 컬럼들의 순서를 쉽게 변경하세요.</p>
                <div class="row show-grid">
                    <div class="col-md-9 col-md-push-3">.col-md-9 .col-md-push-3</div>
                    <div class="col-md-3 col-md-pull-9">.col-md-3 .col-md-pull-9</div>
                </div>

                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"row"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-md-9 col-md-push-3"</span><span class="nt">&gt;</span>.col-md-9 .col-md-push-3<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-md-3 col-md-pull-9"</span><span class="nt">&gt;</span>.col-md-3 .col-md-pull-9<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span></code></pre></div>

                <h3 id="grid-less">LESS 믹스인과 변수<a class="anchorjs-link" href="#grid-less"><span class="anchorjs-icon"></span></a></h3>
                <p>빠른 레이아웃을 위한 <a href="#grid-example-basic">미리 만들어진 그리드 클래스들</a> 과 더불어, 부트스트랩은 당신만의 간단하고 시맨틱한 레이아웃을 빠르게 생성하기 위해 LESS 변수과 믹스인을 포함하고 있습니다.</p>

                <h4 id="변수">변수<a class="anchorjs-link" href="#변수"><span class="anchorjs-icon"></span></a></h4>
                <p>변수들은 컬럼들의 갯수, 간격의 너비, 미디어 쿼리 분기점을 결정합니다. 우리는 위처럼 미리 정의된 그리드 클래스들 뿐만 아니라 아래의 맞춤 믹스인을 위해 사용할 수 있습니다.</p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="k">@grid-columns</span><span class="nd">:</span>              <span class="nt">12</span><span class="p">;</span>
<span class="k">@grid-gutter-width</span><span class="nd">:</span>         <span class="nt">30px</span><span class="p">;</span>
<span class="k">@grid-float-breakpoint</span><span class="nd">:</span>     <span class="nt">768px</span><span class="p">;</span></code></pre></div>

                <h4 id="믹스인">믹스인<a class="anchorjs-link" href="#믹스인"><span class="anchorjs-icon"></span></a></h4>
                <p>믹스인은 그리드 변수와 함께 개개의 그리드 컬럼들을 위한 시맨틱 CSS 를 생성하는데 사용됩니다.</p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="c1">// 일련의 컬럼을 위해 wrapper 를 생성합니다.
</span><span class="err">.</span><span class="na">make-row</span><span class="err">(@</span><span class="na">gutter</span><span class="p">:</span> <span class="o">@</span><span class="n">grid-gutter-width</span><span class="p">)</span> <span class="p">{</span>
  <span class="c1">// Then clear the floated columns
</span>  <span class="nc">.clearfix</span><span class="o">()</span><span class="p">;</span>

  <span class="k">@media</span> <span class="o">(</span><span class="nt">min-width</span><span class="nd">:</span> <span class="o">@</span><span class="nt">screen-sm-min</span><span class="o">)</span> <span class="p">{</span>
    <span class="nl">margin-left</span><span class="p">:</span>  <span class="p">(</span><span class="o">@</span><span class="n">gutter</span> <span class="o">/</span> <span class="m">-2</span><span class="p">);</span>
    <span class="nl">margin-right</span><span class="p">:</span> <span class="p">(</span><span class="o">@</span><span class="n">gutter</span> <span class="o">/</span> <span class="m">-2</span><span class="p">);</span>
  <span class="p">}</span>

  <span class="c1">// 컬럼들의 콘텐츠를 정렬하기 위해 중첩된 행들에 음수 마진을 줍니다
</span>  <span class="nc">.row</span> <span class="p">{</span>
    <span class="nl">margin-left</span><span class="p">:</span>  <span class="p">(</span><span class="o">@</span><span class="n">gutter</span> <span class="o">/</span> <span class="m">-2</span><span class="p">);</span>
    <span class="nl">margin-right</span><span class="p">:</span> <span class="p">(</span><span class="o">@</span><span class="n">gutter</span> <span class="o">/</span> <span class="m">-2</span><span class="p">);</span>
  <span class="p">}</span>
<span class="p">}</span>

<span class="c1">// 매우 작은 기기용 컬럼을 생성합니다
</span><span class="nc">.make-xs-column</span><span class="o">(@</span><span class="nt">columns</span><span class="p">;</span> <span class="k">@gutter</span><span class="nd">:</span> <span class="o">@</span><span class="nt">grid-gutter-width</span><span class="o">)</span> <span class="p">{</span>
  <span class="nl">position</span><span class="p">:</span> <span class="nb">relative</span><span class="p">;</span>
  <span class="c1">// 컬럼이 비어있을때 없어지는걸 방지합니다
</span>  <span class="nl">min-height</span><span class="p">:</span> <span class="m">1px</span><span class="p">;</span>
  <span class="c1">// Inner gutter via padding
</span>  <span class="nl">padding-left</span><span class="p">:</span>  <span class="p">(</span><span class="o">@</span><span class="n">gutter</span> <span class="o">/</span> <span class="m">2</span><span class="p">);</span>
  <span class="nl">padding-right</span><span class="p">:</span> <span class="p">(</span><span class="o">@</span><span class="n">gutter</span> <span class="o">/</span> <span class="m">2</span><span class="p">);</span>

  <span class="c1">// 컬럼수를 기반으로 가능한 너비를 계산합니다
</span>  <span class="k">@media</span> <span class="o">(</span><span class="nt">min-width</span><span class="nd">:</span> <span class="o">@</span><span class="nt">grid-float-breakpoint</span><span class="o">)</span> <span class="p">{</span>
    <span class="nl">float</span><span class="p">:</span> <span class="nb">left</span><span class="p">;</span>
    <span class="nl">width</span><span class="p">:</span> <span class="nf">percentage</span><span class="p">((</span><span class="o">@</span><span class="n">columns</span> <span class="o">/</span> <span class="o">@</span><span class="n">grid-columns</span><span class="p">));</span>
  <span class="p">}</span>
<span class="p">}</span>

<span class="c1">// 작은 기기용 컬럼을 생성합니다
</span><span class="nc">.make-sm-column</span><span class="o">(@</span><span class="nt">columns</span><span class="p">;</span> <span class="k">@gutter</span><span class="nd">:</span> <span class="o">@</span><span class="nt">grid-gutter-width</span><span class="o">)</span> <span class="p">{</span>
  <span class="nl">position</span><span class="p">:</span> <span class="nb">relative</span><span class="p">;</span>
  <span class="c1">// Prevent columns from collapsing when empty
</span>  <span class="nl">min-height</span><span class="p">:</span> <span class="m">1px</span><span class="p">;</span>
  <span class="c1">// Inner gutter via padding
</span>  <span class="nl">padding-left</span><span class="p">:</span>  <span class="p">(</span><span class="o">@</span><span class="n">gutter</span> <span class="o">/</span> <span class="m">2</span><span class="p">);</span>
  <span class="nl">padding-right</span><span class="p">:</span> <span class="p">(</span><span class="o">@</span><span class="n">gutter</span> <span class="o">/</span> <span class="m">2</span><span class="p">);</span>

  <span class="c1">// 컬럼수를 기반으로 가능한 너비를 계산합니다
</span>  <span class="k">@media</span> <span class="o">(</span><span class="nt">min-width</span><span class="nd">:</span> <span class="o">@</span><span class="nt">screen-sm-min</span><span class="o">)</span> <span class="p">{</span>
    <span class="nl">float</span><span class="p">:</span> <span class="nb">left</span><span class="p">;</span>
    <span class="nl">width</span><span class="p">:</span> <span class="nf">percentage</span><span class="p">((</span><span class="o">@</span><span class="n">columns</span> <span class="o">/</span> <span class="o">@</span><span class="n">grid-columns</span><span class="p">));</span>
  <span class="p">}</span>
<span class="p">}</span>

<span class="c1">// 작은 기기용 컬럼 오프셋을 생성합니다
</span><span class="nc">.make-sm-column-offset</span><span class="o">(@</span><span class="nt">columns</span><span class="o">)</span> <span class="p">{</span>
  <span class="k">@media</span> <span class="o">(</span><span class="nt">min-width</span><span class="nd">:</span> <span class="o">@</span><span class="nt">screen-sm-min</span><span class="o">)</span> <span class="p">{</span>
    <span class="nl">margin-left</span><span class="p">:</span> <span class="nf">percentage</span><span class="p">((</span><span class="o">@</span><span class="n">columns</span> <span class="o">/</span> <span class="o">@</span><span class="n">grid-columns</span><span class="p">));</span>
  <span class="p">}</span>
<span class="p">}</span>
<span class="nc">.make-sm-column-push</span><span class="o">(@</span><span class="nt">columns</span><span class="o">)</span> <span class="p">{</span>
  <span class="k">@media</span> <span class="o">(</span><span class="nt">min-width</span><span class="nd">:</span> <span class="o">@</span><span class="nt">screen-sm-min</span><span class="o">)</span> <span class="p">{</span>
    <span class="nl">left</span><span class="p">:</span> <span class="nf">percentage</span><span class="p">((</span><span class="o">@</span><span class="n">columns</span> <span class="o">/</span> <span class="o">@</span><span class="n">grid-columns</span><span class="p">));</span>
  <span class="p">}</span>
<span class="p">}</span>
<span class="nc">.make-sm-column-pull</span><span class="o">(@</span><span class="nt">columns</span><span class="o">)</span> <span class="p">{</span>
  <span class="k">@media</span> <span class="o">(</span><span class="nt">min-width</span><span class="nd">:</span> <span class="o">@</span><span class="nt">screen-sm-min</span><span class="o">)</span> <span class="p">{</span>
    <span class="nl">right</span><span class="p">:</span> <span class="nf">percentage</span><span class="p">((</span><span class="o">@</span><span class="n">columns</span> <span class="o">/</span> <span class="o">@</span><span class="n">grid-columns</span><span class="p">));</span>
  <span class="p">}</span>
<span class="p">}</span>

<span class="c1">// 중간 기기용 컬럼을 생성합니다
</span><span class="nc">.make-md-column</span><span class="o">(@</span><span class="nt">columns</span><span class="p">;</span> <span class="k">@gutter</span><span class="nd">:</span> <span class="o">@</span><span class="nt">grid-gutter-width</span><span class="o">)</span> <span class="p">{</span>
  <span class="nl">position</span><span class="p">:</span> <span class="nb">relative</span><span class="p">;</span>
  <span class="c1">// Prevent columns from collapsing when empty
</span>  <span class="nl">min-height</span><span class="p">:</span> <span class="m">1px</span><span class="p">;</span>
  <span class="c1">// Inner gutter via padding
</span>  <span class="nl">padding-left</span><span class="p">:</span>  <span class="p">(</span><span class="o">@</span><span class="n">gutter</span> <span class="o">/</span> <span class="m">2</span><span class="p">);</span>
  <span class="nl">padding-right</span><span class="p">:</span> <span class="p">(</span><span class="o">@</span><span class="n">gutter</span> <span class="o">/</span> <span class="m">2</span><span class="p">);</span>

  <span class="c1">// Calculate width based on number of columns available
</span>  <span class="k">@media</span> <span class="o">(</span><span class="nt">min-width</span><span class="nd">:</span> <span class="o">@</span><span class="nt">screen-md-min</span><span class="o">)</span> <span class="p">{</span>
    <span class="nl">float</span><span class="p">:</span> <span class="nb">left</span><span class="p">;</span>
    <span class="nl">width</span><span class="p">:</span> <span class="nf">percentage</span><span class="p">((</span><span class="o">@</span><span class="n">columns</span> <span class="o">/</span> <span class="o">@</span><span class="n">grid-columns</span><span class="p">));</span>
  <span class="p">}</span>
<span class="p">}</span>

<span class="c1">// 중간 기기용 컬럼 오프셋을 생성합니다
</span><span class="nc">.make-md-column-offset</span><span class="o">(@</span><span class="nt">columns</span><span class="o">)</span> <span class="p">{</span>
  <span class="k">@media</span> <span class="o">(</span><span class="nt">min-width</span><span class="nd">:</span> <span class="o">@</span><span class="nt">screen-md-min</span><span class="o">)</span> <span class="p">{</span>
    <span class="nl">margin-left</span><span class="p">:</span> <span class="nf">percentage</span><span class="p">((</span><span class="o">@</span><span class="n">columns</span> <span class="o">/</span> <span class="o">@</span><span class="n">grid-columns</span><span class="p">));</span>
  <span class="p">}</span>
<span class="p">}</span>
<span class="nc">.make-md-column-push</span><span class="o">(@</span><span class="nt">columns</span><span class="o">)</span> <span class="p">{</span>
  <span class="k">@media</span> <span class="o">(</span><span class="nt">min-width</span><span class="nd">:</span> <span class="o">@</span><span class="nt">screen-md-min</span><span class="o">)</span> <span class="p">{</span>
    <span class="nl">left</span><span class="p">:</span> <span class="nf">percentage</span><span class="p">((</span><span class="o">@</span><span class="n">columns</span> <span class="o">/</span> <span class="o">@</span><span class="n">grid-columns</span><span class="p">));</span>
  <span class="p">}</span>
<span class="p">}</span>
<span class="nc">.make-md-column-pull</span><span class="o">(@</span><span class="nt">columns</span><span class="o">)</span> <span class="p">{</span>
  <span class="k">@media</span> <span class="o">(</span><span class="nt">min-width</span><span class="nd">:</span> <span class="o">@</span><span class="nt">screen-md-min</span><span class="o">)</span> <span class="p">{</span>
    <span class="nl">right</span><span class="p">:</span> <span class="nf">percentage</span><span class="p">((</span><span class="o">@</span><span class="n">columns</span> <span class="o">/</span> <span class="o">@</span><span class="n">grid-columns</span><span class="p">));</span>
  <span class="p">}</span>
<span class="p">}</span>

<span class="c1">// 큰 기기용 컬럼을 생성합니다
</span><span class="nc">.make-lg-column</span><span class="o">(@</span><span class="nt">columns</span><span class="p">;</span> <span class="k">@gutter</span><span class="nd">:</span> <span class="o">@</span><span class="nt">grid-gutter-width</span><span class="o">)</span> <span class="p">{</span>
  <span class="nl">position</span><span class="p">:</span> <span class="nb">relative</span><span class="p">;</span>
  <span class="c1">// Prevent columns from collapsing when empty
</span>  <span class="nl">min-height</span><span class="p">:</span> <span class="m">1px</span><span class="p">;</span>
  <span class="c1">// Inner gutter via padding
</span>  <span class="nl">padding-left</span><span class="p">:</span>  <span class="p">(</span><span class="o">@</span><span class="n">gutter</span> <span class="o">/</span> <span class="m">2</span><span class="p">);</span>
  <span class="nl">padding-right</span><span class="p">:</span> <span class="p">(</span><span class="o">@</span><span class="n">gutter</span> <span class="o">/</span> <span class="m">2</span><span class="p">);</span>

  <span class="c1">// Calculate width based on number of columns available
</span>  <span class="k">@media</span> <span class="o">(</span><span class="nt">min-width</span><span class="nd">:</span> <span class="o">@</span><span class="nt">screen-lg-min</span><span class="o">)</span> <span class="p">{</span>
    <span class="nl">float</span><span class="p">:</span> <span class="nb">left</span><span class="p">;</span>
    <span class="nl">width</span><span class="p">:</span> <span class="nf">percentage</span><span class="p">((</span><span class="o">@</span><span class="n">columns</span> <span class="o">/</span> <span class="o">@</span><span class="n">grid-columns</span><span class="p">));</span>
  <span class="p">}</span>
<span class="p">}</span>

<span class="c1">// 큰 기기용 컬럼 오프셋을 생성합니다
</span><span class="nc">.make-lg-column-offset</span><span class="o">(@</span><span class="nt">columns</span><span class="o">)</span> <span class="p">{</span>
  <span class="k">@media</span> <span class="o">(</span><span class="nt">min-width</span><span class="nd">:</span> <span class="o">@</span><span class="nt">screen-lg-min</span><span class="o">)</span> <span class="p">{</span>
    <span class="nl">margin-left</span><span class="p">:</span> <span class="nf">percentage</span><span class="p">((</span><span class="o">@</span><span class="n">columns</span> <span class="o">/</span> <span class="o">@</span><span class="n">grid-columns</span><span class="p">));</span>
  <span class="p">}</span>
<span class="p">}</span>
<span class="nc">.make-lg-column-push</span><span class="o">(@</span><span class="nt">columns</span><span class="o">)</span> <span class="p">{</span>
  <span class="k">@media</span> <span class="o">(</span><span class="nt">min-width</span><span class="nd">:</span> <span class="o">@</span><span class="nt">screen-lg-min</span><span class="o">)</span> <span class="p">{</span>
    <span class="nl">left</span><span class="p">:</span> <span class="nf">percentage</span><span class="p">((</span><span class="o">@</span><span class="n">columns</span> <span class="o">/</span> <span class="o">@</span><span class="n">grid-columns</span><span class="p">));</span>
  <span class="p">}</span>
<span class="p">}</span>
<span class="nc">.make-lg-column-pull</span><span class="o">(@</span><span class="nt">columns</span><span class="o">)</span> <span class="p">{</span>
  <span class="k">@media</span> <span class="o">(</span><span class="nt">min-width</span><span class="nd">:</span> <span class="o">@</span><span class="nt">screen-lg-min</span><span class="o">)</span> <span class="p">{</span>
    <span class="nl">right</span><span class="p">:</span> <span class="nf">percentage</span><span class="p">((</span><span class="o">@</span><span class="n">columns</span> <span class="o">/</span> <span class="o">@</span><span class="n">grid-columns</span><span class="p">));</span>
  <span class="p">}</span>
<span class="p">}</span></code></pre></div>

                <h4 id="사용법-예제">사용법 예제<a class="anchorjs-link" href="#사용법-예제"><span class="anchorjs-icon"></span></a></h4>
                <p>당신은 당신만의 맞춤값들로 변수들을 수정하거나, 그냥 기본값들로 사용할 수 있습니다. 여기 사이간격이 있는 두 컬럼 레이아웃을 만드는 기본 설정의 사용예가 있습니다.</p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="nc">.wrapper</span> <span class="p">{</span>
  <span class="nc">.make-row</span><span class="o">()</span><span class="p">;</span>
<span class="p">}</span>
<span class="nc">.content-main</span> <span class="p">{</span>
  <span class="nc">.make-lg-column</span><span class="o">(</span><span class="nt">8</span><span class="o">)</span><span class="p">;</span>
<span class="p">}</span>
<span class="nc">.content-secondary</span> <span class="p">{</span>
  <span class="nc">.make-lg-column</span><span class="o">(</span><span class="nt">3</span><span class="o">)</span><span class="p">;</span>
  <span class="nc">.make-lg-column-offset</span><span class="o">(</span><span class="nt">1</span><span class="o">)</span><span class="p">;</span>
<span class="p">}</span></code></pre></div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"wrapper"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"content-main"</span><span class="nt">&gt;</span>...<span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"content-secondary"</span><span class="nt">&gt;</span>...<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span></code></pre></div>
            </div>

            <div class="bs-docs-section">
                <h1 id="type" class="page-header">타이포그래피<a class="anchorjs-link" href="#type"><span class="anchorjs-icon"></span></a></h1>

                <!-- Headings -->
                <h2 id="type-headings">제목<a class="anchorjs-link" href="#type-headings"><span class="anchorjs-icon"></span></a></h2>
                <p>모든 HTML 제목인, <code>&lt;h1&gt;</code> 부터 <code>&lt;h6&gt;</code> 까지 사용가능합니다. 당신의 텍스트를 인라인으로 표시되면서 스타일만 제목 스타일로 맞추기 위해 <code>.h1</code> 부터 <code>.h6</code> 클래스 또한 사용 가능합니다.</p>
                <div class="bs-example bs-example-type" data-example-id="simple-headings">
                    <table class="table">
                        <tbody>
                        <tr>
                            <td><h1 id="h1.-bootstrap-heading">h1. Bootstrap heading<a class="anchorjs-link" href="#h1.-bootstrap-heading"><span class="anchorjs-icon"></span></a></h1></td>
                            <td class="type-info">Semibold 36px</td>
                        </tr>
                        <tr>
                            <td><h2 id="h2.-bootstrap-heading">h2. Bootstrap heading<a class="anchorjs-link" href="#h2.-bootstrap-heading"><span class="anchorjs-icon"></span></a></h2></td>
                            <td class="type-info">Semibold 30px</td>
                        </tr>
                        <tr>
                            <td><h3 id="h3.-bootstrap-heading">h3. Bootstrap heading<a class="anchorjs-link" href="#h3.-bootstrap-heading"><span class="anchorjs-icon"></span></a></h3></td>
                            <td class="type-info">Semibold 24px</td>
                        </tr>
                        <tr>
                            <td><h4 id="h4.-bootstrap-heading">h4. Bootstrap heading<a class="anchorjs-link" href="#h4.-bootstrap-heading"><span class="anchorjs-icon"></span></a></h4></td>
                            <td class="type-info">Semibold 18px</td>
                        </tr>
                        <tr>
                            <td><h5 id="h5.-bootstrap-heading">h5. Bootstrap heading<a class="anchorjs-link" href="#h5.-bootstrap-heading"><span class="anchorjs-icon"></span></a></h5></td>
                            <td class="type-info">Semibold 14px</td>
                        </tr>
                        <tr>
                            <td><h6>h6. Bootstrap heading</h6></td>
                            <td class="type-info">Semibold 12px</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;h1&gt;</span>h1. Bootstrap heading<span class="nt">&lt;/h1&gt;</span>
<span class="nt">&lt;h2&gt;</span>h2. Bootstrap heading<span class="nt">&lt;/h2&gt;</span>
<span class="nt">&lt;h3&gt;</span>h3. Bootstrap heading<span class="nt">&lt;/h3&gt;</span>
<span class="nt">&lt;h4&gt;</span>h4. Bootstrap heading<span class="nt">&lt;/h4&gt;</span>
<span class="nt">&lt;h5&gt;</span>h5. Bootstrap heading<span class="nt">&lt;/h5&gt;</span>
<span class="nt">&lt;h6&gt;</span>h6. Bootstrap heading<span class="nt">&lt;/h6&gt;</span></code></pre></div>

                <p>일반적인 <code>&lt;small&gt;</code> 태그나 <code>.small</code> 클래스를 사용하여 제목 안에 가벼운 부제 텍스트를 만들 수 있습니다.</p>
                <div class="bs-example bs-example-type" data-example-id="small-headings">
                    <table class="table">
                        <tbody>
                        <tr>
                            <td><h1 id="h1.-bootstrap-heading-secondary-text">h1. Bootstrap heading <small>Secondary text</small><a class="anchorjs-link" href="#h1.-bootstrap-heading-secondary-text"><span class="anchorjs-icon"></span></a></h1></td>
                        </tr>
                        <tr>
                            <td><h2 id="h2.-bootstrap-heading-secondary-text">h2. Bootstrap heading <small>Secondary text</small><a class="anchorjs-link" href="#h2.-bootstrap-heading-secondary-text"><span class="anchorjs-icon"></span></a></h2></td>
                        </tr>
                        <tr>
                            <td><h3 id="h3.-bootstrap-heading-secondary-text">h3. Bootstrap heading <small>Secondary text</small><a class="anchorjs-link" href="#h3.-bootstrap-heading-secondary-text"><span class="anchorjs-icon"></span></a></h3></td>
                        </tr>
                        <tr>
                            <td><h4 id="h4.-bootstrap-heading-secondary-text">h4. Bootstrap heading <small>Secondary text</small><a class="anchorjs-link" href="#h4.-bootstrap-heading-secondary-text"><span class="anchorjs-icon"></span></a></h4></td>
                        </tr>
                        <tr>
                            <td><h5 id="h5.-bootstrap-heading-secondary-text">h5. Bootstrap heading <small>Secondary text</small><a class="anchorjs-link" href="#h5.-bootstrap-heading-secondary-text"><span class="anchorjs-icon"></span></a></h5></td>
                        </tr>
                        <tr>
                            <td><h6>h6. Bootstrap heading <small>Secondary text</small></h6></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;h1&gt;</span>h1. Bootstrap heading <span class="nt">&lt;small&gt;</span>Secondary text<span class="nt">&lt;/small&gt;&lt;/h1&gt;</span>
<span class="nt">&lt;h2&gt;</span>h2. Bootstrap heading <span class="nt">&lt;small&gt;</span>Secondary text<span class="nt">&lt;/small&gt;&lt;/h2&gt;</span>
<span class="nt">&lt;h3&gt;</span>h3. Bootstrap heading <span class="nt">&lt;small&gt;</span>Secondary text<span class="nt">&lt;/small&gt;&lt;/h3&gt;</span>
<span class="nt">&lt;h4&gt;</span>h4. Bootstrap heading <span class="nt">&lt;small&gt;</span>Secondary text<span class="nt">&lt;/small&gt;&lt;/h4&gt;</span>
<span class="nt">&lt;h5&gt;</span>h5. Bootstrap heading <span class="nt">&lt;small&gt;</span>Secondary text<span class="nt">&lt;/small&gt;&lt;/h5&gt;</span>
<span class="nt">&lt;h6&gt;</span>h6. Bootstrap heading <span class="nt">&lt;small&gt;</span>Secondary text<span class="nt">&lt;/small&gt;&lt;/h6&gt;</span></code></pre></div>


                <!-- Body copy -->
                <h2 id="type-body-copy">본문<a class="anchorjs-link" href="#type-body-copy"><span class="anchorjs-icon"></span></a></h2>
                <p>부트스트랩의 <code>font-size</code> 기본값은 <strong>14px</strong> 이고, <code>line-height</code> 는 <strong>1.428</strong> 입니다. 이것은 <code>&lt;body&gt;</code> 와 모든 단락에 적용됩니다. 추가로, <code>&lt;p&gt;</code> (단락) 은 행높이의 절반의 하단 마진을 가집니다.(기본값에 의하면 10px 로 계산됩니다).</p>
                <div class="bs-example" data-example-id="body-copy">
                    <p>Nullam quis risus eget urna mollis ornare vel eu leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam id dolor id nibh ultricies vehicula.</p>
                    <p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec ullamcorper nulla non metus auctor fringilla. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Donec ullamcorper nulla non metus auctor fringilla.</p>
                    <p>Maecenas sed diam eget risus varius blandit sit amet non magna. Donec id elit non mi porta gravida at eget metus. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.</p>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;p&gt;</span>...<span class="nt">&lt;/p&gt;</span></code></pre></div>

                <!-- Body copy .lead -->
                <h3 id="리드-문단-">리드 문단 <!-- TODO: Lead body copy--><a class="anchorjs-link" href="#리드-문단-"><span class="anchorjs-icon"></span></a></h3>
                <p><code>.lead</code> 을 추가하여 문장을 눈에 띄도록 만드세요.</p>
                <div class="bs-example" data-example-id="lead-copy">
                    <p class="lead">Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus.</p>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;p</span> <span class="na">class=</span><span class="s">"lead"</span><span class="nt">&gt;</span>...<span class="nt">&lt;/p&gt;</span></code></pre></div>

                <!-- Using Less -->
                <h3 id="less-로-만들어진">Less 로 만들어진<a class="anchorjs-link" href="#less-로-만들어진"><span class="anchorjs-icon"></span></a></h3>
                <p>문자크기는 <strong>variables.less</strong> 에서의 두 LESS 변수(<code>@font-size-base</code> 와 <code>@line-height-base</code>) 에 기반됩니다. 첫번째 변수는 기본 폰트 크기이고 두번째 변수는 기본 행 높이입니다. 타이포그래피에서 마진, 패딩, 행 높이를 구하기 위해 두 변수와 몇 개의 간단한 수학을 사용합니다.<!-- TODO: The typographic scale is based on two Less variables in <strong>variables.less</strong>: <code>@font-size-base</code> and <code>@line-height-base</code>. The first is the base font-size used throughout and the second is the base line-height. We use those variables and some simple math to create the margins, paddings, and line-heights of all our type and more. Customize them and Bootstrap adapts.--></p>

                <!-- Inline text elements -->
                <h2 id="type-inline-text">인라인 텍스트 요소<a class="anchorjs-link" href="#type-inline-text"><span class="anchorjs-icon"></span></a></h2>
                <h3 id="표시된-텍스트">표시된 텍스트<a class="anchorjs-link" href="#표시된-텍스트"><span class="anchorjs-icon"></span></a></h3>
                <p>또다른 맥락에서 관련있는 텍스트들을 찾아내어 강조하기 위해, <code>&lt;mark&gt;</code> 태그를 사용하세요. <!-- TODO: For highlighting a run of text due to its relevance in another context, use the <code>&lt;mark&gt;</code> tag.--></p>
                <div class="bs-example" data-example-id="simple-mark">
                    <p>당신은 <mark>강조할</mark> 텍스트에 mark 태그를 사용할 수 있습니다.</p>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html">당신은 <span class="nt">&lt;mark&gt;</span>강조할<span class="nt">&lt;/mark&gt;</span> 텍스트에 mark 태그를 사용할 수 있습니다.</code></pre></div>


                <h3 id="삭제된-텍스트">삭제된 텍스트<a class="anchorjs-link" href="#삭제된-텍스트"><span class="anchorjs-icon"></span></a></h3>
                <p>텍스트 블록이 삭제 되었음을 나타내기 위해서는 <code>&lt;del&gt;</code> 태그를 사용하세요.</p>
                <div class="bs-example" data-example-id="simple-del">
                    <p><del>이 텍스트줄은 삭제된 텍스트로 다뤄짐을 의미합니다.</del></p>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;del&gt;</span>이 텍스트줄은 삭제된 텍스트로 다뤄짐을 의미합니다.<span class="nt">&lt;/del&gt;</span></code></pre></div>

                <h3 id="취소선-텍스트">취소선 텍스트<a class="anchorjs-link" href="#취소선-텍스트"><span class="anchorjs-icon"></span></a></h3>
                <p>텍스트 블록이 더 이상상 연관이 없음을 나타내기 위해서 <code>&lt;s&gt;</code> 태그를 사용하세요.</p>
                <div class="bs-example" data-example-id="simple-s">
                    <p><s>이 텍스트줄은 더 이상 정확하지 않다고 다뤄짐을 의미합니다. <!-- TODO: This line of text is meant to be treated as no longer accurate. --></s></p>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;s&gt;</span>이 텍스트줄은 더 이상 정확하지 않다고 다뤄짐을 의미합니다.<span class="nt">&lt;/s&gt;</span></code></pre></div>

                <h3 id="삽입된-텍스트">삽입된 텍스트<a class="anchorjs-link" href="#삽입된-텍스트"><span class="anchorjs-icon"></span></a></h3>
                <p>문서에 추가됨을 나타내기 위해서 <code>&lt;ins&gt;</code> 태그를 사용하세요.</p>
                <div class="bs-example" data-example-id="simple-ins">
                    <p><ins>이 텍스트줄은 문서에 추가분으로 다뤄짐을 의미합니다.</ins></p>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;ins&gt;</span>이 텍스트줄은 문서에 추가분으로 다뤄짐을 의미합니다.<span class="nt">&lt;/ins&gt;</span></code></pre></div>

                <h3 id="밑줄친-텍스트">밑줄친 텍스트<a class="anchorjs-link" href="#밑줄친-텍스트"><span class="anchorjs-icon"></span></a></h3>
                <p>텍스트에 밑출을 치려면 <code>&lt;u&gt;</code> 태그를 사용하세요.</p>
                <div class="bs-example" data-example-id="simple-u">
                    <p><u>이 텍스트줄은 밑줄이 그어질것입니다</u></p>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;u&gt;</span>이 텍스트줄은 밑줄이 그어질것입니다<span class="nt">&lt;/u&gt;</span></code></pre></div>

                <p>가벼운 스타일과 함께 HTML 의 기본 강조 태그를 사용하세요. <!-- TODO: Make use of HTML's default emphasis tags with lightweight styles. --> </p>

                <h3 id="작은-텍스트">작은 텍스트<a class="anchorjs-link" href="#작은-텍스트"><span class="anchorjs-icon"></span></a></h3>
                <p>텍스트 인라인이나 블록을 덜 강조하기 위해, 부모 태그보다 85% 의 크기로 보여지게 하는 <code>&lt;small&gt;</code> 태그를 사용하세요. 제목 요소는 내포된 <code>&lt;small&gt;</code> 요소를 위한 그들만의 <code>font-size</code> 를 가지고 있습니다.</p>
                <p>당신은 <code>&lt;small&gt;</code> 대신 인라인 요소에 <code>.small</code> 을 사용할 수 있습니다.</p>
                <div class="bs-example" data-example-id="simple-small">
                    <p><small>이 텍스트는 작게 보이도록 되어 있습니다.</small></p>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;small&gt;</span>이 텍스트는 작게 보이도록 되어 있습니다.<span class="nt">&lt;/small&gt;</span></code></pre></div>


                <h3 id="두껍게">두껍게<a class="anchorjs-link" href="#두껍게"><span class="anchorjs-icon"></span></a></h3>
                <p>폰트 두께를 두껍게 하여 텍스트를 강조합니다.</p>
                <div class="bs-example" data-example-id="simple-strong">
                    <p>다음의 텍스트는 <strong>두꺼운 텍스트로 렌더링 됩니다</strong>.</p>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;strong&gt;</span>두꺼운 텍스트로 렌더링 됩니다<span class="nt">&lt;/strong&gt;</span></code></pre></div>

                <h3 id="이탤릭">이탤릭<a class="anchorjs-link" href="#이탤릭"><span class="anchorjs-icon"></span></a></h3>
                <p>이탤릭으로 텍스트를 강조합니다.</p>
                <div class="bs-example" data-example-id="simple-em">
                    <p>다음의 텍스트는 <em>이탤릭체로 렌더링 됩니다</em>.</p>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;em&gt;</span>이탤릭체로 렌더링 됩니다<span class="nt">&lt;/em&gt;</span></code></pre></div>

                <div class="bs-callout bs-callout-info" id="callout-type-b-i-elems">
                    <h4 id="대체-요소">대체 요소<a class="anchorjs-link" href="#대체-요소"><span class="anchorjs-icon"></span></a></h4>
                    <p>HTML5 에서 <code>&lt;b&gt;</code> 와 <code>&lt;i&gt;</code> 는 마음대로 사용해도 됩니다. <code>&lt;b&gt;</code> 는 추가적인 중요성의 없이 단어나 구를 강조한다는데 의미가 있고, <code>&lt;i&gt;</code> 는 거의 음성이나 기술적 용어 등에 쓰입니다.</p>
                </div>

                <h2 id="type-alignment">정렬 클래스<a class="anchorjs-link" href="#type-alignment"><span class="anchorjs-icon"></span></a></h2>
                <p>정렬 클래스로 콤포넌트의 텍스트를 손쉽게 재정렬하세요.</p>
                <div class="bs-example" data-example-id="text-alignment">
                    <p class="text-left">좌측정렬된 텍스트.</p>
                    <p class="text-center">중앙정렬된 텍스트.</p>
                    <p class="text-right">우측정렬된 텍스트.</p>
                    <p class="text-justify">양쪽정렬된 텍스트.</p>
                    <p class="text-nowrap">그냥 텍스트.</p>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;p</span> <span class="na">class=</span><span class="s">"text-left"</span><span class="nt">&gt;</span>좌측정렬된 텍스트.<span class="nt">&lt;/p&gt;</span>
<span class="nt">&lt;p</span> <span class="na">class=</span><span class="s">"text-center"</span><span class="nt">&gt;</span>중앙정렬된 텍스트.<span class="nt">&lt;/p&gt;</span>
<span class="nt">&lt;p</span> <span class="na">class=</span><span class="s">"text-right"</span><span class="nt">&gt;</span>우측정렬된 텍스트.<span class="nt">&lt;/p&gt;</span>
<span class="nt">&lt;p</span> <span class="na">class=</span><span class="s">"text-justify"</span><span class="nt">&gt;</span>양쪽정렬된 텍스트.<span class="nt">&lt;/p&gt;</span>
<span class="nt">&lt;p</span> <span class="na">class=</span><span class="s">"text-nowrap"</span><span class="nt">&gt;</span>그냥 텍스트.<span class="nt">&lt;/p&gt;</span></code></pre></div>

                <h2 id="type-transformation">변형 클래스<a class="anchorjs-link" href="#type-transformation"><span class="anchorjs-icon"></span></a></h2>
                <p>콤포넌트의 텍스트를 대소문자 클래스로 변형시킵니다. (한글은 해당사항이 없습니다)</p>
                <div class="bs-example" data-example-id="text-capitalization">
                    <p class="text-lowercase">Lowercased text.</p>
                    <p class="text-uppercase">Uppercased text.</p>
                    <p class="text-capitalize">Capitalized text.</p>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;p</span> <span class="na">class=</span><span class="s">"text-lowercase"</span><span class="nt">&gt;</span>Lowercased text.<span class="nt">&lt;/p&gt;</span>
<span class="nt">&lt;p</span> <span class="na">class=</span><span class="s">"text-uppercase"</span><span class="nt">&gt;</span>Uppercased text.<span class="nt">&lt;/p&gt;</span>
<span class="nt">&lt;p</span> <span class="na">class=</span><span class="s">"text-capitalize"</span><span class="nt">&gt;</span>Capitalized text.<span class="nt">&lt;/p&gt;</span></code></pre></div>

                <!-- Abbreviations -->
                <h2 id="type-abbreviations">약어<a class="anchorjs-link" href="#type-abbreviations"><span class="anchorjs-icon"></span></a></h2>
                <p><code>&lt;abbr&gt;</code> 는 약어나 두문자어를 마우스를 올렸을 때 원래 텍스트를 보여주기 위한 요소입니다. <code>title</code> 속성이 있는 약어는 점으로된 밑줄을 가지고 있고 마우스를 올렸을때 물음표 커서가 보여지며, 원래 텍스트를 보여줍니다.</p>

                <h3 id="기본-약어">기본 약어<a class="anchorjs-link" href="#기본-약어"><span class="anchorjs-icon"></span></a></h3>
                <div class="bs-example" data-example-id="simple-abbr">
                    <p>An abbreviation of the word attribute is <abbr title="attribute">attr</abbr>.</p>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;abbr</span> <span class="na">title=</span><span class="s">"attribute"</span><span class="nt">&gt;</span>attr<span class="nt">&lt;/abbr&gt;</span></code></pre></div>

                <h3 id="두문자어">두문자어<a class="anchorjs-link" href="#두문자어"><span class="anchorjs-icon"></span></a></h3>
                <p>미세하게 작은(90%) 폰트크기를 가지려면 <code>.initialism</code> 을 추가하세요.</p>
                <div class="bs-example" data-example-id="simple-initialism">
                    <p><abbr title="HyperText Markup Language" class="initialism">HTML</abbr> is the best thing since sliced bread.</p>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;abbr</span> <span class="na">title=</span><span class="s">"HyperText Markup Language"</span> <span class="na">class=</span><span class="s">"initialism"</span><span class="nt">&gt;</span>HTML<span class="nt">&lt;/abbr&gt;</span></code></pre></div>


                <!-- Addresses -->
                <h2 id="type-addresses">주소<a class="anchorjs-link" href="#type-addresses"><span class="anchorjs-icon"></span></a></h2>
                <p>주소나 이메일 등의 연락처를 보여줍니다. <code>&lt;br&gt;</code> 로 개행합니다.</p>
                <div class="bs-example" data-example-id="simple-address">
                    <address>
                        <strong>Twitter, Inc.</strong><br>
                        795 Folsom Ave, Suite 600<br>
                        San Francisco, CA 94107<br>
                        <abbr title="Phone">P:</abbr> (123) 456-7890
                    </address>
                    <address>
                        <strong>Full Name</strong><br>
                        <a href="mailto:#">first.last@example.com</a>
                    </address>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;address&gt;</span>
  <span class="nt">&lt;strong&gt;</span>Twitter, Inc.<span class="nt">&lt;/strong&gt;&lt;br&gt;</span>
  795 Folsom Ave, Suite 600<span class="nt">&lt;br&gt;</span>
  San Francisco, CA 94107<span class="nt">&lt;br&gt;</span>
  <span class="nt">&lt;abbr</span> <span class="na">title=</span><span class="s">"Phone"</span><span class="nt">&gt;</span>P:<span class="nt">&lt;/abbr&gt;</span> (123) 456-7890
<span class="nt">&lt;/address&gt;</span>

<span class="nt">&lt;address&gt;</span>
  <span class="nt">&lt;strong&gt;</span>Full Name<span class="nt">&lt;/strong&gt;&lt;br&gt;</span>
  <span class="nt">&lt;a</span> <span class="na">href=</span><span class="s">"mailto:#"</span><span class="nt">&gt;</span>first.last@example.com<span class="nt">&lt;/a&gt;</span>
<span class="nt">&lt;/address&gt;</span></code></pre></div>


                <!-- Blockquotes -->
                <h2 id="type-blockquotes">인용구<a class="anchorjs-link" href="#type-blockquotes"><span class="anchorjs-icon"></span></a></h2>
                <p>당신의 문서안에 다른 출처로부터 인용한 콘텐츠 블록을 위해 사용합니다.</p>

                <h3 id="기본-인용구">기본 인용구<a class="anchorjs-link" href="#기본-인용구"><span class="anchorjs-icon"></span></a></h3>
                <p>인용구 <abbr title="HyperText Markup Language">HTML</abbr> 을 <code>&lt;blockquote&gt;</code> 로 감싸세요. 직접 인용구를 위해서, 우리는 <code>&lt;p&gt;</code> 태그를 추천합니다.</p>
                <div class="bs-example" data-example-id="simple-blockquote">
                    <blockquote>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
                    </blockquote>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;blockquote&gt;</span>
  <span class="nt">&lt;p&gt;</span>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.<span class="nt">&lt;/p&gt;</span>
<span class="nt">&lt;/blockquote&gt;</span></code></pre></div>

                <h3 id="인용구-옵션">인용구 옵션<a class="anchorjs-link" href="#인용구-옵션"><span class="anchorjs-icon"></span></a></h3>
                <p>기본 <code>&lt;blockquote&gt;</code> 를 기반으로 간단한 변형을 위해 스타일과 내용을 바꿉니다.</p>

                <h4 id="출처-표기">출처 표기<a class="anchorjs-link" href="#출처-표기"><span class="anchorjs-icon"></span></a></h4>
                <p>출처를 알수 있게 <code>&lt;footer&gt;</code> 태그를 추가하세요. 출처 원천의 이름은 <code>&lt;cite&gt;</code> 로 감싸주세요.</p>
                <div class="bs-example" data-example-id="blockquote-cite">
                    <blockquote>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
                        <footer>Someone famous in <cite title="Source Title">Source Title</cite></footer>
                    </blockquote>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;blockquote&gt;</span>
  <span class="nt">&lt;p&gt;</span>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.<span class="nt">&lt;/p&gt;</span>
  <span class="nt">&lt;footer&gt;</span>Someone famous in <span class="nt">&lt;cite</span> <span class="na">title=</span><span class="s">"Source Title"</span><span class="nt">&gt;</span>Source Title<span class="nt">&lt;/cite&gt;&lt;/footer&gt;</span>
<span class="nt">&lt;/blockquote&gt;</span></code></pre></div>

                <h4 id="다른-표시">다른 표시<a class="anchorjs-link" href="#다른-표시"><span class="anchorjs-icon"></span></a></h4>
                <p>오른쪽 정렬된 인용구를 위해서 <code>.blockquote-reverse</code> 를 추가하세요.</p>
                <div class="bs-example" style="overflow: hidden;" data-example-id="blockquote-reverse">
                    <blockquote class="blockquote-reverse">
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
                        <footer>Someone famous in <cite title="Source Title">Source Title</cite></footer>
                    </blockquote>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;blockquote</span> <span class="na">class=</span><span class="s">"blockquote-reverse"</span><span class="nt">&gt;</span>
  ...
<span class="nt">&lt;/blockquote&gt;</span></code></pre></div>


                <!-- Lists -->
                <h2 id="type-lists">목록<a class="anchorjs-link" href="#type-lists"><span class="anchorjs-icon"></span></a></h2>

                <h3 id="순서없는">순서없는<a class="anchorjs-link" href="#순서없는"><span class="anchorjs-icon"></span></a></h3>
                <p>순서가 명확치 <em>않은</em> 항목들의 목록입니다.</p>
                <div class="bs-example" data-example-id="simple-ul">
                    <ul>
                        <li>Lorem ipsum dolor sit amet</li>
                        <li>Consectetur adipiscing elit</li>
                        <li>Integer molestie lorem at massa</li>
                        <li>Facilisis in pretium nisl aliquet</li>
                        <li>Nulla volutpat aliquam velit
                            <ul>
                                <li>Phasellus iaculis neque</li>
                                <li>Purus sodales ultricies</li>
                                <li>Vestibulum laoreet porttitor sem</li>
                                <li>Ac tristique libero volutpat at</li>
                            </ul>
                        </li>
                        <li>Faucibus porta lacus fringilla vel</li>
                        <li>Aenean sit amet erat nunc</li>
                        <li>Eget porttitor lorem</li>
                    </ul>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;ul&gt;</span>
  <span class="nt">&lt;li&gt;</span>...<span class="nt">&lt;/li&gt;</span>
<span class="nt">&lt;/ul&gt;</span></code></pre></div>

                <h3 id="순서있는">순서있는<a class="anchorjs-link" href="#순서있는"><span class="anchorjs-icon"></span></a></h3>
                <p>순서가 <em>명확한</em> 항목들의 목록입니다.</p>
                <div class="bs-example" data-example-id="simple-ol">
                    <ol>
                        <li>Lorem ipsum dolor sit amet</li>
                        <li>Consectetur adipiscing elit</li>
                        <li>Integer molestie lorem at massa</li>
                        <li>Facilisis in pretium nisl aliquet</li>
                        <li>Nulla volutpat aliquam velit</li>
                        <li>Faucibus porta lacus fringilla vel</li>
                        <li>Aenean sit amet erat nunc</li>
                        <li>Eget porttitor lorem</li>
                    </ol>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;ol&gt;</span>
  <span class="nt">&lt;li&gt;</span>...<span class="nt">&lt;/li&gt;</span>
<span class="nt">&lt;/ol&gt;</span></code></pre></div>

                <h3 id="스타일-없는">스타일 없는<a class="anchorjs-link" href="#스타일-없는"><span class="anchorjs-icon"></span></a></h3>
                <p>항목에서 <code>list-style</code> 과 좌측 마진을 제거하세요. (직접 자식만 <!--TODO: immediate children only-->) <strong>이것은 오직 바로 아래 항목들에게만 적용됩니다</strong>. 그래서 당신은 중첩된 목록에도 따로 클래스를 추가하여야 합니다.</p>
                <div class="bs-example" data-example-id="unstyled-list">
                    <ul class="list-unstyled">
                        <li>Lorem ipsum dolor sit amet</li>
                        <li>Consectetur adipiscing elit</li>
                        <li>Integer molestie lorem at massa</li>
                        <li>Facilisis in pretium nisl aliquet</li>
                        <li>Nulla volutpat aliquam velit
                            <ul>
                                <li>Phasellus iaculis neque</li>
                                <li>Purus sodales ultricies</li>
                                <li>Vestibulum laoreet porttitor sem</li>
                                <li>Ac tristique libero volutpat at</li>
                            </ul>
                        </li>
                        <li>Faucibus porta lacus fringilla vel</li>
                        <li>Aenean sit amet erat nunc</li>
                        <li>Eget porttitor lorem</li>
                    </ul>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;ul</span> <span class="na">class=</span><span class="s">"list-unstyled"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;li&gt;</span>...<span class="nt">&lt;/li&gt;</span>
<span class="nt">&lt;/ul&gt;</span></code></pre></div>

                <h3 id="인라인">인라인<a class="anchorjs-link" href="#인라인"><span class="anchorjs-icon"></span></a></h3>
                <p><code>display: inline-block;</code> 로 항목들을 한줄에 보여주고 약간의 패딩을 줍니다.</p>
                <div class="bs-example" data-example-id="list-inline">
                    <ul class="list-inline">
                        <li>Lorem ipsum</li>
                        <li>Phasellus iaculis</li>
                        <li>Nulla volutpat</li>
                    </ul>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;ul</span> <span class="na">class=</span><span class="s">"list-inline"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;li&gt;</span>...<span class="nt">&lt;/li&gt;</span>
<span class="nt">&lt;/ul&gt;</span></code></pre></div>

                <h3 id="설명">설명<a class="anchorjs-link" href="#설명"><span class="anchorjs-icon"></span></a></h3>
                <p>연관된 설명들의 목록입니다.</p>
                <div class="bs-example" data-example-id="simple-dl">
                    <dl>
                        <dt>Description lists</dt>
                        <dd>A description list is perfect for defining terms.</dd>
                        <dt>Euismod</dt>
                        <dd>Vestibulum id ligula porta felis euismod semper eget lacinia odio sem nec elit.</dd>
                        <dd>Donec id elit non mi porta gravida at eget metus.</dd>
                        <dt>Malesuada porta</dt>
                        <dd>Etiam porta sem malesuada magna mollis euismod.</dd>
                    </dl>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;dl&gt;</span>
  <span class="nt">&lt;dt&gt;</span>...<span class="nt">&lt;/dt&gt;</span>
  <span class="nt">&lt;dd&gt;</span>...<span class="nt">&lt;/dd&gt;</span>
<span class="nt">&lt;/dl&gt;</span></code></pre></div>

                <h4 id="수평-설명">수평 설명<a class="anchorjs-link" href="#수평-설명"><span class="anchorjs-icon"></span></a></h4>
                <p><code>&lt;dl&gt;</code> 내 용어들과 설명들을 나란히 놓습니다. 기본 <code>&lt;dl&gt;</code> 처럼 쌓이는 것부터 시작이지만, 네비게이션 바가 펼쳐지는 때와 같은 타이밍에 다음과 같이 됩니다.</p>
                <div class="bs-example" data-example-id="horizontal-dl">
                    <dl class="dl-horizontal">
                        <dt>Description lists</dt>
                        <dd>A description list is perfect for defining terms.</dd>
                        <dt>Euismod</dt>
                        <dd>Vestibulum id ligula porta felis euismod semper eget lacinia odio sem nec elit.</dd>
                        <dd>Donec id elit non mi porta gravida at eget metus.</dd>
                        <dt>Malesuada porta</dt>
                        <dd>Etiam porta sem malesuada magna mollis euismod.</dd>
                        <dt>Felis euismod semper eget lacinia</dt>
                        <dd>Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</dd>
                    </dl>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;dl</span> <span class="na">class=</span><span class="s">"dl-horizontal"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;dt&gt;</span>...<span class="nt">&lt;/dt&gt;</span>
  <span class="nt">&lt;dd&gt;</span>...<span class="nt">&lt;/dd&gt;</span>
<span class="nt">&lt;/dl&gt;</span></code></pre></div>

                <div class="bs-callout bs-callout-info" id="callout-type-dl-truncate">
                    <h4 id="자동-줄임">자동 줄임<a class="anchorjs-link" href="#자동-줄임"><span class="anchorjs-icon"></span></a></h4>
                    <p>수평 설명 목록은 열 길이보다 너무 긴 용어를 <code>text-overflow</code> 로 줄일 것입니다. 좁은 너비에서는 개행되는 모양으로 바뀔 것입니다.</p>
                </div>
            </div>

            <div class="bs-docs-section">
                <h1 id="code" class="page-header">코드<a class="anchorjs-link" href="#code"><span class="anchorjs-icon"></span></a></h1>

                <h2 id="code-inline">인라인<a class="anchorjs-link" href="#code-inline"><span class="anchorjs-icon"></span></a></h2>
                <p><code>&lt;code&gt;</code> 로 짧은 코드를 감싸세요.</p>
                <div class="bs-example" data-example-id="inline-code">
                    For example, <code>&lt;section&gt;</code> should be wrapped as inline.
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html">For example, <span class="nt">&lt;code&gt;</span><span class="ni">&amp;lt;</span>section<span class="ni">&amp;gt;</span><span class="nt">&lt;/code&gt;</span> should be wrapped as inline.</code></pre></div>

                <h2 id="code-user-input">사용자 입력<a class="anchorjs-link" href="#code-user-input"><span class="anchorjs-icon"></span></a></h2>
                <p>키보드로 들어가는 입력을 나타내기 위해 <code>&lt;kbd&gt;</code> 를 사용하세요.</p>
                <div class="bs-example" data-example-id="simple-kbd">
                    To switch directories, type <kbd>cd</kbd> followed by the name of the directory.<br>
                    To edit settings, press <kbd><kbd>ctrl</kbd> + <kbd>,</kbd></kbd>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html">To switch directories, type <span class="nt">&lt;kbd&gt;</span>cd<span class="nt">&lt;/kbd&gt;</span> followed by the name of the directory.<span class="nt">&lt;br&gt;</span>
To edit settings, press <span class="nt">&lt;kbd&gt;&lt;kbd&gt;</span>ctrl<span class="nt">&lt;/kbd&gt;</span> + <span class="nt">&lt;kbd&gt;</span>,<span class="nt">&lt;/kbd&gt;&lt;/kbd&gt;</span></code></pre></div>

                <h2 id="code-block">기본 블록<a class="anchorjs-link" href="#code-block"><span class="anchorjs-icon"></span></a></h2>
                <p>여러행의 코드를 위해 <code>&lt;pre&gt;</code> 를 사용하세요. 적절한 렌더링을 위해 어떤 꺽쇠 괄호는 부호화를 해야합니다.</p>
                <div class="bs-example" data-example-id="simple-pre">
                    <pre>&lt;p&gt;Sample text here...&lt;/p&gt;</pre>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;pre&gt;</span><span class="ni">&amp;lt;</span>p<span class="ni">&amp;gt;</span>Sample text here...<span class="ni">&amp;lt;</span>/p<span class="ni">&amp;gt;</span><span class="nt">&lt;/pre&gt;</span></code></pre></div>

                <p>당신은 선택적으로 <code>.pre-scrollable</code> 클래스를 추가할 수도 있습니다. 그건 최대 높이를 350px 로 설정하고 y축 스크롤바를 제공합니다.</p>
                <h2 id="code-variables">변수<a class="anchorjs-link" href="#code-variables"><span class="anchorjs-icon"></span></a></h2>
                <p>변수들을 나타내기 위해서 <code>&lt;var&gt;</code> 태그를 사용하세요.</p>
                <div class="bs-example" data-example-id="simple-var">
                    <p><var>y</var> = <var>m</var><var>x</var> + <var>b</var></p>

                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;var&gt;</span>y<span class="nt">&lt;/var&gt;</span> = <span class="nt">&lt;var&gt;</span>m<span class="nt">&lt;/var&gt;&lt;var&gt;</span>x<span class="nt">&lt;/var&gt;</span> + <span class="nt">&lt;var&gt;</span>b<span class="nt">&lt;/var&gt;</span></code></pre></div>

                <h2 id="code-sample-output">샘플 출력<a class="anchorjs-link" href="#code-sample-output"><span class="anchorjs-icon"></span></a></h2>
                <p>프로그램으로부터의 샘플 출력을 나타내기 위해서 <code>&lt;samp&gt;</code> 태그를 사용하세요.</p>
                <div class="bs-example" data-example-id="simple-samp">
                    <p><samp>This text is meant to be treated as sample output from a computer program.</samp></p>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;samp&gt;</span>This text is meant to be treated as sample output from a computer program.<span class="nt">&lt;/samp&gt;</span></code></pre></div>
            </div>

            <div class="bs-docs-section">
                <h1 id="tables" class="page-header">테이블<a class="anchorjs-link" href="#tables"><span class="anchorjs-icon"></span></a></h1>

                <h2 id="tables-example">기본 예제<a class="anchorjs-link" href="#tables-example"><span class="anchorjs-icon"></span></a></h2>
                <p><code>&lt;table&gt;</code> 에 약간의 패딩과 수평 구분선이 있는 기본 스타일의 <code>.table</code> 클래스를 추가하세요. 그건 매우 불필요해 보이지만, 캘린더와 날짜선택기 같은 플러그인들을 위해 테이블이 널리 사용되는 것을 감안하여, 우리는 맞춤 테이블 스타일들을 분리하기로 했습니다.</p>
                <div class="bs-example" data-example-id="simple-table">
                    <table class="table">
                        <caption>Optional table caption.</caption>
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Username</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td>@mdo</td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>Jacob</td>
                            <td>Thornton</td>
                            <td>@fat</td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td>Larry</td>
                            <td>the Bird</td>
                            <td>@twitter</td>
                        </tr>
                        </tbody>
                    </table>
                </div><!-- /example -->
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;table</span> <span class="na">class=</span><span class="s">"table"</span><span class="nt">&gt;</span>
  ...
<span class="nt">&lt;/table&gt;</span></code></pre></div>


                <h2 id="tables-striped">줄무늬 행<a class="anchorjs-link" href="#tables-striped"><span class="anchorjs-icon"></span></a></h2>
                <p><code>&lt;tbody&gt;</code> 안에 테이블 행에 얼룩말같은 줄무늬를 추가하려면, <code>.table-striped</code> 를 사용하세요.</p>
                <div class="bs-callout bs-callout-danger" id="callout-tables-striped-ie8">
                    <h4 id="크로스브라우저-호환성">크로스브라우저 호환성<a class="anchorjs-link" href="#크로스브라우저-호환성"><span class="anchorjs-icon"></span></a></h4>
                    <p>줄무늬 행 테이블은 <code>:nth-child</code> CSS 셀렉터로 꾸며지기 때문에, 인터넷 익스플로러 8 에서는 가능하지 않습니다.</p>
                </div>
                <div class="bs-example" data-example-id="striped-table">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Username</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td>@mdo</td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>Jacob</td>
                            <td>Thornton</td>
                            <td>@fat</td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td>Larry</td>
                            <td>the Bird</td>
                            <td>@twitter</td>
                        </tr>
                        </tbody>
                    </table>
                </div><!-- /example -->
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;table</span> <span class="na">class=</span><span class="s">"table table-striped"</span><span class="nt">&gt;</span>
  ...
<span class="nt">&lt;/table&gt;</span></code></pre></div>


                <h2 id="tables-bordered">선있는 테이블<a class="anchorjs-link" href="#tables-bordered"><span class="anchorjs-icon"></span></a></h2>
                <p>테이블의 모서리와 셀에 선을 그리기 위해 <code>.table-bordered</code> 을 추가하세요.</p>
                <div class="bs-example" data-example-id="bordered-table">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Username</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td>@mdo</td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>Jacob</td>
                            <td>Thornton</td>
                            <td>@fat</td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td>Larry</td>
                            <td>the Bird</td>
                            <td>@twitter</td>
                        </tr>
                        </tbody>
                    </table>
                </div><!-- /example -->
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;table</span> <span class="na">class=</span><span class="s">"table table-bordered"</span><span class="nt">&gt;</span>
  ...
<span class="nt">&lt;/table&gt;</span></code></pre></div>


                <h2 id="tables-hover-rows">행 hover<a class="anchorjs-link" href="#tables-hover-rows"><span class="anchorjs-icon"></span></a></h2>
                <p><code>&lt;tbody&gt;</code> 안의 테이블 행에 hover 상태를 확인할 수 있게끔 하려면 <code>.table-hover</code> 를 추가하세요.</p>
                <div class="bs-example" data-example-id="hoverable-table">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Username</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td>@mdo</td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>Jacob</td>
                            <td>Thornton</td>
                            <td>@fat</td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td>Larry</td>
                            <td>the Bird</td>
                            <td>@twitter</td>
                        </tr>
                        </tbody>
                    </table>
                </div><!-- /example -->
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;table</span> <span class="na">class=</span><span class="s">"table table-hover"</span><span class="nt">&gt;</span>
  ...
<span class="nt">&lt;/table&gt;</span></code></pre></div>


                <h2 id="tables-condensed">좁은폭 테이블<a class="anchorjs-link" href="#tables-condensed"><span class="anchorjs-icon"></span></a></h2>
                <p>셀 패딩을 반으로 줄여 테이블을 좀 더 조밀하게 만드려면 <code>.table-condensed</code> 을 추가하세요.</p>
                <div class="bs-example" data-example-id="condensed-table">
                    <table class="table table-condensed">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Username</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td>@mdo</td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>Jacob</td>
                            <td>Thornton</td>
                            <td>@fat</td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td colspan="2">Larry the Bird</td>
                            <td>@twitter</td>
                        </tr>
                        </tbody>
                    </table>
                </div><!-- /example -->
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;table</span> <span class="na">class=</span><span class="s">"table table-condensed"</span><span class="nt">&gt;</span>
  ...
<span class="nt">&lt;/table&gt;</span></code></pre></div>


                <h2 id="tables-contextual-classes">맥락적인 클래스들<a class="anchorjs-link" href="#tables-contextual-classes"><span class="anchorjs-icon"></span></a></h2>
                <p>테이블 행이나 셀에 색을 넣으려면 맥락적인 클래스들을 사용하세요.</p>
                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <colgroup>
                            <col class="col-xs-1">
                            <col class="col-xs-7">
                        </colgroup>
                        <thead>
                        <tr>
                            <th>클래스</th>
                            <th>설명</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th scope="row">
                                <code>.active</code>
                            </th>
                            <td>특정한 행이나 셀에 hover 했을 때와 같은 색을 입힙니다.</td>
                        </tr>
                        <tr>
                            <th scope="row">
                                <code>.success</code>
                            </th>
                            <td>성공적이거나 긍정적인 액션을 의미합니다.</td>
                        </tr>
                        <tr>
                            <th scope="row">
                                <code>.info</code>
                            </th>
                            <td>중립적인 정보의 변화나 액션을 의미합니다.</td>
                        </tr>
                        <tr>
                            <th scope="row">
                                <code>.warning</code>
                            </th>
                            <td>주의가 필요한 경고를 의미합니다.</td>
                        </tr>
                        <tr>
                            <th scope="row">
                                <code>.danger</code>
                            </th>
                            <td>위험하거나 부정적일수 있는 액션을 의미합니다. </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="bs-example" data-example-id="contextual-table">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Column heading</th>
                            <th>Column heading</th>
                            <th>Column heading</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr class="active">
                            <th scope="row">1</th>
                            <td>Column content</td>
                            <td>Column content</td>
                            <td>Column content</td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>Column content</td>
                            <td>Column content</td>
                            <td>Column content</td>
                        </tr>
                        <tr class="success">
                            <th scope="row">3</th>
                            <td>Column content</td>
                            <td>Column content</td>
                            <td>Column content</td>
                        </tr>
                        <tr>
                            <th scope="row">4</th>
                            <td>Column content</td>
                            <td>Column content</td>
                            <td>Column content</td>
                        </tr>
                        <tr class="info">
                            <th scope="row">5</th>
                            <td>Column content</td>
                            <td>Column content</td>
                            <td>Column content</td>
                        </tr>
                        <tr>
                            <th scope="row">6</th>
                            <td>Column content</td>
                            <td>Column content</td>
                            <td>Column content</td>
                        </tr>
                        <tr class="warning">
                            <th scope="row">7</th>
                            <td>Column content</td>
                            <td>Column content</td>
                            <td>Column content</td>
                        </tr>
                        <tr>
                            <th scope="row">8</th>
                            <td>Column content</td>
                            <td>Column content</td>
                            <td>Column content</td>
                        </tr>
                        <tr class="danger">
                            <th scope="row">9</th>
                            <td>Column content</td>
                            <td>Column content</td>
                            <td>Column content</td>
                        </tr>
                        </tbody>
                    </table>
                </div><!-- /example -->
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="c">&lt;!-- On rows --&gt;</span>
<span class="nt">&lt;tr</span> <span class="na">class=</span><span class="s">"active"</span><span class="nt">&gt;</span>...<span class="nt">&lt;/tr&gt;</span>
<span class="nt">&lt;tr</span> <span class="na">class=</span><span class="s">"success"</span><span class="nt">&gt;</span>...<span class="nt">&lt;/tr&gt;</span>
<span class="nt">&lt;tr</span> <span class="na">class=</span><span class="s">"warning"</span><span class="nt">&gt;</span>...<span class="nt">&lt;/tr&gt;</span>
<span class="nt">&lt;tr</span> <span class="na">class=</span><span class="s">"danger"</span><span class="nt">&gt;</span>...<span class="nt">&lt;/tr&gt;</span>
<span class="nt">&lt;tr</span> <span class="na">class=</span><span class="s">"info"</span><span class="nt">&gt;</span>...<span class="nt">&lt;/tr&gt;</span>

<span class="c">&lt;!-- On cells (`td` or `th`) --&gt;</span>
<span class="nt">&lt;tr&gt;</span>
  <span class="nt">&lt;td</span> <span class="na">class=</span><span class="s">"active"</span><span class="nt">&gt;</span>...<span class="nt">&lt;/td&gt;</span>
  <span class="nt">&lt;td</span> <span class="na">class=</span><span class="s">"success"</span><span class="nt">&gt;</span>...<span class="nt">&lt;/td&gt;</span>
  <span class="nt">&lt;td</span> <span class="na">class=</span><span class="s">"warning"</span><span class="nt">&gt;</span>...<span class="nt">&lt;/td&gt;</span>
  <span class="nt">&lt;td</span> <span class="na">class=</span><span class="s">"danger"</span><span class="nt">&gt;</span>...<span class="nt">&lt;/td&gt;</span>
  <span class="nt">&lt;td</span> <span class="na">class=</span><span class="s">"info"</span><span class="nt">&gt;</span>...<span class="nt">&lt;/td&gt;</span>
<span class="nt">&lt;/tr&gt;</span></code></pre></div>
                <div class="bs-callout bs-callout-warning" id="callout-tables-context-accessibility">
                    <h4 id="보조-공학으로서-의미를-전달하는-것">보조 공학으로서 의미를 전달하는 것<a class="anchorjs-link" href="#보조-공학으로서-의미를-전달하는-것"><span class="anchorjs-icon"></span></a></h4>
                    <p>테이블 행이나 셀에 의미를 더하는 색을 사용하는 것은 시각적인 암시를 제공합니다만, 스크린리더 같은 보조 공학 사용자들에게는 전달하지 못할 것입니다. 색으로 정보를 나타내는 것은 그것을 콘텐츠 자체(테이블 행이나 셀에 보이는 텍스트) 나 다른 수단을 통해서 포함하는 것을 반드시 하셔야 합니다.  <!-- TODO: Using color to add meaning to a table row or individual cell only provides a visual indication, which will not be conveyed to users of assistive technologies – such as screen readers. Ensure that information denoted by the color is either obvious from the content itself (the visible text in the relevant table row/cell), or is included through alternative means, such as additional text hidden with the <code>.sr-only</code> class.--></p>
                </div>

                <h2 id="tables-responsive">반응형 테이블<a class="anchorjs-link" href="#tables-responsive"><span class="anchorjs-icon"></span></a></h2>
                <p><code>.table</code> 을 <code>.table-responsive</code> 으로 감싸서 작은 기기에서는 수평 스크롤을 할 수 있는 반응형 테이블을 만듭니다(768px 이하). 768px 보다 큰 기기에서는 보기에 차이가 없습니다.</p>

                <div class="bs-callout bs-callout-warning" id="callout-tables-responsive-overflow">
                    <h4 id="수직-잘라내기/절삭">수직 잘라내기/절삭<a class="anchorjs-link" href="#수직-잘라내기/절삭"><span class="anchorjs-icon"></span></a></h4>
                    <p>반응형 테이블은 테이블 상하단 모서리를 초과하는 어떤 콘텐츠를 잘라주는 <code>overflow-y: hidden</code> 을 이용합니다. 특히, 이것은 드롭다운 메뉴와 다른 서드-파티 위젯을 잘라버릴수 있습니다.</p>
                </div>
                <div class="bs-callout bs-callout-warning" id="callout-tables-responsive-ff-fieldset">
                    <h4 id="파이어폭스와-필드셋">파이어폭스와 필드셋<a class="anchorjs-link" href="#파이어폭스와-필드셋"><span class="anchorjs-icon"></span></a></h4>
                    <p>파이어폭스는 반응형 테이블에 간섭하는 <code>width</code> 관련 몇가지 이상한 필드셋 스타일을 가지고 있습니다. 이것은 우리가 부트스트랩에서 <strong>제공할 수 없는</strong> 파이어폭스 전용핵 없이는 오버라이드될 수가 없습니다:</p>
                    <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-css" data-lang="css"><span class="k">@-moz-document</span> <span class="n">url-prefix</span><span class="p">()</span> <span class="p">{</span>
  <span class="nt">fieldset</span> <span class="p">{</span> <span class="nl">display</span><span class="p">:</span> <span class="nb">table-cell</span><span class="p">;</span> <span class="p">}</span>
<span class="p">}</span></code></pre></div>
                    <p>좀 더 정보를 보려면, <a href="http://stackoverflow.com/questions/17408815/fieldset-resizes-wrong-appears-to-have-unremovable-min-width-min-content/17863685#17863685">this Stack Overflow answer</a> 을 읽어보세요.</p>
                </div>

                <div class="bs-example" data-example-id="simple-responsive-table">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Table heading</th>
                                <th>Table heading</th>
                                <th>Table heading</th>
                                <th>Table heading</th>
                                <th>Table heading</th>
                                <th>Table heading</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                            </tr>
                            </tbody>
                        </table>
                    </div><!-- /.table-responsive -->

                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Table heading</th>
                                <th>Table heading</th>
                                <th>Table heading</th>
                                <th>Table heading</th>
                                <th>Table heading</th>
                                <th>Table heading</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                            </tr>
                            </tbody>
                        </table>
                    </div><!-- /.table-responsive -->
                </div><!-- /example -->
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"table-responsive"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;table</span> <span class="na">class=</span><span class="s">"table"</span><span class="nt">&gt;</span>
    ...
  <span class="nt">&lt;/table&gt;</span>
<span class="nt">&lt;/div&gt;</span></code></pre></div>
            </div>

            <div class="bs-docs-section">
                <h1 id="forms" class="page-header">폼<a class="anchorjs-link" href="#forms"><span class="anchorjs-icon"></span></a></h1>

                <h2 id="forms-example">기본 예제<a class="anchorjs-link" href="#forms-example"><span class="anchorjs-icon"></span></a></h2>
                <p>각각의 폼콘트롤은 자동으로 약간의 전역 스타일링을 받아들입니다. <code>.form-control</code> 이 있는 모든 텍스트 기반의 <code>&lt;input&gt;</code>, <code>&lt;textarea&gt;</code> 그리고 <code>&lt;select&gt;</code> 요소는 기본적으로 <code>width: 100%;</code> 이다. 최적의 여백을 위해 <code>.form-group</code> 으로 라벨과 콘트롤을 감싸세요.</p>
                <div class="bs-example" data-example-id="basic-forms">
                    <form>
                        <div class="form-group">
                            <label for="exampleInputEmail1">이메일 주소</label>
                            <input type="email" class="form-control" id="exampleInputEmail1" placeholder="이메일을 입력하세요">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">암호</label>
                            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="암호">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputFile">파일 업로드</label>
                            <input type="file" id="exampleInputFile">
                            <p class="help-block">여기에 블록레벨 도움말 예제</p>
                        </div>
                        <div class="checkbox">
                            <label>
                                <input type="checkbox"> 입력을 기억합니다
                            </label>
                        </div>
                        <button type="submit" class="btn btn-default">제출</button>
                    </form>
                </div><!-- /example -->
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;form&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"form-group"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;label</span> <span class="na">for=</span><span class="s">"exampleInputEmail1"</span><span class="nt">&gt;</span>이메일 주소<span class="nt">&lt;/label&gt;</span>
    <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"email"</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">id=</span><span class="s">"exampleInputEmail1"</span> <span class="na">placeholder=</span><span class="s">"이메일을 입력하세요"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"form-group"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;label</span> <span class="na">for=</span><span class="s">"exampleInputPassword1"</span><span class="nt">&gt;</span>암호<span class="nt">&lt;/label&gt;</span>
    <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"password"</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">id=</span><span class="s">"exampleInputPassword1"</span> <span class="na">placeholder=</span><span class="s">"암호"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"form-group"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;label</span> <span class="na">for=</span><span class="s">"exampleInputFile"</span><span class="nt">&gt;</span>파일 업로드<span class="nt">&lt;/label&gt;</span>
    <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"file"</span> <span class="na">id=</span><span class="s">"exampleInputFile"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;p</span> <span class="na">class=</span><span class="s">"help-block"</span><span class="nt">&gt;</span>여기에 블록레벨 도움말 예제<span class="nt">&lt;/p&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"checkbox"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;label&gt;</span>
      <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"checkbox"</span><span class="nt">&gt;</span> 입력을 기억합니다
    <span class="nt">&lt;/label&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"submit"</span> <span class="na">class=</span><span class="s">"btn btn-default"</span><span class="nt">&gt;</span>제출<span class="nt">&lt;/button&gt;</span>
<span class="nt">&lt;/form&gt;</span></code></pre></div>
                <div class="bs-callout bs-callout-warning" id="callout-formgroup-inputgroup">
                    <h4 id="form-group-과-input-group-을-같이-쓰지-마세요">Form group 과 input group 을 같이 쓰지 마세요<a class="anchorjs-link" href="#form-group-과-input-group-을-같이-쓰지-마세요"><span class="anchorjs-icon"></span></a></h4>
                    <p>Form group 과 <a href="/components/#input-groups">input group</a> 을 직접 같이 쓰면 안됩니다. 대신, input group 을 form group 내에 넣도록 하세요.</p>
                </div>


                <h2 id="forms-inline">인라인 폼<a class="anchorjs-link" href="#forms-inline"><span class="anchorjs-icon"></span></a></h2>
                <p>좌측 정렬된 인라인-블록 콘트롤을 위해 당신의 폼(<code>&lt;form&gt;</code> 태그가 아니어도 됨)에 <code>.form-inline</code> 를 추가하세요. <strong>이것은 최소 768px 의 뷰포트 내의 폼에만 적용됩니다.</strong></p>
                <div class="bs-callout bs-callout-danger" id="callout-inline-form-width">
                    <h4 id="맞춤-너비가-필요할-수-있습니다">맞춤 너비가 필요할 수 있습니다<a class="anchorjs-link" href="#맞춤-너비가-필요할-수-있습니다"><span class="anchorjs-icon"></span></a></h4>
                    <p>입력 콘트롤이나 셀렉트 콘트롤은 부트스트랩에서 기본적으로 <code>width: 100%;</code> 가 적용되어 있습니다. 인라인 폼내에서, 우리는 그것을 <code>width: auto;</code> 로 초기화하여 몇개의 콘트롤들이 같은 줄에 있을 수 있습니다. 당신의 레이아웃에 따라서, 추가적인 맞춤 너비가 필요할 수도 있습니다.</p>
                </div>
                <div class="bs-callout bs-callout-warning" id="callout-inline-form-labels">
                    <h4 id="항상-라벨을-추가해야합니다">항상 라벨을 추가해야합니다<a class="anchorjs-link" href="#항상-라벨을-추가해야합니다"><span class="anchorjs-icon"></span></a></h4>
                    <p>스크린 리더는 당신이 모든 input 에 라벨을 포함하지 않는다면 당신의 폼에 문제를 가지게 될 수 있습니다. 인라인 폼을 위해서, 당신은 <code>.sr-only</code> 을 사용하여 라벨을 숨길수 있습니다. 보조공학으로서 좀더 나아간 라벨을 제공하기 위한 다른 방법이 있습니다. 그것은 <code>aria-label</code>, <code>aria-labelledby</code>, <code>title</code> 입니다. 이런 것들이 존재하지 않는다면, 스크린 리더는 <code>placeholder</code> 속성에 의지하게 될 수 있습니다. <code>placeholder</code> 으로 다른 라벨링을 대체하는 것은 권장되지는 않습니다. <!-- TODO: Screen readers will have trouble with your forms if you don't include a label for every input. For these inline forms, you can hide the labels using the <code>.sr-only</code> class. There are further alternative methods of providing a label for assistive technologies, such as the <code>aria-label</code>, <code>aria-labelledby</code> or <code>title</code> attribute. If none of these is present, screen readers may resort to using the <code>placeholder</code> attribute, if present, but note that use of <code>placeholder</code> as a replacement for other labelling methods is not advised.--></p>
                </div>

                <div class="bs-example" data-example-id="simple-form-inline">
                    <form class="form-inline">
                        <div class="form-group">
                            <label for="exampleInputName2">Name</label>
                            <input type="text" class="form-control" id="exampleInputName2" placeholder="Jane Doe">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail2">Email</label>
                            <input type="email" class="form-control" id="exampleInputEmail2" placeholder="jane.doe@example.com">
                        </div>
                        <button type="submit" class="btn btn-default">Send invitation</button>
                    </form>
                </div><!-- /example -->
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;form</span> <span class="na">class=</span><span class="s">"form-inline"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"form-group"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;label</span> <span class="na">for=</span><span class="s">"exampleInputName2"</span><span class="nt">&gt;</span>Name<span class="nt">&lt;/label&gt;</span>
    <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">id=</span><span class="s">"exampleInputName2"</span> <span class="na">placeholder=</span><span class="s">"Jane Doe"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"form-group"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;label</span> <span class="na">for=</span><span class="s">"exampleInputEmail2"</span><span class="nt">&gt;</span>Email<span class="nt">&lt;/label&gt;</span>
    <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"email"</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">id=</span><span class="s">"exampleInputEmail2"</span> <span class="na">placeholder=</span><span class="s">"jane.doe@example.com"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"submit"</span> <span class="na">class=</span><span class="s">"btn btn-default"</span><span class="nt">&gt;</span>Send invitation<span class="nt">&lt;/button&gt;</span>
<span class="nt">&lt;/form&gt;</span></code></pre></div>

                <div class="bs-example" data-example-id="simple-form-inline">
                    <form class="form-inline">
                        <div class="form-group">
                            <label class="sr-only" for="exampleInputEmail3">Email address</label>
                            <input type="email" class="form-control" id="exampleInputEmail3" placeholder="Enter email">
                        </div>
                        <div class="form-group">
                            <label class="sr-only" for="exampleInputPassword3">Password</label>
                            <input type="password" class="form-control" id="exampleInputPassword3" placeholder="Password">
                        </div>
                        <div class="checkbox">
                            <label>
                                <input type="checkbox"> Remember me
                            </label>
                        </div>
                        <button type="submit" class="btn btn-default">Sign in</button>
                    </form>
                </div><!-- /example -->
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;form</span> <span class="na">class=</span><span class="s">"form-inline"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"form-group"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"sr-only"</span> <span class="na">for=</span><span class="s">"exampleInputEmail3"</span><span class="nt">&gt;</span>Email address<span class="nt">&lt;/label&gt;</span>
    <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"email"</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">id=</span><span class="s">"exampleInputEmail3"</span> <span class="na">placeholder=</span><span class="s">"Enter email"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"form-group"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"sr-only"</span> <span class="na">for=</span><span class="s">"exampleInputPassword3"</span><span class="nt">&gt;</span>Password<span class="nt">&lt;/label&gt;</span>
    <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"password"</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">id=</span><span class="s">"exampleInputPassword3"</span> <span class="na">placeholder=</span><span class="s">"Password"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"checkbox"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;label&gt;</span>
      <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"checkbox"</span><span class="nt">&gt;</span> Remember me
    <span class="nt">&lt;/label&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"submit"</span> <span class="na">class=</span><span class="s">"btn btn-default"</span><span class="nt">&gt;</span>Sign in<span class="nt">&lt;/button&gt;</span>
<span class="nt">&lt;/form&gt;</span></code></pre></div>

                <div class="bs-example" data-example-id="form-inline-with-input-group">
                    <form class="form-inline">
                        <div class="form-group">
                            <label class="sr-only" for="exampleInputAmount">Amount (in dollars)</label>
                            <div class="input-group">
                                <div class="input-group-addon">$</div>
                                <input type="text" class="form-control" id="exampleInputAmount" placeholder="Amount">
                                <div class="input-group-addon">.00</div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary">Transfer cash</button>
                    </form>
                </div><!-- /example -->
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;form</span> <span class="na">class=</span><span class="s">"form-inline"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"form-group"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"sr-only"</span> <span class="na">for=</span><span class="s">"exampleInputAmount"</span><span class="nt">&gt;</span>Amount (in dollars)<span class="nt">&lt;/label&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"input-group"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"input-group-addon"</span><span class="nt">&gt;</span>$<span class="nt">&lt;/div&gt;</span>
      <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">id=</span><span class="s">"exampleInputAmount"</span> <span class="na">placeholder=</span><span class="s">"Amount"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"input-group-addon"</span><span class="nt">&gt;</span>.00<span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"submit"</span> <span class="na">class=</span><span class="s">"btn btn-primary"</span><span class="nt">&gt;</span>Transfer cash<span class="nt">&lt;/button&gt;</span>
<span class="nt">&lt;/form&gt;</span></code></pre></div>

                <h2 id="forms-horizontal">수평 폼<a class="anchorjs-link" href="#forms-horizontal"><span class="anchorjs-icon"></span></a></h2>
                <p>폼(<code>&lt;form&gt;</code> 이 아니어도 됨)에 <code>.form-horizontal</code> 를 추가하여 라벨들과 폼콘트롤들의 그룹들을 정렬하기 위해 부트스트랩의 미리정의된 그리드 클래스들을 사용하세요. 그리드행 역할은 <code>.form-group</code> 가 하기 때문에 <code>.row</code> 는 필요가 없습니다.</p>
                <div class="bs-example" data-example-id="simple-horizontal-form">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> Remember me
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-default">Sign in</button>
                            </div>
                        </div>
                    </form>
                </div><!-- /.bs-example -->
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;form</span> <span class="na">class=</span><span class="s">"form-horizontal"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"form-group"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;label</span> <span class="na">for=</span><span class="s">"inputEmail3"</span> <span class="na">class=</span><span class="s">"col-sm-2 control-label"</span><span class="nt">&gt;</span>Email<span class="nt">&lt;/label&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-sm-10"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"email"</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">id=</span><span class="s">"inputEmail3"</span> <span class="na">placeholder=</span><span class="s">"Email"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"form-group"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;label</span> <span class="na">for=</span><span class="s">"inputPassword3"</span> <span class="na">class=</span><span class="s">"col-sm-2 control-label"</span><span class="nt">&gt;</span>Password<span class="nt">&lt;/label&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-sm-10"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"password"</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">id=</span><span class="s">"inputPassword3"</span> <span class="na">placeholder=</span><span class="s">"Password"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"form-group"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-sm-offset-2 col-sm-10"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"checkbox"</span><span class="nt">&gt;</span>
        <span class="nt">&lt;label&gt;</span>
          <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"checkbox"</span><span class="nt">&gt;</span> Remember me
        <span class="nt">&lt;/label&gt;</span>
      <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"form-group"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-sm-offset-2 col-sm-10"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"submit"</span> <span class="na">class=</span><span class="s">"btn btn-default"</span><span class="nt">&gt;</span>Sign in<span class="nt">&lt;/button&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/form&gt;</span></code></pre></div>


                <h2 id="forms-controls">지원되는 콘트롤들<a class="anchorjs-link" href="#forms-controls"><span class="anchorjs-icon"></span></a></h2>
                <p>폼 레이아웃 예제에서 지원되는 표준 폼콘트롤 예제들. <!-- TODO: Examples of standard form controls supported in an example form layout. --></p>

                <h3 id="inputs">Inputs<a class="anchorjs-link" href="#inputs"><span class="anchorjs-icon"></span></a></h3>
                <p>가장 흔한 폼 콘트롤인 텍스트 기반 입력 필드입니다. HTML5 의 모든 타입을 지원합니다: <code>text</code>, <code>password</code>, <code>datetime</code>, <code>datetime-local</code>, <code>date</code>, <code>month</code>, <code>time</code>, <code>week</code>, <code>number</code>, <code>email</code>, <code>url</code>, <code>search</code>, <code>tel</code>, and <code>color</code>.</p>
                <div class="bs-callout bs-callout-danger" id="callout-input-needs-type">
                    <h4 id="유형-선언이-필요합니다-">유형 선언이 필요합니다 <!-- TODO: Type declaration required--><a class="anchorjs-link" href="#유형-선언이-필요합니다-"><span class="anchorjs-icon"></span></a></h4>
                    <p>입력은 자신의 <code>type</code> 이 제대로 선언된 경우 완전히 스타일됩니다. <!-- TODO: Inputs will only be fully styled if their  is properly declared.--></p>
                </div>
                <div class="bs-example" data-example-id="text-form-control">
                    <form>
                        <input type="text" class="form-control" placeholder="Text input">
                    </form>
                </div><!-- /.bs-example -->
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">placeholder=</span><span class="s">"Text input"</span><span class="nt">&gt;</span></code></pre></div>
                <div class="bs-callout bs-callout-info" id="callout-xref-input-group">
                    <h4 id="입력-그룹">입력 그룹<a class="anchorjs-link" href="#입력-그룹"><span class="anchorjs-icon"></span></a></h4>
                    <p>텍스트 기반 <code>&lt;input&gt;</code> 전후에 텍스트나 버튼을 통합하려면, <a href="../components/#input-groups">입력 그룹 콤포넌트를 확인하세요.</a>.</p>
                </div>

                <h3 id="textarea">Textarea<a class="anchorjs-link" href="#textarea"><span class="anchorjs-icon"></span></a></h3>
                <p>여러 줄의 텍스트를 지원하는 폼콘트롤. 필요에 따라 <code>rows</code> 속성을 바꾸세요.</p>
                <div class="bs-example" data-example-id="textarea-form-control">
                    <form>
                        <textarea class="form-control" rows="3" placeholder="Textarea"></textarea>
                    </form>
                </div><!-- /.bs-example -->
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;textarea</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">rows=</span><span class="s">"3"</span><span class="nt">&gt;&lt;/textarea&gt;</span></code></pre></div>

                <h3 id="체크박스와-라디오">체크박스와 라디오<a class="anchorjs-link" href="#체크박스와-라디오"><span class="anchorjs-icon"></span></a></h3>
                <p>체크박스는 목록에서 하나 혹은 몇개의 옵션을 선택하기 위함이고, 라디오는 여러 개중 하나의 옵션을 선택하기 위함입니다.</p>
                <p><code>disabled</code> 속성이 있는 체크박스나 라디오는 적절하게 스타일될 것입니다. 사용자들이 라벨에 마우스를 올렸을 때 "허락되지 않은" 커서를 표시하려면, <code>.radio</code>, <code>.radio-inline</code>, <code>.checkbox</code>, <code>.checkbox-inline</code>, <code>&lt;fieldset&gt;</code> 에  <code>.disabled</code> 클래스를 추가하세요. <!-- TODO: To have the <label> for the checkbox or radio also display a "not-allowed" cursor when the user hovers over the label, add the .disabled class to your .radio, .radio-inline, .checkbox, .checkbox-inline, or <fieldset>.--></p>
                <h4 id="기본-(쌓이는)">기본 (쌓이는)<a class="anchorjs-link" href="#기본-(쌓이는)"><span class="anchorjs-icon"></span></a></h4>
                <div class="bs-example" data-example-id="block-checkboxes-radios">
                    <form>
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" value="">
                                Option one is this and that—be sure to include why it's great
                            </label>
                        </div>
                        <div class="checkbox disabled">
                            <label>
                                <input type="checkbox" value="" disabled="">
                                Option two is disabled
                            </label>
                        </div>
                        <br>
                        <div class="radio">
                            <label>
                                <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
                                Option one is this and that—be sure to include why it's great
                            </label>
                        </div>
                        <div class="radio">
                            <label>
                                <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
                                Option two can be something else and selecting it will deselect option one
                            </label>
                        </div>
                        <div class="radio disabled">
                            <label>
                                <input type="radio" name="optionsRadios" id="optionsRadios3" value="option3" disabled="">
                                Option three is disabled
                            </label>
                        </div>
                    </form>
                </div><!-- /.bs-example -->
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"checkbox"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;label&gt;</span>
    <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"checkbox"</span> <span class="na">value=</span><span class="s">""</span><span class="nt">&gt;</span>
    Option one is this and that<span class="ni">&amp;mdash;</span>be sure to include why it's great
  <span class="nt">&lt;/label&gt;</span>
<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"checkbox disabled"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;label&gt;</span>
    <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"checkbox"</span> <span class="na">value=</span><span class="s">""</span> <span class="na">disabled</span><span class="nt">&gt;</span>
    Option two is disabled
  <span class="nt">&lt;/label&gt;</span>
<span class="nt">&lt;/div&gt;</span>

<span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"radio"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;label&gt;</span>
    <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"radio"</span> <span class="na">name=</span><span class="s">"optionsRadios"</span> <span class="na">id=</span><span class="s">"optionsRadios1"</span> <span class="na">value=</span><span class="s">"option1"</span> <span class="na">checked</span><span class="nt">&gt;</span>
    Option one is this and that<span class="ni">&amp;mdash;</span>be sure to include why it's great
  <span class="nt">&lt;/label&gt;</span>
<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"radio"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;label&gt;</span>
    <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"radio"</span> <span class="na">name=</span><span class="s">"optionsRadios"</span> <span class="na">id=</span><span class="s">"optionsRadios2"</span> <span class="na">value=</span><span class="s">"option2"</span><span class="nt">&gt;</span>
    Option two can be something else and selecting it will deselect option one
  <span class="nt">&lt;/label&gt;</span>
<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"radio disabled"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;label&gt;</span>
    <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"radio"</span> <span class="na">name=</span><span class="s">"optionsRadios"</span> <span class="na">id=</span><span class="s">"optionsRadios3"</span> <span class="na">value=</span><span class="s">"option3"</span> <span class="na">disabled</span><span class="nt">&gt;</span>
    Option three is disabled
  <span class="nt">&lt;/label&gt;</span>
<span class="nt">&lt;/div&gt;</span></code></pre></div>

                <h4 id="인라인-체크박스와-라디오">인라인 체크박스와 라디오<a class="anchorjs-link" href="#인라인-체크박스와-라디오"><span class="anchorjs-icon"></span></a></h4>
                <p>체크박스나 라디오 콘트롤들을 같은 줄에 보이게 하기 위해, <code>.checkbox-inline</code> 이나 <code>.radio-inline</code> 클래스를 사용하세요. <!-- TODO: Use the .checkbox-inline or .radio-inline classes on a series of checkboxes or radios for controls that appear on the same line.--></p>
                <div class="bs-example" data-example-id="inline-checkboxes-radios">
                    <form>
                        <label class="checkbox-inline">
                            <input type="checkbox" id="inlineCheckbox1" value="option1"> 1
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" id="inlineCheckbox2" value="option2"> 2
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" id="inlineCheckbox3" value="option3"> 3
                        </label>
                    </form>
                    <br>
                    <form>
                        <label class="radio-inline">
                            <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> 1
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> 2
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3"> 3
                        </label>
                    </form>
                </div><!-- /.bs-example -->
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"checkbox-inline"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"checkbox"</span> <span class="na">id=</span><span class="s">"inlineCheckbox1"</span> <span class="na">value=</span><span class="s">"option1"</span><span class="nt">&gt;</span> 1
<span class="nt">&lt;/label&gt;</span>
<span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"checkbox-inline"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"checkbox"</span> <span class="na">id=</span><span class="s">"inlineCheckbox2"</span> <span class="na">value=</span><span class="s">"option2"</span><span class="nt">&gt;</span> 2
<span class="nt">&lt;/label&gt;</span>
<span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"checkbox-inline"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"checkbox"</span> <span class="na">id=</span><span class="s">"inlineCheckbox3"</span> <span class="na">value=</span><span class="s">"option3"</span><span class="nt">&gt;</span> 3
<span class="nt">&lt;/label&gt;</span>

<span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"radio-inline"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"radio"</span> <span class="na">name=</span><span class="s">"inlineRadioOptions"</span> <span class="na">id=</span><span class="s">"inlineRadio1"</span> <span class="na">value=</span><span class="s">"option1"</span><span class="nt">&gt;</span> 1
<span class="nt">&lt;/label&gt;</span>
<span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"radio-inline"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"radio"</span> <span class="na">name=</span><span class="s">"inlineRadioOptions"</span> <span class="na">id=</span><span class="s">"inlineRadio2"</span> <span class="na">value=</span><span class="s">"option2"</span><span class="nt">&gt;</span> 2
<span class="nt">&lt;/label&gt;</span>
<span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"radio-inline"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"radio"</span> <span class="na">name=</span><span class="s">"inlineRadioOptions"</span> <span class="na">id=</span><span class="s">"inlineRadio3"</span> <span class="na">value=</span><span class="s">"option3"</span><span class="nt">&gt;</span> 3
<span class="nt">&lt;/label&gt;</span></code></pre></div>

                <h4 id="라벨-텍스트-없는-체크박스와-라디오">라벨 텍스트 없는 체크박스와 라디오<a class="anchorjs-link" href="#라벨-텍스트-없는-체크박스와-라디오"><span class="anchorjs-icon"></span></a></h4>
                <p>입력 콘트롤이 상식적으로 위치한다면 <code>&lt;label&gt;</code> 에 텍스트가 필요하지 않을 수 있습니다. <strong>현재 인라인이 아닌 체크박스과 라디오에서만 작동합니다.</strong> 여전히 라벨폼에는 보조 공학이 제공되어야 함을 기억하세요. (예를 들면, <code>aria-label</code> 를 사용하는 것). <!-- Should you have no text within the <label>, the input is positioned as you'd expect. Currently only works on non-inline checkboxes and radios. Remember to still provide some form of label for assistive technologies (for instance, using aria-label).--></p>
                <div class="bs-example" data-example-id="checkboxes-radios-without-labels">
                    <form>
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" id="blankCheckbox" value="option1" aria-label="Checkbox without label text">
                            </label>
                        </div>
                        <div class="radio">
                            <label>
                                <input type="radio" name="blankRadio" id="blankRadio1" value="option1" aria-label="Radio button without label text">
                            </label>
                        </div>
                    </form>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"checkbox"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;label&gt;</span>
    <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"checkbox"</span> <span class="na">id=</span><span class="s">"blankCheckbox"</span> <span class="na">value=</span><span class="s">"option1"</span> <span class="na">aria-label=</span><span class="s">"..."</span><span class="nt">&gt;</span>
  <span class="nt">&lt;/label&gt;</span>
<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"radio"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;label&gt;</span>
    <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"radio"</span> <span class="na">name=</span><span class="s">"blankRadio"</span> <span class="na">id=</span><span class="s">"blankRadio1"</span> <span class="na">value=</span><span class="s">"option1"</span> <span class="na">aria-label=</span><span class="s">"..."</span><span class="nt">&gt;</span>
  <span class="nt">&lt;/label&gt;</span>
<span class="nt">&lt;/div&gt;</span></code></pre></div>

                <h3 id="셀렉트">셀렉트<a class="anchorjs-link" href="#셀렉트"><span class="anchorjs-icon"></span></a></h3>
                <p>사파리와 크롬의 셀렉트는 <code>border-radius</code> 속성으로 수정되지 않는 둥근 코너를 가지고 있습니다. <!-- TODO: Note that many native select menus—namely in Safari and Chrome—have rounded corners that cannot be modified via border-radius properties. --></p>
                <div class="bs-example" data-example-ids="select-form-control">
                    <form>
                        <select class="form-control">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                        </select>
                    </form>
                </div><!-- /.bs-example -->
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;select</span> <span class="na">class=</span><span class="s">"form-control"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;option&gt;</span>1<span class="nt">&lt;/option&gt;</span>
  <span class="nt">&lt;option&gt;</span>2<span class="nt">&lt;/option&gt;</span>
  <span class="nt">&lt;option&gt;</span>3<span class="nt">&lt;/option&gt;</span>
  <span class="nt">&lt;option&gt;</span>4<span class="nt">&lt;/option&gt;</span>
  <span class="nt">&lt;option&gt;</span>5<span class="nt">&lt;/option&gt;</span>
<span class="nt">&lt;/select&gt;</span></code></pre></div>

                <p>For <code>&lt;select&gt;</code> controls with the <code>multiple</code> attribute, multiple options are shown by default.</p>

                <div class="bs-example" data-example-ids="select-multiple-form-control">
                    <form>
                        <select multiple="" class="form-control">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                        </select>
                    </form>
                </div><!-- /.bs-example -->

                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;select</span> <span class="na">multiple</span> <span class="na">class=</span><span class="s">"form-control"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;option&gt;</span>1<span class="nt">&lt;/option&gt;</span>
  <span class="nt">&lt;option&gt;</span>2<span class="nt">&lt;/option&gt;</span>
  <span class="nt">&lt;option&gt;</span>3<span class="nt">&lt;/option&gt;</span>
  <span class="nt">&lt;option&gt;</span>4<span class="nt">&lt;/option&gt;</span>
  <span class="nt">&lt;option&gt;</span>5<span class="nt">&lt;/option&gt;</span>
<span class="nt">&lt;/select&gt;</span></code></pre></div>


                <h2 id="forms-controls-static">정적 콘트롤<a class="anchorjs-link" href="#forms-controls-static"><span class="anchorjs-icon"></span></a></h2>
                <p>폼에서 텍스트를 넣고 싶을때는 <code>&lt;p&gt;</code> 에 <code>.form-control-static</code> 클래스를 사용하세요.</p>
                <div class="bs-example" data-example-id="horizontal-static-form-control">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-10">
                                <p class="form-control-static">email@example.com</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword" class="col-sm-2 control-label">Password</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">
                            </div>
                        </div>
                    </form>
                </div><!-- /.bs-example -->
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;form</span> <span class="na">class=</span><span class="s">"form-horizontal"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"form-group"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"col-sm-2 control-label"</span><span class="nt">&gt;</span>Email<span class="nt">&lt;/label&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-sm-10"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;p</span> <span class="na">class=</span><span class="s">"form-control-static"</span><span class="nt">&gt;</span>email@example.com<span class="nt">&lt;/p&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"form-group"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;label</span> <span class="na">for=</span><span class="s">"inputPassword"</span> <span class="na">class=</span><span class="s">"col-sm-2 control-label"</span><span class="nt">&gt;</span>Password<span class="nt">&lt;/label&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-sm-10"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"password"</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">id=</span><span class="s">"inputPassword"</span> <span class="na">placeholder=</span><span class="s">"Password"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/form&gt;</span></code></pre></div>
                <div class="bs-example" data-example-id="inline-static-form-control">
                    <form class="form-inline">
                        <div class="form-group">
                            <label class="sr-only">Email</label>
                            <p class="form-control-static">email@example.com</p>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword2" class="sr-only">Password</label>
                            <input type="password" class="form-control" id="inputPassword2" placeholder="Password">
                        </div>
                        <button type="submit" class="btn btn-default">Confirm identity</button>
                    </form>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;form</span> <span class="na">class=</span><span class="s">"form-inline"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"form-group"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"sr-only"</span><span class="nt">&gt;</span>Email<span class="nt">&lt;/label&gt;</span>
    <span class="nt">&lt;p</span> <span class="na">class=</span><span class="s">"form-control-static"</span><span class="nt">&gt;</span>email@example.com<span class="nt">&lt;/p&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"form-group"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;label</span> <span class="na">for=</span><span class="s">"inputPassword2"</span> <span class="na">class=</span><span class="s">"sr-only"</span><span class="nt">&gt;</span>Password<span class="nt">&lt;/label&gt;</span>
    <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"password"</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">id=</span><span class="s">"inputPassword2"</span> <span class="na">placeholder=</span><span class="s">"Password"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"submit"</span> <span class="na">class=</span><span class="s">"btn btn-default"</span><span class="nt">&gt;</span>Confirm identity<span class="nt">&lt;/button&gt;</span>
<span class="nt">&lt;/form&gt;</span></code></pre></div>

                <h2 id="forms-control-focus">포커스 상태(Focus state)<a class="anchorjs-link" href="#forms-control-focus"><span class="anchorjs-icon"></span></a></h2>
                <p>우리는 <code>:focus</code> 를 위해 몇몇 폼콘트롤들의 기본 <code>outline</code> 스타일들을 제거하고 그 대신에 <code>box-shadow</code> 를 적용했습니다. <!-- TODO: We remove the default <code>outline</code> styles on some form controls and apply a <code>box-shadow</code> in its place for <code>:focus</code>. --></p>
                <div class="bs-example">
                    <form>
                        <input class="form-control" id="focusedInput" type="text" value="Demonstrative focus state">
                    </form>
                </div>
                <div class="bs-callout bs-callout-info" id="callout-focus-demo">
                    <h4 id=":focus-상태-데모"><code>:focus</code> 상태 데모<a class="anchorjs-link" href="#:focus-상태-데모"><span class="anchorjs-icon"></span></a></h4>
                    <p>위 예제 input 은 <code>.form-control</code> 상의 <code>:focus</code> 상태를 시연하기 위해서 우리 문서 안의 맞춤 스타일을 사용합니다.</p>
                </div>


                <h2 id="forms-control-disabled">비활성화 상태(Disabled state)<a class="anchorjs-link" href="#forms-control-disabled"><span class="anchorjs-icon"></span></a></h2>
                <p>Input 에 사용자 상호작용을 막기위해 <code>disabled</code> (boolean) 속성을 추가하세요. 비활성화된 입력양식은 좀더 밝게 보여지고 <code>not-allowed</code> 커서가 추가됩니다.</p>
                <div class="bs-example" data-example-id="text-form-control-disabled">
                    <form>
                        <input class="form-control" id="disabledInput" type="text" placeholder="Disabled input here…" disabled="">
                    </form>
                </div><!-- /.bs-example -->
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;input</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">id=</span><span class="s">"disabledInput"</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">placeholder=</span><span class="s">"Disabled input here..."</span> <span class="na">disabled</span><span class="nt">&gt;</span></code></pre></div>

                <h3 id="forms-disabled-fieldsets">비활성화된 필드셋(Disabled fieldsets)<a class="anchorjs-link" href="#forms-disabled-fieldsets"><span class="anchorjs-icon"></span></a></h3>
                <p>한번에 <code>&lt;fieldset&gt;</code> 내 모든 콘트롤을 비활성화하려면 <code>&lt;fieldset&gt;</code> 에 <code>disabled</code> 속성을 추가하세요.</p>

                <div class="bs-callout bs-callout-warning" id="callout-fieldset-disabled-pointer-events">
                    <h4 id="<a>-링크-기능성에-대한-경고"><code>&lt;a&gt;</code> 링크 기능성에 대한 경고<a class="anchorjs-link" href="#<a>-링크-기능성에-대한-경고"><span class="anchorjs-icon"></span></a></h4>
                    <p>기본적으로, 브라우저는 <code>&lt;비활성화된 필드셋&gt;</code> 내의 모든 기본 폼콘트롤(<code>&lt;input&gt;</code>, <code>&lt;select&gt;</code>, <code>&lt;button&gt;</code> 요소)들을 키보드와 마우스 상호작용이 되지 않도록 할 것입니다. 하지만, 만약 당신의 폼이  <code>&lt;a ... class="btn btn-*"&gt;</code> 을 포함하면, 그것들은 오직 <code>pointer-events: none</code> 스타일만이 적용될 것입니다. <a href="#buttons-disabled">버튼에서 비활성화 상태</a> 섹션에서 언급한 것처럼 이 CSS 속성은 아직 표준화되지 않았고, 오페라 18 이하나 인터넷 익스플로러 11 에서 완전히 지원되지 않습니다. 그리고 키보드 사용자가 이 링크들에 포커스하는 것을 막을 수 없을 것입니다. 그래서 안전하게 하려면, 그러한 링크들은 비활성활 할 수 있는 맞춤 자바스크립트를 사용하세요.
                        <!-- TODO: By default, browsers will treat all native form controls (<code>&lt;input&gt;</code>, <code>&lt;select&gt;</code> and <code>&lt;button&gt;</code> elements) inside a <code>&lt;fieldset disabled&gt;</code> as disabled, preventing both keyboard and mouse interactions on them. However, if your form also includes <code>&lt;a ... class="btn btn-*"&gt;</code> elements, these will only be given a style of <code>pointer-events: none</code>. As noted in the section about <a href="#buttons-disabled">disabled state for buttons</a> (and specifically in the sub-section for anchor elements), this CSS property is not yet standardized and isn't fully supported in Opera 18 and below, or in Internet Explorer 11, and won't prevent keyboard users from being able to focus or activate these links. So to be safe, use custom JavaScript to disable such links. --></p>
                </div>

                <div class="bs-callout bs-callout-danger" id="callout-fieldset-disabled-ie">
                    <h4 id="크로스브라우저-호환성">크로스브라우저 호환성<a class="anchorjs-link" href="#크로스브라우저-호환성"><span class="anchorjs-icon"></span></a></h4>
                    <p>부트스트랩은 이 스타일들을 모든 브라우저에 적용하지만, 인터넷 익스플로러 11 와 그 이하에서는 실제로 <code>&lt;fieldset&gt;</code> 에서 <code>disabled</code> 속성을 지원하지 않습니다. 이 브라우저들의 필드셋을 비활성화하려면 맞춤 자바스크립트를 사용하세요. <!-- TODO: While Bootstrap will apply these styles in all browsers, Internet Explorer 11 and below don't fully support the <code>disabled</code> attribute on a <code>&lt;fieldset&gt;</code>. Use custom JavaScript to disable the fieldset in these browsers.--></p>
                </div>

                <div class="bs-example" data-example-id="disabled-fieldset">
                    <form>
                        <fieldset disabled="">
                            <div class="form-group">
                                <label for="disabledTextInput">Disabled input</label>
                                <input type="text" id="disabledTextInput" class="form-control" placeholder="Disabled input">
                            </div>
                            <div class="form-group">
                                <label for="disabledSelect">Disabled select menu</label>
                                <select id="disabledSelect" class="form-control">
                                    <option>Disabled select</option>
                                </select>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox"> Can't check this
                                </label>
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </fieldset>
                    </form>
                </div><!-- /.bs-example -->
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;form&gt;</span>
  <span class="nt">&lt;fieldset</span> <span class="na">disabled</span><span class="nt">&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"form-group"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;label</span> <span class="na">for=</span><span class="s">"disabledTextInput"</span><span class="nt">&gt;</span>Disabled input<span class="nt">&lt;/label&gt;</span>
      <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">id=</span><span class="s">"disabledTextInput"</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">placeholder=</span><span class="s">"Disabled input"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"form-group"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;label</span> <span class="na">for=</span><span class="s">"disabledSelect"</span><span class="nt">&gt;</span>Disabled select menu<span class="nt">&lt;/label&gt;</span>
      <span class="nt">&lt;select</span> <span class="na">id=</span><span class="s">"disabledSelect"</span> <span class="na">class=</span><span class="s">"form-control"</span><span class="nt">&gt;</span>
        <span class="nt">&lt;option&gt;</span>Disabled select<span class="nt">&lt;/option&gt;</span>
      <span class="nt">&lt;/select&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"checkbox"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;label&gt;</span>
        <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"checkbox"</span><span class="nt">&gt;</span> Can't check this
      <span class="nt">&lt;/label&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"submit"</span> <span class="na">class=</span><span class="s">"btn btn-primary"</span><span class="nt">&gt;</span>Submit<span class="nt">&lt;/button&gt;</span>
  <span class="nt">&lt;/fieldset&gt;</span>
<span class="nt">&lt;/form&gt;</span></code></pre></div>


                <h2 id="forms-control-readonly">읽기전용 상태<a class="anchorjs-link" href="#forms-control-readonly"><span class="anchorjs-icon"></span></a></h2>
                <p>입력값의 수정을 막기위해 입력콘트롤에 <code>readonly</code> (boolean) 속성을 추가하세요. 읽기전용 입력콘트롤은 좀더 밝게 보여집니다. (비활성화된 입력콘트롤처럼), 하지만 커서는 기본 커서로 남아있습니다. </p>
                <div class="bs-example" data-example-id="readonly-text-form-control">
                    <form>
                        <input class="form-control" type="text" placeholder="Readonly input here…" readonly="">
                    </form>
                </div><!-- /.bs-example -->
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;input</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">placeholder=</span><span class="s">"Readonly input here…"</span> <span class="na">readonly</span><span class="nt">&gt;</span></code></pre></div>


                <h2 id="forms-control-validation">유효 상태(Validation states)<a class="anchorjs-link" href="#forms-control-validation"><span class="anchorjs-icon"></span></a></h2>
                <p>부트스트랩은 폼 콘트롤상의 에러, 경고, 성공 상태를 위한 유효 상태 스타일을 포함하고 있습니다. 사용하려면, 부모 요소에 <code>.has-warning</code>, <code>.has-error</code>, <code>.has-success</code> 를 추가하세요. 그 요소안의 모든 <code>.control-label</code>, <code>.form-control</code>, <code>.help-block</code> 은 유효성 스타일을 적용받습니다. <!-- TODO: Bootstrap includes validation styles for error, warning, and success states on form controls. To use, add .has-warning, .has-error, or .has-success to the parent element. Any .control-label, .form-control, and .help-block within that element will receive the validation styles.--></p>

                <div class="bs-callout bs-callout-warning" id="callout-form-validation-state-accessibility">
                    <h4 id="보조공학으로-유효-상태를-전달하기">보조공학으로 유효 상태를 전달하기<!-- TODO: Conveying validation state to assistive technologies--><a class="anchorjs-link" href="#보조공학으로-유효-상태를-전달하기"><span class="anchorjs-icon"></span></a></h4>
                    <p>폼콘트롤의 상태를 알리기 위해 유효성 스타일들을 사용하는 것은 시각적인 표시일뿐입니다, 스크린 리더같은 보조 공학 사용자들에게 전달하지 못할 것입니다. <!-- TODO: Using these validation styles to denote the state of a form control only provides a visual indication, which will not be conveyed to users of assistive technologies – such as screen readers.--></p>
                    <p>상태의 대안 표시가 제공될 수 있도록 하세요. 예를 들면, 당신은 폼콘트롤의 <code>&lt;label&gt;</code> 텍스트 자체에 상태에 대한 힌트를 포함할 수 있습니다 (다음 코드 예제와 같이). 아니면 <code>aria-describedby</code> 을 사용하는 폼콘트롤의 유효상태에 관한 텍스트 정보를 추가적인 속성을 사용할 수도 있습니다(따라오는 섹션의 예제를 보세요). 에러의 경우, 당신은 폼콘트롤에 <code>aria-invalid="true"</code> 을 사용할 수 있습니다.    <!-- TODO: Ensure that an alternative indication of state is also provided. For instance, you can include a hint about state in the form control's <code>&lt;label&gt;</code> text itself (as is the case in the following code example), or associate an additional element with textual information about the validation state with the form control using <code>aria-describedby</code> (see the example in the following section). In the case of an error, you could also use the <code>aria-invalid="true"</code> attribute on the form control.--></p>
                </div>

                <div class="bs-example" data-example-id="form-validation-states">
                    <form>
                        <div class="form-group has-success">
                            <label class="control-label" for="inputSuccess1">Input with success</label>
                            <input type="text" class="form-control" id="inputSuccess1">
                        </div>
                        <div class="form-group has-warning">
                            <label class="control-label" for="inputWarning1">Input with warning</label>
                            <input type="text" class="form-control" id="inputWarning1">
                        </div>
                        <div class="form-group has-error">
                            <label class="control-label" for="inputError1">Input with error</label>
                            <input type="text" class="form-control" id="inputError1">
                        </div>
                        <div class="has-success">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" id="checkboxSuccess" value="option1">
                                    Checkbox with success
                                </label>
                            </div>
                        </div>
                        <div class="has-warning">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" id="checkboxWarning" value="option1">
                                    Checkbox with warning
                                </label>
                            </div>
                        </div>
                        <div class="has-error">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" id="checkboxError" value="option1">
                                    Checkbox with error
                                </label>
                            </div>
                        </div>
                    </form>
                </div><!-- /.bs-example -->
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"form-group has-success"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"control-label"</span> <span class="na">for=</span><span class="s">"inputSuccess1"</span><span class="nt">&gt;</span>Input with success<span class="nt">&lt;/label&gt;</span>
  <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">id=</span><span class="s">"inputSuccess1"</span><span class="nt">&gt;</span>
<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"form-group has-warning"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"control-label"</span> <span class="na">for=</span><span class="s">"inputWarning1"</span><span class="nt">&gt;</span>Input with warning<span class="nt">&lt;/label&gt;</span>
  <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">id=</span><span class="s">"inputWarning1"</span><span class="nt">&gt;</span>
<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"form-group has-error"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"control-label"</span> <span class="na">for=</span><span class="s">"inputError1"</span><span class="nt">&gt;</span>Input with error<span class="nt">&lt;/label&gt;</span>
  <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">id=</span><span class="s">"inputError1"</span><span class="nt">&gt;</span>
<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"has-success"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"checkbox"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;label&gt;</span>
      <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"checkbox"</span> <span class="na">id=</span><span class="s">"checkboxSuccess"</span> <span class="na">value=</span><span class="s">"option1"</span><span class="nt">&gt;</span>
      Checkbox with success
    <span class="nt">&lt;/label&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"has-warning"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"checkbox"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;label&gt;</span>
      <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"checkbox"</span> <span class="na">id=</span><span class="s">"checkboxWarning"</span> <span class="na">value=</span><span class="s">"option1"</span><span class="nt">&gt;</span>
      Checkbox with warning
    <span class="nt">&lt;/label&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"has-error"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"checkbox"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;label&gt;</span>
      <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"checkbox"</span> <span class="na">id=</span><span class="s">"checkboxError"</span> <span class="na">value=</span><span class="s">"option1"</span><span class="nt">&gt;</span>
      Checkbox with error
    <span class="nt">&lt;/label&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span></code></pre></div>

                <h3 id="선택적인-아이콘">선택적인 아이콘<a class="anchorjs-link" href="#선택적인-아이콘"><span class="anchorjs-icon"></span></a></h3>
                <p>당신은 또한 <code>.has-feedback</code> 와 우측 아이콘의 추가로 선택적인 피드백 아이콘을 추가할 수 있습니다. <!-- TODO: You can also add optional feedback icons with the addition of <code>.has-feedback</code> and the right icon.--></p>
                <p><strong class="text-danger">피드백 아이콘은 오직 텍스트를 사용하는 <code>&lt;input class="form-control"&gt;</code> 요소에서만 작동합니다.</strong> <!-- TODO: Feedback icons only work with textual <input class="form-control"> elements.--></p>
                <div class="bs-callout bs-callout-warning" id="callout-has-feedback-icon-positioning">
                    <h4 id="아이콘,-라벨,-입력-그룹">아이콘, 라벨, 입력 그룹<a class="anchorjs-link" href="#아이콘,-라벨,-입력-그룹"><span class="anchorjs-icon"></span></a></h4>
                    <p>피드백 아이콘의 수동 위치는 라벨 없는 입력콘트롤과 에드온이 오른쪽에 있는 <a href="../components#input-groups">input groups</a> 을 위해 필요합니다. 당신은 접근성 이유를 위해 모든 입력콘트롤을 위한 라벨을 제공하는 것을 강력하게 장려해야 합니다. 만약 당신이 라벨없이 한따면, 피드백 아이콘의 <code>top</code> 값은 조정합니다. 입력 그룹을 위해, 당신의 애드온의 너비를 고려하여 적절한 픽셀값으로 <code>right</code> 값을 조정하세요.  <!-- TODO: Manual positioning of feedback icons is required for inputs without a label and for <a href="../components#input-groups">input groups</a> with an add-on on the right. You are strongly encouraged to provide labels for all inputs for accessibility reasons. If you wish to prevent labels from being displayed, hide them with the <code>.sr-only</code> class. If you must do without labels, adjust the <code>top</code> value of the feedback icon. For input groups, adjust the <code>right</code> value to an appropriate pixel value depending on the width of your addon.--></p>
                </div>
                <div class="bs-callout bs-callout-warning" id="callout-has-feedback-icon-accessibility">
                    <h4 id="보조-공학에-아이콘의-의미를-전달하는-것">보조 공학에 아이콘의 의미를 전달하는 것<!-- TODO: Conveying the icon's meaning to assistive technologies--><a class="anchorjs-link" href="#보조-공학에-아이콘의-의미를-전달하는-것"><span class="anchorjs-icon"></span></a></h4>
                    <p>스크린 리더같은 보조 공학에게 아이콘의 의미를 확실하게 전달하는 것을 확실히 하려면, <code>.sr-only</code> 클래스로 추가적인 숨겨진 텍스트가 포함되거나 <code>aria-describedby</code> 을 사용하는 폼콘트롤과 연관되어 있어야 합니다. 그렇지 않으면, 의미를 (예를 들면, 특정 텍스트 입력 필드를 위한 경고) 폼콘트롤에 연결된 <code>&lt;label&gt;</code> 의 텍스트를 바꾸는 것 처럼 다른 폼에서 전달하는 것을 확실히 하셔야 합니다. <!-- TODO: To ensure that assistive technologies – such as screen readers – correctly convey the meaning of an icon, additional hidden text should be included with the <code>.sr-only</code> class and explicitly associated with the form control it relates to using <code>aria-describedby</code>. Alternatively, ensure that the meaning (for instance, the fact that there is a warning for a particular text entry field) is conveyed in some other form, such as changing the text of the actual <code>&lt;label&gt;</code> associated with the form control.--></p>
                    <p>다음 예제는 <code>&lt;label&gt;</code> 텍스트 자체안에 폼콘트롤 각각의 유효 상태가 이미 언급되어 있음에도 불구하고, 실례를 보여주기 위해 아래의 테크닉(<code>.sr-only</code> 와 <code>aria-describedby</code> 를 사용)이 포함되어 있습니다.
                        <!-- TODO: Although the following examples already mention the validation state of their respective form controls in the <code>&lt;label&gt;</code> text itself, the above technique (using <code>.sr-only</code> text and <code>aria-describedby</code>) has been included for illustrative purposes.--></p>
                </div>
                <div class="bs-example" data-example-id="form-validation-states-with-icons">
                    <form>
                        <div class="form-group has-success has-feedback">
                            <label class="control-label" for="inputSuccess2">Input with success</label>
                            <input type="text" class="form-control" id="inputSuccess2" aria-describedby="inputSuccess2Status">
                            <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
                            <span id="inputSuccess2Status" class="sr-only">(success)</span>
                        </div>
                        <div class="form-group has-warning has-feedback">
                            <label class="control-label" for="inputWarning2">Input with warning</label>
                            <input type="text" class="form-control" id="inputWarning2" aria-describedby="inputWarning2Status">
                            <span class="glyphicon glyphicon-warning-sign form-control-feedback" aria-hidden="true"></span>
                            <span id="inputWarning2Status" class="sr-only">(warning)</span>
                        </div>
                        <div class="form-group has-error has-feedback">
                            <label class="control-label" for="inputError2">Input with error</label>
                            <input type="text" class="form-control" id="inputError2" aria-describedby="inputError2Status">
                            <span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
                            <span id="inputError2Status" class="sr-only">(error)</span>
                        </div>
                        <div class="form-group has-success has-feedback">
                            <label class="control-label" for="inputGroupSuccess1">Input group with success</label>
                            <div class="input-group">
                                <span class="input-group-addon">@</span>
                                <input type="text" class="form-control" id="inputGroupSuccess1" aria-describedby="inputGroupSuccess1Status">
                            </div>
                            <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
                            <span id="inputGroupSuccess1Status" class="sr-only">(success)</span>
                        </div>
                    </form>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"form-group has-success has-feedback"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"control-label"</span> <span class="na">for=</span><span class="s">"inputSuccess2"</span><span class="nt">&gt;</span>Input with success<span class="nt">&lt;/label&gt;</span>
  <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">id=</span><span class="s">"inputSuccess2"</span> <span class="na">aria-describedby=</span><span class="s">"inputSuccess2Status"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"glyphicon glyphicon-ok form-control-feedback"</span> <span class="na">aria-hidden=</span><span class="s">"true"</span><span class="nt">&gt;&lt;/span&gt;</span>
  <span class="nt">&lt;span</span> <span class="na">id=</span><span class="s">"inputSuccess2Status"</span> <span class="na">class=</span><span class="s">"sr-only"</span><span class="nt">&gt;</span>(success)<span class="nt">&lt;/span&gt;</span>
<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"form-group has-warning has-feedback"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"control-label"</span> <span class="na">for=</span><span class="s">"inputWarning2"</span><span class="nt">&gt;</span>Input with warning<span class="nt">&lt;/label&gt;</span>
  <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">id=</span><span class="s">"inputWarning2"</span> <span class="na">aria-describedby=</span><span class="s">"inputWarning2Status"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"glyphicon glyphicon-warning-sign form-control-feedback"</span> <span class="na">aria-hidden=</span><span class="s">"true"</span><span class="nt">&gt;&lt;/span&gt;</span>
  <span class="nt">&lt;span</span> <span class="na">id=</span><span class="s">"inputWarning2Status"</span> <span class="na">class=</span><span class="s">"sr-only"</span><span class="nt">&gt;</span>(warning)<span class="nt">&lt;/span&gt;</span>
<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"form-group has-error has-feedback"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"control-label"</span> <span class="na">for=</span><span class="s">"inputError2"</span><span class="nt">&gt;</span>Input with error<span class="nt">&lt;/label&gt;</span>
  <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">id=</span><span class="s">"inputError2"</span> <span class="na">aria-describedby=</span><span class="s">"inputError2Status"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"glyphicon glyphicon-remove form-control-feedback"</span> <span class="na">aria-hidden=</span><span class="s">"true"</span><span class="nt">&gt;&lt;/span&gt;</span>
  <span class="nt">&lt;span</span> <span class="na">id=</span><span class="s">"inputError2Status"</span> <span class="na">class=</span><span class="s">"sr-only"</span><span class="nt">&gt;</span>(error)<span class="nt">&lt;/span&gt;</span>
<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"form-group has-success has-feedback"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"control-label"</span> <span class="na">for=</span><span class="s">"inputGroupSuccess1"</span><span class="nt">&gt;</span>Input group with success<span class="nt">&lt;/label&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"input-group"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"input-group-addon"</span><span class="nt">&gt;</span>@<span class="nt">&lt;/span&gt;</span>
    <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">id=</span><span class="s">"inputGroupSuccess1"</span> <span class="na">aria-describedby=</span><span class="s">"inputGroupSuccess1Status"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"glyphicon glyphicon-ok form-control-feedback"</span> <span class="na">aria-hidden=</span><span class="s">"true"</span><span class="nt">&gt;&lt;/span&gt;</span>
  <span class="nt">&lt;span</span> <span class="na">id=</span><span class="s">"inputGroupSuccess1Status"</span> <span class="na">class=</span><span class="s">"sr-only"</span><span class="nt">&gt;</span>(success)<span class="nt">&lt;/span&gt;</span>
<span class="nt">&lt;/div&gt;</span></code></pre></div>

                <h4 id="수평폼과-인라인폼에서-보조-아이콘">수평폼과 인라인폼에서 보조 아이콘<a class="anchorjs-link" href="#수평폼과-인라인폼에서-보조-아이콘"><span class="anchorjs-icon"></span></a></h4>
                <div class="bs-example" data-example-id="horizontal-form-validation-state-with-icon">
                    <form class="form-horizontal">
                        <div class="form-group has-success has-feedback">
                            <label class="control-label col-sm-3" for="inputSuccess3">Input with success</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="inputSuccess3" aria-describedby="inputSuccess3Status">
                                <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
                                <span id="inputSuccess3Status" class="sr-only">(success)</span>
                            </div>
                        </div>
                        <div class="form-group has-success has-feedback">
                            <label class="control-label col-sm-3" for="inputGroupSuccess2">Input group with success</label>
                            <div class="col-sm-9">
                                <div class="input-group">
                                    <span class="input-group-addon">@</span>
                                    <input type="text" class="form-control" id="inputGroupSuccess2" aria-describedby="inputGroupSuccess2Status">
                                </div>
                                <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
                                <span id="inputGroupSuccess2Status" class="sr-only">(success)</span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;form</span> <span class="na">class=</span><span class="s">"form-horizontal"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"form-group has-success has-feedback"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"control-label col-sm-3"</span> <span class="na">for=</span><span class="s">"inputSuccess3"</span><span class="nt">&gt;</span>Input with success<span class="nt">&lt;/label&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-sm-9"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">id=</span><span class="s">"inputSuccess3"</span> <span class="na">aria-describedby=</span><span class="s">"inputSuccess3Status"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"glyphicon glyphicon-ok form-control-feedback"</span> <span class="na">aria-hidden=</span><span class="s">"true"</span><span class="nt">&gt;&lt;/span&gt;</span>
      <span class="nt">&lt;span</span> <span class="na">id=</span><span class="s">"inputSuccess3Status"</span> <span class="na">class=</span><span class="s">"sr-only"</span><span class="nt">&gt;</span>(success)<span class="nt">&lt;/span&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"form-group has-success has-feedback"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"control-label col-sm-3"</span> <span class="na">for=</span><span class="s">"inputGroupSuccess2"</span><span class="nt">&gt;</span>Input group with success<span class="nt">&lt;/label&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-sm-9"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"input-group"</span><span class="nt">&gt;</span>
        <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"input-group-addon"</span><span class="nt">&gt;</span>@<span class="nt">&lt;/span&gt;</span>
        <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">id=</span><span class="s">"inputGroupSuccess2"</span> <span class="na">aria-describedby=</span><span class="s">"inputGroupSuccess2Status"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;/div&gt;</span>
      <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"glyphicon glyphicon-ok form-control-feedback"</span> <span class="na">aria-hidden=</span><span class="s">"true"</span><span class="nt">&gt;&lt;/span&gt;</span>
      <span class="nt">&lt;span</span> <span class="na">id=</span><span class="s">"inputGroupSuccess2Status"</span> <span class="na">class=</span><span class="s">"sr-only"</span><span class="nt">&gt;</span>(success)<span class="nt">&lt;/span&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/form&gt;</span></code></pre></div>

                <div class="bs-example" data-example-id="inline-form-validation-state-with-icon">
                    <form class="form-inline">
                        <div class="form-group has-success has-feedback">
                            <label class="control-label" for="inputSuccess4">Input with success</label>
                            <input type="text" class="form-control" id="inputSuccess4" aria-describedby="inputSuccess4Status">
                            <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
                            <span id="inputSuccess4Status" class="sr-only">(success)</span>
                        </div>
                    </form>
                    <br>
                    <form class="form-inline">
                        <div class="form-group has-success has-feedback">
                            <label class="control-label" for="inputGroupSuccess3">Input group with success</label>
                            <div class="input-group">
                                <span class="input-group-addon">@</span>
                                <input type="text" class="form-control" id="inputGroupSuccess3" aria-describedby="inputGroupSuccess3Status">
                            </div>
                            <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
                            <span id="inputGroupSuccess3Status" class="sr-only">(success)</span>
                        </div>
                    </form>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;form</span> <span class="na">class=</span><span class="s">"form-inline"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"form-group has-success has-feedback"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"control-label"</span> <span class="na">for=</span><span class="s">"inputSuccess4"</span><span class="nt">&gt;</span>Input with success<span class="nt">&lt;/label&gt;</span>
    <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">id=</span><span class="s">"inputSuccess4"</span> <span class="na">aria-describedby=</span><span class="s">"inputSuccess4Status"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"glyphicon glyphicon-ok form-control-feedback"</span> <span class="na">aria-hidden=</span><span class="s">"true"</span><span class="nt">&gt;&lt;/span&gt;</span>
    <span class="nt">&lt;span</span> <span class="na">id=</span><span class="s">"inputSuccess4Status"</span> <span class="na">class=</span><span class="s">"sr-only"</span><span class="nt">&gt;</span>(success)<span class="nt">&lt;/span&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/form&gt;</span>
<span class="nt">&lt;form</span> <span class="na">class=</span><span class="s">"form-inline"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"form-group has-success has-feedback"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"control-label"</span> <span class="na">for=</span><span class="s">"inputGroupSuccess3"</span><span class="nt">&gt;</span>Input group with success<span class="nt">&lt;/label&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"input-group"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"input-group-addon"</span><span class="nt">&gt;</span>@<span class="nt">&lt;/span&gt;</span>
      <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">id=</span><span class="s">"inputGroupSuccess3"</span> <span class="na">aria-describedby=</span><span class="s">"inputGroupSuccess3Status"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"glyphicon glyphicon-ok form-control-feedback"</span> <span class="na">aria-hidden=</span><span class="s">"true"</span><span class="nt">&gt;&lt;/span&gt;</span>
    <span class="nt">&lt;span</span> <span class="na">id=</span><span class="s">"inputGroupSuccess3Status"</span> <span class="na">class=</span><span class="s">"sr-only"</span><span class="nt">&gt;</span>(success)<span class="nt">&lt;/span&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/form&gt;</span></code></pre></div>

                <h4 id="숨겨진-.sr-only-라벨과-보조-아이콘">숨겨진 <code>.sr-only</code> 라벨과 보조 아이콘<a class="anchorjs-link" href="#숨겨진-.sr-only-라벨과-보조-아이콘"><span class="anchorjs-icon"></span></a></h4>
                <p>만약 당신이 폼콘트롤의 <code>&lt;label&gt;</code> 을 숨기기 위해서 <code>.sr-only</code> 클래스를 사용한다면 (<code>aria-label</code> 속성같은 다른 라벨링 대안을 사용하는 것보다), 부트스트랩은 자동으로 아이콘의 위치를 조정할 것입니다. <!-- TODO: If you use the <code>.sr-only</code> class to hide a form control's <code>&lt;label&gt;</code> (rather than using other labelling options, such as the <code>aria-label</code> attribute), Bootstrap will automatically adjust the position of the icon once it's been added. --></p>
                <div class="bs-example" data-example-id="form-validation-state-with-icon-without-label">
                    <div class="form-group has-success has-feedback">
                        <label class="control-label sr-only" for="inputSuccess5">Hidden label</label>
                        <input type="text" class="form-control" id="inputSuccess5" aria-describedby="inputSuccess5Status">
                        <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
                        <span id="inputSuccess5Status" class="sr-only">(success)</span>
                    </div>
                    <div class="form-group has-success has-feedback">
                        <label class="control-label sr-only" for="inputGroupSuccess4">Input group with success</label>
                        <div class="input-group">
                            <span class="input-group-addon">@</span>
                            <input type="text" class="form-control" id="inputGroupSuccess4" aria-describedby="inputGroupSuccess4Status">
                        </div>
                        <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
                        <span id="inputGroupSuccess4Status" class="sr-only">(success)</span>
                    </div>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"form-group has-success has-feedback"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"control-label sr-only"</span> <span class="na">for=</span><span class="s">"inputSuccess5"</span><span class="nt">&gt;</span>Hidden label<span class="nt">&lt;/label&gt;</span>
  <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">id=</span><span class="s">"inputSuccess5"</span> <span class="na">aria-describedby=</span><span class="s">"inputSuccess5Status"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"glyphicon glyphicon-ok form-control-feedback"</span> <span class="na">aria-hidden=</span><span class="s">"true"</span><span class="nt">&gt;&lt;/span&gt;</span>
  <span class="nt">&lt;span</span> <span class="na">id=</span><span class="s">"inputSuccess5Status"</span> <span class="na">class=</span><span class="s">"sr-only"</span><span class="nt">&gt;</span>(success)<span class="nt">&lt;/span&gt;</span>
<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"form-group has-success has-feedback"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"control-label sr-only"</span> <span class="na">for=</span><span class="s">"inputGroupSuccess4"</span><span class="nt">&gt;</span>Input group with success<span class="nt">&lt;/label&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"input-group"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"input-group-addon"</span><span class="nt">&gt;</span>@<span class="nt">&lt;/span&gt;</span>
    <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">id=</span><span class="s">"inputGroupSuccess4"</span> <span class="na">aria-describedby=</span><span class="s">"inputGroupSuccess4Status"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"glyphicon glyphicon-ok form-control-feedback"</span> <span class="na">aria-hidden=</span><span class="s">"true"</span><span class="nt">&gt;&lt;/span&gt;</span>
  <span class="nt">&lt;span</span> <span class="na">id=</span><span class="s">"inputGroupSuccess4Status"</span> <span class="na">class=</span><span class="s">"sr-only"</span><span class="nt">&gt;</span>(success)<span class="nt">&lt;/span&gt;</span>
<span class="nt">&lt;/div&gt;</span></code></pre></div>


                <h2 id="forms-control-sizes">콘트롤 크기조절<a class="anchorjs-link" href="#forms-control-sizes"><span class="anchorjs-icon"></span></a></h2>
                <p><code>.input-lg</code> 같은 클래스를 사용하여 높이를 설정하세요. 그리고 <code>.col-lg-*</code> 같은 그리드 열 클래스를 사용하여 너비를 설정하세요. <!-- TODO: Set heights using classes like <code>.input-lg</code>, and set widths using grid column classes like <code>.col-lg-*</code>.--></p>

                <h3 id="높이-조절">높이 조절<a class="anchorjs-link" href="#높이-조절"><span class="anchorjs-icon"></span></a></h3>
                <p>폼콘트롤을 버튼 크기에 맞춰 크거나 작게 만드세요. <!-- TODO: Create taller or shorter form controls that match button sizes.--></p>
                <div class="bs-example bs-example-control-sizing" data-example-id="form-control-height-sizes">
                    <form>
                        <div class="controls">
                            <input class="form-control input-lg" type="text" placeholder=".input-lg">
                            <input type="text" class="form-control" placeholder="Default input">
                            <input class="form-control input-sm" type="text" placeholder=".input-sm">

                            <select class="form-control input-lg">
                                <option value="">.input-lg</option>
                            </select>
                            <select class="form-control">
                                <option value="">Default select</option>
                            </select>
                            <select class="form-control input-sm">
                                <option value="">.input-sm</option>
                            </select>
                        </div>
                    </form>
                </div><!-- /.bs-example -->
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;input</span> <span class="na">class=</span><span class="s">"form-control input-lg"</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">placeholder=</span><span class="s">".input-lg"</span><span class="nt">&gt;</span>
<span class="nt">&lt;input</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">placeholder=</span><span class="s">"Default input"</span><span class="nt">&gt;</span>
<span class="nt">&lt;input</span> <span class="na">class=</span><span class="s">"form-control input-sm"</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">placeholder=</span><span class="s">".input-sm"</span><span class="nt">&gt;</span>

<span class="nt">&lt;select</span> <span class="na">class=</span><span class="s">"form-control input-lg"</span><span class="nt">&gt;</span>...<span class="nt">&lt;/select&gt;</span>
<span class="nt">&lt;select</span> <span class="na">class=</span><span class="s">"form-control"</span><span class="nt">&gt;</span>...<span class="nt">&lt;/select&gt;</span>
<span class="nt">&lt;select</span> <span class="na">class=</span><span class="s">"form-control input-sm"</span><span class="nt">&gt;</span>...<span class="nt">&lt;/select&gt;</span></code></pre></div>

                <h3 id="수평폼-그룹-크기조절">수평폼 그룹 크기조절<a class="anchorjs-link" href="#수평폼-그룹-크기조절"><span class="anchorjs-icon"></span></a></h3>
                <p><code>.form-horizontal</code> 안의 라벨과 폼콘트롤을 간편하게 <code>.form-group-lg</code> 나 <code>.form-group-sm</code> 으로 크기조절 하세요. <!-- TODO: Quickly size labels and form controls within <code>.form-horizontal</code> by adding <code>.form-group-lg</code> or <code>.form-group-sm</code>.--></p>
                <div class="bs-example" data-example-id="form-group-height-sizes">
                    <form class="form-horizontal">
                        <div class="form-group form-group-lg">
                            <label class="col-sm-2 control-label" for="formGroupInputLarge">Large label</label>
                            <div class="col-sm-10">
                                <input class="form-control" type="text" id="formGroupInputLarge" placeholder="Large input">
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <label class="col-sm-2 control-label" for="formGroupInputSmall">Small label</label>
                            <div class="col-sm-10">
                                <input class="form-control" type="text" id="formGroupInputSmall" placeholder="Small input">
                            </div>
                        </div>
                    </form>
                </div><!-- /.bs-example -->
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;form</span> <span class="na">class=</span><span class="s">"form-horizontal"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"form-group form-group-lg"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"col-sm-2 control-label"</span> <span class="na">for=</span><span class="s">"formGroupInputLarge"</span><span class="nt">&gt;</span>Large label<span class="nt">&lt;/label&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-sm-10"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;input</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">id=</span><span class="s">"formGroupInputLarge"</span> <span class="na">placeholder=</span><span class="s">"Large input"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"form-group form-group-sm"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"col-sm-2 control-label"</span> <span class="na">for=</span><span class="s">"formGroupInputSmall"</span><span class="nt">&gt;</span>Small label<span class="nt">&lt;/label&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-sm-10"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;input</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">id=</span><span class="s">"formGroupInputSmall"</span> <span class="na">placeholder=</span><span class="s">"Small input"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/form&gt;</span></code></pre></div>


                <h3 id="열-크기조절">열 크기조절<a class="anchorjs-link" href="#열-크기조절"><span class="anchorjs-icon"></span></a></h3>
                <p>입력콘트롤을 그리드 열이나 간단히 원하는 너비로 맞춰주는 맞춤 부모 요소로 감싸세요. <!-- TODO: Wrap inputs in grid columns, or any custom parent element, to easily enforce desired widths.--></p>
                <div class="bs-example" data-example-id="form-control-column-sizing">
                    <form>
                        <div class="row">
                            <div class="col-xs-2">
                                <input type="text" class="form-control" placeholder=".col-xs-2">
                            </div>
                            <div class="col-xs-3">
                                <input type="text" class="form-control" placeholder=".col-xs-3">
                            </div>
                            <div class="col-xs-4">
                                <input type="text" class="form-control" placeholder=".col-xs-4">
                            </div>
                        </div>
                    </form>
                </div><!-- /.bs-example -->
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"row"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-xs-2"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">placeholder=</span><span class="s">".col-xs-2"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-xs-3"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">placeholder=</span><span class="s">".col-xs-3"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"col-xs-4"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">placeholder=</span><span class="s">".col-xs-4"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span></code></pre></div>

                <h2 id="forms-help-text">도움말(Help text)<a class="anchorjs-link" href="#forms-help-text"><span class="anchorjs-icon"></span></a></h2>
                <p>폼콘트롤을 위한 블록 레벨 도움말.</p>
                <div class="bs-callout bs-callout-info" id="callout-help-text-accessibility">
                    <h4 id="폼콘트롤과-도움말을-연계하기-">폼콘트롤과 도움말을 연계하기 <!-- TODO: Associating help text with form controls --><a class="anchorjs-link" href="#폼콘트롤과-도움말을-연계하기-"><span class="anchorjs-icon"></span></a></h4>
                    <p>도움말은 명확하게 <code>aria-describedby</code> 을 사용하여 폼콘트롤과 연계되어야 합니다. 이것은 보조 공학 -스크린 리더같은- 이 콘트롤에 포커스 되거나 들어왔을때 도움말을 알려줍니다. <!-- TODO: Help text should be explicitly associated with the form control it relates to using the <code>aria-describedby</code> attribute. This will ensure that assistive technologies – such as screen readers – will announce this help text when the user focuses or enters the control.--></p>
                </div>
                <div class="bs-example" data-example-id="simple-help-text">
                    <form>
                        <div class="form-group">
                            <label for="inputHelpBlock">Input with help text</label>
                            <input type="text" id="inputHelpBlock" class="form-control" aria-describedby="helpBlock">
                        </div>
                        <span id="helpBlock" class="help-block">A block of help text that breaks onto a new line and may extend beyond one line.</span>
                    </form>
                </div><!-- /.bs-example -->
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;label</span> <span class="na">class=</span><span class="s">"sr-only"</span> <span class="na">for=</span><span class="s">"inputHelpBlock"</span><span class="nt">&gt;</span>Input with help text<span class="nt">&lt;/label&gt;</span>
<span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"text"</span> <span class="na">id=</span><span class="s">"inputHelpBlock"</span> <span class="na">class=</span><span class="s">"form-control"</span> <span class="na">aria-describedby=</span><span class="s">"helpBlock"</span><span class="nt">&gt;</span>
...
<span class="nt">&lt;span</span> <span class="na">id=</span><span class="s">"helpBlock"</span> <span class="na">class=</span><span class="s">"help-block"</span><span class="nt">&gt;</span>A block of help text that breaks onto a new line and may extend beyond one line.<span class="nt">&lt;/span&gt;</span></code></pre></div>
            </div>

            <div class="bs-docs-section">
                <h1 id="buttons" class="page-header">버튼<a class="anchorjs-link" href="#buttons"><span class="anchorjs-icon"></span></a></h1>

                <h2 id="buttons-tags">버튼 태그<a class="anchorjs-link" href="#buttons-tags"><span class="anchorjs-icon"></span></a></h2>
                <p><code>&lt;a&gt;</code>, <code>&lt;button&gt;</code>, <code>&lt;input&gt;</code> 요소에 버튼 클래스를 사용하세요. <!-- TODO: Use the button classes on an <code>&lt;a&gt;</code>, <code>&lt;button&gt;</code>, or <code>&lt;input&gt;</code> element.--></p>
                <form class="bs-example" data-example-id="btn-tags">
                    <a class="btn btn-default" href="#" role="button">Link</a>
                    <button class="btn btn-default" type="submit">Button</button>
                    <input class="btn btn-default" type="button" value="Input">
                    <input class="btn btn-default" type="submit" value="Submit">
                </form>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-default"</span> <span class="na">href=</span><span class="s">"#"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Link<span class="nt">&lt;/a&gt;</span>
<span class="nt">&lt;button</span> <span class="na">class=</span><span class="s">"btn btn-default"</span> <span class="na">type=</span><span class="s">"submit"</span><span class="nt">&gt;</span>Button<span class="nt">&lt;/button&gt;</span>
<span class="nt">&lt;input</span> <span class="na">class=</span><span class="s">"btn btn-default"</span> <span class="na">type=</span><span class="s">"button"</span> <span class="na">value=</span><span class="s">"Input"</span><span class="nt">&gt;</span>
<span class="nt">&lt;input</span> <span class="na">class=</span><span class="s">"btn btn-default"</span> <span class="na">type=</span><span class="s">"submit"</span> <span class="na">value=</span><span class="s">"Submit"</span><span class="nt">&gt;</span></code></pre></div>

                <div class="bs-callout bs-callout-warning" id="callout-buttons-context-usage">
                    <h4 id="문맥-특정-사용-(context-specific-usage)">문맥 특정 사용 (Context-specific usage)<a class="anchorjs-link" href="#문맥-특정-사용-(context-specific-usage)"><span class="anchorjs-icon"></span></a></h4>
                    <p>버튼 클래스는 <code>&lt;a&gt;</code> 와 <code>&lt;button&gt;</code> 에 사용되어지지만, 오직 <code>&lt;button&gt;</code> 만이 네비게이션이과 네비게이션바 콤포넌트에서 지원됩니다. <!-- TODO: While button classes can be used on <code>&lt;a&gt;</code> and <code>&lt;button&gt;</code> elements, only <code>&lt;button&gt;</code> elements are supported within our nav and navbar components.--></p>
                </div>

                <div class="bs-callout bs-callout-warning" id="callout-buttons-anchor-accessibility">
                    <h4 id="버튼처럼-작동하는-링크-">버튼처럼 작동하는 링크 <!-- TODO: Links acting as buttons--><a class="anchorjs-link" href="#버튼처럼-작동하는-링크-"><span class="anchorjs-icon"></span></a></h4>
                    <p>만약 <code>&lt;a&gt;</code> 요소가 버튼 처럼 사용된다면, 그들은 적절한 <code>role="button"</code> 도 주어져야 합니다. <!-- TODO: If the <code>&lt;a&gt;</code> elements are used to act as buttons – triggering in-page functionality, rather than navigating to another document or section within the current page – they should also be given an appropriate <code>role="button"</code>.--></p>
                </div>

                <div class="bs-callout bs-callout-warning" id="callout-buttons-ff-height">
                    <h4 id="크로스브라우저-렌더링-">크로스브라우저 렌더링 <!-- TODO: Cross-browser rendering--><a class="anchorjs-link" href="#크로스브라우저-렌더링-"><span class="anchorjs-icon"></span></a></h4>
                    <p>크로스브라우저 렌더링에 맞춤을 확실히 하기 위해 <strong>우리는 가능한 <code>&lt;button&gt;</code> 사용하는 것을 강력히 추천합니다.</strong> <!-- TODO: As a best practice, <strong>we highly recommend using the <code>&lt;button&gt;</code> element whenever possible</strong> to ensure matching cross-browser rendering.--></p>
                    <p>다른 것들 중에서, <a href="https://bugzilla.mozilla.org/show_bug.cgi?id=697451">파이어폭스 &lt;30 버그</a> 가 있습니다. 그것은 우리가 <code>&lt;input&gt;</code> 의 <code>line-height</code> 의 설정을 하는 것을 막습니다. 그래서 파이어폭스의 다른 버튼의 높이와 정확하게 맞추지 못합니다. <!-- TODO: Among other things, there's <a href="https://bugzilla.mozilla.org/show_bug.cgi?id=697451">a bug in Firefox &lt;30</a> that prevents us from setting the <code>line-height</code> of <code>&lt;input&gt;</code>-based buttons, causing them to not exactly match the height of other buttons on Firefox.--></p>
                </div>

                <h2 id="buttons-options">옵션<a class="anchorjs-link" href="#buttons-options"><span class="anchorjs-icon"></span></a></h2>
                <p>간편하게 스타일 버튼을 만들기 위해 사용가능한 버튼 클래스중 하나를 사용하세요. <!-- TODO: Use any of the available button classes to quickly create a styled button. --></p>
                <div class="bs-example" data-example-id="btn-variants">
                    <button type="button" class="btn btn-default">Default</button>
                    <button type="button" class="btn btn-primary">Primary</button>
                    <button type="button" class="btn btn-success">Success</button>
                    <button type="button" class="btn btn-info">Info</button>
                    <button type="button" class="btn btn-warning">Warning</button>
                    <button type="button" class="btn btn-danger">Danger</button>
                    <button type="button" class="btn btn-link">Link</button>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="c">&lt;!-- Standard button --&gt;</span>
<span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"button"</span> <span class="na">class=</span><span class="s">"btn btn-default"</span><span class="nt">&gt;</span>Default<span class="nt">&lt;/button&gt;</span>

<span class="c">&lt;!-- Provides extra visual weight and identifies the primary action in a set of buttons --&gt;</span>
<span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"button"</span> <span class="na">class=</span><span class="s">"btn btn-primary"</span><span class="nt">&gt;</span>Primary<span class="nt">&lt;/button&gt;</span>

<span class="c">&lt;!-- Indicates a successful or positive action --&gt;</span>
<span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"button"</span> <span class="na">class=</span><span class="s">"btn btn-success"</span><span class="nt">&gt;</span>Success<span class="nt">&lt;/button&gt;</span>

<span class="c">&lt;!-- Contextual button for informational alert messages --&gt;</span>
<span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"button"</span> <span class="na">class=</span><span class="s">"btn btn-info"</span><span class="nt">&gt;</span>Info<span class="nt">&lt;/button&gt;</span>

<span class="c">&lt;!-- Indicates caution should be taken with this action --&gt;</span>
<span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"button"</span> <span class="na">class=</span><span class="s">"btn btn-warning"</span><span class="nt">&gt;</span>Warning<span class="nt">&lt;/button&gt;</span>

<span class="c">&lt;!-- Indicates a dangerous or potentially negative action --&gt;</span>
<span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"button"</span> <span class="na">class=</span><span class="s">"btn btn-danger"</span><span class="nt">&gt;</span>Danger<span class="nt">&lt;/button&gt;</span>

<span class="c">&lt;!-- Deemphasize a button by making it look like a link while maintaining button behavior --&gt;</span>
<span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"button"</span> <span class="na">class=</span><span class="s">"btn btn-link"</span><span class="nt">&gt;</span>Link<span class="nt">&lt;/button&gt;</span></code></pre></div>

                <div class="bs-callout bs-callout-warning" id="callout-buttons-color-accessibility">
                    <h4 id="보조-공학에-의미를-전달하는-것">보조 공학에 의미를 전달하는 것<!-- TODO: Conveying meaning to assistive technologies--><a class="anchorjs-link" href="#보조-공학에-의미를-전달하는-것"><span class="anchorjs-icon"></span></a></h4>
                    <p>버튼에 의미를 추가하기 위해 색을 사용하는 것은 시각적인 표시만 제공할 뿐입니다. 그것은 스크린리더같은 보조 공학의 사용자들에게는 전달되지 않을 것입니다. 색에 의한 정보를 콘텐츠 자체에도 나타낼 수 있도록 하세요. 그리고 <code>.sr-only</code> 로 텍스트를 숨길수도 있습니다. <!-- TODO: Using color to add meaning to a button only provides a visual indication, which will not be conveyed to users of assistive technologies – such as screen readers. Ensure that information denoted by the color is either obvious from the content itself (the visible text of the button), or is included through alternative means, such as additional text hidden with the <code>.sr-only</code> class.--></p>
                </div>

                <h2 id="buttons-sizes">크기<a class="anchorjs-link" href="#buttons-sizes"><span class="anchorjs-icon"></span></a></h2>
                <p>버튼을 크거나 작게 하고 싶으세요? 크기를 변경하려면 <code>.btn-lg</code>, <code>.btn-sm</code>, <code>.btn-xs</code> 을 추가하세요. <!-- TODO: Fancy larger or smaller buttons? Add <code>.btn-lg</code>, <code>.btn-sm</code>, or <code>.btn-xs</code> for additional sizes.--></p>
                <div class="bs-example" data-example-id="btn-sizes">
                    <p>
                        <button type="button" class="btn btn-primary btn-lg">Large button</button>
                        <button type="button" class="btn btn-default btn-lg">Large button</button>
                    </p>
                    <p>
                        <button type="button" class="btn btn-primary">Default button</button>
                        <button type="button" class="btn btn-default">Default button</button>
                    </p>
                    <p>
                        <button type="button" class="btn btn-primary btn-sm">Small button</button>
                        <button type="button" class="btn btn-default btn-sm">Small button</button>
                    </p>
                    <p>
                        <button type="button" class="btn btn-primary btn-xs">Extra small button</button>
                        <button type="button" class="btn btn-default btn-xs">Extra small button</button>
                    </p>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;p&gt;</span>
  <span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"button"</span> <span class="na">class=</span><span class="s">"btn btn-primary btn-lg"</span><span class="nt">&gt;</span>Large button<span class="nt">&lt;/button&gt;</span>
  <span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"button"</span> <span class="na">class=</span><span class="s">"btn btn-default btn-lg"</span><span class="nt">&gt;</span>Large button<span class="nt">&lt;/button&gt;</span>
<span class="nt">&lt;/p&gt;</span>
<span class="nt">&lt;p&gt;</span>
  <span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"button"</span> <span class="na">class=</span><span class="s">"btn btn-primary"</span><span class="nt">&gt;</span>Default button<span class="nt">&lt;/button&gt;</span>
  <span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"button"</span> <span class="na">class=</span><span class="s">"btn btn-default"</span><span class="nt">&gt;</span>Default button<span class="nt">&lt;/button&gt;</span>
<span class="nt">&lt;/p&gt;</span>
<span class="nt">&lt;p&gt;</span>
  <span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"button"</span> <span class="na">class=</span><span class="s">"btn btn-primary btn-sm"</span><span class="nt">&gt;</span>Small button<span class="nt">&lt;/button&gt;</span>
  <span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"button"</span> <span class="na">class=</span><span class="s">"btn btn-default btn-sm"</span><span class="nt">&gt;</span>Small button<span class="nt">&lt;/button&gt;</span>
<span class="nt">&lt;/p&gt;</span>
<span class="nt">&lt;p&gt;</span>
  <span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"button"</span> <span class="na">class=</span><span class="s">"btn btn-primary btn-xs"</span><span class="nt">&gt;</span>Extra small button<span class="nt">&lt;/button&gt;</span>
  <span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"button"</span> <span class="na">class=</span><span class="s">"btn btn-default btn-xs"</span><span class="nt">&gt;</span>Extra small button<span class="nt">&lt;/button&gt;</span>
<span class="nt">&lt;/p&gt;</span></code></pre></div>

                <p><code>.btn-block</code> 을 더하는 것으로 블록 레벨 버튼—부모 요소만큼 꽉 찬 너비—을 만듭니다. <!--TODO: Create block level buttons&mdash;those that span the full width of a parent&mdash; by adding <code>.btn-block</code>.--></p>
                <div class="bs-example" data-example-id="block-btns">
                    <div class="well center-block" style="max-width: 400px;">
                        <button type="button" class="btn btn-primary btn-lg btn-block">Block level button</button>
                        <button type="button" class="btn btn-default btn-lg btn-block">Block level button</button>
                    </div>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"button"</span> <span class="na">class=</span><span class="s">"btn btn-primary btn-lg btn-block"</span><span class="nt">&gt;</span>Block level button<span class="nt">&lt;/button&gt;</span>
<span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"button"</span> <span class="na">class=</span><span class="s">"btn btn-default btn-lg btn-block"</span><span class="nt">&gt;</span>Block level button<span class="nt">&lt;/button&gt;</span></code></pre></div>


                <h2 id="buttons-active">활성 상태<!-- TODO: Active state--><a class="anchorjs-link" href="#buttons-active"><span class="anchorjs-icon"></span></a></h2>
                <p>버튼은 활성화 되었을때 눌려진 것처럼(좀더 어두운 배경, 어두운 테두리, 내부 그림자로) 보여질 것입니다. <code>&lt;button&gt;</code> 요소를 위해서, <code>:active</code> 를 통해 되어있습니다. 하지만, 당신은 프로그램적으로 활성화된 상태를 적용할 필요가 있을때, <code>&lt;button&gt;</code> 에 <code>.active</code> 를 사용할 수 있습니다. (그리고 <code>aria-pressed="true"</code> 속성도 포함합니다)<!-- TODO: Buttons will appear pressed (with a darker background, darker border, and inset shadow) when active. For <code>&lt;button&gt;</code> elements, this is done via <code>:active</code>. For <code>&lt;a&gt;</code> elements, it's done with <code>.active</code>. However, you may use <code>.active</code> on <code>&lt;button&gt;</code>s (and include the <code>aria-pressed="true"</code> attribute) should you need to replicate the active state programmatically.--></p>

                <h3 id="버튼-요소-">버튼 요소 <!-- TODO: Button element--><a class="anchorjs-link" href="#버튼-요소-"><span class="anchorjs-icon"></span></a></h3>
                <p><code>:active</code> 를 더할 필요는 없습니다만, 만약 강제로 같은 모습이 필요하다면, <code>.active</code> 를 추가하세요. <!-- TOOD: No need to add <code>:active</code> as it's a pseudo-class, but if you need to force the same appearance, go ahead and add <code>.active</code>.--></p>
                <p class="bs-example" data-example-id="active-button-btns">
                    <button type="button" class="btn btn-primary btn-lg active">Primary button</button>
                    <button type="button" class="btn btn-default btn-lg active">Button</button>
                </p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"button"</span> <span class="na">class=</span><span class="s">"btn btn-primary btn-lg active"</span><span class="nt">&gt;</span>Primary button<span class="nt">&lt;/button&gt;</span>
<span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"button"</span> <span class="na">class=</span><span class="s">"btn btn-default btn-lg active"</span><span class="nt">&gt;</span>Button<span class="nt">&lt;/button&gt;</span></code></pre></div>

                <h3 id="앵커-요소-">앵커 요소 <!-- TODO: Anchor element--><a class="anchorjs-link" href="#앵커-요소-"><span class="anchorjs-icon"></span></a></h3>
                <p><code>&lt;a&gt;</code> 버튼에 <code>.active</code> 클래스를 추가하세요. <!-- TODO: Add the <code>.active</code> class to <code>&lt;a&gt;</code> buttons.--></p>
                <p class="bs-example" data-example-id="active-anchor-btns">
                    <a href="#" class="btn btn-primary btn-lg active" role="button">Primary link</a>
                    <a href="#" class="btn btn-default btn-lg active" role="button">Link</a>
                </p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;a</span> <span class="na">href=</span><span class="s">"#"</span> <span class="na">class=</span><span class="s">"btn btn-primary btn-lg active"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Primary link<span class="nt">&lt;/a&gt;</span>
<span class="nt">&lt;a</span> <span class="na">href=</span><span class="s">"#"</span> <span class="na">class=</span><span class="s">"btn btn-default btn-lg active"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Link<span class="nt">&lt;/a&gt;</span></code></pre></div>


                <h2 id="buttons-disabled">비활성화된 상태 <!--TODO: Disabled state--><a class="anchorjs-link" href="#buttons-disabled"><span class="anchorjs-icon"></span></a></h2>
                <p><code>opacity</code> 로 흐려지게 하여 버튼을 클릭할수 없는 것처럼 보여지게 만드세요. <!-- TODO: Make buttons look unclickable by fading them back with <code>opacity</code>.--></p>

                <h3 id="버튼-요소-">버튼 요소 <!-- TODO: Button element--><a class="anchorjs-link" href="#버튼-요소-"><span class="anchorjs-icon"></span></a></h3>
                <p><code>&lt;button&gt;</code> 버튼에 <code>disabled</code> 속성을 추가하세요. <!-- TODO: Add the <code>disabled</code> attribute to <code>&lt;button&gt;</code> buttons.--></p>
                <p class="bs-example" data-example-id="disabled-button-btns">
                    <button type="button" class="btn btn-primary btn-lg" disabled="disabled">Primary button</button>
                    <button type="button" class="btn btn-default btn-lg" disabled="disabled">Button</button>
                </p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"button"</span> <span class="na">class=</span><span class="s">"btn btn-lg btn-primary"</span> <span class="na">disabled=</span><span class="s">"disabled"</span><span class="nt">&gt;</span>Primary button<span class="nt">&lt;/button&gt;</span>
<span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"button"</span> <span class="na">class=</span><span class="s">"btn btn-default btn-lg"</span> <span class="na">disabled=</span><span class="s">"disabled"</span><span class="nt">&gt;</span>Button<span class="nt">&lt;/button&gt;</span></code></pre></div>

                <div class="bs-callout bs-callout-danger" id="callout-buttons-ie-disabled">
                    <h4 id="크로스브라우저-호환성-">크로스브라우저 호환성 <!--TODO: Cross-browser compatibility--><a class="anchorjs-link" href="#크로스브라우저-호환성-"><span class="anchorjs-icon"></span></a></h4>
                    <p>만약 당신이 <code>&lt;button&gt;</code> 에 <code>disabled</code> 속성을 추가한다면, 인터넷 익스플로러 9 와 그 이하는 우리가 고칠수 없는 이상한 텍스트 그림자와 회색 텍스트가 렌더링 될 것입니다. <!-- TODO: If you add the <code>disabled</code> attribute to a <code>&lt;button&gt;</code>, Internet Explorer 9 and below will render text gray with a nasty text-shadow that we cannot fix.--></p>
                </div>

                <h3 id="앵커-요소-">앵커 요소 <!-- TODO: Anchor element--><a class="anchorjs-link" href="#앵커-요소-"><span class="anchorjs-icon"></span></a></h3>
                <p><code>&lt;a&gt;</code> 버튼에 <code>.disabled</code> 를 추가하세요. <!-- TODO: Add the <code>.disabled</code> class to <code>&lt;a&gt;</code> buttons.--></p>
                <p class="bs-example" data-example-id="disabled-anchor-btns">
                    <a href="#" class="btn btn-primary btn-lg disabled" role="button">Primary link</a>
                    <a href="#" class="btn btn-default btn-lg disabled" role="button">Link</a>
                </p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;a</span> <span class="na">href=</span><span class="s">"#"</span> <span class="na">class=</span><span class="s">"btn btn-primary btn-lg disabled"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Primary link<span class="nt">&lt;/a&gt;</span>
<span class="nt">&lt;a</span> <span class="na">href=</span><span class="s">"#"</span> <span class="na">class=</span><span class="s">"btn btn-default btn-lg disabled"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Link<span class="nt">&lt;/a&gt;</span></code></pre></div>
                <p>
                    우리는 유틸리티 클래스로 <code>.disabled</code> 를 사용합니다. 비슷하게 <code>.active</code> 도요. prefix 는 필요하지 않습니다. <!-- TODO: We use <code>.disabled</code> as a utility class here, similar to the common <code>.active</code> class, so no prefix is required.-->
                </p>
                <div class="bs-callout bs-callout-warning" id="callout-buttons-disabled-anchor">
                    <h4 id="링크-기능성-경고-">링크 기능성 경고 <!-- TODO: Link functionality caveat--><a class="anchorjs-link" href="#링크-기능성-경고-"><span class="anchorjs-icon"></span></a></h4>
                    <p>이 클래스는 <code>&lt;a&gt;</code> 의 링크 기능성을 비활성화하기 위해서 <code>pointer-events: none</code> 를 사용합니다. 그러나 이 CSS 속성은 아직 표준화되지 않았고 오페라18 과 그 이하, 인터넷 익스플로러 11 에서 완전하게 지원되지 않습니다. 추가로, <code>pointer-events: none</code> 를 지원하는 브라우저 조차도, 키보드 네비게이션에는 효력이 없습니다. 그말은 보조공학 사용자들은 여전히 이런 링크들에 접근할 수 있다는 얘기입니다. 안전하게 하려면, 그런 링크들을 비활성화할 수 있는 맞춤 자바스크립트를 사용하세요. <!-- TODO: This class uses <code>pointer-events: none</code> to try to disable the link functionality of <code>&lt;a&gt;</code>s, but that CSS property is not yet standardized and isn't fully supported in Opera 18 and below, or in Internet Explorer 11. In addition, even in browsers that do support <code>pointer-events: none</code>, keyboard navigation remains unaffected, meaning that sighted keyboard users and users of assistive technologies will still be able to activate these links. So to be safe, use custom JavaScript to disable such links.--></p>
                </div>

            </div>

            <div class="bs-docs-section">
                <h1 id="images" class="page-header">이미지<a class="anchorjs-link" href="#images"><span class="anchorjs-icon"></span></a></h1>

                <h2 id="images-responsive">반응형 이미지 <!-- TODO: Responsive images --><a class="anchorjs-link" href="#images-responsive"><span class="anchorjs-icon"></span></a></h2>
                <p>부트스트랩 3 의 이미지들은 <code>.img-responsive</code> 으로 반응형으로 만들수 있습니다. 이것은 이미지에 <code>max-width: 100%;</code>, <code>height: auto;</code> , <code>display: block;</code> 을 적용합니다. 그래서 그것은 부모요소에 알맞게 변화합니다. </p><!-- TODO: Images in Bootstrap 3 can be made responsive-friendly via the addition of the <code>.img-responsive</code> class. This applies <code>max-width: 100%;</code>, <code>height: auto;</code> and <code>display: block;</code> to the image so that it scales nicely to the parent element.--><p></p>
                <p><code>.img-responsive</code> 를 사용한 이미지를 가운데 두기 위해서, <code>.text-center</code> 대신 <code>.center-block</code> 를 사용하세요. <code>.center-block</code> 사용에 관해 자세한 것은 <a href="../css/#helper-classes-center">헬퍼 클래스 섹션을 보세요.</a><!-- TODO: To center images which use the <code>.img-responsive</code> class, use <code>.center-block</code> instead of <code>.text-center</code>. <a href="../css/#helper-classes-center">See the helper classes section</a> for more details about <code>.center-block</code> usage.--></p>
                <div class="bs-callout bs-callout-warning" id="callout-images-ie-svg">
                    <h4 id="svg-이미지와-ie-8-10">SVG 이미지와 IE 8-10<a class="anchorjs-link" href="#svg-이미지와-ie-8-10"><span class="anchorjs-icon"></span></a></h4>
                    <p>인터넷 익스플로러 8-10 에서는, <code>.img-responsive</code> 와 SVG 이미지는 불균형적으로 조절됩니다. 이것을 고치려면, <code>width: 100% \9;</code> 을 더하세요. 부트스트랩은 다른 이미지 포멧에 문제를 일으킬 여지가 있어서 이것을 자동으로 적용하지 않았습니다. <!-- TODO: In Internet Explorer 8-10, SVG images with <code>.img-responsive</code> are disproportionately sized. To fix this, add <code>width: 100% \9;</code> where necessary. Bootstrap doesn't apply this automatically as it causes complications to other image formats.--></p>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;img</span> <span class="na">src=</span><span class="s">"..."</span> <span class="na">class=</span><span class="s">"img-responsive"</span> <span class="na">alt=</span><span class="s">"Responsive image"</span><span class="nt">&gt;</span></code></pre></div>

                <h2 id="images-shapes">이미지 모양<!-- TODO: Image shapes--><a class="anchorjs-link" href="#images-shapes"><span class="anchorjs-icon"></span></a></h2>
                <p>프로젝트에 손쉽게 스타일된 이미지를 위해서 <code>&lt;img&gt;</code> 요소에 클래스를 추가하세요. <!-- TODO: Add classes to an <code>&lt;img&gt;</code> element to easily style images in any project.--></p>
                <div class="bs-callout bs-callout-danger" id="callout-images-ie-rounded-corners">
                    <h4 id="크로스브라우저-호환성-">크로스브라우저 호환성 <!-- TODO: Cross-browser compatibility--><a class="anchorjs-link" href="#크로스브라우저-호환성-"><span class="anchorjs-icon"></span></a></h4>
                    <p>인터넥 익스플로러 8 은 둥근 모서리를 지원하지 않음을 명심하세요. <!-- TODO: Keep in mind that Internet Explorer 8 lacks support for rounded corners.--></p>
                </div>
                <div class="bs-example bs-example-images" data-example-id="image-shapes">
                    <img data-src="holder.js/140x140" class="img-rounded" alt="140x140" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMTQwIiBoZWlnaHQ9IjE0MCIgdmlld0JveD0iMCAwIDE0MCAxNDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjxkZWZzLz48cmVjdCB3aWR0aD0iMTQwIiBoZWlnaHQ9IjE0MCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjQ0LjA0Njg3NSIgeT0iNzAiIHN0eWxlPSJmaWxsOiNBQUFBQUE7Zm9udC13ZWlnaHQ6Ym9sZDtmb250LWZhbWlseTpBcmlhbCwgSGVsdmV0aWNhLCBPcGVuIFNhbnMsIHNhbnMtc2VyaWYsIG1vbm9zcGFjZTtmb250LXNpemU6MTBwdDtkb21pbmFudC1iYXNlbGluZTpjZW50cmFsIj4xNDB4MTQwPC90ZXh0PjwvZz48L3N2Zz4=" data-holder-rendered="true" style="width: 140px; height: 140px;">
                    <img data-src="holder.js/140x140" class="img-circle" alt="140x140" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMTQwIiBoZWlnaHQ9IjE0MCIgdmlld0JveD0iMCAwIDE0MCAxNDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjxkZWZzLz48cmVjdCB3aWR0aD0iMTQwIiBoZWlnaHQ9IjE0MCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjQ0LjA0Njg3NSIgeT0iNzAiIHN0eWxlPSJmaWxsOiNBQUFBQUE7Zm9udC13ZWlnaHQ6Ym9sZDtmb250LWZhbWlseTpBcmlhbCwgSGVsdmV0aWNhLCBPcGVuIFNhbnMsIHNhbnMtc2VyaWYsIG1vbm9zcGFjZTtmb250LXNpemU6MTBwdDtkb21pbmFudC1iYXNlbGluZTpjZW50cmFsIj4xNDB4MTQwPC90ZXh0PjwvZz48L3N2Zz4=" data-holder-rendered="true" style="width: 140px; height: 140px;">
                    <img data-src="holder.js/140x140" class="img-thumbnail" alt="140x140" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMTQwIiBoZWlnaHQ9IjE0MCIgdmlld0JveD0iMCAwIDE0MCAxNDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjxkZWZzLz48cmVjdCB3aWR0aD0iMTQwIiBoZWlnaHQ9IjE0MCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjQ0LjA0Njg3NSIgeT0iNzAiIHN0eWxlPSJmaWxsOiNBQUFBQUE7Zm9udC13ZWlnaHQ6Ym9sZDtmb250LWZhbWlseTpBcmlhbCwgSGVsdmV0aWNhLCBPcGVuIFNhbnMsIHNhbnMtc2VyaWYsIG1vbm9zcGFjZTtmb250LXNpemU6MTBwdDtkb21pbmFudC1iYXNlbGluZTpjZW50cmFsIj4xNDB4MTQwPC90ZXh0PjwvZz48L3N2Zz4=" data-holder-rendered="true" style="width: 140px; height: 140px;">
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;img</span> <span class="na">src=</span><span class="s">"..."</span> <span class="na">alt=</span><span class="s">"..."</span> <span class="na">class=</span><span class="s">"img-rounded"</span><span class="nt">&gt;</span>
<span class="nt">&lt;img</span> <span class="na">src=</span><span class="s">"..."</span> <span class="na">alt=</span><span class="s">"..."</span> <span class="na">class=</span><span class="s">"img-circle"</span><span class="nt">&gt;</span>
<span class="nt">&lt;img</span> <span class="na">src=</span><span class="s">"..."</span> <span class="na">alt=</span><span class="s">"..."</span> <span class="na">class=</span><span class="s">"img-thumbnail"</span><span class="nt">&gt;</span></code></pre></div>
            </div>

            <div class="bs-docs-section" style="height: auto !important;">
                <h1 id="helper-classes" class="page-header">헬퍼 클래스<a class="anchorjs-link" href="#helper-classes"><span class="anchorjs-icon"></span></a></h1>

                <h3 id="helper-classes-colors">맥락적인 색<a class="anchorjs-link" href="#helper-classes-colors"><span class="anchorjs-icon"></span></a></h3>
                <p>몇개의 다용도 강조 클래스로 색으로 의미를 전달하세요. 이것들은 또한 링크에도 적용되고 마우스가 올라갔을때 어두워질것입니다. <!-- TODO: Convey meaning through color with a handful of emphasis utility classes. These may also be applied to links and will darken on hover just like our default link styles.--></p>
                <div class="bs-example" data-example-id="contextual-colors-helpers">
                    <p class="text-muted">Fusce dapibus, tellus ac cursus commodo, tortor mauris nibh.</p>
                    <p class="text-primary">Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                    <p class="text-success">Duis mollis, est non commodo luctus, nisi erat porttitor ligula.</p>
                    <p class="text-info">Maecenas sed diam eget risus varius blandit sit amet non magna.</p>
                    <p class="text-warning">Etiam porta sem malesuada magna mollis euismod.</p>
                    <p class="text-danger">Donec ullamcorper nulla non metus auctor fringilla.</p>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;p</span> <span class="na">class=</span><span class="s">"text-muted"</span><span class="nt">&gt;</span>...<span class="nt">&lt;/p&gt;</span>
<span class="nt">&lt;p</span> <span class="na">class=</span><span class="s">"text-primary"</span><span class="nt">&gt;</span>...<span class="nt">&lt;/p&gt;</span>
<span class="nt">&lt;p</span> <span class="na">class=</span><span class="s">"text-success"</span><span class="nt">&gt;</span>...<span class="nt">&lt;/p&gt;</span>
<span class="nt">&lt;p</span> <span class="na">class=</span><span class="s">"text-info"</span><span class="nt">&gt;</span>...<span class="nt">&lt;/p&gt;</span>
<span class="nt">&lt;p</span> <span class="na">class=</span><span class="s">"text-warning"</span><span class="nt">&gt;</span>...<span class="nt">&lt;/p&gt;</span>
<span class="nt">&lt;p</span> <span class="na">class=</span><span class="s">"text-danger"</span><span class="nt">&gt;</span>...<span class="nt">&lt;/p&gt;</span></code></pre></div>
                <div class="bs-callout bs-callout-info" id="callout-helper-context-color-specificity">
                    <h4 id="특수성-해결-">특수성 해결 <!-- TODO: Dealing with specificity--><a class="anchorjs-link" href="#특수성-해결-"><span class="anchorjs-icon"></span></a></h4>
                    <p>가끔 강조 클래스는 또다른 앵커 셀렉터의 특수성으로 인해 적용되지 않을 수 있습니다. 많은 경우에서, 해결책은 당신의 텍스트를 클래스와 함께 <code>&lt;span&gt;</code> 로 감싸는 것입니다. <!-- TODO: Sometimes emphasis classes cannot be applied due to the specificity of another selector. In most cases, a sufficient workaround is to wrap your text in a <code>&lt;span&gt;</code> with the class.--></p>
                </div>
                <div class="bs-callout bs-callout-warning" id="callout-helper-context-color-accessibility">
                    <h4 id="보조공학에-의미를-전달하기">보조공학에 의미를 전달하기<!--TODO: Conveying meaning to assistive technologies--><a class="anchorjs-link" href="#보조공학에-의미를-전달하기"><span class="anchorjs-icon"></span></a></h4>
                    <p>의미를 전달하기 위해 색을 사용하는 것은 오직 시각적인 표시를 제공할 뿐입니다. 보조 공학 사용자들에게는 전달되지 않습니다. 그 색에 의한 정보들이 콘텐츠 자체에도 명백히 나타낼 수 있도록 하세요. 그리고 <code>.sr-only</code> 클래스로 가려두셔도 괜찮습니다. <!-- TODO: Using color to add meaning only provides a visual indication, which will not be conveyed to users of assistive technologies – such as screen readers. Ensure that information denoted by the color is either obvious from the content itself (the contextual colors are only used to reinforce meaning that is already present in the text/markup), or is included through alternative means, such as additional text hidden with the <code>.sr-only</code> class.--></p>
                </div>

                <h3 id="helper-classes-backgrounds">맥락적인 배경 <!-- TODO: Contextual backgrounds--><a class="anchorjs-link" href="#helper-classes-backgrounds"><span class="anchorjs-icon"></span></a></h3>
                <p>맥락적인 텍스트 색 클래스와 비슷하게, 하나의 맥락적인 클래스로 요소의 배경을 손쉽게 설정하세요. 앵커 콤포넌트는 텍스트 클래스들 처럼 마우스가 올라오면 어두워질 것입니다. <!-- TODO: Similar to the contextual text color classes, easily set the background of an element to any contextual class. Anchor components will darken on hover, just like the text classes.--></p>
                <div class="bs-example bs-example-bg-classes" data-example-id="contextual-backgrounds-helpers">
                    <p class="bg-primary">Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                    <p class="bg-success">Duis mollis, est non commodo luctus, nisi erat porttitor ligula.</p>
                    <p class="bg-info">Maecenas sed diam eget risus varius blandit sit amet non magna.</p>
                    <p class="bg-warning">Etiam porta sem malesuada magna mollis euismod.</p>
                    <p class="bg-danger">Donec ullamcorper nulla non metus auctor fringilla.</p>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;p</span> <span class="na">class=</span><span class="s">"bg-primary"</span><span class="nt">&gt;</span>...<span class="nt">&lt;/p&gt;</span>
<span class="nt">&lt;p</span> <span class="na">class=</span><span class="s">"bg-success"</span><span class="nt">&gt;</span>...<span class="nt">&lt;/p&gt;</span>
<span class="nt">&lt;p</span> <span class="na">class=</span><span class="s">"bg-info"</span><span class="nt">&gt;</span>...<span class="nt">&lt;/p&gt;</span>
<span class="nt">&lt;p</span> <span class="na">class=</span><span class="s">"bg-warning"</span><span class="nt">&gt;</span>...<span class="nt">&lt;/p&gt;</span>
<span class="nt">&lt;p</span> <span class="na">class=</span><span class="s">"bg-danger"</span><span class="nt">&gt;</span>...<span class="nt">&lt;/p&gt;</span></code></pre></div>
                <div class="bs-callout bs-callout-info" id="callout-helper-bg-specificity">
                    <h4 id="특수성-해결-">특수성 해결 <!-- TODO: Dealing with specificity--><a class="anchorjs-link" href="#특수성-해결-"><span class="anchorjs-icon"></span></a></h4>
                    <p>가끔 배경 클래스는 또다른 앵커 셀렉터의 특수성으로 인해 적용되지 않을 수 있습니다. 많은 경우에서, 해결책은 당신의 텍스트를 클래스와 함께 <code>&lt;div&gt;</code> 로 감싸는 것입니다. <!-- TODO: Sometimes contextual background classes cannot be applied due to the specificity of another selector. In some cases, a sufficient workaround is to wrap your element's content in a <code>&lt;div&gt;</code> with the class.--></p>
                </div>
                <div class="bs-callout bs-callout-warning" id="callout-helper-bg-accessibility">
                    <h4 id="보조공학에-의미를-전달하는것">보조공학에 의미를 전달하는것<!-- TODO: Conveying meaning to assistive technologies--><a class="anchorjs-link" href="#보조공학에-의미를-전달하는것"><span class="anchorjs-icon"></span></a></h4>
                    <p><a href="#helper-classes-colors">맥락적인 색</a> 처럼, 색의 의미를 전달하는 것을 확실히 하세요. <!-- TODO: As with <a href="#helper-classes-colors">contextual colors</a>, ensure that any meaning conveyed through color is also conveyed in a format that is not purely presentational.--></p>
                </div>

                <h3 id="helper-classes-close">닫기 아이콘<a class="anchorjs-link" href="#helper-classes-close"><span class="anchorjs-icon"></span></a></h3>
                <p>모달이나 경고같은 콘텐츠를 없애기 위한 보통의 닫기 아이콘을 사용하세요. <!-- TODO: Use the generic close icon for dismissing content like modals and alerts. --></p>
                <div class="bs-example" data-example-id="close-icon">
                    <p><button type="button" class="close" aria-label="Close"><span aria-hidden="true">×</span></button></p>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"button"</span> <span class="na">class=</span><span class="s">"close"</span> <span class="na">aria-label=</span><span class="s">"Close"</span><span class="nt">&gt;&lt;span</span> <span class="na">aria-hidden=</span><span class="s">"true"</span><span class="nt">&gt;</span><span class="ni">&amp;times;</span><span class="nt">&lt;/span&gt;&lt;/button&gt;</span></code></pre></div>


                <h3 id="helper-classes-carets">캐럿 (Carets)<a class="anchorjs-link" href="#helper-classes-carets"><span class="anchorjs-icon"></span></a></h3>
                <p>드롭다운 기능성과 방향을 알리기 위해 캐럿을 사용하세요. 기본 캐럿은 <a href="../components/#btn-dropdowns-dropup">드롭업 메뉴</a> 에서 반대임을 눈여겨 두세요. <!-- TODO: Use carets to indicate dropdown functionality and direction. Note that the default caret will reverse automatically in <a href="../components/#btn-dropdowns-dropup">dropup menus</a>.--></p>
                <div class="bs-example" data-example-id="caret">
                    <span class="caret"></span>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;span</span> <span class="na">class=</span><span class="s">"caret"</span><span class="nt">&gt;&lt;/span&gt;</span></code></pre></div>


                <h3 id="helper-classes-floats">간편한 float <!-- TODO: Quick floats--><a class="anchorjs-link" href="#helper-classes-floats"><span class="anchorjs-icon"></span></a></h3>
                <p>요소를 클래스로 좌측이나 우측으로 float 하세요. <code>!important</code> 는 특정한 이슈들을 피하기 위해 포함되어집니다. 클래스들은 또한 믹스인으로 사용할 수 있습니다. <!-- TODO: Float an element to the left or right with a class. <code>!important</code> is included to avoid specificity issues. Classes can also be used as mixins.--></p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"pull-left"</span><span class="nt">&gt;</span>...<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"pull-right"</span><span class="nt">&gt;</span>...<span class="nt">&lt;/div&gt;</span></code></pre></div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="c1">// Classes
</span><span class="nc">.pull-left</span> <span class="p">{</span>
  <span class="nl">float</span><span class="p">:</span> <span class="nb">left</span> <span class="o">!</span><span class="n">important</span><span class="p">;</span>
<span class="p">}</span>
<span class="nc">.pull-right</span> <span class="p">{</span>
  <span class="nl">float</span><span class="p">:</span> <span class="nb">right</span> <span class="o">!</span><span class="n">important</span><span class="p">;</span>
<span class="p">}</span>

<span class="c1">// Usage as mixins
</span><span class="nc">.element</span> <span class="p">{</span>
  <span class="nc">.pull-left</span><span class="o">()</span><span class="p">;</span>
<span class="p">}</span>
<span class="nc">.another-element</span> <span class="p">{</span>
  <span class="nc">.pull-right</span><span class="o">()</span><span class="p">;</span>
<span class="p">}</span></code></pre></div>

                <div class="bs-callout bs-callout-warning" id="callout-helper-pull-navbar">
                    <h4 id="네비게이션-바에서-사용하지-않습니다">네비게이션 바에서 사용하지 않습니다<a class="anchorjs-link" href="#네비게이션-바에서-사용하지-않습니다"><span class="anchorjs-icon"></span></a></h4>
                    <p>네비게이션 바에서 콤포넌트들을 정렬하려면, 대신 <code>.navbar-left</code> 나 <code>.navbar-right</code> 를 사용하세요. 자세한건 <a href="../components/#navbar-component-alignment">네비게이션 바 문서를 보세요</a>.</p>
                </div>


                <h3 id="helper-classes-center">콘텐츠 블록 중앙정렬 <!-- TODO: Center content blocks--><a class="anchorjs-link" href="#helper-classes-center"><span class="anchorjs-icon"></span></a></h3>
                <p><code>display: block</code> 와 <code>margin</code> 로 요소를 설정하세요. 믹스인과 클래스로 사용가능합니다. <!-- TODO: Set an element to <code>display: block</code> and center via <code>margin</code>. Available as a mixin and class.--></p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"center-block"</span><span class="nt">&gt;</span>...<span class="nt">&lt;/div&gt;</span></code></pre></div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="c1">// Class
</span><span class="nc">.center-block</span> <span class="p">{</span>
  <span class="nl">display</span><span class="p">:</span> <span class="nb">block</span><span class="p">;</span>
  <span class="nl">margin-left</span><span class="p">:</span> <span class="nb">auto</span><span class="p">;</span>
  <span class="nl">margin-right</span><span class="p">:</span> <span class="nb">auto</span><span class="p">;</span>
<span class="p">}</span>

<span class="c1">// Usage as a mixin
</span><span class="nc">.element</span> <span class="p">{</span>
  <span class="nc">.center-block</span><span class="o">()</span><span class="p">;</span>
<span class="p">}</span></code></pre></div>


                <h3 id="helper-classes-clearfix">Clearfix<a class="anchorjs-link" href="#helper-classes-clearfix"><span class="anchorjs-icon"></span></a></h3>
                <p><code>.clearfix</code> 을 추가하여 손쉽게 <code>float</code> 을 클리어하세요.  Nicolas Gallagher 가 공개한 <a href="http://nicolasgallagher.com/micro-clearfix-hack/">the micro clearfix</a> 를 사용하였습니다. 또한 믹스인으로 사용 가능합니다. <!-- TODO: Easily clear <code>float</code>s by adding <code>.clearfix</code> <strong>to the parent element</strong>. Utilizes <a href="http://nicolasgallagher.com/micro-clearfix-hack/">the micro clearfix</a> as popularized by Nicolas Gallagher. Can also be used as a mixin.--></p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="c">&lt;!-- Usage as a class --&gt;</span>
<span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"clearfix"</span><span class="nt">&gt;</span>...<span class="nt">&lt;/div&gt;</span></code></pre></div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="c1">// Mixin itself
</span><span class="nc">.clearfix</span><span class="o">()</span> <span class="p">{</span>
  <span class="k">&amp;</span><span class="nd">:before</span><span class="o">,</span>
  <span class="k">&amp;</span><span class="nd">:after</span> <span class="p">{</span>
    <span class="nl">content</span><span class="p">:</span> <span class="s2">" "</span><span class="p">;</span>
    <span class="nl">display</span><span class="p">:</span> <span class="n">table</span><span class="p">;</span>
  <span class="p">}</span>
  <span class="k">&amp;</span><span class="nd">:after</span> <span class="p">{</span>
    <span class="nl">clear</span><span class="p">:</span> <span class="nb">both</span><span class="p">;</span>
  <span class="p">}</span>
<span class="p">}</span>

<span class="c1">// Usage as a mixin
</span><span class="nc">.element</span> <span class="p">{</span>
  <span class="nc">.clearfix</span><span class="o">()</span><span class="p">;</span>
<span class="p">}</span></code></pre></div>


                <h3 id="helper-classes-show-hide">콘텐츠 보이고 숨기기<a class="anchorjs-link" href="#helper-classes-show-hide"><span class="anchorjs-icon"></span></a></h3>
                <p><code>.show</code> 와 <code>.hide</code> 클래스의 사용으로 display 를 통해 요소를 보이거나 숨깁니다. 이 클래스들은 간편한 float 처럼 특정한 이슈를 피하기 위해 !important 를 사용합니다. 그들은 오직 블록레벨만 사용 가능합니다. 그들은 또한 믹스인으로 사용됩니다.<!--
    Force an element to be shown or hidden (<strong>including for screen readers</strong>) with the use of <code>.show</code> and <code>.hidden</code> classes. These classes use <code>!important</code> to avoid specificity conflicts, just like the <a href="#helper-classes-floats">quick floats</a>. They are only available for block level toggling. They can also be used as mixins.--></p>
                <p><code>.hide</code> 는 가능합니다만 그것은 항상 스크린리더에 효과가 있지 않으며, v3.0.1 부터 <strong>deprecated</strong> 되었습니다. 대신 <code>.hidden</code> 나 <code>.sr-only</code> 를 사용하세요.</p><div class="google-auto-placed ap_container" style="width: 100%; height: auto; clear: both; text-align: center;"><ins data-ad-format="auto" class="adsbygoogle adsbygoogle-noablate" data-ad-client="ca-pub-5850631189163450" data-adsbygoogle-status="done" style="display: block; margin: auto; background-color: transparent; height: 280px;"><ins id="aswift_2_expand" style="display:inline-table;border:none;height:280px;margin:0;padding:0;position:relative;visibility:visible;width:848px;background-color:transparent;"><ins id="aswift_2_anchor" style="display: block; border: none; height: 280px; margin: 0px; padding: 0px; position: relative; visibility: visible; width: 848px; background-color: transparent; overflow: visible;"><iframe id="aswift_2" name="aswift_2" style="left:0;position:absolute;top:0;border:0;width:848px;height:280px;" sandbox="allow-forms allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" width="848" height="280" frameborder="0" src="https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-5850631189163450&amp;output=html&amp;h=280&amp;adk=3786634371&amp;adf=2928921663&amp;pi=t.aa~a.2373496813~i.83~rp.4&amp;w=848&amp;fwrn=4&amp;fwrnh=100&amp;lmt=1528810253&amp;num_ads=1&amp;rafmt=1&amp;armr=3&amp;sem=mc&amp;pwprc=3929213836&amp;psa=1&amp;guci=2.2.0.0.2.2.0.0&amp;ad_type=text_image&amp;format=848x280&amp;url=http%3A%2F%2Fbootstrapk.com%2Fcss%2F&amp;flash=0&amp;fwr=0&amp;pra=3&amp;rh=200&amp;rw=847&amp;rpe=1&amp;resp_fmts=3&amp;wgl=1&amp;fa=27&amp;adsid=ChAI8Iml_AUQ-IjVjMK-ovUjEj0ACJbdfNRucZVUMtmputV57xF1H8389p-qj4lM9GPEn6_1pEyfFVIz26ZfWUbgcSqRYZCx1qie2siZzRHR&amp;tt_state=W3siaXNzdWVyT3JpZ2luIjoiaHR0cHM6Ly9hZHNlcnZpY2UuZ29vZ2xlLmNvbSIsInN0YXRlIjowfV0.&amp;dt=1602880385616&amp;bpp=5&amp;bdt=1987&amp;idt=5&amp;shv=r20201014&amp;cbv=r20190131&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3Dbd35757aff5e7d08-22c9bea8f8c30095%3AT%3D1602157713%3ART%3D1602157713%3AS%3DALNI_MYhPOWzzI8UTfRs0sGcBjy_LeVqWw&amp;prev_fmts=0x0&amp;prev_slotnames=3534287123&amp;nras=2&amp;correlator=1156248753704&amp;frm=20&amp;pv=1&amp;ga_vid=772183725.1594738873&amp;ga_sid=1602880384&amp;ga_hid=1410710275&amp;ga_fc=0&amp;iag=0&amp;icsg=2189664831&amp;dssz=20&amp;mdo=0&amp;mso=0&amp;u_tz=540&amp;u_his=6&amp;u_java=0&amp;u_h=1080&amp;u_w=2560&amp;u_ah=1040&amp;u_aw=2560&amp;u_cd=24&amp;u_nplug=3&amp;u_nmime=5&amp;adx=101&amp;ady=50378&amp;biw=1341&amp;bih=605&amp;scr_x=0&amp;scr_y=200&amp;eid=42530672%2C21067105&amp;oid=3&amp;psts=AGkb-H_MlvwNbspI0m2KW2A1UgG8GfbydD7OazYzxJrnbJAIiOFT7jCZLDyyhKzCNo_I&amp;pvsid=2424789996601532&amp;pem=433&amp;ref=http%3A%2F%2Fbootstrapk.com%2Fcomponents%2F&amp;rx=0&amp;eae=0&amp;fc=1408&amp;brdim=2871%2C537%2C2871%2C537%2C2560%2C349%2C1374%2C725%2C1358%2C605&amp;vis=1&amp;rsz=%7C%7Cs%7C&amp;abl=NS&amp;alvm=r20201008&amp;fu=8320&amp;bc=23&amp;ifi=2&amp;uci=a!2&amp;btvi=1&amp;fsb=1&amp;xpc=ok4VCZuOLx&amp;p=http%3A//bootstrapk.com&amp;dtd=75" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" allowfullscreen="true" data-google-container-id="a!2" data-google-query-id="CIi3meD6uewCFZqGlgodMeMN8Q" data-load-complete="true"></iframe></ins></ins></ins></div>
                <p>더 나아가, <code>.invisible</code> 은 오직 요소의 가시성을 토글하기 위해 사용되어질 수 있습니다. <code>display</code> 은 수정되지 않고 요소는 여전히 문서의 흐름(공간)에 영향을 미칩니다.</p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"show"</span><span class="nt">&gt;</span>...<span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"hidden"</span><span class="nt">&gt;</span>...<span class="nt">&lt;/div&gt;</span></code></pre></div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="c1">// Classes
</span><span class="nc">.show</span> <span class="p">{</span>
  <span class="nl">display</span><span class="p">:</span> <span class="nb">block</span> <span class="o">!</span><span class="n">important</span><span class="p">;</span>
<span class="p">}</span>
<span class="nc">.hidden</span> <span class="p">{</span>
  <span class="nl">display</span><span class="p">:</span> <span class="nb">none</span> <span class="o">!</span><span class="n">important</span><span class="p">;</span>
  <span class="nl">visibility</span><span class="p">:</span> <span class="nb">hidden</span> <span class="o">!</span><span class="n">important</span><span class="p">;</span>
<span class="p">}</span>
<span class="nc">.invisible</span> <span class="p">{</span>
  <span class="nl">visibility</span><span class="p">:</span> <span class="nb">hidden</span><span class="p">;</span>
<span class="p">}</span>

<span class="c1">// Usage as mixins
</span><span class="nc">.element</span> <span class="p">{</span>
  <span class="nc">.show</span><span class="o">()</span><span class="p">;</span>
<span class="p">}</span>
<span class="nc">.another-element</span> <span class="p">{</span>
  <span class="nc">.hidden</span><span class="o">()</span><span class="p">;</span>
<span class="p">}</span></code></pre></div>


                <h3 id="helper-classes-screen-readers">스크린 리더와 키보드 네비게이션 콘텐츠<a class="anchorjs-link" href="#helper-classes-screen-readers"><span class="anchorjs-icon"></span></a></h3>
                <p><code>.sr-only</code> 로 <strong>스크린 리더를 제외한</strong> 모든 기기에서 요소를 숨기세요. 그것이 포커스 되었을때 요소를 보이기 위해서 <code>.sr-only</code> 와 <code>.sr-only-focusable</code> 를 조합하세요. (예를 들면 키보드만 가지고 있는 사용자들에 의해). <a href="../getting-started/#accessibility">최적의 접근성</a> 을 위해 필요합니다. 또한 믹스인으로도 사용할 수 있습니다. <!-- TODO: Hide an element to all devices except screen readers with .sr-only. Combine .sr-only with .sr-only-focusable to show the element again when it's focused (e.g. by a keyboard-only user). Necessary for following accessibility best practices. Can also be used as mixins.--></p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"sr-only sr-only-focusable"</span> <span class="na">href=</span><span class="s">"#content"</span><span class="nt">&gt;</span>Skip to main content<span class="nt">&lt;/a&gt;</span></code></pre></div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="c1">// Usage as a mixin
</span><span class="nc">.skip-navigation</span> <span class="p">{</span>
  <span class="nc">.sr-only</span><span class="o">()</span><span class="p">;</span>
  <span class="nc">.sr-only-focusable</span><span class="o">()</span><span class="p">;</span>
<span class="p">}</span></code></pre></div>


                <h3 id="helper-classes-image-replacement">이미지 대체<a class="anchorjs-link" href="#helper-classes-image-replacement"><span class="anchorjs-icon"></span></a></h3>
                <p><code>.text-hide</code> 클래스나 믹스인을 요소의 텍스트 콘텐츠를 배경 이미지로 대체하는 활용하세요.</p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;h1</span> <span class="na">class=</span><span class="s">"text-hide"</span><span class="nt">&gt;</span>Custom heading<span class="nt">&lt;/h1&gt;</span></code></pre></div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="c1">// 믹스인으로 사용
</span><span class="nc">.heading</span> <span class="p">{</span>
  <span class="nc">.text-hide</span><span class="o">()</span><span class="p">;</span>
<span class="p">}</span></code></pre></div>
            </div>

            <div class="bs-docs-section">
                <h1 id="responsive-utilities" class="page-header">반응형 유틸리티<a class="anchorjs-link" href="#responsive-utilities"><span class="anchorjs-icon"></span></a></h1>

                <p class="lead">좀더 빠른 모바일 친화 개발을 위해, 미디어 쿼리로 구분하는 기기로 콘텐츠를 보이고 숨기는데 이 유틸리티 클래스를 사용하세요. 또한 프린트할 때의 콘텐츠도 선택할 수 있습니다.</p>
                <p>같은 사이트의 완전히 다른 버전을 만드는 것을 피하기 위해 제한적으로 이것들을 사용하는 것을 시도해 보세요. 대신, 각 기기의 표현을 보완하기 위해 사용하세요.  <!-- TODO: Try to use these on a limited basis and avoid creating entirely different versions of the same site. Instead, use them to complement each device's presentation.--></p>


                <h2 id="responsive-utilities-classes">가능한 클래스<a class="anchorjs-link" href="#responsive-utilities-classes"><span class="anchorjs-icon"></span></a></h2>
                <p>뷰포트 분기점을 넘어 콘텐츠를 토글링하기 위한 가능한 클래스들을 혼자 아니면 조합으로 사용하세요. <!-- TODO: Use a single or combination of the available classes for toggling content across viewport breakpoints.--></p>
                <div class="table-responsive">
                    <table class="table table-bordered table-striped responsive-utilities">
                        <thead>
                        <tr>
                            <th></th>
                            <th>
                                매우 작은 기기
                                <small>모바일폰 (&lt;768px)</small>
                            </th>
                            <th>
                                작은 기기
                                <small>태블릿 (≥768px)</small>
                            </th>
                            <th>
                                중간 기기
                                <small>데스크탑 (≥992px)</small>
                            </th>
                            <th>
                                큰 기기
                                <small>데스크탑 (≥1200px)</small>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th scope="row"><code>.visible-xs-*</code></th>
                            <td class="is-visible">보임</td>
                            <td class="is-hidden">숨겨짐</td>
                            <td class="is-hidden">숨겨짐</td>
                            <td class="is-hidden">숨겨짐</td>
                        </tr>
                        <tr>
                            <th scope="row"><code>.visible-sm-*</code></th>
                            <td class="is-hidden">숨겨짐</td>
                            <td class="is-visible">보임</td>
                            <td class="is-hidden">숨겨짐</td>
                            <td class="is-hidden">숨겨짐</td>
                        </tr>
                        <tr>
                            <th scope="row"><code>.visible-md-*</code></th>
                            <td class="is-hidden">숨겨짐</td>
                            <td class="is-hidden">숨겨짐</td>
                            <td class="is-visible">보임</td>
                            <td class="is-hidden">숨겨짐</td>
                        </tr>
                        <tr>
                            <th scope="row"><code>.visible-lg-*</code></th>
                            <td class="is-hidden">숨겨짐</td>
                            <td class="is-hidden">숨겨짐</td>
                            <td class="is-hidden">숨겨짐</td>
                            <td class="is-visible">보임</td>
                        </tr>
                        </tbody>
                        <tbody>
                        <tr>
                            <th scope="row"><code>.hidden-xs</code></th>
                            <td class="is-hidden">숨겨짐</td>
                            <td class="is-visible">보임</td>
                            <td class="is-visible">보임</td>
                            <td class="is-visible">보임</td>
                        </tr>
                        <tr>
                            <th scope="row"><code>.hidden-sm</code></th>
                            <td class="is-visible">보임</td>
                            <td class="is-hidden">숨겨짐</td>
                            <td class="is-visible">보임</td>
                            <td class="is-visible">보임</td>
                        </tr>
                        <tr>
                            <th scope="row"><code>.hidden-md</code></th>
                            <td class="is-visible">보임</td>
                            <td class="is-visible">보임</td>
                            <td class="is-hidden">숨겨짐</td>
                            <td class="is-visible">보임</td>
                        </tr>
                        <tr>
                            <th scope="row"><code>.hidden-lg</code></th>
                            <td class="is-visible">보임</td>
                            <td class="is-visible">보임</td>
                            <td class="is-visible">보임</td>
                            <td class="is-hidden">숨겨짐</td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <p>v3.2.0 부터, <code>.visible-*-*</code> 클래스는 3가지 형태로 나옵니다. 각각의 형태는 아래에 나열된 것처럼 CSS <code>display</code> 속성값을 가집니다.</p>
                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>클래스 그룹</th>
                            <th>CSS <code>display</code></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th scope="row"><code>.visible-*-block</code></th>
                            <td><code>display: block;</code></td>
                        </tr>
                        <tr>
                            <th scope="row"><code>.visible-*-inline</code></th>
                            <td><code>display: inline;</code></td>
                        </tr>
                        <tr>
                            <th scope="row"><code>.visible-*-inline-block</code></th>
                            <td><code>display: inline-block;</code></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <p>그래서, 예를들어 매우 작은 (<code>xs</code>) 화면은 <code>.visible-*-*</code> 의 형태인 3가지 클래스가 가능합니다: <code>.visible-xs-block</code>, <code>.visible-xs-inline</code>, <code>.visible-xs-inline-block</code>.</p>
                <p><code>.visible-xs</code>, <code>.visible-sm</code>, <code>.visible-md</code>, <code>.visible-lg</code> 는 아직 존재합니다만 <strong>v3.2.0 부터 deprecated 되었습니다</strong>. 그들은 거의 <code>.visible-*-block</code> 과 동등합니다. 단, <code>&lt;table&gt;</code> 관련 요소의 토글링하는 특수한 경우는 예외입니다.  <!-- except with additional special cases for toggling <code>&lt;table&gt;</code>-related elements.--></p>

                <h2 id="responsive-utilities-print">프린트 클래스<a class="anchorjs-link" href="#responsive-utilities-print"><span class="anchorjs-icon"></span></a></h2>
                <p>보통 반응형 클래스들과 비슷하게, 프린트를 위해 토글링할 클래스에 이것들을 사용하세요. <!-- TODO: Similar to the regular responsive classes, use these for toggling content for print.--></p>
                <div class="table-responsive">
                    <table class="table table-bordered table-striped responsive-utilities">
                        <thead>
                        <tr>
                            <th>클래스</th>
                            <th>브라우저</th>
                            <th>프린트</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th scope="row">
                                <code>.visible-print-block</code><br>
                                <code>.visible-print-inline</code><br>
                                <code>.visible-print-inline-block</code>
                            </th>
                            <td class="is-hidden">숨겨짐</td>
                            <td class="is-visible">보임</td>
                        </tr>
                        <tr>
                            <th scope="row"><code>.hidden-print</code></th>
                            <td class="is-visible">보임</td>
                            <td class="is-hidden">숨겨짐</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <p><code>.visible-print</code> 클래스는 또한 존재합니다만 v3.2.0 부터는 <strong>deprecated</strong> 되었습니다. 그것은 거의 <code>.visible-print-block</code> 와 유사합니다. 단, <code>&lt;table&gt;</code> 관련 요소처럼 특수한 경우는 예외입니다. <!-- TODO: The class .visible-print also exists but is deprecated as of v3.2.0. It is approximately equivalent to .visible-print-block, except with additional special cases for <table>-related elements --></p>


                <h2 id="responsive-utilities-tests">테스트 케이스<a class="anchorjs-link" href="#responsive-utilities-tests"><span class="anchorjs-icon"></span></a></h2>
                <p>반응형 유틸리티 클래스를 테스트하려면 당신의 브라우저 크기를 조절하거나 다른 기기에서 이 주소를 불러오세요. <!-- TODO: Resize your browser or load on different devices to test the responsive utility classes.--></p>

                <h3 id="..에서-보이는">..에서 보이는<a class="anchorjs-link" href="#..에서-보이는"><span class="anchorjs-icon"></span></a></h3>
                <p>녹색 체크표시는 요소가 당신의 현재 뷰포트에서 <strong>보이는 것</strong> 임을 가르킵니다.</p>
                <div class="row responsive-utilities-test visible-on">
                    <div class="col-xs-6 col-sm-3">
                        <span class="hidden-xs">Extra small</span>
                        <span class="visible-xs-block">✔ 매우 작은 기기에서 보임</span>
                    </div>
                    <div class="col-xs-6 col-sm-3">
                        <span class="hidden-sm">Small</span>
                        <span class="visible-sm-block">✔ 작은 기기에서 보임</span>
                    </div>
                    <div class="clearfix visible-xs-block"></div>
                    <div class="col-xs-6 col-sm-3">
                        <span class="hidden-md">Medium</span>
                        <span class="visible-md-block">✔ 중간 기기에서 보임</span>
                    </div>
                    <div class="col-xs-6 col-sm-3">
                        <span class="hidden-lg">Large</span>
                        <span class="visible-lg-block">✔ 큰 기기에서 보임</span>
                    </div>
                </div>
                <div class="row responsive-utilities-test visible-on">
                    <div class="col-xs-6">
                        <span class="hidden-xs hidden-sm">매우 작은 기기와 작은 기기</span>
                        <span class="visible-xs-block visible-sm-block">✔ 매우 작은 기기와 작은 기기에서 보임</span>
                    </div>
                    <div class="col-xs-6">
                        <span class="hidden-md hidden-lg">중간 기기와 큰 기기</span>
                        <span class="visible-md-block visible-lg-block">✔ 중간 기기와 큰 기기에서 보임</span>
                    </div>
                    <div class="clearfix visible-xs-block"></div>
                    <div class="col-xs-6">
                        <span class="hidden-xs hidden-md">매우 작은 기기와 중간 기기</span>
                        <span class="visible-xs-block visible-md-block">✔ 매우 작은 기기와 중간 기기에서 보임</span>
                    </div>
                    <div class="col-xs-6">
                        <span class="hidden-sm hidden-lg">작은 기기와 큰 기기</span>
                        <span class="visible-sm-block visible-lg-block">✔ 작은 기기와 큰 기기에서 보임</span>
                    </div>
                    <div class="clearfix visible-xs-block"></div>
                    <div class="col-xs-6">
                        <span class="hidden-xs hidden-lg">매우 작은 기기와 큰 기기</span>
                        <span class="visible-xs-block visible-lg-block">✔ 매우 작은 기기와 큰 기기에서 보임</span>
                    </div>
                    <div class="col-xs-6">
                        <span class="hidden-sm hidden-md">작은 기기와 중간 기기</span>
                        <span class="visible-sm-block visible-md-block">✔ 작은 기기와 중간 기기에서 보임</span>
                    </div>
                </div>

                <h3 id="..에서-가려진">..에서 가려진<a class="anchorjs-link" href="#..에서-가려진"><span class="anchorjs-icon"></span></a></h3>
                <p>여기, 녹색 체크는 당신의 현재 뷰포트에서 요소가 <strong>가려지고</strong> 있음을 가르킵니다. <!-- TODO: Here, green checkmarks also indicate the element <strong>is hidden</strong> in your current viewport. --></p>
                <div class="row responsive-utilities-test hidden-on">
                    <div class="col-xs-6 col-sm-3">
                        <span class="hidden-xs"> 매우 작은 기기</span>
                        <span class="visible-xs-block">✔  매우 작은 기기에서 숨겨짐</span>
                    </div>
                    <div class="col-xs-6 col-sm-3">
                        <span class="hidden-sm">작은 기기</span>
                        <span class="visible-sm-block">✔ 작은 기기에서 숨겨짐</span>
                    </div>
                    <div class="clearfix visible-xs-block"></div>
                    <div class="col-xs-6 col-sm-3">
                        <span class="hidden-md">중간 기기</span>
                        <span class="visible-md-block">✔ 중간 기기에서 숨겨짐</span>
                    </div>
                    <div class="col-xs-6 col-sm-3">
                        <span class="hidden-lg">큰 기기</span>
                        <span class="visible-lg-block">✔ 큰 기기에서 숨겨짐</span>
                    </div>
                </div>
                <div class="row responsive-utilities-test hidden-on">
                    <div class="col-xs-6">
                        <span class="hidden-xs hidden-sm">매우 작은 기기와 작은 기기</span>
                        <span class="visible-xs-block visible-sm-block">✔ 매우 작은 기기와 작은 기기에서 숨겨짐</span>
                    </div>
                    <div class="col-xs-6">
                        <span class="hidden-md hidden-lg">중간 기기와 큰 기기</span>
                        <span class="visible-md-block visible-lg-block">✔ 중간 기기와 큰 기기에서 숨겨짐</span>
                    </div>
                    <div class="clearfix visible-xs-block"></div>
                    <div class="col-xs-6">
                        <span class="hidden-xs hidden-md">매우 작은 기기와 중간 기기</span>
                        <span class="visible-xs-block visible-md-block">✔ 매우 작은 기기와 중간 기기에서 숨겨짐</span>
                    </div>
                    <div class="col-xs-6">
                        <span class="hidden-sm hidden-lg">작은 기기와 큰 기기</span>
                        <span class="visible-sm-block visible-lg-block">✔ 작은 기기와 큰 기기에서 숨겨짐</span>
                    </div>
                    <div class="clearfix visible-xs-block"></div>
                    <div class="col-xs-6">
                        <span class="hidden-xs hidden-lg">매우 작은 기기와 큰 기기</span>
                        <span class="visible-xs-block visible-lg-block">✔ 매우 작은 기기와 큰 기기에서 숨겨짐</span>
                    </div>
                    <div class="col-xs-6">
                        <span class="hidden-sm hidden-md">작은 기기와 중간 기기</span>
                        <span class="visible-sm-block visible-md-block">✔ 작은 기기와 중간 기기에서 숨겨짐</span>
                    </div>
                </div>
            </div>

            <div class="bs-docs-section">
                <h1 id="less" class="page-header">Less 사용<a class="anchorjs-link" href="#less"><span class="anchorjs-icon"></span></a></h1>

                <p class="lead">부트스트랩의 CSS 는 Less 를 기반으로 만들어졌습니다. Less 는 CSS 컴파일링을 위한 변수, 믹스인, 함수 같은 부가 기능성을 갖춘 프리프로세서입니다. 컴파일된 CSS 파일들 대신 우리가 프레임워크 내에서 사용한 수많은 변수들과 믹스인들을 활용하는 Less 파일들을 사용하는 것을 고려해보세요.  <!-- TODO: Those looking to use the source Less files instead of our compiled CSS files can make use of the numerous variables and mixins we use throughout the framework.--></p>

                <p>그리드 변수들과 믹스들은 <a href="#grid-less">그리드 시스템 섹션</a> 에 포함되어 있습니다.</p>


                <h2 id="less-bootstrap">부트스트랩 컴파일하기<a class="anchorjs-link" href="#less-bootstrap"><span class="anchorjs-icon"></span></a></h2>
                <p>부트스트랩은 최소한 2가지 방법으로 사용되어질 수 있습니다: 컴파일된 CSS 아니면 Less 파일들. Less 파일들을 컴파일하려면, 어떻게 필수적인 명령어들을 실행하는 개발환경을 설정하는지 <a href="../getting-started/#grunt">시작하기 섹션을 참고하세요.</a></p>
                <p>서드 파티 편집 도구는 부트스트랩에서 작동할 수는 있지만, 코어팀에 의해 지원되는 것은 아닙니다. <!-- TODO: Third party compilation tools may work with Bootstrap, but they are not supported by our core team.--></p>

                <h2 id="less-variables">변수<a class="anchorjs-link" href="#less-variables"><span class="anchorjs-icon"></span></a></h2>
                <p>변수는 프로젝트 전역에서 흔히 사용되는 색이나 공간, 폰트 스택 등의 변수들을 한곳에 모으고 공유하기 위한 방법으로 사용되어집니다. 자세한 것은, <a href="../customize/#less-variables-section">맞춤화</a> 를 보세요.</p>

                <h3 id="less-variables-colors">색<a class="anchorjs-link" href="#less-variables-colors"><span class="anchorjs-icon"></span></a></h3>
                <p>손쉽게 2가지 색배합을 이용하세요: 그레이스케일, 시멘틱. 그레이스케일은 흔히 사용되는 검은색의 색조를 빠르게 제어하는 것을 제공합니다. 반면에 시멘틱은 의미있는 맥락적인 값들이 할당된 다양한 색을 포함합니다.</p>
                <div class="bs-example">
                    <div class="color-swatches">
                        <div class="color-swatch gray-darker"></div>
                        <div class="color-swatch gray-dark"></div>
                        <div class="color-swatch gray"></div>
                        <div class="color-swatch gray-light"></div>
                        <div class="color-swatch gray-lighter"></div>
                    </div>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="k">@gray-darker</span><span class="nd">:</span>  <span class="nt">lighten</span><span class="o">(</span><span class="nn">#000</span><span class="o">,</span> <span class="nt">13</span><span class="nc">.5</span><span class="nv">%</span><span class="o">)</span><span class="p">;</span> <span class="c1">// #222
</span><span class="k">@gray-dark</span><span class="nd">:</span>    <span class="nt">lighten</span><span class="o">(</span><span class="nn">#000</span><span class="o">,</span> <span class="nt">20</span><span class="nv">%</span><span class="o">)</span><span class="p">;</span>   <span class="c1">// #333
</span><span class="k">@gray</span><span class="nd">:</span>         <span class="nt">lighten</span><span class="o">(</span><span class="nn">#000</span><span class="o">,</span> <span class="nt">33</span><span class="nc">.5</span><span class="nv">%</span><span class="o">)</span><span class="p">;</span> <span class="c1">// #555
</span><span class="k">@gray-light</span><span class="nd">:</span>   <span class="nt">lighten</span><span class="o">(</span><span class="nn">#000</span><span class="o">,</span> <span class="nt">46</span><span class="nc">.7</span><span class="nv">%</span><span class="o">)</span><span class="p">;</span> <span class="c1">// #777
</span><span class="k">@gray-lighter</span><span class="nd">:</span> <span class="nt">lighten</span><span class="o">(</span><span class="nn">#000</span><span class="o">,</span> <span class="nt">93</span><span class="nc">.5</span><span class="nv">%</span><span class="o">)</span><span class="p">;</span> <span class="o">//</span> <span class="nn">#eee</span></code></pre></div>

                <div class="bs-example">
                    <div class="color-swatches">
                        <div class="color-swatch brand-primary"></div>
                        <div class="color-swatch brand-success"></div>
                        <div class="color-swatch brand-info"></div>
                        <div class="color-swatch brand-warning"></div>
                        <div class="color-swatch brand-danger"></div>
                    </div>
                </div>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="k">@brand-primary</span><span class="nd">:</span> <span class="nt">darken</span><span class="o">(</span><span class="nn">#428bca</span><span class="o">,</span> <span class="nt">6</span><span class="nc">.5</span><span class="nv">%</span><span class="o">)</span><span class="p">;</span> <span class="c1">// #337ab7
</span><span class="k">@brand-success</span><span class="nd">:</span> <span class="nn">#5cb85c</span><span class="p">;</span>
<span class="k">@brand-info</span><span class="nd">:</span>    <span class="nn">#5bc0de</span><span class="p">;</span>
<span class="k">@brand-warning</span><span class="nd">:</span> <span class="nn">#f0ad4e</span><span class="p">;</span>
<span class="k">@brand-danger</span><span class="nd">:</span>  <span class="nn">#d9534f</span><span class="p">;</span></code></pre></div>

                <p>색 변수들 중 어느 것이라도 당신의 프로젝트 안에서 더 의미있는 변수들에게 그대로 사용하거나 혹은 다시 할당할 수 있습니다.</p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="c1">// 그대로 사용
</span><span class="nc">.masthead</span> <span class="p">{</span>
  <span class="nl">background-color</span><span class="p">:</span> <span class="o">@</span><span class="n">brand-primary</span><span class="p">;</span>
<span class="p">}</span>

<span class="c1">// Less 에서 변수를 재할당
</span><span class="k">@alert-message-background</span><span class="nd">:</span> <span class="o">@</span><span class="nt">brand-info</span><span class="p">;</span>
<span class="nc">.alert</span> <span class="p">{</span>
  <span class="nl">background-color</span><span class="p">:</span> <span class="o">@</span><span class="n">alert-message-background</span><span class="p">;</span>
<span class="p">}</span></code></pre></div>

                <h3 id="less-variables-scaffolding">스캐폴딩<a class="anchorjs-link" href="#less-variables-scaffolding"><span class="anchorjs-icon"></span></a></h3>
                <p>당신의 사이트 뼈대의 주요 요소를 빠르게 맞춤화하기 위한 한줌의 변수들. <!-- TODO: A handful of variables for quickly customizing key elements of your site's skeleton.--></p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="c1">// 스캐폴딩
</span><span class="k">@body-bg</span><span class="nd">:</span>    <span class="nn">#fff</span><span class="p">;</span>
<span class="k">@text-color</span><span class="nd">:</span> <span class="o">@</span><span class="nt">black-50</span><span class="p">;</span></code></pre></div>

                <h3 id="less-variables-links">링크<a class="anchorjs-link" href="#less-variables-links"><span class="anchorjs-icon"></span></a></h3>
                <p>손쉽게 하나의 값으로 적절한 색을 당신의 링크에 스타일을 입히세요. <!-- TODO: Easily style your links with the right color with only one value. --></p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="c1">// 변수
</span><span class="k">@link-color</span><span class="nd">:</span>       <span class="o">@</span><span class="nt">brand-primary</span><span class="p">;</span>
<span class="k">@link-hover-color</span><span class="nd">:</span> <span class="nt">darken</span><span class="o">(@</span><span class="nt">link-color</span><span class="o">,</span> <span class="nt">15</span><span class="nv">%</span><span class="o">)</span><span class="p">;</span>

<span class="c1">// 사용법
</span><span class="nt">a</span> <span class="p">{</span>
  <span class="nl">color</span><span class="p">:</span> <span class="o">@</span><span class="n">link-color</span><span class="p">;</span>
  <span class="nl">text-decoration</span><span class="p">:</span> <span class="nb">none</span><span class="p">;</span>

  <span class="k">&amp;</span><span class="nd">:hover</span> <span class="p">{</span>
    <span class="nl">color</span><span class="p">:</span> <span class="o">@</span><span class="n">link-hover-color</span><span class="p">;</span>
    <span class="nl">text-decoration</span><span class="p">:</span> <span class="nb">underline</span><span class="p">;</span>
  <span class="p">}</span>
<span class="p">}</span></code></pre></div>
                <p><code>@link-hover-color</code> 은 Less 의 또다른 놀라운 도구인 함수를 사용하고 있음을 주목하세요. 그것은 마술처럼 편리하게 적절한 hover 색을 만듭니다. 당신은 <code>darken</code>, <code>lighten</code>, <code>saturate</code>, <code>desaturate</code> 을 사용할 수 있습니다.</p>

                <h3 id="less-variables-typography">타이포그래피<a class="anchorjs-link" href="#less-variables-typography"><span class="anchorjs-icon"></span></a></h3>
                <p>손쉽게 당신의 폰트모양, 사이즈, 제목 등을 약간의 변수들로 설정하세요. 부트스트랩은 이들을 사용할 뿐만 아니라 간편한 타이포그래피 믹스인들도 제공합니다. <!-- TODO: Bootstrap makes use of these as well to provide easy typographic mixins. --></p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="k">@font-family-sans-serif</span><span class="nd">:</span>  <span class="s2">"Helvetica Neue"</span><span class="o">,</span> <span class="nt">Helvetica</span><span class="o">,</span> <span class="nt">Arial</span><span class="o">,</span> <span class="nt">sans-serif</span><span class="p">;</span>
<span class="k">@font-family-serif</span><span class="nd">:</span>       <span class="nt">Georgia</span><span class="o">,</span> <span class="s2">"Times New Roman"</span><span class="o">,</span> <span class="nt">Times</span><span class="o">,</span> <span class="nt">serif</span><span class="p">;</span>
<span class="k">@font-family-monospace</span><span class="nd">:</span>   <span class="nt">Menlo</span><span class="o">,</span> <span class="nt">Monaco</span><span class="o">,</span> <span class="nt">Consolas</span><span class="o">,</span> <span class="s2">"Courier New"</span><span class="o">,</span> <span class="nt">monospace</span><span class="p">;</span>
<span class="k">@font-family-base</span><span class="nd">:</span>        <span class="o">@</span><span class="nt">font-family-sans-serif</span><span class="p">;</span>

<span class="k">@font-size-base</span><span class="nd">:</span>          <span class="nt">14px</span><span class="p">;</span>
<span class="k">@font-size-large</span><span class="nd">:</span>         <span class="nt">ceil</span><span class="o">((@</span><span class="nt">font-size-base</span> <span class="o">*</span> <span class="nt">1</span><span class="nc">.25</span><span class="o">))</span><span class="p">;</span> <span class="c1">// ~18px
</span><span class="k">@font-size-small</span><span class="nd">:</span>         <span class="nt">ceil</span><span class="o">((@</span><span class="nt">font-size-base</span> <span class="o">*</span> <span class="nt">0</span><span class="nc">.85</span><span class="o">))</span><span class="p">;</span> <span class="c1">// ~12px
</span>
<span class="k">@font-size-h1</span><span class="nd">:</span>            <span class="nt">floor</span><span class="o">((@</span><span class="nt">font-size-base</span> <span class="o">*</span> <span class="nt">2</span><span class="nc">.6</span><span class="o">))</span><span class="p">;</span> <span class="c1">// ~36px
</span><span class="k">@font-size-h2</span><span class="nd">:</span>            <span class="nt">floor</span><span class="o">((@</span><span class="nt">font-size-base</span> <span class="o">*</span> <span class="nt">2</span><span class="nc">.15</span><span class="o">))</span><span class="p">;</span> <span class="c1">// ~30px
</span><span class="k">@font-size-h3</span><span class="nd">:</span>            <span class="nt">ceil</span><span class="o">((@</span><span class="nt">font-size-base</span> <span class="o">*</span> <span class="nt">1</span><span class="nc">.7</span><span class="o">))</span><span class="p">;</span> <span class="c1">// ~24px
</span><span class="k">@font-size-h4</span><span class="nd">:</span>            <span class="nt">ceil</span><span class="o">((@</span><span class="nt">font-size-base</span> <span class="o">*</span> <span class="nt">1</span><span class="nc">.25</span><span class="o">))</span><span class="p">;</span> <span class="c1">// ~18px
</span><span class="k">@font-size-h5</span><span class="nd">:</span>            <span class="o">@</span><span class="nt">font-size-base</span><span class="p">;</span>
<span class="k">@font-size-h6</span><span class="nd">:</span>            <span class="nt">ceil</span><span class="o">((@</span><span class="nt">font-size-base</span> <span class="o">*</span> <span class="nt">0</span><span class="nc">.85</span><span class="o">))</span><span class="p">;</span> <span class="c1">// ~12px
</span>
<span class="k">@line-height-base</span><span class="nd">:</span>        <span class="nt">1</span><span class="nc">.428571429</span><span class="p">;</span> <span class="c1">// 20/14
</span><span class="k">@line-height-computed</span><span class="nd">:</span>    <span class="nt">floor</span><span class="o">((@</span><span class="nt">font-size-base</span> <span class="o">*</span> <span class="o">@</span><span class="nt">line-height-base</span><span class="o">))</span><span class="p">;</span> <span class="c1">// ~20px
</span>
<span class="k">@headings-font-family</span><span class="nd">:</span>    <span class="nt">inherit</span><span class="p">;</span>
<span class="k">@headings-font-weight</span><span class="nd">:</span>    <span class="nt">500</span><span class="p">;</span>
<span class="k">@headings-line-height</span><span class="nd">:</span>    <span class="nt">1</span><span class="nc">.1</span><span class="p">;</span>
<span class="k">@headings-color</span><span class="nd">:</span>          <span class="nt">inherit</span><span class="p">;</span></code></pre></div>

                <h3 id="less-variables-icons">아이콘<a class="anchorjs-link" href="#less-variables-icons"><span class="anchorjs-icon"></span></a></h3>
                <p>당신의 아이콘들의 위치와 파일명을 맞춤화하기 위한 두개의 간편한 변수들</p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="k">@icon-font-path</span><span class="nd">:</span>          <span class="s2">"../fonts/"</span><span class="p">;</span>
<span class="k">@icon-font-name</span><span class="nd">:</span>          <span class="s2">"glyphicons-halflings-regular"</span><span class="p">;</span></code></pre></div>

                <h3 id="less-variables-components">콤포넌트<a class="anchorjs-link" href="#less-variables-components"><span class="anchorjs-icon"></span></a></h3>
                <p>부트스트랩의 전반적인 콤포넌트는 보통을 기준으로 하는 약간의 기본값 변수들을 사용합니다. 아래의 변수들이 가장 보편적으로 쓰입니다.</p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="k">@padding-base-vertical</span><span class="nd">:</span>          <span class="nt">6px</span><span class="p">;</span>
<span class="k">@padding-base-horizontal</span><span class="nd">:</span>        <span class="nt">12px</span><span class="p">;</span>

<span class="k">@padding-large-vertical</span><span class="nd">:</span>         <span class="nt">10px</span><span class="p">;</span>
<span class="k">@padding-large-horizontal</span><span class="nd">:</span>       <span class="nt">16px</span><span class="p">;</span>

<span class="k">@padding-small-vertical</span><span class="nd">:</span>         <span class="nt">5px</span><span class="p">;</span>
<span class="k">@padding-small-horizontal</span><span class="nd">:</span>       <span class="nt">10px</span><span class="p">;</span>

<span class="k">@padding-xs-vertical</span><span class="nd">:</span>            <span class="nt">1px</span><span class="p">;</span>
<span class="k">@padding-xs-horizontal</span><span class="nd">:</span>          <span class="nt">5px</span><span class="p">;</span>

<span class="k">@line-height-large</span><span class="nd">:</span>              <span class="nt">1</span><span class="nc">.33</span><span class="p">;</span>
<span class="k">@line-height-small</span><span class="nd">:</span>              <span class="nt">1</span><span class="nc">.5</span><span class="p">;</span>

<span class="k">@border-radius-base</span><span class="nd">:</span>             <span class="nt">4px</span><span class="p">;</span>
<span class="k">@border-radius-large</span><span class="nd">:</span>            <span class="nt">6px</span><span class="p">;</span>
<span class="k">@border-radius-small</span><span class="nd">:</span>            <span class="nt">3px</span><span class="p">;</span>

<span class="k">@component-active-color</span><span class="nd">:</span>         <span class="nn">#fff</span><span class="p">;</span>
<span class="k">@component-active-bg</span><span class="nd">:</span>            <span class="o">@</span><span class="nt">brand-primary</span><span class="p">;</span>

<span class="k">@caret-width-base</span><span class="nd">:</span>               <span class="nt">4px</span><span class="p">;</span>
<span class="k">@caret-width-large</span><span class="nd">:</span>              <span class="nt">5px</span><span class="p">;</span></code></pre></div>


                <h2 id="less-mixins-vendor">벤더 믹스인<a class="anchorjs-link" href="#less-mixins-vendor"><span class="anchorjs-icon"></span></a></h2>
                <p>벤더 믹스인들은 컴파일된 CSS 에 관련있는 모든 벤더 접두사를 포함하여 다양한 브라우저 지원을 돕기위한 믹스인들이다.</p>


                <h3 id="less-mixins-box-sizing">박스 사이징<a class="anchorjs-link" href="#less-mixins-box-sizing"><span class="anchorjs-icon"></span></a></h3>
                <p>하나의 믹스인으로 당신의 콤포넌트의 박스 모델을 초기화하세요. 왜 그런지에 대하여, <a href="https://developer.mozilla.org/en-US/docs/CSS/box-sizing" target="_blank">도움이 될만한 모질라의 문서</a> 에서 확인할 수 있습니다.</p>
                <p>이 믹스인은 Autoprefixer 도입이 되면서 v3.2.0 부터는 <strong>deprecated</strong> 되었습니다. 하위 호환성을 지키기 위하여, 부트스트랩은 v4 이전까지는 내부적으로 믹스인을 사용할 것입니다.</p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="nc">.box-sizing</span><span class="o">(@</span><span class="nt">box-model</span><span class="o">)</span> <span class="p">{</span>
  <span class="na">-webkit-box-sizing</span><span class="p">:</span> <span class="o">@</span><span class="n">box-model</span><span class="p">;</span> <span class="c1">// 사파리 &lt;= 5
</span>     <span class="na">-moz-box-sizing</span><span class="p">:</span> <span class="o">@</span><span class="n">box-model</span><span class="p">;</span> <span class="c1">// 파이어폭스 &lt;= 19
</span>          <span class="nl">box-sizing</span><span class="p">:</span> <span class="o">@</span><span class="n">box-model</span><span class="p">;</span>
<span class="p">}</span></code></pre></div>

                <h3 id="less-mixins-rounded-corners">둥근 모서리<a class="anchorjs-link" href="#less-mixins-rounded-corners"><span class="anchorjs-icon"></span></a></h3>
                <p>오늘날 모든 현대 브라우저들은 접두사 없는 <code>border-radius</code> 속성을 지원합니다. 그런 까닭에, <code>.border-radius()</code> 믹스인은 없습니다만, 부트스트랩은 객체의 특정한 면의 두 모서리를 간편히 둥글게 하는 믹스인을 포함합니다.</p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="nc">.border-top-radius</span><span class="o">(@</span><span class="nt">radius</span><span class="o">)</span> <span class="p">{</span>
  <span class="nl">border-top-right-radius</span><span class="p">:</span> <span class="o">@</span><span class="n">radius</span><span class="p">;</span>
   <span class="nl">border-top-left-radius</span><span class="p">:</span> <span class="o">@</span><span class="n">radius</span><span class="p">;</span>
<span class="p">}</span>
<span class="nc">.border-right-radius</span><span class="o">(@</span><span class="nt">radius</span><span class="o">)</span> <span class="p">{</span>
  <span class="nl">border-bottom-right-radius</span><span class="p">:</span> <span class="o">@</span><span class="n">radius</span><span class="p">;</span>
     <span class="nl">border-top-right-radius</span><span class="p">:</span> <span class="o">@</span><span class="n">radius</span><span class="p">;</span>
<span class="p">}</span>
<span class="nc">.border-bottom-radius</span><span class="o">(@</span><span class="nt">radius</span><span class="o">)</span> <span class="p">{</span>
  <span class="nl">border-bottom-right-radius</span><span class="p">:</span> <span class="o">@</span><span class="n">radius</span><span class="p">;</span>
   <span class="nl">border-bottom-left-radius</span><span class="p">:</span> <span class="o">@</span><span class="n">radius</span><span class="p">;</span>
<span class="p">}</span>
<span class="nc">.border-left-radius</span><span class="o">(@</span><span class="nt">radius</span><span class="o">)</span> <span class="p">{</span>
  <span class="nl">border-bottom-left-radius</span><span class="p">:</span> <span class="o">@</span><span class="n">radius</span><span class="p">;</span>
     <span class="nl">border-top-left-radius</span><span class="p">:</span> <span class="o">@</span><span class="n">radius</span><span class="p">;</span>
<span class="p">}</span></code></pre></div>

                <h3 id="less-mixins-box-shadow">박스 (드롭) 그림자<a class="anchorjs-link" href="#less-mixins-box-shadow"><span class="anchorjs-icon"></span></a></h3>
                <p>만약 당신의 방문자들이 최신 브라우저나 기기들만 사용한다면, 그냥 <code>box-shadow</code> 속성만 사용하면 됩니다. 만약 당신이 예전 안드로이드(v4 이전)와 iOS 기기(iOS5 이전) 를 지원하는 것이 필요하다면, 접두사 <code>-webkit</code> 을 붙이기 위해 <strong>deprecated</strong> 된 믹스인을 사용하세요. <!-- TODO: If your target audience is using the latest and greatest browsers and devices, be sure to just use the <code>box-shadow</code> property on its own. If you need support for older Android (pre-v4) and iOS devices (pre-iOS 5), use the <strong>deprecated</strong> mixin to pick up the required <code>-webkit</code> prefix.--></p>
                <p>이 믹스인은 부트스트랩이 표준 속성을 지원하지 않는 지나간 플랫폼을 지원하지 않기로 한, v3.1.0 부터는 <strong>deprecated</strong> 되었습니다. 하위 호환성을 지키기 위하여, 부트스트랩은 v4 이전까지는 내부적으로 믹스인을 사용할 것입니다.</p>
                <p>반드시 <code>rgba()</code> 색을 사용하세요. 그러면 배경과 최대한 매끄럽게 표현됩니다.</p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="err">.</span><span class="nl">box-shadow</span><span class="err">(@</span><span class="na">shadow</span><span class="p">:</span> <span class="m">0</span> <span class="m">1px</span> <span class="m">3px</span> <span class="nf">rgba</span><span class="p">(</span><span class="m">0</span><span class="o">,</span><span class="m">0</span><span class="o">,</span><span class="m">0</span><span class="o">,.</span><span class="m">25</span><span class="p">))</span> <span class="p">{</span>
  <span class="na">-webkit-box-shadow</span><span class="p">:</span> <span class="o">@</span><span class="n">shadow</span><span class="p">;</span> <span class="c1">// iOS &lt;4.3 &amp; Android &lt;4.1
</span>          <span class="nl">box-shadow</span><span class="p">:</span> <span class="o">@</span><span class="n">shadow</span><span class="p">;</span>
<span class="p">}</span></code></pre></div>

                <h3 id="less-mixins-transitions">전환<a class="anchorjs-link" href="#less-mixins-transitions"><span class="anchorjs-icon"></span></a></h3>
                <p>유연성을 위한 다양한 믹스인들. <!-- TODO: Multiple mixins for flexibility. --> 하나에 모든 전환 정보를 설정하거나, 필요한만큼 딜레이나 지속시간을 명시하세요. <!-- TODO: Set all transition information with one, or specify a separate delay and duration as needed.--></p>
                <p>이 믹스인은 Autoprefixer 도입이 되면서 v3.2.0 부터는 <strong>deprecated</strong> 되었습니다. 하위 호환성을 지키기 위하여, 부트스트랩은 v4 이전까지는 내부적으로 믹스인을 사용할 것입니다.</p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="nc">.transition</span><span class="o">(@</span><span class="nt">transition</span><span class="o">)</span> <span class="p">{</span>
  <span class="na">-webkit-transition</span><span class="p">:</span> <span class="o">@</span><span class="n">transition</span><span class="p">;</span>
          <span class="nl">transition</span><span class="p">:</span> <span class="o">@</span><span class="n">transition</span><span class="p">;</span>
<span class="p">}</span>
<span class="nc">.transition-property</span><span class="o">(@</span><span class="nt">transition-property</span><span class="o">)</span> <span class="p">{</span>
  <span class="na">-webkit-transition-property</span><span class="p">:</span> <span class="o">@</span><span class="n">transition-property</span><span class="p">;</span>
          <span class="nl">transition-property</span><span class="p">:</span> <span class="o">@</span><span class="n">transition-property</span><span class="p">;</span>
<span class="p">}</span>
<span class="nc">.transition-delay</span><span class="o">(@</span><span class="nt">transition-delay</span><span class="o">)</span> <span class="p">{</span>
  <span class="na">-webkit-transition-delay</span><span class="p">:</span> <span class="o">@</span><span class="n">transition-delay</span><span class="p">;</span>
          <span class="nl">transition-delay</span><span class="p">:</span> <span class="o">@</span><span class="n">transition-delay</span><span class="p">;</span>
<span class="p">}</span>
<span class="nc">.transition-duration</span><span class="o">(@</span><span class="nt">transition-duration</span><span class="o">)</span> <span class="p">{</span>
  <span class="na">-webkit-transition-duration</span><span class="p">:</span> <span class="o">@</span><span class="n">transition-duration</span><span class="p">;</span>
          <span class="nl">transition-duration</span><span class="p">:</span> <span class="o">@</span><span class="n">transition-duration</span><span class="p">;</span>
<span class="p">}</span>
<span class="nc">.transition-timing-function</span><span class="o">(@</span><span class="nt">timing-function</span><span class="o">)</span> <span class="p">{</span>
  <span class="na">-webkit-transition-timing-function</span><span class="p">:</span> <span class="o">@</span><span class="n">timing-function</span><span class="p">;</span>
          <span class="nl">transition-timing-function</span><span class="p">:</span> <span class="o">@</span><span class="n">timing-function</span><span class="p">;</span>
<span class="p">}</span>
<span class="nc">.transition-transform</span><span class="o">(@</span><span class="nt">transition</span><span class="o">)</span> <span class="p">{</span>
  <span class="na">-webkit-transition</span><span class="p">:</span> <span class="o">-</span><span class="n">webkit-transform</span> <span class="o">@</span><span class="n">transition</span><span class="p">;</span>
     <span class="na">-moz-transition</span><span class="p">:</span> <span class="o">-</span><span class="n">moz-transform</span> <span class="o">@</span><span class="n">transition</span><span class="p">;</span>
       <span class="na">-o-transition</span><span class="p">:</span> <span class="o">-</span><span class="n">o-transform</span> <span class="o">@</span><span class="n">transition</span><span class="p">;</span>
          <span class="nl">transition</span><span class="p">:</span> <span class="n">transform</span> <span class="o">@</span><span class="n">transition</span><span class="p">;</span>
<span class="p">}</span></code></pre></div>

                <h3 id="less-mixins-transformations">변형<a class="anchorjs-link" href="#less-mixins-transformations"><span class="anchorjs-icon"></span></a></h3>
                <p>객체를 회전, 크기, 이동, 왜곡하세요.</p>
                <p>이 믹스인은 Autoprefixer 도입이 되면서 v3.2.0 부터는 <strong>deprecated</strong> 되었습니다. 하위 호환성을 지키기 위하여, 부트스트랩은 v4 이전까지는 내부적으로 믹스인을 사용할 것입니다.</p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="nc">.rotate</span><span class="o">(@</span><span class="nt">degrees</span><span class="o">)</span> <span class="p">{</span>
  <span class="na">-webkit-transform</span><span class="p">:</span> <span class="nf">rotate</span><span class="p">(</span><span class="o">@</span><span class="n">degrees</span><span class="p">);</span>
      <span class="na">-ms-transform</span><span class="p">:</span> <span class="nf">rotate</span><span class="p">(</span><span class="o">@</span><span class="n">degrees</span><span class="p">);</span> <span class="c1">// IE9 만
</span>          <span class="nl">transform</span><span class="p">:</span> <span class="nf">rotate</span><span class="p">(</span><span class="o">@</span><span class="n">degrees</span><span class="p">);</span>
<span class="p">}</span>
<span class="nc">.scale</span><span class="o">(@</span><span class="nt">ratio</span><span class="p">;</span> <span class="k">@ratio-y</span><span class="nc">...</span><span class="o">)</span> <span class="p">{</span>
  <span class="na">-webkit-transform</span><span class="p">:</span> <span class="nf">scale</span><span class="p">(</span><span class="o">@</span><span class="n">ratio</span><span class="o">,</span> <span class="o">@</span><span class="n">ratio-y</span><span class="p">);</span>
      <span class="na">-ms-transform</span><span class="p">:</span> <span class="nf">scale</span><span class="p">(</span><span class="o">@</span><span class="n">ratio</span><span class="o">,</span> <span class="o">@</span><span class="n">ratio-y</span><span class="p">);</span> <span class="c1">// IE9 만
</span>          <span class="nl">transform</span><span class="p">:</span> <span class="nf">scale</span><span class="p">(</span><span class="o">@</span><span class="n">ratio</span><span class="o">,</span> <span class="o">@</span><span class="n">ratio-y</span><span class="p">);</span>
<span class="p">}</span>
<span class="nc">.translate</span><span class="o">(@</span><span class="nt">x</span><span class="p">;</span> <span class="k">@y</span><span class="o">)</span> <span class="p">{</span>
  <span class="na">-webkit-transform</span><span class="p">:</span> <span class="nf">translate</span><span class="p">(</span><span class="o">@</span><span class="n">x</span><span class="o">,</span> <span class="o">@</span><span class="n">y</span><span class="p">);</span>
      <span class="na">-ms-transform</span><span class="p">:</span> <span class="nf">translate</span><span class="p">(</span><span class="o">@</span><span class="n">x</span><span class="o">,</span> <span class="o">@</span><span class="n">y</span><span class="p">);</span> <span class="c1">// IE9 만
</span>          <span class="nl">transform</span><span class="p">:</span> <span class="nf">translate</span><span class="p">(</span><span class="o">@</span><span class="n">x</span><span class="o">,</span> <span class="o">@</span><span class="n">y</span><span class="p">);</span>
<span class="p">}</span>
<span class="nc">.skew</span><span class="o">(@</span><span class="nt">x</span><span class="p">;</span> <span class="k">@y</span><span class="o">)</span> <span class="p">{</span>
  <span class="na">-webkit-transform</span><span class="p">:</span> <span class="nf">skew</span><span class="p">(</span><span class="o">@</span><span class="n">x</span><span class="o">,</span> <span class="o">@</span><span class="n">y</span><span class="p">);</span>
      <span class="na">-ms-transform</span><span class="p">:</span> <span class="nf">skewX</span><span class="p">(</span><span class="o">@</span><span class="n">x</span><span class="p">)</span> <span class="nf">skewY</span><span class="p">(</span><span class="o">@</span><span class="n">y</span><span class="p">);</span> <span class="c1">// https://github.com/twbs/bootstrap/issues/4885 을 보세요; IE9+
</span>          <span class="nl">transform</span><span class="p">:</span> <span class="nf">skew</span><span class="p">(</span><span class="o">@</span><span class="n">x</span><span class="o">,</span> <span class="o">@</span><span class="n">y</span><span class="p">);</span>
<span class="p">}</span>
<span class="nc">.translate3d</span><span class="o">(@</span><span class="nt">x</span><span class="p">;</span> <span class="k">@y</span><span class="p">;</span> <span class="k">@z</span><span class="o">)</span> <span class="p">{</span>
  <span class="na">-webkit-transform</span><span class="p">:</span> <span class="nf">translate3d</span><span class="p">(</span><span class="o">@</span><span class="n">x</span><span class="o">,</span> <span class="o">@</span><span class="n">y</span><span class="o">,</span> <span class="o">@</span><span class="n">z</span><span class="p">);</span>
          <span class="nl">transform</span><span class="p">:</span> <span class="nf">translate3d</span><span class="p">(</span><span class="o">@</span><span class="n">x</span><span class="o">,</span> <span class="o">@</span><span class="n">y</span><span class="o">,</span> <span class="o">@</span><span class="n">z</span><span class="p">);</span>
<span class="p">}</span>

<span class="nc">.rotateX</span><span class="o">(@</span><span class="nt">degrees</span><span class="o">)</span> <span class="p">{</span>
  <span class="na">-webkit-transform</span><span class="p">:</span> <span class="nf">rotateX</span><span class="p">(</span><span class="o">@</span><span class="n">degrees</span><span class="p">);</span>
      <span class="na">-ms-transform</span><span class="p">:</span> <span class="nf">rotateX</span><span class="p">(</span><span class="o">@</span><span class="n">degrees</span><span class="p">);</span> <span class="c1">// IE9 만
</span>          <span class="nl">transform</span><span class="p">:</span> <span class="nf">rotateX</span><span class="p">(</span><span class="o">@</span><span class="n">degrees</span><span class="p">);</span>
<span class="p">}</span>
<span class="nc">.rotateY</span><span class="o">(@</span><span class="nt">degrees</span><span class="o">)</span> <span class="p">{</span>
  <span class="na">-webkit-transform</span><span class="p">:</span> <span class="nf">rotateY</span><span class="p">(</span><span class="o">@</span><span class="n">degrees</span><span class="p">);</span>
      <span class="na">-ms-transform</span><span class="p">:</span> <span class="nf">rotateY</span><span class="p">(</span><span class="o">@</span><span class="n">degrees</span><span class="p">);</span> <span class="c1">// IE9 만
</span>          <span class="nl">transform</span><span class="p">:</span> <span class="nf">rotateY</span><span class="p">(</span><span class="o">@</span><span class="n">degrees</span><span class="p">);</span>
<span class="p">}</span>
<span class="nc">.perspective</span><span class="o">(@</span><span class="nt">perspective</span><span class="o">)</span> <span class="p">{</span>
  <span class="na">-webkit-perspective</span><span class="p">:</span> <span class="o">@</span><span class="n">perspective</span><span class="p">;</span>
     <span class="na">-moz-perspective</span><span class="p">:</span> <span class="o">@</span><span class="n">perspective</span><span class="p">;</span>
          <span class="nl">perspective</span><span class="p">:</span> <span class="o">@</span><span class="n">perspective</span><span class="p">;</span>
<span class="p">}</span>
<span class="nc">.perspective-origin</span><span class="o">(@</span><span class="nt">perspective</span><span class="o">)</span> <span class="p">{</span>
  <span class="na">-webkit-perspective-origin</span><span class="p">:</span> <span class="o">@</span><span class="n">perspective</span><span class="p">;</span>
     <span class="na">-moz-perspective-origin</span><span class="p">:</span> <span class="o">@</span><span class="n">perspective</span><span class="p">;</span>
          <span class="nl">perspective-origin</span><span class="p">:</span> <span class="o">@</span><span class="n">perspective</span><span class="p">;</span>
<span class="p">}</span>
<span class="nc">.transform-origin</span><span class="o">(@</span><span class="nt">origin</span><span class="o">)</span> <span class="p">{</span>
  <span class="na">-webkit-transform-origin</span><span class="p">:</span> <span class="o">@</span><span class="n">origin</span><span class="p">;</span>
     <span class="na">-moz-transform-origin</span><span class="p">:</span> <span class="o">@</span><span class="n">origin</span><span class="p">;</span>
      <span class="na">-ms-transform-origin</span><span class="p">:</span> <span class="o">@</span><span class="n">origin</span><span class="p">;</span> <span class="c1">// IE9 만
</span>          <span class="nl">transform-origin</span><span class="p">:</span> <span class="o">@</span><span class="n">origin</span><span class="p">;</span>
<span class="p">}</span></code></pre></div>

                <h3 id="less-mixins-animations">애니메이션<a class="anchorjs-link" href="#less-mixins-animations"><span class="anchorjs-icon"></span></a></h3>
                <p>한번의 정의로 CSS3 애니메이션 속성들을 사용하기 위한 단일 믹스인. <!-- TODO: A single mixin for using all of CSS3's animation properties in one declaration and other mixins for individual properties.--></p>
                <p>이 믹스인은 Autoprefixer 도입이 되면서 v3.2.0 부터는 <strong>deprecated</strong> 되었습니다. 하위 호환성을 지키기 위하여, 부트스트랩은 v4 이전까지는 내부적으로 믹스인을 사용할 것입니다.</p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="nc">.animation</span><span class="o">(@</span><span class="nt">animation</span><span class="o">)</span> <span class="p">{</span>
  <span class="na">-webkit-animation</span><span class="p">:</span> <span class="o">@</span><span class="n">animation</span><span class="p">;</span>
          <span class="nl">animation</span><span class="p">:</span> <span class="o">@</span><span class="n">animation</span><span class="p">;</span>
<span class="p">}</span>
<span class="nc">.animation-name</span><span class="o">(@</span><span class="nt">name</span><span class="o">)</span> <span class="p">{</span>
  <span class="na">-webkit-animation-name</span><span class="p">:</span> <span class="o">@</span><span class="n">name</span><span class="p">;</span>
          <span class="nl">animation-name</span><span class="p">:</span> <span class="o">@</span><span class="n">name</span><span class="p">;</span>
<span class="p">}</span>
<span class="nc">.animation-duration</span><span class="o">(@</span><span class="nt">duration</span><span class="o">)</span> <span class="p">{</span>
  <span class="na">-webkit-animation-duration</span><span class="p">:</span> <span class="o">@</span><span class="n">duration</span><span class="p">;</span>
          <span class="nl">animation-duration</span><span class="p">:</span> <span class="o">@</span><span class="n">duration</span><span class="p">;</span>
<span class="p">}</span>
<span class="nc">.animation-timing-function</span><span class="o">(@</span><span class="nt">timing-function</span><span class="o">)</span> <span class="p">{</span>
  <span class="na">-webkit-animation-timing-function</span><span class="p">:</span> <span class="o">@</span><span class="n">timing-function</span><span class="p">;</span>
          <span class="nl">animation-timing-function</span><span class="p">:</span> <span class="o">@</span><span class="n">timing-function</span><span class="p">;</span>
<span class="p">}</span>
<span class="nc">.animation-delay</span><span class="o">(@</span><span class="nt">delay</span><span class="o">)</span> <span class="p">{</span>
  <span class="na">-webkit-animation-delay</span><span class="p">:</span> <span class="o">@</span><span class="n">delay</span><span class="p">;</span>
          <span class="nl">animation-delay</span><span class="p">:</span> <span class="o">@</span><span class="n">delay</span><span class="p">;</span>
<span class="p">}</span>
<span class="nc">.animation-iteration-count</span><span class="o">(@</span><span class="nt">iteration-count</span><span class="o">)</span> <span class="p">{</span>
  <span class="na">-webkit-animation-iteration-count</span><span class="p">:</span> <span class="o">@</span><span class="n">iteration-count</span><span class="p">;</span>
          <span class="nl">animation-iteration-count</span><span class="p">:</span> <span class="o">@</span><span class="n">iteration-count</span><span class="p">;</span>
<span class="p">}</span>
<span class="nc">.animation-direction</span><span class="o">(@</span><span class="nt">direction</span><span class="o">)</span> <span class="p">{</span>
  <span class="na">-webkit-animation-direction</span><span class="p">:</span> <span class="o">@</span><span class="n">direction</span><span class="p">;</span>
          <span class="nl">animation-direction</span><span class="p">:</span> <span class="o">@</span><span class="n">direction</span><span class="p">;</span>
<span class="p">}</span></code></pre></div>

                <h3 id="less-mixins-opacity">불투명도<a class="anchorjs-link" href="#less-mixins-opacity"><span class="anchorjs-icon"></span></a></h3>
                <p>모든 브라우저를 위해 불투명도를 설정하고 IE8 을 위해 대안 <code>filter</code> 를 제공합니다.</p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="nc">.opacity</span><span class="o">(@</span><span class="nt">opacity</span><span class="o">)</span> <span class="p">{</span>
  <span class="nl">opacity</span><span class="p">:</span> <span class="o">@</span><span class="n">opacity</span><span class="p">;</span>
  <span class="c1">// IE8 filter
</span>  <span class="k">@opacity-ie</span><span class="nd">:</span> <span class="o">(@</span><span class="nt">opacity</span> <span class="o">*</span> <span class="nt">100</span><span class="o">)</span><span class="p">;</span>
  <span class="nl">filter</span><span class="p">:</span> <span class="o">~</span><span class="s2">"alpha(opacity=@{opacity-ie})"</span><span class="p">;</span>
<span class="p">}</span></code></pre></div>

                <h3 id="less-mixins-placeholder">플레이스홀더 텍스트<a class="anchorjs-link" href="#less-mixins-placeholder"><span class="anchorjs-icon"></span></a></h3>
                <p>각 필드내 폼콘트롤에 의미를 제공합니다. <!-- TODO: Provide context for form controls within each field. --></p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="err">.</span><span class="na">placeholder</span><span class="err">(@</span><span class="nl">color</span><span class="p">:</span> <span class="o">@</span><span class="n">input-color-placeholder</span><span class="p">)</span> <span class="p">{</span>
  <span class="err">&amp;</span><span class="p">:</span><span class="o">:-</span><span class="n">moz-placeholder</span>           <span class="p">{</span> <span class="nl">color</span><span class="p">:</span> <span class="o">@</span><span class="n">color</span><span class="p">;</span> <span class="p">}</span> <span class="c1">// Firefox
</span>  <span class="err">&amp;</span><span class="p">:</span><span class="o">-</span><span class="n">ms-input-placeholder</span>       <span class="p">{</span> <span class="nl">color</span><span class="p">:</span> <span class="o">@</span><span class="n">color</span><span class="p">;</span> <span class="p">}</span> <span class="c1">// Internet Explorer 10+
</span>  <span class="err">&amp;</span><span class="p">:</span><span class="o">:-</span><span class="n">webkit-input-placeholder</span>  <span class="p">{</span> <span class="nl">color</span><span class="p">:</span> <span class="o">@</span><span class="n">color</span><span class="p">;</span> <span class="p">}</span> <span class="c1">// Safari and Chrome
</span><span class="p">}</span></code></pre></div>

                <h3 id="less-mixins-columns">단<a class="anchorjs-link" href="#less-mixins-columns"><span class="anchorjs-icon"></span></a></h3>
                <p>하나의 요소에 CSS 로 단을 생성합니다.</p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="nc">.content-columns</span><span class="o">(@</span><span class="nt">width</span><span class="p">;</span> <span class="k">@count</span><span class="p">;</span> <span class="k">@gap</span><span class="o">)</span> <span class="p">{</span>
  <span class="na">-webkit-column-width</span><span class="p">:</span> <span class="o">@</span><span class="n">width</span><span class="p">;</span>
     <span class="na">-moz-column-width</span><span class="p">:</span> <span class="o">@</span><span class="n">width</span><span class="p">;</span>
          <span class="nl">column-width</span><span class="p">:</span> <span class="o">@</span><span class="n">width</span><span class="p">;</span>
  <span class="na">-webkit-column-count</span><span class="p">:</span> <span class="o">@</span><span class="n">count</span><span class="p">;</span>
     <span class="na">-moz-column-count</span><span class="p">:</span> <span class="o">@</span><span class="n">count</span><span class="p">;</span>
          <span class="nl">column-count</span><span class="p">:</span> <span class="o">@</span><span class="n">count</span><span class="p">;</span>
  <span class="na">-webkit-column-gap</span><span class="p">:</span> <span class="o">@</span><span class="n">gap</span><span class="p">;</span>
     <span class="na">-moz-column-gap</span><span class="p">:</span> <span class="o">@</span><span class="n">gap</span><span class="p">;</span>
          <span class="nl">column-gap</span><span class="p">:</span> <span class="o">@</span><span class="n">gap</span><span class="p">;</span>
<span class="p">}</span></code></pre></div>

                <h3 id="less-mixins-gradients">그라디언트<a class="anchorjs-link" href="#less-mixins-gradients"><span class="anchorjs-icon"></span></a></h3>
                <p>손쉽게 2개의 색을 배경 그라디언트로 바꿔줍니다. 나아가서 방향을 설정하거나, 3가지 색을 사용하거나, 방사성의 그라디언트를 사용하세요. 하나의 믹스인으로 당신이 필요로 할 모든 접두사 구문을 얻을 수 있습니다. <!-- TODO: With a single mixin you get all the prefixed syntaxes you'll need.--></p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="nn">#gradient</span> <span class="o">&gt;</span> <span class="nc">.vertical</span><span class="o">(</span><span class="nn">#333</span><span class="p">;</span> <span class="nn">#000</span><span class="o">)</span><span class="p">;</span>
<span class="nn">#gradient</span> <span class="o">&gt;</span> <span class="nc">.horizontal</span><span class="o">(</span><span class="nn">#333</span><span class="p">;</span> <span class="nn">#000</span><span class="o">)</span><span class="p">;</span>
<span class="nn">#gradient</span> <span class="o">&gt;</span> <span class="nc">.radial</span><span class="o">(</span><span class="nn">#333</span><span class="p">;</span> <span class="nn">#000</span><span class="o">)</span><span class="p">;</span></code></pre></div>
                <p>당신은 또한 선형 그라디언트 2개의 색의 각도을 명시할 수 있습니다:</p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="nn">#gradient</span> <span class="o">&gt;</span> <span class="nc">.directional</span><span class="o">(</span><span class="nn">#333</span><span class="p">;</span> <span class="nn">#000</span><span class="p">;</span> <span class="nt">45deg</span><span class="o">)</span><span class="p">;</span></code></pre></div>
                <p>만약 당신이 미용실-줄무늬 스타일 그라디언트가 필요하다면, 쉽습니다. 그저 한가지 색을 명시하면 우리는 반투명한 흰 줄무니를 덮어씌울 것입니다.</p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="nn">#gradient</span> <span class="o">&gt;</span> <span class="nc">.striped</span><span class="o">(</span><span class="nn">#333</span><span class="p">;</span> <span class="nt">45deg</span><span class="o">)</span><span class="p">;</span></code></pre></div>
                <p>나가가서 3가지 색을 사용하세요. 아래의 믹스인들로 첫번째, 두번째 색, 두번째 색이 멈추는 곳 (25% 같이 비율로 기입), 세번째 색을 설정합니다:</p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="nn">#gradient</span> <span class="o">&gt;</span> <span class="nc">.vertical-three-colors</span><span class="o">(</span><span class="nn">#777</span><span class="p">;</span> <span class="nn">#333</span><span class="p">;</span> <span class="nt">25</span><span class="nv">%</span><span class="p">;</span> <span class="nn">#000</span><span class="o">)</span><span class="p">;</span>
<span class="nn">#gradient</span> <span class="o">&gt;</span> <span class="nc">.horizontal-three-colors</span><span class="o">(</span><span class="nn">#777</span><span class="p">;</span> <span class="nn">#333</span><span class="p">;</span> <span class="nt">25</span><span class="nv">%</span><span class="p">;</span> <span class="nn">#000</span><span class="o">)</span><span class="p">;</span></code></pre></div>
                <p><strong>주의!</strong> Should you ever need to remove a gradient, be sure to remove any IE-specific <code>filter</code> you may have added. You can do that by using the <code>.reset-filter()</code> mixin alongside <code>background-image: none;</code>.</p>


                <h2 id="less-mixins-utility">유틸리티 믹스인<a class="anchorjs-link" href="#less-mixins-utility"><span class="anchorjs-icon"></span></a></h2>
                <p>유틸리티 믹스인은 목표나 과제를 이루기 위해 관계없는 CSS 속성을 합쳐놓은 믹스인입니다. <!-- TODO: Utility mixins are mixins that combine otherwise unrelated CSS properties to achieve a specific goal or task. --></p>

                <h3 id="less-mixins-clearfix">Clearfix<a class="anchorjs-link" href="#less-mixins-clearfix"><span class="anchorjs-icon"></span></a></h3>
                <p>어느 요소에 <code>class="clearfix"</code> 를 추가하는 대신 적절한 곳에 <code>.clearfix()</code> 믹스인을 추가하세요. <a href="https://twitter.com/necolas" target="_blank">Nicolas Gallagher</a> 의 <a href="http://nicolasgallagher.com/micro-clearfix-hack/" target="_blank">micro clearfix</a> 를 사용합니다.</p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="c1">// Mixin
</span><span class="nc">.clearfix</span><span class="o">()</span> <span class="p">{</span>
  <span class="k">&amp;</span><span class="nd">:before</span><span class="o">,</span>
  <span class="k">&amp;</span><span class="nd">:after</span> <span class="p">{</span>
    <span class="nl">content</span><span class="p">:</span> <span class="s2">" "</span><span class="p">;</span>
    <span class="nl">display</span><span class="p">:</span> <span class="n">table</span><span class="p">;</span>
  <span class="p">}</span>
  <span class="k">&amp;</span><span class="nd">:after</span> <span class="p">{</span>
    <span class="nl">clear</span><span class="p">:</span> <span class="nb">both</span><span class="p">;</span>
  <span class="p">}</span>
<span class="p">}</span>

<span class="c1">// Usage
</span><span class="nc">.container</span> <span class="p">{</span>
  <span class="nc">.clearfix</span><span class="o">()</span><span class="p">;</span>
<span class="p">}</span></code></pre></div>

                <h3 id="less-mixins-centering">수평 중앙 배치<a class="anchorjs-link" href="#less-mixins-centering"><span class="anchorjs-icon"></span></a></h3>
                <p>어떤 요소를 간단하게 부모의 중앙에 위치하게 합니다. <strong><code>width</code> 나 <code>max-width</code> 의 값설정이 필요합니다.</strong></p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="c1">// Mixin
</span><span class="nc">.center-block</span><span class="o">()</span> <span class="p">{</span>
  <span class="nl">display</span><span class="p">:</span> <span class="nb">block</span><span class="p">;</span>
  <span class="nl">margin-left</span><span class="p">:</span> <span class="nb">auto</span><span class="p">;</span>
  <span class="nl">margin-right</span><span class="p">:</span> <span class="nb">auto</span><span class="p">;</span>
<span class="p">}</span>

<span class="c1">// Usage
</span><span class="nc">.container</span> <span class="p">{</span>
  <span class="nl">width</span><span class="p">:</span> <span class="m">940px</span><span class="p">;</span>
  <span class="nc">.center-block</span><span class="o">()</span><span class="p">;</span>
<span class="p">}</span></code></pre></div>

                <h3 id="less-mixins-sizing">크기조절 헬퍼<a class="anchorjs-link" href="#less-mixins-sizing"><span class="anchorjs-icon"></span></a></h3>
                <p>객체의 크기를 좀더 쉽게 명시합니다.</p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="c1">// Mixins
</span><span class="nc">.size</span><span class="o">(@</span><span class="nt">width</span><span class="p">;</span> <span class="k">@height</span><span class="o">)</span> <span class="p">{</span>
  <span class="nl">width</span><span class="p">:</span> <span class="o">@</span><span class="n">width</span><span class="p">;</span>
  <span class="nl">height</span><span class="p">:</span> <span class="o">@</span><span class="n">height</span><span class="p">;</span>
<span class="p">}</span>
<span class="nc">.square</span><span class="o">(@</span><span class="nt">size</span><span class="o">)</span> <span class="p">{</span>
  <span class="nc">.size</span><span class="o">(@</span><span class="nt">size</span><span class="p">;</span> <span class="k">@size</span><span class="o">)</span><span class="p">;</span>
<span class="p">}</span>

<span class="c1">// Usage
</span><span class="nc">.image</span> <span class="p">{</span> <span class="nc">.size</span><span class="o">(</span><span class="nt">400px</span><span class="p">;</span> <span class="nt">300px</span><span class="o">)</span><span class="p">;</span> <span class="p">}</span>
<span class="nc">.avatar</span> <span class="p">{</span> <span class="nc">.square</span><span class="o">(</span><span class="nt">48px</span><span class="o">)</span><span class="p">;</span> <span class="p">}</span></code></pre></div>

                <h3 id="less-mixins-resizable">크기조절할수 있는 텍스트영역<a class="anchorjs-link" href="#less-mixins-resizable"><span class="anchorjs-icon"></span></a></h3>
                <p>어떤 텍스트영역이나 다른 요소에 크기조절 옵션을 손쉽게 환경설정 하세요. 기본적으로 보통의 브라우저 양식에 따릅니다.  (<code>both</code>).</p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="err">.</span><span class="na">resizable</span><span class="err">(@</span><span class="nl">direction</span><span class="p">:</span> <span class="nb">both</span><span class="p">)</span> <span class="p">{</span>
  <span class="c1">// Options: horizontal, vertical, both
</span>  <span class="nl">resize</span><span class="p">:</span> <span class="o">@</span><span class="n">direction</span><span class="p">;</span>
  <span class="c1">// Safari fix
</span>  <span class="nl">overflow</span><span class="p">:</span> <span class="nb">auto</span><span class="p">;</span>
<span class="p">}</span></code></pre></div>

                <h3 id="less-mixins-truncating">텍스트 줄임<a class="anchorjs-link" href="#less-mixins-truncating"><span class="anchorjs-icon"></span></a></h3>
                <p>ellipsis 와 믹스인 하나로 손쉽게 텍스트를 줄이세요. <strong><code>block</code> 이나 <code>inline-block</code> 레벨의 요소가 필요합니다.</strong></p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="c1">// Mixin
</span><span class="nc">.text-overflow</span><span class="o">()</span> <span class="p">{</span>
  <span class="nl">overflow</span><span class="p">:</span> <span class="nb">hidden</span><span class="p">;</span>
  <span class="nl">text-overflow</span><span class="p">:</span> <span class="n">ellipsis</span><span class="p">;</span>
  <span class="nl">white-space</span><span class="p">:</span> <span class="nb">nowrap</span><span class="p">;</span>
<span class="p">}</span>

<span class="c1">// Usage
</span><span class="nc">.branch-name</span> <span class="p">{</span>
  <span class="nl">display</span><span class="p">:</span> <span class="n">inline-block</span><span class="p">;</span>
  <span class="nl">max-width</span><span class="p">:</span> <span class="m">200px</span><span class="p">;</span>
  <span class="nc">.text-overflow</span><span class="o">()</span><span class="p">;</span>
<span class="p">}</span></code></pre></div>

                <h3 id="less-mixins-retina-images">레티나 이미지<a class="anchorjs-link" href="#less-mixins-retina-images"><span class="anchorjs-icon"></span></a></h3>
                <p>2개의 이미지 경로와 @1x 이미지 크기를 명시하세요, 그러면 부트스트랩은 @2x 미디어쿼리를 제공할 것입니다. <strong>만약 당신이 지원할 많은 이미지를 가지고 있다면, 하나의 미디어 쿼리로 수동적으로 레티나 이미지 CSS 를 작성하는 것을 고려해보세요. <!-- TODO: If you have many images to serve, consider writing your retina image CSS manually in a single media query. --></strong></p>
                <div class="zero-clipboard"><span class="btn-clipboard">Copy</span></div><div class="highlight"><pre><code class="language-scss" data-lang="scss"><span class="nc">.img-retina</span><span class="o">(@</span><span class="nt">file-1x</span><span class="p">;</span> <span class="k">@file-2x</span><span class="p">;</span> <span class="k">@width-1x</span><span class="p">;</span> <span class="k">@height-1x</span><span class="o">)</span> <span class="p">{</span>
  <span class="nl">background-image</span><span class="p">:</span> <span class="sx">url("@{file-1x}")</span><span class="p">;</span>

  <span class="k">@media</span>
  <span class="nt">only</span> <span class="nt">screen</span> <span class="nt">and</span> <span class="o">(</span><span class="nt">-webkit-min-device-pixel-ratio</span><span class="nd">:</span> <span class="nt">2</span><span class="o">),</span>
  <span class="nt">only</span> <span class="nt">screen</span> <span class="nt">and</span> <span class="o">(</span>   <span class="nt">min--moz-device-pixel-ratio</span><span class="nd">:</span> <span class="nt">2</span><span class="o">),</span>
  <span class="nt">only</span> <span class="nt">screen</span> <span class="nt">and</span> <span class="o">(</span>     <span class="nt">-o-min-device-pixel-ratio</span><span class="nd">:</span> <span class="nt">2</span><span class="o">/</span><span class="nt">1</span><span class="o">),</span>
  <span class="nt">only</span> <span class="nt">screen</span> <span class="nt">and</span> <span class="o">(</span>        <span class="nt">min-device-pixel-ratio</span><span class="nd">:</span> <span class="nt">2</span><span class="o">),</span>
  <span class="nt">only</span> <span class="nt">screen</span> <span class="nt">and</span> <span class="o">(</span>                <span class="nt">min-resolution</span><span class="nd">:</span> <span class="nt">192dpi</span><span class="o">),</span>
  <span class="nt">only</span> <span class="nt">screen</span> <span class="nt">and</span> <span class="o">(</span>                <span class="nt">min-resolution</span><span class="nd">:</span> <span class="nt">2dppx</span><span class="o">)</span> <span class="p">{</span>
    <span class="nl">background-image</span><span class="p">:</span> <span class="sx">url("@{file-2x}")</span><span class="p">;</span>
    <span class="nl">background-size</span><span class="p">:</span> <span class="o">@</span><span class="n">width-1x</span> <span class="o">@</span><span class="n">height-1x</span><span class="p">;</span>
  <span class="p">}</span>
<span class="p">}</span>

<span class="c1">// Usage
</span><span class="nc">.jumbotron</span> <span class="p">{</span>
  <span class="nc">.img-retina</span><span class="o">(</span><span class="s2">"/img/bg-1x.png"</span><span class="o">,</span> <span class="s2">"/img/bg-2x.png"</span><span class="o">,</span> <span class="nt">100px</span><span class="o">,</span> <span class="nt">100px</span><span class="o">)</span><span class="p">;</span>
<span class="p">}</span></code></pre></div>
            </div>

            <div class="bs-docs-section">
                <h1 id="sass" class="page-header">Sass 사용<a class="anchorjs-link" href="#sass"><span class="anchorjs-icon"></span></a></h1>
                <p class="lead">부트스트랩은 Less 를 기반으로 만들어졌지만, <a href="https://github.com/twbs/bootstrap-sass">공식 Sass 버전</a> 도 있습니다. 우리는 그것을 별도의 깃허브 저장소에서 관리하고 전환 스크립트로 업데이트 합니다.</p>

                <h2 id="sass-contents">살펴보기<a class="anchorjs-link" href="#sass-contents"><span class="anchorjs-icon"></span></a></h2>
                <p>Sass 버전이 분리된 저장소를 가지고 조금 다른 사용자들을 지원하면서, 프로젝트의 콘텐츠는 메인 부트스트랩 프로젝트와 크게 다릅니다. 이것은 Sass 버전이 가능한 많은 Sass 기반 시스템들에 호환성을 가지도록 합니다.</p>

                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>경로</th>
                            <th>설명</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th scope="row"><code>lib/</code></th>
                            <td>Ruby gem code (Sass configuration, Rails and Compass integrations)</td>
                        </tr>
                        <tr>
                            <th scope="row"><code>tasks/</code></th>
                            <td>Converter scripts (turning upstream Less to Sass)</td>
                        </tr>
                        <tr>
                            <th scope="row"><code>test/</code></th>
                            <td>Compilation tests</td>
                        </tr>
                        <tr>
                            <th scope="row"><code>templates/</code></th>
                            <td>Compass package manifest</td>
                        </tr>
                        <tr>
                            <th scope="row"><code>vendor/assets/</code></th>
                            <td>Sass, JavaScript, and font files</td>
                        </tr>
                        <tr>
                            <th scope="row"><code>Rakefile</code></th>
                            <td>Internal tasks, such as rake and convert</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <p>파일들을 보려면 <a href="https://github.com/twbs/bootstrap-sass">Sass 버전 깃허브 저장소</a> 를 방문하세요. <!-- TODO: in action --></p>


                <h2 id="sass-installation">설치<a class="anchorjs-link" href="#sass-installation"><span class="anchorjs-icon"></span></a></h2>
                <p>Sass 용 부트스트랩을 설치하고 사용하는 방법에 대한 정보는, <a href="https://github.com/twbs/bootstrap-sass">깃허브 저장소 readme</a> 를 살펴보세요. 그것은 가장 최근의 소스이고, 레일즈와 Compass, 표준 Sass 프로젝트들을 위한 정보를 포함하고 있습니다.</p>
                <p>
                    <a class="btn btn-lg btn-outline" href="https://github.com/twbs/bootstrap-sass">Sass 용 부트스트랩</a>
                </p>
            </div>


        </div>










    </div>
</section>