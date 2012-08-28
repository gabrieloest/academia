<%@ page import="academia.Artigo" %>



<div class="fieldcontain ${hasErrors(bean: artigoInstance, field: 'conteudo', 'error')} ">
	<label for="conteudo">
		<g:message code="artigo.conteudo.label" default="Conteudo" />
		
	</label>
	<g:textField name="conteudo" value="${artigoInstance?.conteudo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: artigoInstance, field: 'emDestaque', 'error')} ">
	<label for="emDestaque">
		<g:message code="artigo.emDestaque.label" default="Em Destaque" />
		
	</label>
	<g:checkBox name="emDestaque" value="${artigoInstance?.emDestaque}" />
</div>

<div class="fieldcontain ${hasErrors(bean: artigoInstance, field: 'professor', 'error')} required">
	<label for="professor">
		<g:message code="artigo.professor.label" default="Professor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="professor" name="professor.id" from="${academia.Professor.list()}" optionKey="id" required="" value="${artigoInstance?.professor?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: artigoInstance, field: 'titulo', 'error')} ">
	<label for="titulo">
		<g:message code="artigo.titulo.label" default="Titulo" />
		
	</label>
	<g:textField name="titulo" value="${artigoInstance?.titulo}"/>
</div>

