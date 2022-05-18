
<%@ page import="com.keremet.normalizer.ejb.metav1.entity.FormVersionEntity" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'formVersionEntity.label', default: 'FormVersionEntity')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-formVersionEntity" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-formVersionEntity" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="formVersionId" title="${message(code: 'formVersionEntity.formVersionId.label', default: 'Form Version Id')}" />
					
						<g:sortableColumn property="begDate" title="${message(code: 'formVersionEntity.begDate.label', default: 'Beg Date')}" />
					
						<g:sortableColumn property="endDate" title="${message(code: 'formVersionEntity.endDate.label', default: 'End Date')}" />
					
						<g:sortableColumn property="isMultireport" title="${message(code: 'formVersionEntity.isMultireport.label', default: 'Is Multireport')}" />
					
						<g:sortableColumn property="isNullreport" title="${message(code: 'formVersionEntity.isNullreport.label', default: 'Is Nullreport')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${formVersionEntityInstanceList}" status="i" var="formVersionEntityInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${formVersionEntityInstance.id}">${fieldValue(bean: formVersionEntityInstance, field: "id")}</g:link></td>
					
						<td>${fieldValue(bean: formVersionEntityInstance, field: "begDate")}</td>
					
						<td>${fieldValue(bean: formVersionEntityInstance, field: "endDate")}</td>
					

						<td>${fieldValue(bean: formVersionEntityInstance, field: "isMultireport")}</td>
					
						<td>${fieldValue(bean: formVersionEntityInstance, field: "isNullreport")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${formVersionEntityInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
