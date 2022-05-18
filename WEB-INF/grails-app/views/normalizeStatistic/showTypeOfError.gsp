
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
    function showError( idReport, statcode, bin, dtReport, dtError, dtErrorTime, reportNomer, errorFlk, kato ){
        console.log( dtErrorTime );
        console.log( 'dtReport: '+dtReport );
        $("#value-id").text(idReport);
        $("#value-statcode").text(statcode);
        $("#value-bin").text(bin);
        $("#value-dt-last").text(dtReport);
        $("#value-dt-error").text(dtError);
        $("#value-report-nomer").text(reportNomer);
        $("#value-dt-error-flk").text(errorFlk);
        $("#value-dt-error-kato").text(kato);


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

    };


    $("#reNormalize").click(function() {
        console.log(' reNormalize clicked');

        var arrayOfCheckboxes = document.getElementsByClassName("ch-box-normalize");

        var checkedRecordsArray = new Array();
        // var item = $("#jqxSelectGenerationList").jqxListBox('getSelectedItem')

        for (var i = 0; i < arrayOfCheckboxes.length; i++) {

            if(arrayOfCheckboxes[i].checked) {

                console.log('value: ');
                console.log(arrayOfCheckboxes[i].value);
                checkedRecordsArray.push(arrayOfCheckboxes[i].value);
            }
        }
        console.log(checkedRecordsArray);

        if (checkedRecordsArray.length===0) {
            alert( 'Выберите записи для нормализации!');
            return;
        }


        var checkedRecordsArrayJson = JSON.stringify( { 'checkedRecordsArray' : checkedRecordsArray } );

        $.ajax({
            type: 'post',
            dataType: 'html',
            contentType: "application/json; charset=utf-8",
            data: checkedRecordsArrayJson,
            url: "<g:createLink action="reNormalize" controller="normalizeStatistic" />",
            success: function(data, textStatus)
            {
                alert( 'Записи успешно отправлены на перенормализацию');
                // var canDelete = JSON.parse(data);
                // if ('errorMsg' in canDelete) {
                // alert( 'Не могу удалить. ' +canDelete.errorMsg);
                // } else{
                // deleteCatalog(item.value);
                //
                // }
            },
            error:   function(XMLHttpRequest,textStatus,errorThrown)
            { console.error( XMLHttpRequest )}
        });
    });


//    $("#dialog-error-detail").dialog({
//        resizable: true,
//        height:200,
//        width:300,
//        modal: true,
//        autoOpen: false,
//        buttons: {
//            "Закрыть": function() {
//                $( this ).dialog( "close" );
//            }
//        }
//    });
    function handleChange(checkbox) {
        var arrayOfCheckboxes = document.getElementsByClassName("ch-box-normalize");
        if(checkbox.checked == true){
            console.log('checked!');

            for (var i = 0; i < arrayOfCheckboxes.length; i++) {
                arrayOfCheckboxes[i].checked=true;
            }
        }else{
            console.log('uncheked!');
            for (var i = 0; i < arrayOfCheckboxes.length; i++) {
                arrayOfCheckboxes[i].checked=false;
            }
        }
    }

    $(document).ready(function () {
    $('#pageSplitter').jqxSplitter({ width: '958px', height: '500px', panels: [{ size: 320, collapsible : false }], orientation: 'horizontal' });
    $("#jqxpanel").jqxPanel({ width: '958px', height: 380 });
    //$("#jqxTextArea-Error").jqxTextArea({ width: 550, height: 300, placeHolder: 'Enter a sentence...' });
    //$("#itemInfoForm").hide();

    });


</r:script>
<a href="#show-mdicFormVersion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><g:link class="home"  controller="selectNormalizeInfo" action="show">Форма и Период</g:link></li>
        <li><g:link class="list"  controller="normalizeStatistic" action="show" params="[idForm : idForm,  idPeriodKind : idPeriodKind]">Журнал</g:link></li>
        <li><g:link class="list"  controller="normalizeStatistic" action="exportExcelReportTest" params="[idForm : idForm,  idPeriodKind : idPeriodKind ,  logicError : logicError]">Выгрузить список</g:link></li>

        <li><input class="list"   id="reNormalize" type="button" value="Нормализовать"/></li>


    </ul>
</div>
<div id="pageSplitter">
    <div>
        <div id='jqxpanel'>
        <table >
            <caption style="margin-top: 10px;  margin-bottom: 10px;" >Список отчетов по форме <span class="mark-info-general">'${formDescription}'</span> за период <span class="mark-info-general">'${peirodDescription}'</span> с кодом ошибки нормализаций <span class="mark-info-alarm">${logicError}</span>. </caption>
            <thead>
            <tr>
                <th>Статкод:</th>
                <th>Бин:</th>
                <th>№ отчета:</th>
                <th>Дата изменения отчета:</th>
                <th>Дата ошибки нормализаций:</th>
                <th>Ошибка ФЛК:</th>
                <th>КАТО:</th>
                <th><input type="checkbox" id="ch-box-normalize-main" onchange="handleChange(this)"/></th>
            </tr>
            </thead>
            <tbody>

                <g:each var="reportData"  status="i" in="${reportsData}">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}" id="row-with-error-report-${i}">
                        <td> <a title="Посмотреть техническое описание ошибки."
                                href="#" onclick="showError(${reportData[0]}, '${reportData[1]}', '${reportData[2]}', '${reportData[3]}', '${reportData[4]}', '${reportData[4].time}', ${reportData[5]}, ${reportData[6]}, ${reportData[7]} );return false;">${ reportData[1] }</a> </td>
                        <td>${ reportData[2] }</td>
                        <td>${ reportData[5] }</td>
                        <td>${ reportData[3] }</td>
                        <td>${ reportData[4] }</td>
                        <td>${ reportData[6] }</td>
                        <td>${ reportData[7] }</td>
                        <td><input class="ch-box-normalize" type="checkbox" name="binChecked" value="${ reportData[0] }"/></td>
                        %{--<td><g:checkBox name="binChecked" value="${ reportData[2] }" checked="false">${ reportData[2] }</g:checkBox> </td>--}%
                    </tr>
                </g:each>

            </tbody>
        </table>
        </div>
    </div>
    <div id="itemInfoForm">
        <table >
            <caption style="margin-top: 10px;  margin-bottom: 10px;" >Выбран отчет с ИД : <span class="mark-info-general" id="value-id">'---'</span> . </caption>
            <thead>
            <tr>
                <th>Статкод:</th>
                <th>Бин:</th>
                <th>№ отчета:</th>
                <th>Дата изменения отчета:</th>
                <th>Дата ошибки нормализаций:</th>
                <th>Ошибка ФЛК:</th>
                <th>КАТО:</th>
            </tr>
            </thead>
            <tbody>
                <tr class="even" >
                    <td> <span id ="value-statcode"></span> </td>
                    <td><span id ="value-bin"></span></td>
                    <td><span id ="value-report-nomer"></span></td>
                    <td><span id ="value-dt-last"></span></td>
                    <td><span id ="value-dt-error"></span></td>
                    <td><span id ="value-dt-error-flk"></span></td>
                    <td><span id ="value-dt-error-kato"></span></td>
                </tr>%{----}%

            </tbody>
        </table>
        <div id="detailErrorForm" >
            <ol class="property-list mdicFormVersion">
                <li class="fieldcontain">
                    <span id="formVersionId-label" class="property-label">Детальное описание ошибки отчета :</span>

                    <textarea id="jqxTextArea-Error" aria-labelledby="formVersionId-label" style = "width: 600px; height: 200px"></textarea>

                </li>

            </ol>
        </div>

    </div>
</div>


<!--div id="dialog-error-detail" title="Детальное описание ошибки.">
                    <span class="property-value" aria-labelledby="formVersionId-label">1111111111</span>
    <form>
        <p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span><span>Отчет будет сохранен как нулевой.</span></p>
    </form>
</div>
<div id='jqxwindow'>
    <div>Header</div>
    <div>Content</div>
</div>
<div id='jqxexpander'>
    <div>
        Header</div>
    <div>
        Content
    </div>
</div-->
</body>

</html>