<div class="sg-table-caption">Формы с разными Периодами сбора использующие эту Генерацию Справочника:
</div>

<table>
    <thead>
    <tr>
        <g:sortableColumn property="formVersionId" title="Версия формы Ид" />
        <g:sortableColumn property="formDescription" title="Название формы" />
        <g:sortableColumn property="period" title="Отчетный Период" />
        <g:sortableColumn property="beginCollect" title="Начало использования" />
        <g:sortableColumn property="endCollect" title="Завершиние исп." />

    </tr>
    </thead>
    <tbody>
    <g:each in="${catalogVersionInstance?.theLinkToCalendar.sort{ catalogVersionInstance?.theLinkToCalendar.sort{ 100000*( it.theCalendarOnForm?.theMyCreator?.theForm()?.forFormVersionId?.id ?:1) + (it.theCalendarOnForm?.theMyCreator?.theFormId ?:0)  } } }" status="i" var="theLink">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <td><g:link controller="mdicFormVersion"  action="show" id="${theLink.theCalendarOnForm?.theMyCreator?.theFormId}">${ theLink.theCalendarOnForm?.theMyCreator?.theFormId }</g:link></td>
            <td> ${ (theLink.theCalendarOnForm?.theMyCreator?.theForm()?.forFormVersionId?.info()) ?: "нет" }  </td>
            <td> <g:link controller="calendarCatalogOnForm"  action="show" id="${theLink.theCalendarOnForm?.id}"> ${ (theLink.theCalendarOnForm?.theCalendar()?.mdicPeriodKind?.mdicPeriod?.info() ) ?: "нет"  }</g:link></td>
            <td> <g:formatDate date="${theLink.calcDtBeginCollect() }" format="yyyy-MM-dd HH:mm" /> </td>
            <td> <g:formatDate date="${theLink.calcDtEndCollect() }" format="yyyy-MM-dd HH:mm"  /></td>
        </tr>
    </g:each>

    </tbody>
</table>
