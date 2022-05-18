
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'mdicFormVersion.label', default: 'MdicFormVersion')}" />
    <title>Статистика по Форме : '${formDescription}' за период : '${peirodDescription}'. </title>

    <r:require modules="jqWidgets"/>

    <asset:javascript src="metaServiceWork.js"  />
    <asset:javascript src="normalizeAnalitic.js"/>

</head>
<body>
<r:script>

</r:script>
<a href="#show-mdicFormVersion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><g:link class="home"  controller="selectNormalizeInfo" action="show">Форма и Период</g:link></li>
    </ul>
</div>


<table class="tableSimple">
    <caption style="margin-top: 10px;  margin-bottom: 10px;" >Статистика по Форме : <span class="mark-info-general">'${formDescription}'</span> за период : <span class="mark-info-general">'${peirodDescription}'</span>. </caption>
    <tr><td>Текущие состояние Нормализации:</td><td class="mark-info-general"> ${currentState} </td></tr>
    <tr><td>Время последней нормализации:</td><td class="mark-info-general"> <g:formatDate format="yyyy-MM-dd HH:mm:ss" date="${timeOfLastNormalization}"/> </td></tr>
    <!--tr><td>Приоритет нормализаций (100 по умолчанию) :</td><td class="mark-info-general"> ${loadingPriorityPower} </td></tr-->
    <tr><td>Кол-во НЕ нормализованных отчетов:</td>
        <g:if test="${countOfNotNormaReport>0}" >
           <td  class="mark-info-alarm">${countOfNotNormaReport}</td>
        </g:if>
        <g:else>
            <td  class="mark-info-general">${countOfNotNormaReport}</td>
        </g:else>
    </tr>
    <tr><td>Кол-во отчетов БЕЗ ошибок нормализации:</td><td class="mark-info-general">${countOfReportWithOutError}</td></tr>
    <tr><td>Кол-во нормализованных данных в отчетах:</td><td class="mark-info-general"> <span id="countOfNormalizedNumberAndFlg">Идет загрузка...</span>  </td></tr>
    <tr><td>Кол-во отчетов С ошибками нормализации:</td>
        <g:if test="${countOfReportWithError>0}" >
            <td class="mark-info-alarm">${countOfReportWithError}</td>
        </g:if>
        <g:else>
            <td  class="mark-info-general">${countOfReportWithError}</td>
        </g:else>
    </tr>
    <tr><td>Кол-во отчетов В кубах:</td><td class="mark-info-general">${countOfReportInsideCube}</td></tr>
    <tr><td>Кол-во отчетов НЕ в кубах:</td>
        <td class="mark-info-general">${countOfReportOutsideCube}
            <g:link class="list" controller="normalizeStatistic" action="showReportOutsideCube" params="[idForm : idForm,  idPeriodKind : idPeriodKind  ]">(Посмотреть)</g:link>
        </td>
    </tr>

</table>
<g:if test="${hasLogicError}" >
    <table >
        <caption style="margin-top: 10px;  margin-bottom: 10px;" >Виды ошибок нормализаций: </caption>
        <thead>
            <tr>
                <th>Коды ошибок:</th>
                <th>Кол-во:</th>
            </tr>
        </thead>
        <tbody>
            <g:each var="logicError"  status="i" in="${logicErrors}">
              <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                  <td><g:link class="list" controller="normalizeStatistic" action="showTypeOfError" params="[idForm : idForm,  idPeriodKind : idPeriodKind ,  logicError : logicError[0] ]">${ kz.statbase.estat.utils.NormalizeErrorTypes.findErrorCodeDescription(logicError[0]) }</g:link></td>
                  <td>${logicError[1]}</td>
              </tr>
            </g:each>
        </tbody>
    </table>
</g:if>
<div style="display: none">
    <span id="param_idForm">${idForm}</span>
    <span id="param_idPeriodKind">${idPeriodKind}</span>
</div>


</body>
</html>