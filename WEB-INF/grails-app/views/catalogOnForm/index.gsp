
<%@ page import="kz.statbase.estat.spravgenerator2.model.CatalogOnForm" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'catalogOnForm.label', default: 'CatalogOnForm')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-catalogOnForm" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-catalogOnForm" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="descriptionRu" title="${message(code: 'catalogOnForm.descriptionRu.label', default: 'Description Ru')}" />
					
						<g:sortableColumn property="dtCreate" title="${message(code: 'catalogOnForm.dtCreate.label', default: 'Dt Create')}" />
					
						<g:sortableColumn property="theClassVersionId" title="${message(code: 'catalogOnForm.theClassVersionId.label', default: 'The Class Version Id')}" />
					
						<g:sortableColumn property="theFormId" title="${message(code: 'catalogOnForm.theFormId.label', default: 'The Form Id')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${catalogOnFormInstanceList}" status="i" var="catalogOnFormInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${catalogOnFormInstance.id}">${fieldValue(bean: catalogOnFormInstance, field: "descriptionRu")}</g:link></td>
					
						<td><g:formatDate date="${catalogOnFormInstance.dtCreate}" /></td>
					
						<td>${fieldValue(bean: catalogOnFormInstance, field: "theClassVersionId")}</td>
					
						<td>${fieldValue(bean: catalogOnFormInstance, field: "theFormId")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${catalogOnFormInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
