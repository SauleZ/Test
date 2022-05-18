<div class="sg-table-caption">Справочник на Форме используеться в нижеследующих отчетных периодах:
</div>

<table>
    <thead>
    <tr>

        <g:sortableColumn property="theClassVersionId" title="Период сбора отчетов" />
        <g:sortableColumn property="descriptionRu" title="Активный сгенерированный справочник" />

    </tr>
    </thead>
    <tbody>
    <g:each in="${catalogOnFormInstance?.theCalendarCatalogOnForms.sort{it.theCalendar()?.dtBeg} }" status="i" var="calendar">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td><g:link controller="calendarCatalogOnForm"  action="show" id="${calendar.id}">${ calendar.theCalendar()?.info() }</g:link></td>

            <td>${calendar.currentCatalog()?.info() }</td>
        </tr>
    </g:each>
    </tbody>
</table>
