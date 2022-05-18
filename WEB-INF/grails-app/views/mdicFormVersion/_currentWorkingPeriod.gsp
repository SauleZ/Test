<div class="sg-table-caption">Текущий рабочий период (на '<g:formatDate date="${dtCurrent}" format="yyyy-MM-dd HH:mm" />' ) сдачи отчетов:
</div>
<div class="sg-property-value" >${infoAboutCalendar} </div>

<div class="sg-table-caption">
    Используются нижеследующие сгенерированные справочники для текущего Периода :
</div>

<table>
    <thead>
    <tr>

        <g:sortableColumn property="theClassVersionId" title="ИД" />
        <g:sortableColumn property="descriptionRu" title="Название" />
        <g:sortableColumn property="dtGeneration" title="Дата формирования" />
        <g:sortableColumn property="jsFileName" title="js-файл" />
        <g:sortableColumn property="version" title="Версия" />

    </tr>
    </thead>
    <tbody>
       <g:each in="${calendarSpravList}" status="i" var="calendar">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td><g:link controller="calendarCatalogOnForm"  action="show" id="${calendar.id}">${ calendar.theMyCreator.theClassVersionId }</g:link></td>
            <td>${fieldValue(bean: calendar.theMyCreator , field: "descriptionRu")}</td>
            <td> <g:formatDate format="yyyy-MM-dd HH:mm" date="${calendar.currentCatalog()?.dtOfPickingDb}"/>  </td>
            <td>
                <g:if test="${calendar.currentCatalog()?.fileName}">
                    <g:link controller="catalogGetter"  action="loadCatalog" params="['catalogVersionId' : calendar.currentCatalog()?.id]">${calendar.currentCatalog().fileName}</g:link>
                </g:if>
                <g:else>
                    нет
                </g:else>
            </td>
            <td>${ (calendar.currentCatalog()) ? calendar.currentCatalog().myVersion.description() : "нет"  }</td>
        </tr>
    </g:each>
    </tbody>
</table>


