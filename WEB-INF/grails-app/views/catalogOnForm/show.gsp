
<%@ page import="kz.statbase.estat.spravgenerator2.model.CatalogOnForm" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'catalogOnForm.label', default: 'CatalogOnForm')}" />
		<title>Справочник используемый Версий Формы </title>
	</head>
	<body>
		<a href="#show-catalogOnForm" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link controller="mdicFormVersion" action="show" id="${catalogOnFormInstance?.theFormId}">Находиться на форме</g:link>
			</ul>
		</div>
		<div id="show-catalogOnForm" class="content scaffold-show" role="main">
			<h1>Справочник используемый Версий Формы </h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list catalogOnForm">

                <g:if test="${catalogOnFormInstance?.theClassVersionId}">
                    <li class="fieldcontain">
                        <span id="theClassVersionId-label" class="property-label"><g:message code="catalogOnForm.theClassVersionId.label" default="Ид справочника на в Форме и в БД 'Класс'" /></span>

                        <span class="property-value" aria-labelledby="theClassVersionId-label">${catalogOnFormInstance.theClassVersionId}</span>

                    </li>
                </g:if>

				<g:if test="${catalogOnFormInstance?.descriptionRu}">
				<li class="fieldcontain">
					<span id="descriptionRu-label" class="property-label"><g:message code="catalogOnForm.descriptionRu.label" default="Описание Справочника" /></span>
					
						<span class="property-value" aria-labelledby="descriptionRu-label"><g:fieldValue bean="${catalogOnFormInstance}" field="descriptionRu"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${catalogOnFormInstance?.dtCreate}">
				<li class="fieldcontain">
					<span id="dtCreate-label" class="property-label"><g:message code="catalogOnForm.dtCreate.label" default="Дата привязки к форме" /></span>
					
						<span class="property-value" aria-labelledby="dtCreate-label"><g:formatDate date="${catalogOnFormInstance?.dtCreate}" /></span>
					
				</li>
				</g:if>
			

				<g:if test="${catalogOnFormInstance?.theFormId}">
				<li class="fieldcontain">
					<span id="theFormId-label" class="property-label"><g:message code="catalogOnForm.theFormId.label" default="Справочник нужен Форме" /></span>
						<span class="property-value" aria-labelledby="theFormId-label">
                            <g:link controller="mdicFormVersion" action="show" id="${catalogOnFormInstance?.theFormId}">${formInfo}</g:link>
						</span>
					
				</li>
				</g:if>
			
			</ol>

            <g:if test="${catalogOnFormInstance?.theCalendarCatalogOnForms}">
                <div id="сalendarCatalogOnFormsDlg">
                    <g:render template="сalendarCatalogOnForms"  />
                </div>
            </g:if>


		</div>
	</body>
</html>
