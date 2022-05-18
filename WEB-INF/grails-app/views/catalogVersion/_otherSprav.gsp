<div class="sg-table-caption">Показать разницу с другими Генерациями этого Справочника:
</div>


<table>
    <thead>
    <tr>
        <g:sortableColumn property="id" title="Ид справочники" />
        <g:sortableColumn property="dtOfPickingDb" title="Сравнить с этой Дата сбора" />

    </tr>
    </thead>
    <tbody>
    <g:each in="${otherSprav.sort{it.id}}" status="i" var="theOtherSprav">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <td><g:link controller="catalogVersion"  action="show" id="${theOtherSprav.id}">${ theOtherSprav.id }</g:link></td>
            <td><g:link controller="catalogVersion"  action="findDiffBetweenJS"  target="_blank" params="[id1: catalogVersionInstance.id , id2 : theOtherSprav.id]" >
                <g:formatDate format="yyyy-MM-dd HH:mm" date="${theOtherSprav?.dtOfPickingDb}"/> </g:link></td>
        </tr>
    </g:each>

    </tbody>
</table>
