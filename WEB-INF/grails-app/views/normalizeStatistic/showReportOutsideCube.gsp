
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'mdicFormVersion.label', default: 'MdicFormVersion')}" />
    <title>Список отчетов по форме '${formDescription}' за период '${peirodDescription}' с кодом ошибки нормализаций ${logicError}. </title>

    <r:require modules="jquery-ui"/>
    <r:require modules="jqWidgets"/>
    <asset:javascript src="metaServiceWork.js"/>
</head>
<body>
<r:script>
    function showError( idReport, statcode, bin, dtReport, dtError, dtErrorTime  ){
        console.log( dtErrorTime );
        $("#value-id").text(idReport);
        $("#value-statcode").text(statcode);
        $("#value-bin").text(bin);
        $("#value-dt-last").text(dtReport);
        $("#value-dt-error").text(dtError);
        $("#jqxTextArea-Error").text('Подождите идет загрузка ошибки с отчета ИД '+idReport+' ...');
        $("#jqxTextArea-Error").prop('disabled', true);
        var url = "/e-stat/spravGen/normalizeStatistic/getLastErrorMessage?logicCodeError=${logicError}&idReport="+idReport+"&dtErrorTime="+dtErrorTime;
        $.get( url ).done( function( data) {
                console.log(data);
                $("#jqxTextArea-Error").text(data.errorMessage);
            }).fail(function(error) {
                $("#jqxTextArea-Error").text(error);
            }).always(function() {
                $("#jqxTextArea-Error").prop('disabled', false);
            });
    }
    $(document).ready(function () {
        //$('#pageSplitter').jqxSplitter({ width: '958px', height: '500px', panels: [{ size: 250, collapsible : false }], orientation: 'horizontal' });
        //$("#jqxpanel").jqxPanel({ width: '958px', height: 380 });
        //$("#jqxTextArea-Error").jqxTextArea({ width: 550, height: 300, placeHolder: 'Enter a sentence...' });


    });


</r:script>
<a href="#show-mdicFormVersion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><g:link class="home"  controller="selectNormalizeInfo" action="show">Форма и Период</g:link></li>
        <li><g:link class="list"  controller="normalizeStatistic" action="show" params="[idForm : idForm,  idPeriodKind : idPeriodKind]">Журнал</g:link></li>

    </ul>
</div>
<div id="pageSplitter">
    <div>
        <div id='jqxpanel'>
            <table >
                <caption style="margin-top: 10px;  margin-bottom: 10px;" >Список отчетов по форме <span class="mark-info-general">'${formDescription}'</span> за период <span class="mark-info-general">'${peirodDescription}'</span> которых НЕТ в Кубах. </caption>
                <thead>
                <tr>
                    <th>Статкод:</th>
                    <th>Бин:</th>
                    <th>Номер отчета:</th>
                    <th>Дата изменения отчета:</th>
                </tr>
                </thead>
                <tbody>
                <g:each var="reportData"  status="i" in="${reportsData}">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}" id="row-with-error-report-${i}">
                        <td> ${ reportData[1] } </td>
                        <td>${ reportData[2] }</td>
                        <td>${ reportData[4] }</td>
                        <td>${ reportData[3] }</td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>
    <div>

    </div>
</div>

</body>

</html>