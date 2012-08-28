<%@ page import="academia.Curriculo" %>



<div class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'atividades', 'error')} ">
	<label for="atividades">
		<g:message code="curriculo.atividades.label" default="Atividades" />
		
	</label>
	<g:select name="atividades" from="${academia.Atividade.list()}" multiple="multiple" optionKey="id" size="5" value="${curriculoInstance?.atividades*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: curriculoInstance, field: 'formacoes', 'error')} ">
	<label for="formacoes">
		<g:message code="curriculo.formacoes.label" default="Formacoes" />
		
	</label>
	<g:select name="formacoes" from="${academia.Formacao.list()}" multiple="multiple" optionKey="id" size="5" value="${curriculoInstance?.formacoes*.id}" class="many-to-many"/>
</div>

