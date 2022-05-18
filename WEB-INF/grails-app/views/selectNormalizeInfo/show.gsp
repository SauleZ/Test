
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'mdicFormVersion.label', default: 'MdicFormVersion')}" />
    <title>Журнал Нормализаций</title>

    <r:require modules="jqWidgets"/>
    <asset:javascript src="metaServiceWork.js"/>
</head>
<body>
<r:script>
    $(document).ready(function () {
        $("#id_btn_norma_stat").jqxButton({ theme: 'darkblue' });
        $( "#id_btn_norma_stat" ).click(function() {
            var idForm = $("#input_form_id").val().value;
            var idPeriod = $("#input_period_id").val().value;
            if ( (idForm) && (idPeriod) ) {
                console.log( " ---  " + idForm + " --- " + idPeriod);
                var link = "<g:createLink action="show" controller="normalizeStatistic" />"+"?idForm="+idForm+"&idPeriodKind="+idPeriod;
                window.location.href = link;
            }

        });
        $.ajax({
                    url: "<g:createLink action="listOfForm" controller="mdicFormVersion" />",
                    type: "post",
                    dataType: 'json',
                    contentType:"application/json; charset=utf-8",
                    success: function(data) {
                            var source =
                            {
                                datatype : "json",
                                datafields : [
                                    { name: 'idForm' },
                                    { name: 'name' }
                                ],
                                localdata : data
                            };
                            var dataAdapter = new $.jqx.dataAdapter(source);
                            $("#input_form_id").jqxInput({ placeHolder: "Выбор формы:", height: 25, width: 400,
                                        minLength: 1, source: dataAdapter,  displayMember: "name", valueMember: "idForm" });
                            %{--var sourceCalendar =--}%
                            %{--{--}%
                                %{--type: "POST",--}%
                                %{--datatype : "json",--}%
                                %{--datafields : [--}%
                                    %{--{ name: 'idPeriodKind' },--}%
                                    %{--{ name: 'name' }--}%
                                %{--],--}%
                                %{--url : "<g:createLink action="findCalendarCollectInfoForForm" controller="mdicFormVersion"/>",--}%
                                %{--data: [{ idForm : "1049"}]--}%

                            %{--};--}%
                                %{--//data: JSON.stringify( { idForm : "1049"} )--}%
                            %{--//var paramInJson = JSON.stringify( { 'idForm' : item.value });--}%
                            %{--var dataAdapterCalendar = new $.jqx.dataAdapter(sourceCalendar);--}%
                            $("#input_period_id").jqxInput({ placeHolder: "Выбор периода:", height: 25, width: 400,
                                        minLength: 1,  displayMember: "name", valueMember: "idPeriodKind" }); // source: dataAdapterCalendar,


                            $('#input_form_id').on( 'select',
                                function (event) {
                                    if (event.args) {
                                        var item = event.args.item;
                                        if (item) {
                                            console.log( $('#input_form_id').val() );
                                            var paramInJson = JSON.stringify( { 'idForm' : item.value });
                                            $.ajax({
                                                            url: "<g:createLink action="findCalendarCollectInfoForForm"
                                                                                controller="mdicFormVersion"/>",
                                                            type: "post",
                                                            dataType: 'json',
                                                            contentType:"application/json; charset=utf-8",
                                                            data:  paramInJson  ,
                                                            success: function(data2) {
                                                                console.log(data2); //<----- this logs the data in browser's console
                            var source2 =
                            {
                                datatype : "json",
                                datafields : [
                                    { name: 'idPeriodKind' },
                                    { name: 'name' }
                                ],
                                localdata : data2
                            };
                            var dataAdapter2 = new $.jqx.dataAdapter(source2);
                                                                $("#input_period_id").jqxInput('val', '');
                                                                $("#input_period_id").jqxInput('source', dataAdapter2);
                                                            },
                                                            error: function(xhr){
                                                                console.error(xhr.responseText);
                                                                //alert('Не могу создать новую версию Справочника!');
                                                            },
                                                            complete: function(jqXHR, textStatus) { //$( "#createGenerationDlgId" ).jqxButton({disabled: false});
                                                             }
                                            });
                                        }
                                    }
                                } );

                     //   $("#input_form_id").jqxInput('source', data);
                        console.log(data); //<----- this logs the data in browser's console
                    },
                    error: function(xhr){
                        console.error(xhr.responseText);
                        //alert('Не могу создать новую версию Справочника!');
                    },
                    complete: function(jqXHR, textStatus) { $( "#createGenerationDlgId" ).jqxButton({disabled: false}); }
                });

    });
</r:script>

<a href="#show-mdicFormVersion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>

    </ul>
</div>

<!--div id="show-select" class="content scaffold-show" role="main"-->

    <table class="tableSimple">
        <caption style="margin-top: 10px;  margin-bottom: 10px;" >Для просмотра информаций о Нормализаций выберете нижеследующие параметры: </caption>
        <tr><td>Код формы:</td><td> <input type="text" id="input_form_id"/> </td></tr>
        <tr><td>Отчетный период сбора формы :</td><td><input type="text" id="input_period_id"/></td></tr>
        <!--tr><td>БИН :</td><td><input type="text" id="input_bin"/></td></tr-->
        <tr><td colspan="2"><button id="id_btn_norma_stat" type="button">Посмотреть Журнал</button> </td></tr>
    </table>


<!--/div-->

</body>
</html>