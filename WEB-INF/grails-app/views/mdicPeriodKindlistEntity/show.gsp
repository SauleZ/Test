
<%@ page import="com.keremet.normalizer.ejb.metav2.entity.MdicPeriodKindlistEntity" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mdicPeriodKindlistEntity.label', default: 'MdicPeriodKindlistEntity')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-mdicPeriodKindlistEntity" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" controller="mdicPeriodTypeEntity" action="index">Список типов периодов</g:link></li>

			</ul>
		</div>
		<div id="show-mdicPeriodKindlistEntity" class="content scaffold-show" role="main">
			<h1>Тип периода и сам Период:</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list mdicPeriodKindlistEntity">

                <g:if test="${mdicPeriodKindlistEntityInstance?.kind}">
                    <li class="fieldcontain">
                        <span id="kind-label" class="property-label"><g:message code="mdicPeriodKindlistEntity.kind.label" default="Тип Периода" /></span>

                        <span class="property-value" aria-labelledby="kind-label">
                            <g:link controller="mdicPeriodTypeEntity" action="show" id="${periodType?.id}"><g:fieldValue bean="${periodType}" field="nameRu"/></g:link>
                        </span>

                    </li>
                </g:if>
                <g:if test="${mdicPeriodKindlistEntityInstance?.mdicPeriod}">
                    <li class="fieldcontain">
                        <span id="mdicPeriod-label" class="property-label"><g:message code="mdicPeriodKindlistEntity.mdicPeriod.label" default="и сам Период" /></span>

                        <span class="property-value" aria-labelledby="mdicPeriod-label">${mdicPeriodKindlistEntityInstance?.mdicPeriod?.info()}</span>
                        <%--                        <span class="property-value" aria-labelledby="mdicPeriod-label"><g:link controller="mdicPeriodEntity" action="show" id="${mdicPeriodKindlistEntityInstance?.mdicPeriod?.id}">${mdicPeriodKindlistEntityInstance?.mdicPeriod?.info()}</g:link></span>
                        --%>
                    </li>
                </g:if>

                <g:if test="${mdicPeriodKindlistEntityInstance?.fullNameRu}">
				<li class="fieldcontain">
					<span id="fullNameRu-label" class="property-label"><g:message code="mdicPeriodKindlistEntity.fullNameRu.label" default="Название (рус.)" /></span>
					
						<span class="property-value" aria-labelledby="fullNameRu-label"><g:fieldValue bean="${mdicPeriodKindlistEntityInstance}" field="fullNameRu"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${mdicPeriodKindlistEntityInstance?.fullNameKz}">
				<li class="fieldcontain">
					<span id="fullNameKz-label" class="property-label"><g:message code="mdicPeriodKindlistEntity.fullNameKz.label" default="Название (каз.)" /></span>
					
						<span class="property-value" aria-labelledby="fullNameKz-label"><g:fieldValue bean="${mdicPeriodKindlistEntityInstance}" field="fullNameKz"/></span>
					
				</li>
				</g:if>

                <g:if test="${mdicPeriodKindlistEntityInstance?.nameRu}">
                    <li class="fieldcontain">
                        <span id="name-label" class="property-label"><g:message code="mdicPeriodKindlistEntity.name.label" default="Имя (рус.)" /></span>

                        <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${mdicPeriodKindlistEntityInstance}" field="nameRu"/></span>

                    </li>
                </g:if>

                <g:if test="${mdicPeriodKindlistEntityInstance?.nameKz}">
                    <li class="fieldcontain">
                        <span id="nameKz-label" class="property-label"><g:message code="mdicPeriodKindlistEntity.nameKz.label" default="Имя (каз.)" /></span>

                        <span class="property-value" aria-labelledby="nameKz-label"><g:fieldValue bean="${mdicPeriodKindlistEntityInstance}" field="nameKz"/></span>

                    </li>
                </g:if>


			</ol>
            <div class="sg-table-caption">
                Формы при сборе которых данный Период <i>УЖЕ</i> используется :
            </div>

            <table>
                <thead>
                <tr>

                    <g:sortableColumn property="formVersionId" title="${message(code: 'mdicFormVersion.formVersionId.label', default: 'ИД')}" />
                    <g:sortableColumn property="rname" title="Краткое название" />
                    <g:sortableColumn property="rtitleFormname" title="Полное название" />
                    <g:sortableColumn property="rtitleFormname" title="Версия есть" />

                </tr>
                </thead>
                <tbody>
                <g:each in="${forms }" status="i" var="theForm">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td><g:link action="showStatFormType" controller="mdicFormVersion" id="${theForm.id}">${theForm.id}</g:link></td>

                        <td>${fieldValue(bean: theForm, field: "rname")}</td>
                        <td>${fieldValue(bean: theForm, field: "rtitleFormname")}</td>
                        <td> <g:if test ="${existedVersion?.contains(theForm.id)}" >  Да
                            </g:if>
                            <g:else>
                               <spam class="table-warring">Нет</spam>
                            </g:else>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
            <div class="sg-table-caption">
                Формы при сборе которых данный Период <i>'ВЕРОЯТНО'</i> должен  использоваться :
            </div>
            <table>
                <thead>
                <tr>
                    <g:sortableColumn property="formVersionId" title="${message(code: 'mdicFormVersion.formVersionId.label', default: 'ИД')}" />
                    <g:sortableColumn property="rname" title="Краткое название" />
                    <g:sortableColumn property="rtitleFormname" title="Полное название" />
                </tr>
                </thead>
                <tbody>
                <g:each in="${formsPossible }" status="i" var="theForm">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td><g:link action="showStatFormType" controller="mdicFormVersion" id="${theForm.id}">${theForm.id}</g:link></td>

                        <td>${fieldValue(bean: theForm, field: "rname")}</td>
                        <td>${fieldValue(bean: theForm, field: "rtitleFormname")}</td>
                    </tr>
                </g:each>
                </tbody>
            </table>

		</div>
	</body>
</html>
