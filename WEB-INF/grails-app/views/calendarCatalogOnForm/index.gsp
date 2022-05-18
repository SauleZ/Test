
<%@ page import="kz.statbase.estat.spravgenerator2.model.CalendarCatalogOnForm" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'calendarCatalogOnForm.label', default: 'CalendarCatalogOnForm')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-calendarCatalogOnForm" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-calendarCatalogOnForm" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="calendarCatalogOnForm.theMyCreator.label" default="The My Creator" /></th>
					
						<th><g:message code="calendarCatalogOnForm.theActive.label" default="The Active" /></th>
					
						<g:sortableColumn property="theCalendarId" title="${message(code: 'calendarCatalogOnForm.theCalendarId.label', default: 'The Calendar Id')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${calendarCatalogOnFormInstanceList}" status="i" var="calendarCatalogOnFormInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${calendarCatalogOnFormInstance.id}">${fieldValue(bean: calendarCatalogOnFormInstance, field: "theMyCreator")}</g:link></td>
					
						<td>${calendarCatalogOnFormInstance.currentCatalog()}</td>
					
						<td>${fieldValue(bean: calendarCatalogOnFormInstance, field: "theCalendarId")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${calendarCatalogOnFormInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
