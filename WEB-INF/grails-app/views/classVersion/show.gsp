
<%@ page import="com.keremet.normalizer.ejb.class1.ClassVersion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'classVersion.label', default: 'ClassVersion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-classVersion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-classVersion" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list classVersion">
			
				<g:if test="${classVersionInstance?.classificatorId}">
				<li class="fieldcontain">
					<span id="classificatorId-label" class="property-label"><g:message code="classVersion.classificatorId.label" default="Classificator Id" /></span>
					
						<span class="property-value" aria-labelledby="classificatorId-label"><g:fieldValue bean="${classVersionInstance}" field="classificatorId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${classVersionInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="classVersion.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${classVersionInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${classVersionInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="classVersion.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${classVersionInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${classVersionInstance?.rname}">
				<li class="fieldcontain">
					<span id="rname-label" class="property-label"><g:message code="classVersion.rname.label" default="Rname" /></span>
					
						<span class="property-value" aria-labelledby="rname-label"><g:fieldValue bean="${classVersionInstance}" field="rname"/></span>
					
				</li>
				</g:if>
			
			</ol>
		</div>
	</body>
</html>
