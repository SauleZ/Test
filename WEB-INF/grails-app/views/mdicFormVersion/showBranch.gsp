
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

    </ul>
</div>
<div id="list-mdicFormVersion" class="content scaffold-list" role="main">
    <g:if test="${!(flash.error)}">
        <h1>Отрасль : <span>'${mdicFormVersionInstance.rname}'</span> </h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <table>
            <thead>
            <tr>

                <g:sortableColumn property="formVersionId" title="${message(code: 'mdicFormVersion.formVersionId.label', default: 'ИД')}" />
                <g:sortableColumn property="rname" title="Краткое название" />
                <g:sortableColumn property="rtitleFormname" title="Полное название" />

            </tr>
            </thead>
            <tbody>
            <g:each in="${mdicFormVersionInstance.mdicFormVersionCollection.findAll{ it.tp==1}. sort{ it.rname} }" status="i" var="statFormType">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td><g:link action="showStatFormType" id="${statFormType.id}">${statFormType.id}</g:link></td>

                    <td>${fieldValue(bean: statFormType, field: "rname")}</td>
                    <td>${fieldValue(bean: statFormType, field: "rtitleFormname")}</td>
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
