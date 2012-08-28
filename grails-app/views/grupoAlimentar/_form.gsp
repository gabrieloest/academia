<%@ page import="academia.GrupoAlimentar" %>



<div class="fieldcontain ${hasErrors(bean: grupoAlimentarInstance, field: 'descricao', 'error')} ">
	<label for="descricao">
		<g:message code="grupoAlimentar.descricao.label" default="Descricao" />
		
	</label>
	<g:textField name="descricao" value="${grupoAlimentarInstance?.descricao}"/>
</div>

