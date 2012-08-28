<%@ page import="academia.Patrocinador" %>



<div class="fieldcontain ${hasErrors(bean: patrocinadorInstance, field: 'foto', 'error')} required">
	<label for="foto">
		<g:message code="patrocinador.foto.label" default="Foto" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="foto" name="foto" />
</div>

<div class="fieldcontain ${hasErrors(bean: patrocinadorInstance, field: 'nome', 'error')} ">
	<label for="nome">
		<g:message code="patrocinador.nome.label" default="Nome" />
		
	</label>
	<g:textField name="nome" value="${patrocinadorInstance?.nome}"/>
</div>

