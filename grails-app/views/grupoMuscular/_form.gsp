<%@ page import="academia.GrupoMuscular" %>



<div class="fieldcontain ${hasErrors(bean: grupoMuscularInstance, field: 'descricao', 'error')} ">
	<label for="descricao">
		<g:message code="grupoMuscular.descricao.label" default="Descricao" />
		
	</label>
	<g:textField name="descricao" value="${grupoMuscularInstance?.descricao}"/>
</div>

