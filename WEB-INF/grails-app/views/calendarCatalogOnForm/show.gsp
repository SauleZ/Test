
<%@ page import="kz.statbase.estat.spravgenerator2.model.CalendarCatalogOnForm" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'calendarCatalogOnForm.label', default: 'CalendarCatalogOnForm')}" />
        <r:require modules="jqWidgets"/>
        <title>Справочник на Форме для для отчетного периода</title>
	</head>
	<body>
		<a href="#show-calendarCatalogOnForm" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list"  controller="mdicFormVersion" action="show" id="${calendarCatalogOnFormInstance?.theMyCreator?.theFormId}">Версия формы</g:link></li>
                <li><g:link class="list"  controller="catalogOnForm" action="show" id="${calendarCatalogOnFormInstance?.theMyCreator?.id}">Владелец</g:link></li>

			</ul>
		</div>
		<div id="show-calendarCatalogOnForm" class="content scaffold-show" role="main">
			<h1>Справочник на Форме для для отчетного периода</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list calendarCatalogOnForm">
			
				<g:if test="${calendarCatalogOnFormInstance?.theMyCreator}">
				<li class="fieldcontain">
					<span id="theMyCreator-label" class="property-label"><g:message code="calendarCatalogOnForm.theMyCreator.label" default="Владелец" /></span>
					
					<span class="property-value" aria-labelledby="theMyCreator-label"><g:link controller="catalogOnForm" action="show" id="${calendarCatalogOnFormInstance?.theMyCreator?.id}">${calendarCatalogOnFormInstance?.theMyCreator?.info()}</g:link></span>
					
				</li>
				</g:if>
			

				<g:if test="${calendarCatalogOnFormInstance?.theCalendarId}">
				<li class="fieldcontain">
					<span id="theCalendarId-label" class="property-label"><g:message code="calendarCatalogOnForm.theCalendarId.label" default="Период сбора отчетов" /></span>
					
						<span class="property-value" aria-labelledby="theCalendarId-label">${calendarCatalogOnFormInstance?.theCalendar()?.info()}</span>
					
				</li>
				</g:if>
			

                <g:if test="${calendarCatalogOnFormInstance?.currentCatalog()}">
                    <li class="fieldcontain">
                       <div id="activeCreationGuiId">
                           <g:render template="activeCatalogVersion"  />
                       </div>
                    </li>
                </g:if>

			</ol>

        <div class="nav" role="navigation">
                <ul>
                    <li>
                        <button id="openSelectActiveDlg" type="button">Изменить Активную версию</button>
                    </li>

                </ul>
        </div>

        <g:if test="${calendarCatalogOnFormInstance?.theLinkToCatalogs}">
            <div id="generatedCatalogsDlg">
                <g:render template="generatedCatalogs"  />
            </div>

        </g:if>

            <div id="dialogSelectActiveCreation">
                <div id="windowHeader">
                    Выбор версий справочника для периода сдачи Формы:
                </div>
                <div style="overflow: hidden;" id="windowContent">
                        <table class="sg-table-dlg">
                            <tr>
                                <td>Код справочника :</td>
                                <td><div id='spravCodeDlgId' class="valueShow">${calendarCatalogOnFormInstance?.theMyCreator?.theClassVersionId}</div></td>
                            </tr>
                            <tr>
                                <td>Название справочника:</td>
                                <td><div id='spravDescDlgId' class="valueShow">${calendarCatalogOnFormInstance?.theMyCreator?.descriptionRu}</div></td>
                            </tr>
                            <tr>
                                <td>Старый Активный справочник:</td>
                                <td class="valueOldShow" >${oldActive}</td>
                            </tr>
                            <tr>
                                <td>Новый Активный справочник:</td>
                                <td class="valueShow" ><div id='activeGenerationDlgId' ></div></td>
                            </tr>
                        </table>
                        <table class="tableSimple">
                            <tr>
                                <td><div id='jqxSelectGenerationList' > </div></td>
                                <td> <input id="createGenerationDlgId" type="button" value="Создать справочник"/>
                                    <div id='sparvDateInput'></div>
                                    <div id='jqxSelectOption'></div>
                                </td>
                            </tr>
                        </table>
                        <div style="font-size: 13px; font-family: Verdana;" id="selectionlog" >
                        </div>

                        <div class="buttonPlace" >
                            <ul>
                                <li><input id="makeSelectionDlgId" type="button" value="Выбрать"/></li>
                                <li><input id="deleteSprav" type="button" value="Удалить спр."/></li>
                                <li><input id="showSprav" type="button" value="Просмотр спр."/></li>
                                <li><input id="closeDlgId" type="button" value="Отмена"/></li>

                            </ul>
                        </div>

                </div>
            </div>
            <r:script>
             function createNewCatalogVersion( dataAdapter ){
               $( "#createGenerationDlgId" ).jqxButton({disabled: true});
               console.log('asdasd');
               console.log(${calendarCatalogOnFormInstance?.theMyCreator?.theFormId});
               var formId = ${calendarCatalogOnFormInstance?.theMyCreator?.theFormId};
               var allOptions=$('#jqxSelectOption').jqxGrid('getrows');
               var selectedOptions=$.grep(allOptions, function( a ) {  return a.selected;});
               var selectedOptionsIDs= $.map(selectedOptions, function( a ) {  return a.id;});


               var paramInJson = JSON.stringify( {
                'spravId' : ${sparvCode},
                'classPickTime' : $("#sparvDateInput").jqxDateTimeInput('value').getTime() ,
                'calendarCatalogId' : ${ calendarCatalogOnFormInstance.id } ,
                'options' : selectedOptionsIDs,
                'formId' : formId
               }
               );
               $.ajax({
                    url: "<g:createLink action="createNewCatalogVersion" controller="calendarCatalogOnForm" />",
                    type: "post",
                    dataType: 'json',
                    data:  paramInJson  ,
                    contentType:"application/json; charset=utf-8",
                    success: function(data) {
                        dataAdapter.dataBind();
                        console.log(data); //<----- this logs the data in browser's console
                    },
                    error: function(xhr){
                        console.error(xhr.responseText);
                        alert('Не могу создать новую версию Справочника!');
                    },
                    complete: function(jqXHR, textStatus) { $( "#createGenerationDlgId" ).jqxButton({disabled: false}); }
                });
             }

             function updateActiveCatalogVersion( newActiveId ){
               var paramInJson = JSON.stringify( { 'newActiveId' : newActiveId, 'calendarCatalogId' : ${calendarCatalogOnFormInstance.id}  } );
               $.ajax({
                    url: "<g:createLink action="updateActiveCatalogVersion" controller="calendarCatalogOnForm" />",
                    type: "post",
                    dataType: 'json',
                    data:  paramInJson  ,
                    contentType:"application/json; charset=utf-8",
                    success: function(data) {
                        if (data.result == 'error') {
                            alert('Не могу привизать новую версию Справочника '+ newActiveId+' к каталогу на форме '+${calendarCatalogOnFormInstance.id})
                            console.error( data.msg );
                        } else {
                            console.log(data); //<----- this logs the data in browser's console
                            refreshVersion();

                        }
                    },
                    error: function(xhr){
                        console.error(xhr.responseText);
                        console.error('Не могу привизать новую версию Справочника '+ newActiveId+' к каталогу на форме '+${calendarCatalogOnFormInstance.id});
                    }
                });
             }
             function refreshVersion(){
                var paramInJson = JSON.stringify( { 'calendarCatalogId' : ${calendarCatalogOnFormInstance.id}  } );
                $.ajax({
                    type: 'post',
                    dataType: 'html',
                    contentType: "application/json; charset=utf-8",
                    data: paramInJson,
                    url: "<g:createLink action="refreshVersionTable" controller="calendarCatalogOnForm" />",
                    success: function(data, textStatus)
                        {
                            jQuery('#generatedCatalogsDlg').html(data);
                        },
                    error:   function(XMLHttpRequest,textStatus,errorThrown)
                        { console.error( XMLHttpRequest )}
                });
                $.ajax({
                    type: 'post',
                    dataType: 'html',
                    contentType: "application/json; charset=utf-8",
                    data: paramInJson,
                    url: "<g:createLink action="refreshActiveCatalog" controller="calendarCatalogOnForm" />",
                    success: function(data, textStatus)
                        {
                            jQuery('#activeCreationGuiId').html(data);
                        },
                    error:   function(XMLHttpRequest,textStatus,errorThrown)
                        { console.error( XMLHttpRequest )}
                });
             }
             function deleteCatalog(catalogId) {
                console.log( catalogId );
                var paramInJson = JSON.stringify( { 'catalogVersionId' : catalogId  } );
                $.ajax({
                    type: 'post',
                    dataType: 'html',
                    contentType: "application/json; charset=utf-8",
                    data: paramInJson,
                    url: "<g:createLink action="deleteDirect" controller="catalogVersion" />",
                    success: function(data, textStatus)
                        {
                            var deleteResult = JSON.parse(data);
                            if ('errorMsg' in deleteResult) {
                                alert( 'Ошибка удаления. ' +deleteResult.errorMsg);
                            } else{
                                $('#jqxSelectGenerationList').jqxListBox('refresh');
                                alert( 'Справочник успешно удален. ');
                            }
                        },
                    error:   function(XMLHttpRequest,textStatus,errorThrown)
                        { console.error( XMLHttpRequest )}
                });


             }

             function createOptionSelect(){
                var url = "<g:createLink action="listOptionForSprav" controller="catalogVersion" params="[spravId: sparvCode]"/>";
                var source =
                {
                    datatype: "json",
                    datafields: [
                        { name: 'selected' },
                        { name: 'descript' },
                        { name: 'id' }
                    ],
                    id: 'id',
                    url: url
                };
                var dataAdapter = new $.jqx.dataAdapter(  source ,
                    { downloadComplete: function (data, status, xhr) {  },
                     loadComplete: function (data) { console.log( data );
                         },
                     loadError: function (xhr, status, error) { }
                    }
                  );
                $("#jqxSelectOption").jqxGrid(
                {
                    width: 300,
                    source: dataAdapter,
                    pageable: false,
                    autoheight: true,
                    sortable: false,
                    altrows: true,
                    enabletooltips: true,
                    editable: true,
                    theme: 'darkblue',
                    selectionmode: 'singlerow',
                    columns: [
                      { text: 'Да?', columntype: 'checkbox', datafield: 'selected', width: 40 },
                      { text: 'Описание',  datafield: 'descript', width: 260, editable: false }
                    ],
                    ready: function () {
                        $("#jqxSelectOption").jqxGrid('autoresizecolumns');
                    }
                });


             }

             function createDialog(){
                var url = "<g:createLink action="listOfAllBySpravId" controller="catalogVersion" params="[spravId: sparvCode]"/>";
                var source =
                {
                    datatype: "json",
                    datafields: [
                        { name: 'dtGen' },
                        { name: 'descript' },
                        { name: 'version' },
                        { name: 'id' }
                    ],
                    id: 'id',
                    url: url
                };
                var dataAdapter = new $.jqx.dataAdapter(source , { loadComplete: function () {
                     $('#jqxSelectGenerationList').jqxWindow('refresh');
                     console.log( dataAdapter.records )
                    //alert('data is loaded');
                }});

                $("#jqxSelectGenerationList").jqxListBox({ source: dataAdapter, displayMember: "descript", valueMember: "id",
                    width: 250, height: 200, theme: 'darkblue'});

                // update events.
                $("#jqxSelectGenerationList").on('select', function (event) {
                    if (event.args) {
                        var item = event.args.item;
                        if (item) {
                            $("#activeGenerationDlgId").children().remove();
                            var labelelement2 = $("<div></div>");
                            labelelement2.text(item.label);
                            $("#activeGenerationDlgId").append(labelelement2);

                        }
                    }
                });
                $("#sparvDateInput").jqxDateTimeInput({ width: '160px', height: '25px', formatString: 'yyyy-MM-dd HH:mm',
                       theme: 'darkblue' });
                 createOptionSelect();

//                 showCollapseButton: true, maxHeight: 400, maxWidth: 700, minHeight: 200, minWidth: 200, height: 300, width: 500,
                 $("#makeSelectionDlgId").jqxRepeatButton({ delay: 25 , theme: 'darkblue' });
                 $("#makeSelectionDlgId").click(function() {
                     console.log(' #makeSelectionDlgId  clicked');
                     var item = $("#jqxSelectGenerationList").jqxListBox('getSelectedItem')
                     updateActiveCatalogVersion( item.value )
                     console.log( item ) ;

                 });
                 //$("#createGenerationDlgId").jqxRepeatButton({ delay: 25 , theme: 'darkblue' });
                 $("#createGenerationDlgId").jqxButton({ theme: 'darkblue' });
                 $("#createGenerationDlgId").click(function() {
                     console.log(' __ #createGenerationDlgIdclick __ ');
                     // console.log(${calendarCatalogOnFormInstance?.theMyCreator?.theFormId});
                     //$( "#createGenerationDlgId" ).jqxButton('focus');
                     //$('#dialogSelectActiveCreation').jqxWindow('focus');
                     $( "#createGenerationDlgId" ).jqxButton({disabled: true});
                     createNewCatalogVersion( dataAdapter );
                 });
                 $("#showSprav").jqxButton({ theme: 'darkblue' });
                 $("#showSprav").click(function() {
                     var item = $("#jqxSelectGenerationList").jqxListBox('getSelectedItem')
                     var urlCatalog = '<g:createLink controller="catalogVersion"  action="show"/>'
                     urlCatalog = urlCatalog+'/'+item.value
                     var win = window.open(urlCatalog, '_blank');
                     win.focus();
                     console.log(' __ #showSprav __ '+urlCatalog);
             });

             $("#deleteSprav").jqxButton({ theme: 'darkblue' });
             $("#deleteSprav").click(function() {
                var item = $("#jqxSelectGenerationList").jqxListBox('getSelectedItem')
                var paramInJson = JSON.stringify( { 'catalogVersionId' : item.value  } );
                $.ajax({
                    type: 'post',
                    dataType: 'html',
                    contentType: "application/json; charset=utf-8",
                    data: paramInJson,
                    url: "<g:createLink action="canDelete" controller="catalogVersion" />",
                    success: function(data, textStatus)
                        {
                            var canDelete = JSON.parse(data);
                            if ('errorMsg' in canDelete) {
                                alert( 'Не могу удалить. ' +canDelete.errorMsg);
                            } else{
                               deleteCatalog(item.value);

                            }
                        },
                    error:   function(XMLHttpRequest,textStatus,errorThrown)
                        { console.error( XMLHttpRequest )}
                });


                 console.log(' __ #deleteSprav __ ');
             });

             $("#closeDlgId").jqxButton({ theme: 'darkblue' });
             $("#closeDlgId").click(function() {
                $('#dialogSelectActiveCreation').jqxWindow('close');
             });

             $('#dialogSelectActiveCreation').jqxWindow({
                 maxHeight: 625, maxWidth: 625, minHeight: 200, minWidth: 200, height: 550, width: 625,
                 autoOpen : false, isModal : true, modalOpacity: 0.2,
                 okButton :  $('#makeSelectionDlgId'),
                 cancelButton :  $('#closeDlgId'),
                 initContent: function () {
                     $('#dialogSelectActiveCreation').jqxWindow('focus');
                 }
             });

         };

         $(document).ready(function () {
             $("#openSelectActiveDlg").jqxButton({ theme: 'darkblue' });

             $( "#openSelectActiveDlg" ).click(function() {
                 $( "#dialogSelectActiveCreation" ).jqxWindow('open');
             });
             createDialog();

         });
            </r:script>

		</div>
	</body>
</html>
