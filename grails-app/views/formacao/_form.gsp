<%@ page import="academia.Formacao" %>



<div class="fieldcontain ${hasErrors(bean: formacaoInstance, field: 'descricao', 'error')} ">
	<label for="descricao">
		<g:message code="formacao.descricao.label" default="Descricao" />
		
	</label>
	<g:textField name="descricao" value="${formacaoInstance?.descricao}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: formacaoInstance, field: 'fim', 'error')} required">
	<label for="fim">
		<g:message code="formacao.fim.label" default="Fim" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fim" precision="day"  value="${formacaoInstance?.fim}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: formacaoInstance, field: 'inicio', 'error')} required">
	<label for="inicio">
		<g:message code="formacao.inicio.label" default="Inicio" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="inicio" precision="day"  value="${formacaoInstance?.inicio}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: formacaoInstance, field: 'titulo', 'error')} ">
	<label for="titulo">
		<g:message code="formacao.titulo.label" default="Titulo" />
		
	</label>
	<g:textField name="titulo" value="${formacaoInstance?.titulo}"/>
</div>

