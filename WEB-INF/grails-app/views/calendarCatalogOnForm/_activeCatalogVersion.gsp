<span id="theActive-label" class="property-label"><g:message code="calendarCatalogOnForm.theActive.label" default="Активный сгенерированный справочник" /></span>

<span class="property-value" aria-labelledby="theActive-label"><g:link controller="catalogVersion" action="show" id="${calendarCatalogOnFormInstance?.currentCatalog()?.id}">${calendarCatalogOnFormInstance?.currentCatalog()?.info()}</g:link></span>
