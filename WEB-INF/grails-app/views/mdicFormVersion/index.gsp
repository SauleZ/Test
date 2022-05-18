
<%@ page import="com.keremet.normalizer.ejb.metav2.entity.MdicFormVersion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mdicFormVersion.label', default: 'MdicFormVersion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
        <asset:javascript src="metaServiceWork.js"/>
    </head>
	<body>
		<a href="#list-mdicFormVersion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" controller="mdicPeriodTypeEntity" action="index">Список типов периодов</g:link></li>
			</ul>
		</div>
		<div id="list-mdicFormVersion" class="content scaffold-list" role="main">
			<h1>Отрасли:</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="formVersionId" title="${message(code: 'mdicFormVersion.formVersionId.label', default: 'ИД')}" />
                        <g:sortableColumn property="rname" title="Краткое название" />

					</tr>
				</thead>
				<tbody>
				<g:each in="${mdicFormVersionInstanceList}" status="i" var="mdicFormVersionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="showBranch" id="${mdicFormVersionInstance.id}">${mdicFormVersionInstance.id}</g:link></td>

                        <td>${fieldValue(bean: mdicFormVersionInstance, field: "rname")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${mdicFormVersionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
