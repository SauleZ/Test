
<%@ page import="com.keremet.normalizer.ejb.class1.ClassVersion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'classVersion.label', default: 'ClassVersion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-classVersion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-classVersion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="id" title="${message(code: 'classVersion.classificatorId.Id', default: 'Id')}" />
						<g:sortableColumn property="classificatorId" title="${message(code: 'classVersion.classificatorId.label', default: 'Classificator Id')}" />
					
						<g:sortableColumn property="code" title="${message(code: 'classVersion.code.label', default: 'Code')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'classVersion.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="rname" title="${message(code: 'classVersion.rname.label', default: 'Rname')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${classVersionInstanceList}" status="i" var="classVersionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${classVersionInstance.id}">${fieldValue(bean: classVersionInstance, field: "id")}</g:link></td>
						<td>${fieldValue(bean: classVersionInstance, field: "classificatorId")}</td>
					
						<td>${fieldValue(bean: classVersionInstance, field: "code")}</td>
					
						<td>${fieldValue(bean: classVersionInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: classVersionInstance, field: "rname")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${classVersionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
