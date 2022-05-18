
    <div class="sg-table-caption">Справочники на форме:
    </div>


    <table>
        <thead>
        <tr>
            <g:sortableColumn property="theClassVersionId" title="ИД" />
            <g:sortableColumn property="descriptionRu" title="Название название" />

        </tr>
        </thead>
        <tbody>
        <g:each in="${spravList}" status="i" var="sprav">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link controller="catalogOnForm"  action="show" id="${sprav.id}" >${sprav.theClassVersionId }</g:link></td>

                <td>${fieldValue(bean: sprav, field: "descriptionRu")}</td>
            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="nav" role="navigation">
        <ul>
            <li>
                <g:remoteLink action="findCatalogsOnForm"  update="spravId" controller="metaAnalyzer"
                              elementId="findCatalogsOnForm"
                              params="${[idFormVersion : idFormVersion]}"  onComplete="\$.each( \$('.onUpdateSpravEvent') , function( index, value ) { value.click(); }); " >Найти справочники</g:remoteLink>
            </li>
        </ul>
    </div>



