
<%@ page import="com.keremet.normalizer.ejb.metav2.entity.MdicFormVersion" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'mdicFormVersion.label', default: 'MdicFormVersion')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<a href="#list-mdicFormVersion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index">Список отраслей</g:link></li>
        <li><g:link class="list" action="showBranch" id="${mdicFormVersionInstance.forFormVersionId.id}" >${mdicFormVersionInstance.forFormVersionId.rname}</g:link></li>

    </ul>
</div>
<div id="list-mdicFormVersion" class="content scaffold-list" role="main">
    <g:if test="${!(flash.error)}">
        <h1>Форма : <span>'${mdicFormVersionInstance.rname}'</span> </h1>
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

            <g:if test="${mdicFormVersionInstance?.periodType}">
                <li class="fieldcontain">
                    <span id="periodType-label" class="property-label"><g:message code="mdicFormVersion.periodType.label" default="Периодичность сбора:" /></span>

                    <span class="property-value" aria-labelledby="periodType-label">${mdicFormVersionInstance?.periodType?.info()}</span>

                </li>
            </g:if>
        </ol>

        <div id="childForms-label" class="property-label"><g:message code="mdicFormVersion.childForms.label" default="Версий формы:" /></div>
        <br />
        <table>
            <thead>
            <tr>

                <g:sortableColumn property="formVersionId" title="${message(code: 'mdicFormVersion.formVersionId.label', default: 'ИД')}" />
                <g:sortableColumn property="rname" title="Краткое название" />
                <g:sortableColumn property="repBeg" title="Начала периода" />
                <g:sortableColumn property="repEnd" title="Конец периода" />

            </tr>
            </thead>
            <tbody>
            <g:each in="${mdicFormVersionInstance.mdicFormVersionCollection.findAll{ it.deleted !=1}.sort{ it.repBeg} }" status="i" var="statFormVersion">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td><g:link action="show" id="${statFormVersion.id}">${statFormVersion.id}</g:link></td>

                    <td>${fieldValue(bean: statFormVersion, field: "rname")}</td>
                    <td>${statFormVersion.repBeg}</td>
                    <td>${statFormVersion.repEnd}</td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </g:if>
    <g:else>
        <div class="errors" role="status">${flash.error}</div>
    </g:else>

</div>
</body>
</html>
