
<%@ page import="com.keremet.normalizer.ejb.metav2.entity.MdicPeriodKindlistEntity" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mdicPeriodKindlistEntity.label', default: 'MdicPeriodKindlistEntity')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-mdicPeriodKindlistEntity" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-mdicPeriodKindlistEntity" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="fullNameRu" title="${message(code: 'mdicPeriodKindlistEntity.fullNameRu.label', default: 'Fullname')}" />
					
						<g:sortableColumn property="fullNameKz" title="${message(code: 'mdicPeriodKindlistEntity.fullNameKz.label', default: 'Fullnamekz')}" />
					
						<g:sortableColumn property="kind" title="${message(code: 'mdicPeriodKindlistEntity.kind.label', default: 'Kind')}" />
					
						<th><g:message code="mdicPeriodKindlistEntity.mdicPeriod.label" default="Mdic Period" /></th>
					
						<g:sortableColumn property="name" title="${message(code: 'mdicPeriodKindlistEntity.name.label', default: 'NameRu')}" />
					
						<g:sortableColumn property="nameKz" title="${message(code: 'mdicPeriodKindlistEntity.nameKz.label', default: 'Namekz')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${mdicPeriodKindlistEntityInstanceList}" status="i" var="mdicPeriodKindlistEntityInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${mdicPeriodKindlistEntityInstance.id}">${fieldValue(bean: mdicPeriodKindlistEntityInstance, field: "fullNameRu")}</g:link></td>
					
						<td>${fieldValue(bean: mdicPeriodKindlistEntityInstance, field: "fullNameKz")}</td>
					
						<td>${fieldValue(bean: mdicPeriodKindlistEntityInstance, field: "kind")}</td>
					
						<td>${fieldValue(bean: mdicPeriodKindlistEntityInstance, field: "mdicPeriod")}</td>
					
						<td>${fieldValue(bean: mdicPeriodKindlistEntityInstance, field: "nameRu")}</td>
					
						<td>${fieldValue(bean: mdicPeriodKindlistEntityInstance, field: "nameKz")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${mdicPeriodKindlistEntityInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
