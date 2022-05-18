
<%@ page import="com.keremet.normalizer.ejb.metav1.entity.FormVersionEntity" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'formVersionEntity.label', default: 'FormVersionEntity')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-formVersionEntity" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-formVersionEntity" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list formVersionEntity">
			
				<g:if test="${formVersionEntityInstance?.id}">
				<li class="fieldcontain">
					<span id="formVersionId-label" class="property-label"><g:message code="formVersionEntity.formVersionId.label" default="Id" /></span>
					
						<span class="property-value" aria-labelledby="formVersionId-label"><g:fieldValue bean="${formVersionEntityInstance}" field="id"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${formVersionEntityInstance?.begDate}">
				<li class="fieldcontain">
					<span id="begDate-label" class="property-label"><g:message code="formVersionEntity.begDate.label" default="Beg Date" /></span>
					
						<span class="property-value" aria-labelledby="begDate-label"><g:fieldValue bean="${formVersionEntityInstance}" field="begDate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${formVersionEntityInstance?.endDate}">
				<li class="fieldcontain">
					<span id="endDate-label" class="property-label"><g:message code="formVersionEntity.endDate.label" default="End Date" /></span>
					
						<span class="property-value" aria-labelledby="endDate-label"><g:fieldValue bean="${formVersionEntityInstance}" field="endDate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${formVersionEntityInstance?.formdata}">
				<li class="fieldcontain">
					<span id="formdata-label" class="property-label"><g:message code="formVersionEntity.formdata.label" default="Formdata" /></span>
					
						<span class="property-value" aria-labelledby="formdata-label"><g:fieldValue bean="${formVersionEntityInstance}" field="formdata"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${formVersionEntityInstance?.isMultireport}">
				<li class="fieldcontain">
					<span id="isMultireport-label" class="property-label"><g:message code="formVersionEntity.isMultireport.label" default="Is Multireport" /></span>
					
						<span class="property-value" aria-labelledby="isMultireport-label"><g:fieldValue bean="${formVersionEntityInstance}" field="isMultireport"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${formVersionEntityInstance?.isNullreport}">
				<li class="fieldcontain">
					<span id="isNullreport-label" class="property-label"><g:message code="formVersionEntity.isNullreport.label" default="Is Nullreport" /></span>
					
						<span class="property-value" aria-labelledby="isNullreport-label"><g:fieldValue bean="${formVersionEntityInstance}" field="isNullreport"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${formVersionEntityInstance?.kcode}">
				<li class="fieldcontain">
					<span id="kcode-label" class="property-label"><g:message code="formVersionEntity.kcode.label" default="Kcode" /></span>
					
						<span class="property-value" aria-labelledby="kcode-label"><g:fieldValue bean="${formVersionEntityInstance}" field="kcode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${formVersionEntityInstance?.kdescription}">
				<li class="fieldcontain">
					<span id="kdescription-label" class="property-label"><g:message code="formVersionEntity.kdescription.label" default="Kdescription" /></span>
					
						<span class="property-value" aria-labelledby="kdescription-label"><g:fieldValue bean="${formVersionEntityInstance}" field="kdescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${formVersionEntityInstance?.kname}">
				<li class="fieldcontain">
					<span id="kname-label" class="property-label"><g:message code="formVersionEntity.kname.label" default="Kname" /></span>
					
						<span class="property-value" aria-labelledby="kname-label"><g:fieldValue bean="${formVersionEntityInstance}" field="kname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${formVersionEntityInstance?.ktitleConfirmed}">
				<li class="fieldcontain">
					<span id="ktitleConfirmed-label" class="property-label"><g:message code="formVersionEntity.ktitleConfirmed.label" default="Ktitle Confirmed" /></span>
					
						<span class="property-value" aria-labelledby="ktitleConfirmed-label"><g:fieldValue bean="${formVersionEntityInstance}" field="ktitleConfirmed"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${formVersionEntityInstance?.ktitleFormname}">
				<li class="fieldcontain">
					<span id="ktitleFormname-label" class="property-label"><g:message code="formVersionEntity.ktitleFormname.label" default="Ktitle Formname" /></span>
					
						<span class="property-value" aria-labelledby="ktitleFormname-label"><g:fieldValue bean="${formVersionEntityInstance}" field="ktitleFormname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${formVersionEntityInstance?.period}">
				<li class="fieldcontain">
					<span id="period-label" class="property-label"><g:message code="formVersionEntity.period.label" default="Period" /></span>
					
						<span class="property-value" aria-labelledby="period-label"><g:fieldValue bean="${formVersionEntityInstance}" field="period"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${formVersionEntityInstance?.pro}">
				<li class="fieldcontain">
					<span id="pro-label" class="property-label"><g:message code="formVersionEntity.pro.label" default="Pro" /></span>
					
						<span class="property-value" aria-labelledby="pro-label"><g:fieldValue bean="${formVersionEntityInstance}" field="pro"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${formVersionEntityInstance?.rcode}">
				<li class="fieldcontain">
					<span id="rcode-label" class="property-label"><g:message code="formVersionEntity.rcode.label" default="Rcode" /></span>
					
						<span class="property-value" aria-labelledby="rcode-label"><g:fieldValue bean="${formVersionEntityInstance}" field="rcode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${formVersionEntityInstance?.rdescription}">
				<li class="fieldcontain">
					<span id="rdescription-label" class="property-label"><g:message code="formVersionEntity.rdescription.label" default="Rdescription" /></span>
					
						<span class="property-value" aria-labelledby="rdescription-label"><g:fieldValue bean="${formVersionEntityInstance}" field="rdescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${formVersionEntityInstance?.repBeg}">
				<li class="fieldcontain">
					<span id="repBeg-label" class="property-label"><g:message code="formVersionEntity.repBeg.label" default="Rep Beg" /></span>
					
						<span class="property-value" aria-labelledby="repBeg-label"><g:fieldValue bean="${formVersionEntityInstance}" field="repBeg"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${formVersionEntityInstance?.repEnd}">
				<li class="fieldcontain">
					<span id="repEnd-label" class="property-label"><g:message code="formVersionEntity.repEnd.label" default="Rep End" /></span>
					
						<span class="property-value" aria-labelledby="repEnd-label"><g:fieldValue bean="${formVersionEntityInstance}" field="repEnd"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${formVersionEntityInstance?.rname}">
				<li class="fieldcontain">
					<span id="rname-label" class="property-label"><g:message code="formVersionEntity.rname.label" default="Rname" /></span>
					
						<span class="property-value" aria-labelledby="rname-label"><g:fieldValue bean="${formVersionEntityInstance}" field="rname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${formVersionEntityInstance?.rtitleConfirmed}">
				<li class="fieldcontain">
					<span id="rtitleConfirmed-label" class="property-label"><g:message code="formVersionEntity.rtitleConfirmed.label" default="Rtitle Confirmed" /></span>
					
						<span class="property-value" aria-labelledby="rtitleConfirmed-label"><g:fieldValue bean="${formVersionEntityInstance}" field="rtitleConfirmed"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${formVersionEntityInstance?.rtitleFormname}">
				<li class="fieldcontain">
					<span id="rtitleFormname-label" class="property-label"><g:message code="formVersionEntity.rtitleFormname.label" default="Rtitle Formname" /></span>
					
						<span class="property-value" aria-labelledby="rtitleFormname-label"><g:fieldValue bean="${formVersionEntityInstance}" field="rtitleFormname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${formVersionEntityInstance?.tableName}">
				<li class="fieldcontain">
					<span id="tableName-label" class="property-label"><g:message code="formVersionEntity.tableName.label" default="Table Name" /></span>
					
						<span class="property-value" aria-labelledby="tableName-label"><g:fieldValue bean="${formVersionEntityInstance}" field="tableName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${formVersionEntityInstance?.tp}">
				<li class="fieldcontain">
					<span id="tp-label" class="property-label"><g:message code="formVersionEntity.tp.label" default="Tp" /></span>
					
						<span class="property-value" aria-labelledby="tp-label"><g:fieldValue bean="${formVersionEntityInstance}" field="tp"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${formVersionEntityInstance?.xsdData}">
				<li class="fieldcontain">
					<span id="xsdData-label" class="property-label"><g:message code="formVersionEntity.xsdData.label" default="Xsd Data" /></span>
					
						<span class="property-value" aria-labelledby="xsdData-label"><g:fieldValue bean="${formVersionEntityInstance}" field="xsdData"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${formVersionEntityInstance?.xsdSdata}">
				<li class="fieldcontain">
					<span id="xsdSdata-label" class="property-label"><g:message code="formVersionEntity.xsdSdata.label" default="Xsd Sdata" /></span>
					
						<span class="property-value" aria-labelledby="xsdSdata-label"><g:fieldValue bean="${formVersionEntityInstance}" field="xsdSdata"/></span>
					
				</li>
				</g:if>
			
			</ol>
		</div>
	</body>
</html>
