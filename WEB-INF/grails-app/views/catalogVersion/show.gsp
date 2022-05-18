
<%@ page import="kz.statbase.estat.spravgenerator2.model.CatalogVersion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'catalogCreation.label', default: 'CatalogVersion')}" />
		<title>Генерация справочника</title>
	</head>
	<body>
		<a href="#show-catalogVersion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="show-catalogVersion" class="content scaffold-show" role="main">
			<h1>Генерация справочника</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list catalogVersion">

                <g:if test="${catalogVersionInstance?.theClassVersionId}">
                    <li class="fieldcontain">
                        <span id="theClassVersionId-label" class="property-label"><g:message code="catalogVersion.theClassVersionId.label" default="Ид справочника" /></span>

                        <span class="property-value" aria-labelledby="theClassVersionId-label">${catalogVersionInstance?.theClassVersionId}</span>

                    </li>
                </g:if>

                <g:if test="${catalogVersionInstance?.fileName}">
                    <li class="fieldcontain">
                        <span id="fileName-label" class="property-label"><g:message code="catalogVersion.fileName.label" default="Имя файла" /></span>

                        <span class="property-value" aria-labelledby="fileName-label">
                                <g:link controller="catalogGetter"  action="loadCatalog" params="['catalogVersionId' : catalogVersionInstance.id]">${catalogVersionInstance?.fileName}</g:link>
                        </span>

                    </li>
                </g:if>

				<g:if test="${catalogVersionInstance?.dtOfPickingDb}">
				<li class="fieldcontain">
					<span id="dtOfPickingDb-label" class="property-label"><g:message code="catalogVersion.dtOfPickingDb.label" default="Дата генераций" /></span>
					
						<span class="property-value" aria-labelledby="dtOfPickingDb-label"><g:formatDate date="${catalogVersionInstance?.dtOfPickingDb}"  format="yyyy-MM-dd HH:mm"  /></span>
					
				</li>
				</g:if>

				<g:if test="${catalogVersionInstance?.isFrozen}">
				<li class="fieldcontain">
					<span id="isFrozen-label" class="property-label"><g:message code="catalogVersion.isFrozen.label" default="Is Frozen" /></span>
					
						<span class="property-value" aria-labelledby="isFrozen-label"><g:formatBoolean boolean="${catalogVersionInstance?.isFrozen}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${catalogVersionInstance?.myVersion}">
				<li class="fieldcontain">
					<span id="myVersion-label" class="property-label"><g:message code="catalogVersion.myVersion.label" default="Версия" /></span>
					
						<span class="property-value" aria-labelledby="myVersion-label">${catalogVersionInstance?.myVersion.description()}</span>
					
				</li>
				</g:if>
			
				<g:if test="${catalogVersionInstance?.state}">
				<li class="fieldcontain">
					<span id="state-label" class="property-label"><g:message code="catalogVersion.state.label" default="Состояние" /></span>
					
						<span class="property-value" aria-labelledby="state-label">${catalogVersionInstance?.state.description()}</span>
					
				</li>
				</g:if>
			
				<g:if test="${catalogVersionInstance?.theOptions}">
				<li class="fieldcontain">
					<span id="theOptions-label" class="property-label"><g:message code="catalogVersion.theOptions.label" default="Опций выбраные для генераций:" /></span>

						<g:each in="${catalogVersionInstance.theOptions.sort{it.id}}" var="t">
                            <span class="property-value" aria-labelledby="theOptions-label">
                            '${t?.theOption.description}'</span>
						</g:each>

				</li>
				</g:if>
			
			</ol>
            <g:if test="${catalogVersionInstance?.theLinkToCalendar}">
                <div id="usedInCalendarGuiId">
                    <g:render template="usedInCalendarCatalogs"  />
                </div>
            </g:if>
            <g:if test="${otherSprav}">
                <div id="otherSpravId">
                    <g:render template="otherSprav"  />
                </div>
            </g:if>


		</div>
	</body>
</html>
