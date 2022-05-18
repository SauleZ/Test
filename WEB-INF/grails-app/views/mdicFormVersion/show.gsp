
<%@ page import="com.keremet.normalizer.ejb.metav2.entity.MdicFormVersion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mdicFormVersion.label', default: 'MdicFormVersion')}" />
		<title>Версия формы</title>
        <r:require module="jquery"/>
        <asset:javascript src="metaServiceWork.js"/>
	</head>
	<body>
		<a href="#show-mdicFormVersion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list"  action="index">Список отраслей</g:link></li>
                <li><g:link class="list"  elementId="linkBranchId" action="showBranch" id="${mdicFormVersionInstance?.forFormVersionId?.forFormVersionId?.id}" >Отрасль</g:link></li>
                <li><g:link class="list"  controller="mdicFormVersion" action="showStatFormType" id="${mdicFormVersionInstance?.forFormVersionId?.id}">${mdicFormVersionInstance?.forFormVersionId?.rname}</g:link></li>

			</ul>
		</div>
		<div id="show-mdicFormVersion" class="content scaffold-show" role="main">
		<div id="show-mdicFormVersion" class="content scaffold-show" role="main">
        <g:if test="${!(flash.error)}">
            <h1>Версия формы:</h1>
			<g:if test="${flash.message}">
			    <div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list mdicFormVersion">
			
				<g:if test="${mdicFormVersionInstance?.id}">
				<li class="fieldcontain">
					    <span id="formVersionId-label" class="property-label"><g:message code="mdicFormVersion.formVersionId.label" default="Ид:" /></span>
						<span class="property-value" aria-labelledby="formVersionId-label">${mdicFormVersionInstance.id}</span>
					
				</li>
				</g:if>
			
				<g:if test="${mdicFormVersionInstance?.begDate}">
				<li class="fieldcontain">
					<span id="begDate-label" class="property-label"><g:message code="mdicFormVersion.begDate.label" default="Дата начала:" /></span>
					
						<span class="property-value" aria-labelledby="begDate-label"><g:formatDate date="${mdicFormVersionInstance?.begDate}" format="yyyy-MM-dd" /></span>
					
				</li>
				</g:if>

                <g:if test="${mdicFormVersionInstance?.endDate}">
                    <li class="fieldcontain">
                        <span id="endDate-label" class="property-label"><g:message code="mdicFormVersion.endDate.label" default="Дата конца:" /></span>

                        <span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${mdicFormVersionInstance?.endDate}" format="yyyy-MM-dd" /></span>

                    </li>
                </g:if>

				<g:if test="${mdicFormVersionInstance?.deleted}">
				<li class="fieldcontain">
					<span id="deleted-label" class="property-label"><g:message code="mdicFormVersion.deleted.label" default="Удалена:" /></span>
					
						<span class="property-value" aria-labelledby="deleted-label">${ (mdicFormVersionInstance.deleted ==1) ? "да" : "нет"  }/></span>
					
				</li>
				</g:if>

				<g:if test="${mdicFormVersionInstance?.forFormVersionId}">
				<li class="fieldcontain">
					<span id="forFormVersionId-label" class="property-label"><g:message code="mdicFormVersion.forFormVersionId.label" default="Родительская форма:" /></span>
					
						<span class="property-value" aria-labelledby="forFormVersionId-label"><g:link controller="mdicFormVersion" action="showStatFormType" id="${mdicFormVersionInstance?.forFormVersionId?.id}">${mdicFormVersionInstance?.forFormVersionId?.info()}</g:link></span>
					
				</li>
				</g:if>

				<g:if test="${mdicFormVersionInstance?.kname}">
				<li class="fieldcontain">
					<span id="kname-label" class="property-label"><g:message code="mdicFormVersion.kname.label" default="Описание (каз.):" /></span>
					
						<span class="property-value" aria-labelledby="kname-label"><g:fieldValue bean="${mdicFormVersionInstance}" field="kname"/></span>
					
				</li>
				</g:if>

				<g:if test="${mdicFormVersionInstance?.ktitleFormname}">
				<li class="fieldcontain">
					<span id="ktitleFormname-label" class="property-label"><g:message code="mdicFormVersion.ktitleFormname.label" default="Описание полное (каз.):" /></span>
					
						<span class="property-value" aria-labelledby="ktitleFormname-label"><g:fieldValue bean="${mdicFormVersionInstance}" field="ktitleFormname"/></span>
					
				</li>
				</g:if>

                <g:if test="${mdicFormVersionInstance?.rname}">
                    <li class="fieldcontain">
                        <span id="rname-label" class="property-label"><g:message code="mdicFormVersion.rname.label" default="Описание (рус.):" /></span>

                        <span class="property-value" aria-labelledby="rname-label"><g:fieldValue bean="${mdicFormVersionInstance}" field="rname"/></span>

                    </li>
                </g:if>

                <g:if test="${mdicFormVersionInstance?.rtitleFormname}">
                    <li class="fieldcontain">
                        <span id="rtitleFormname-label" class="property-label"><g:message code="mdicFormVersion.rtitleFormname.label" default="Описание полное (рус.):" /></span>

                        <span class="property-value" aria-labelledby="rtitleFormname-label"><g:fieldValue bean="${mdicFormVersionInstance}" field="rtitleFormname"/></span>

                    </li>
                </g:if>


                <g:if test="${mdicFormVersionInstance?.period}">
				<li class="fieldcontain">
					<span id="period-label" class="property-label"><g:message code="mdicFormVersion.period.label" default="Период:" /></span>
					
						<span class="property-value" aria-labelledby="period-label"><g:fieldValue bean="${mdicFormVersionInstance}" field="period"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${mdicFormVersionInstance?.repBeg}">
				<li class="fieldcontain">
					<span id="repBeg-label" class="property-label"><g:message code="mdicFormVersion.repBeg.label" default="Дата начала отчетов:" /></span>
					
						<span class="property-value" aria-labelledby="repBeg-label">${mdicFormVersionInstance.repBeg}</span>
					
				</li>
				</g:if>
			
				<g:if test="${mdicFormVersionInstance?.repEnd}">
				<li class="fieldcontain">
					<span id="repEnd-label" class="property-label"><g:message code="mdicFormVersion.repEnd.label" default="Дата конца отчетов:" /></span>
					
						<span class="property-value" aria-labelledby="repEnd-label">${mdicFormVersionInstance.repEnd}</span>
					
				</li>
				</g:if>
			
				<g:if test="${mdicFormVersionInstance?.tableName}">
				<li class="fieldcontain">
					<span id="tableName-label" class="property-label"><g:message code="mdicFormVersion.tableName.label" default="Table Name" /></span>
					
						<span class="property-value" aria-labelledby="tableName-label"><g:fieldValue bean="${mdicFormVersionInstance}" field="tableName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${mdicFormVersionInstance?.tp}">
				<li class="fieldcontain">
					<span id="tp-label" class="property-label"><g:message code="mdicFormVersion.tp.label" default="Тип" /></span>
					
					<span class="property-value" aria-labelledby="tp-label"><g:fieldValue bean="${mdicFormVersionInstance}" field="tp"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${mdicFormVersionInstance?.userId}">
				<li class="fieldcontain">
					    <span id="userId-label" class="property-label"><g:message code="mdicFormVersion.userId.label" default="Пользователь:" /></span>
					
						<span class="property-value" aria-labelledby="userId-label"><g:fieldValue bean="${mdicFormVersionInstance}" field="userId"/></span>
					
				</li>
				</g:if>
			
			</ol>

            <div id="spravId">
                <g:render template="spravOnFromVersion" model="${[ spravList: spravList, idFormVersion : mdicFormVersionInstance.id ]}" />
            </div>


            <g:if test="${useCurrentPeriod}">
                <div id="workingPeriodId">
                    <g:render template="currentWorkingPeriod"  />
                </div>
                <div class="nav" role="navigation">
                    <ul>
                        <li>
                            <g:remoteLink action="findCurrentCalendarCatalogOnForm"  update="workingPeriodId" controller="metaAnalyzer"
                                 elementId="findCurrentCalendarCatalogOnForm"  class="onUpdateSpravEvent" params="${[idFormVersion : mdicFormVersionInstance.id]}">Обновить cправочники</g:remoteLink>
                        </li>
                    </ul>
                </div>


            </g:if>

            <g:if test="${useNextPeriod}">
                <div id="nextPeriodId">
                    <g:render template="nextWorkingPeriod"  />
                </div>
                <div class="nav" role="navigation">
                    <ul>
                        <li>
                            <g:remoteLink action="findNextCalendarCatalogOnForm"  update="nextPeriodId" controller="metaAnalyzer"
                                          elementId="findNextCalendarCatalogOnForm" class="onUpdateSpravEvent" params="${[idFormVersion : mdicFormVersionInstance.id]}">Обновить cправочники</g:remoteLink>
                        </li>
                    </ul>
                </div>
            </g:if>
        </g:if>
            <g:else>
                <div class="errors" role="status">${flash.error}</div>
            </g:else>

		</div>
	</body>
</html>
