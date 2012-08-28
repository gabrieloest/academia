<%@ page import="academia.ConjuntoDieta" %>



<div class="fieldcontain ${hasErrors(bean: conjuntoDietaInstance, field: 'alimento', 'error')} required">
	<label for="alimento">
		<g:message code="conjuntoDieta.alimento.label" default="Alimento" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="alimento" name="alimento.id" from="${academia.Alimento.list()}" optionKey="id" required="" value="${conjuntoDietaInstance?.alimento?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: conjuntoDietaInstance, field: 'dieta', 'error')} required">
	<label for="dieta">
		<g:message code="conjuntoDieta.dieta.label" default="Dieta" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="dieta" name="dieta.id" from="${academia.Dieta.list()}" optionKey="id" required="" value="${conjuntoDietaInstance?.dieta?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: conjuntoDietaInstance, field: 'quantidade', 'error')} ">
	<label for="quantidade">
		<g:message code="conjuntoDieta.quantidade.label" default="Quantidade" />
		
	</label>
	<g:textField name="quantidade" value="${conjuntoDietaInstance?.quantidade}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: conjuntoDietaInstance, field: 'refeicao', 'error')} ">
	<label for="refeicao">
		<g:message code="conjuntoDieta.refeicao.label" default="Refeicao" />
		
	</label>
	<g:textField name="refeicao" value="${conjuntoDietaInstance?.refeicao}"/>
</div>

