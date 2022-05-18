
<%@ page import="com.keremet.normalizer.ejb.metav2.entity.MdicPeriodTypeEntity" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mdicPeriodTypeEntity.label', default: 'MdicPeriodTypeEntity')}" />
		<title>Список типов периодов</title>
	</head>
	<body>
		<a href="#list-mdicPeriodTypeEntity" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="list-mdicPeriodTypeEntity" class="content scaffold-list" role="main">
			<h1>Список типов периодов в БД 'Мета'</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
                        <g:sortableColumn property="id" title="${message(code: 'mdicPeriodTypeEntity.id.label', default: 'ИД')}" />

						<g:sortableColumn property="fullCode" title="${message(code: 'mdicPeriodTypeEntity.fullCode.label', default: 'Полный Код')}" />
						<g:sortableColumn property="nameKk" title="${message(code: 'mdicPeriodTypeEntity.nameKk.label', default: 'Имя (каз.)')}" />
					
						<g:sortableColumn property="nameRu" title="${message(code: 'mdicPeriodTypeEntity.nameRu.label', default: 'Имя (рус.)')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${mdicPeriodTypeEntityInstanceList}" status="i" var="mdicPeriodTypeEntityInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td>${fieldValue(bean: mdicPeriodTypeEntityInstance, field: "id")}</td>
						<td>${fieldValue(bean: mdicPeriodTypeEntityInstance, field: "fullCode")}</td>

						<td>${fieldValue(bean: mdicPeriodTypeEntityInstance, field: "nameKk")}</td>
					
						<td><g:link action="show" id="${mdicPeriodTypeEntityInstance.id}">${fieldValue(bean: mdicPeriodTypeEntityInstance, field: "nameRu")}</g:link></td>

					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${mdicPeriodTypeEntityInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
