
<%@ page import="kz.statbase.estat.spravgenerator2.model.CatalogVersion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'catalogVersion.label', default: 'CatalogVersion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-catalogVersion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-catalogVersion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="dtOfPickingDb" title="${message(code: 'catalogVersion.dtOfPickingDb.label', default: 'Dt Of Generation')}" />
					
						<g:sortableColumn property="fileName" title="${message(code: 'catalogVersion.fileName.label', default: 'File Name')}" />
					
						<g:sortableColumn property="isFrozen" title="${message(code: 'catalogVersion.isFrozen.label', default: 'Is Frozen')}" />
					
						<g:sortableColumn property="myVersion" title="${message(code: 'catalogVersion.myVersion.label', default: 'My Version')}" />
					
						<g:sortableColumn property="state" title="${message(code: 'catalogVersion.state.label', default: 'State')}" />
					
						<g:sortableColumn property="theClassVersionId" title="${message(code: 'catalogVersion.theClassVersionId.label', default: 'The Class Version Id')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${catalogVersionInstanceList}" status="i" var="catalogVersionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${catalogVersionInstance.id}">${fieldValue(bean: catalogVersionInstance, field: "dtOfPickingDb")}</g:link></td>
					
						<td>${fieldValue(bean: catalogVersionInstance, field: "fileName")}</td>
					
						<td><g:formatBoolean boolean="${catalogVersionInstance.isFrozen}" /></td>
					
						<td>${fieldValue(bean: catalogVersionInstance, field: "myVersion")}</td>
					
						<td>${fieldValue(bean: catalogVersionInstance, field: "state")}</td>
					
						<td>${fieldValue(bean: catalogVersionInstance, field: "theClassVersionId")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${catalogVersionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
