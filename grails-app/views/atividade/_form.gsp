<%@ page import="academia.Atividade" %>



<div class="fieldcontain ${hasErrors(bean: atividadeInstance, field: 'descricao', 'error')} ">
	<label for="descricao">
		<g:message code="atividade.descricao.label" default="Descricao" />
		
	</label>
	<g:textField name="descricao" value="${atividadeInstance?.descricao}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: atividadeInstance, field: 'fim', 'error')} required">
	<label for="fim">
		<g:message code="atividade.fim.label" default="Fim" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fim" precision="day"  value="${atividadeInstance?.fim}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: atividadeInstance, field: 'inicio', 'error')} required">
	<label for="inicio">
		<g:message code="atividade.inicio.label" default="Inicio" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="inicio" precision="day"  value="${atividadeInstance?.inicio}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: atividadeInstance, field: 'professor', 'error')} required">
	<label for="professor">
		<g:message code="atividade.professor.label" default="Professor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="professor" name="professor.id" from="${academia.Professor.list()}" optionKey="id" required="" value="${atividadeInstance?.professor?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: atividadeInstance, field: 'tipo', 'error')} required">
	<label for="tipo">
		<g:message code="atividade.tipo.label" default="Tipo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipo" name="tipo.id" from="${academia.TipoAtividade.list()}" optionKey="id" required="" value="${atividadeInstance?.tipo?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: atividadeInstance, field: 'titulo', 'error')} ">
	<label for="titulo">
		<g:message code="atividade.titulo.label" default="Titulo" />
		
	</label>
	<g:textField name="titulo" value="${atividadeInstance?.titulo}"/>
</div>

