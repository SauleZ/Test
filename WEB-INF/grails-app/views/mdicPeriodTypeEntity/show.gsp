
<%@ page import="com.keremet.normalizer.ejb.metav2.entity.MdicPeriodTypeEntity" %>
<!DOCTYPE html>
<html>
	<head>
        <meta name="layout" content="main">
        <r:require module="jqWidgets"/>

		<g:set var="entityName" value="${message(code: 'mdicPeriodTypeEntity.label', default: 'MdicPeriodTypeEntity')}" />
		<title>Типы периода сбора</title>
	</head>
	<body>
		<a href="#show-mdicPeriodTypeEntity" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index">Список типов периодов</g:link></li>
			</ul>
		</div>
		<div id="show-mdicPeriodTypeEntity" class="content scaffold-show" role="main">
			<h1>Типы периода сбора</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list mdicPeriodTypeEntity">

                <g:if test="${mdicPeriodTypeEntityInstance?.id}">
                    <li class="fieldcontain">
                        <span id="id-label" class="property-label"><g:message code="mdicPeriodTypeEntity.fullCode.label" default="Ид" /></span>

                        <span class="property-value" aria-labelledby="id-label"><g:fieldValue bean="${mdicPeriodTypeEntityInstance}" field="id"/></span>

                    </li>
                </g:if>

				<g:if test="${mdicPeriodTypeEntityInstance?.fullCode}">
				<li class="fieldcontain">
					<span id="fullCode-label" class="property-label"><g:message code="mdicPeriodTypeEntity.fullCode.label" default="Код полный" /></span>
					
						<span class="property-value" aria-labelledby="fullCode-label"><g:fieldValue bean="${mdicPeriodTypeEntityInstance}" field="fullCode"/></span>
					
				</li>
				</g:if>

                <g:if test="${mdicPeriodTypeEntityInstance?.nameRu}">
                    <li class="fieldcontain">
                        <span id="nameRu-label" class="property-label"><g:message code="mdicPeriodTypeEntity.nameRu.label" default="Имя (рус.)" /></span>

                        <span class="property-value" aria-labelledby="nameRu-label"><g:fieldValue bean="${mdicPeriodTypeEntityInstance}" field="nameRu"/></span>

                    </li>
                </g:if>

				<g:if test="${mdicPeriodTypeEntityInstance?.nameKk}">
				<li class="fieldcontain">
					<span id="nameKk-label" class="property-label"><g:message code="mdicPeriodTypeEntity.nameKk.label" default="Имя (каз.)" /></span>
					
						<span class="property-value" aria-labelledby="nameKk-label"><g:fieldValue bean="${mdicPeriodTypeEntityInstance}" field="nameKk"/></span>
					
				</li>
				</g:if>
			
			</ol>

            <div class="sg-table-caption">
                <span>Список периодов сбора за указанный год:</span>
                <div id="yearSelectId"> </div>
            </div>

            <div id="tableCurrentCalendarId"> </div>

		</div>
    <r:script>
        var currentDt= new Date()
        $(document).ready(function () {
            createDt_SelectYear();
            createTable_CurrentCalendars();
        });

        function createDt_SelectYear(){
            $("#yearSelectId").jqxDateTimeInput({ width: '160px', height: '25px',
                formatString: 'yyyy',   theme: 'darkblue', showCalendarButton: true });
            $('#yearSelectId').on('valueChanged', function (event)
            {
                currentDt = event.args.date
                console.log( currentDt );
                $("#tableCurrentCalendarId").jqxGrid('updatebounddata');
                //refreshdata
            });
        }

        function returnHyperLink(cellValue, options, rowdata, action)
            {
                var urlShowKind = "<g:createLink action="show" controller="mdicPeriodKindlistEntity" />";

                return urlShowKind +'/' +rowdata.id ;
            }

        function createTable_CurrentCalendars(){
                var url = "<g:createLink action="listCurrentCalendars" controller="mdicPeriodTypeEntity" />";
                var source =
                {
                    datatype: "json",
                    contentType: "application/json; charset=utf-8",
                    type: "POST",
                    datafields: [
                        { name: 'period_kind_id' },
                        { name: 'periodId' },
                        { name: 'name' },
                        { name: 'dtBeg' },
                        { name: 'dtEnd' }
                    ],
                    formatData: function (data) {
                        return "{'dt': "+currentDt.getTime()+", kindId: "+ ${mdicPeriodTypeEntityInstance.id} +"}";
                    },
                    id: 'id',
                    url: url
                };
                var linkRenderer = function (row, column, value) {
                    var urlShowKind = "<g:createLink action="show" controller="mdicPeriodKindlistEntity" />";
                    var rowData = $('#tableCurrentCalendarId').jqxGrid('getrowdata', row);
                    console.log( rowData );

                    var url = urlShowKind +'/' + rowData.period_kind_id ;
                    var html = "<a href='" + url + "' >" + rowData.name +"</a>";
                    return html;
                }

                var dataAdapter1 = new $.jqx.dataAdapter(  source ,
                    { downloadComplete: function (data, status, xhr) { },
                     loadComplete: function (data) { console.log( data ) },
                     loadError: function (xhr, status, error) { }
                    }
                  );
                $("#tableCurrentCalendarId").jqxGrid(
                {
                    width: 500,
                    source: dataAdapter1,
                    pageable: false,
                    autoheight: true,
                    sortable: false,
                    altrows: true,
                    enabletooltips: true,
                    editable: false,
                    theme: 'darkblue',
                    selectionmode: 'none',
                    columns: [
                      //{ text: 'Название периода',  datafield: 'name', width: 200 },
                      { text: 'Название периода', datafield: 'id',  width: 200, cellsrenderer: linkRenderer },
                      { text: 'Дата начала',  datafield: 'dtBeg', width: 150 },
                      { text: 'Дата завершения',  datafield: 'dtEnd', width: 150 }
                    ]
                });

        }

    </r:script>
	</body>
</html>
