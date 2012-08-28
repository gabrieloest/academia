<%@ page import="academia.Alimento" %>



<div class="fieldcontain ${hasErrors(bean: alimentoInstance, field: 'calorias', 'error')} required">
	<label for="calorias">
		<g:message code="alimento.calorias.label" default="Calorias" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="calorias" required="" value="${fieldValue(bean: alimentoInstance, field: 'calorias')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alimentoInstance, field: 'nome', 'error')} ">
	<label for="nome">
		<g:message code="alimento.nome.label" default="Nome" />
		
	</label>
	<g:textField name="nome" value="${alimentoInstance?.nome}"/>
</div>

