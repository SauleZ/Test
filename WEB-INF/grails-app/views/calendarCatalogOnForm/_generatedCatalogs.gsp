
<div class="sg-table-caption">Сгенерированные справочники используемые на Форме на этот Период:
</div>

<table>
    <thead>
    <tr>
        <g:sortableColumn property="theClassVersionId" title="ИД" />
        <g:sortableColumn property="dtOfPickingDb" title="Дата формирования" />
        <g:sortableColumn property="calcDtBeginCollect" title="Начало " />
        <g:sortableColumn property="calcDtBeginCollect" title="Завершение" />
        <g:sortableColumn property="jsFileName" title="js-файл" />
        <g:sortableColumn property="version" title="Версия" />
        <g:sortableColumn property="actived" title="Активный" />

    </tr>
    </thead>
    <tbody>
    <g:each in="${calendarCatalogOnFormInstance?.theLinkToCatalogs.sort{it.calcDtBeginCollect()}}" status="i" var="linkCalendar">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td><g:link controller="catalogVersion"  action="show" id="${linkCalendar.theCatalog?.id}">${ linkCalendar.theCatalog?.id }</g:link></td>
            <td> <g:formatDate format="yyyy-MM-dd HH:mm" date="${linkCalendar.theCatalog?.dtOfPickingDb}"/>  </td>
            <td> <g:formatDate format="yyyy-MM-dd HH:mm" date="${linkCalendar.calcDtBeginCollect()}"/>  </td>
            <td> <g:formatDate format="yyyy-MM-dd HH:mm" date="${linkCalendar.calcDtEndCollect()}"/>  </td>
            <td>
                <g:if test="${linkCalendar.theCatalog?.fileName}">
                    <g:link controller="catalogGetter"  action="loadCatalog" params="['catalogVersionId' : linkCalendar.theCatalog?.id]">${linkCalendar.theCatalog?.fileName}</g:link>
                </g:if>
                <g:else>
                    нет
                </g:else>
            </td>
            <td>${ (linkCalendar.theCatalog?.myVersion) ? linkCalendar.theCatalog?.myVersion?.description() : "нет"  }</td>
            <td>${ (linkCalendar.isActive) ? "да" : "нет"  }</td>
        </tr>
    </g:each>
    </tbody>
</table>
