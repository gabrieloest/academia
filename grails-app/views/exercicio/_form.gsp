<%@ page import="academia.Exercicio" %>



<div class="fieldcontain ${hasErrors(bean: exercicioInstance, field: 'descricao', 'error')} ">
	<label for="descricao">
		<g:message code="exercicio.descricao.label" default="Descricao" />
		
	</label>
	<g:textField name="descricao" value="${exercicioInstance?.descricao}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: exercicioInstance, field: 'grupoMuscular', 'error')} required">
	<label for="grupoMuscular">
		<g:message code="exercicio.grupoMuscular.label" default="Grupo Muscular" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="grupoMuscular" name="grupoMuscular.id" from="${academia.GrupoMuscular.list()}" optionKey="id" required="" value="${exercicioInstance?.grupoMuscular?.id}" class="many-to-one"/>
</div>

