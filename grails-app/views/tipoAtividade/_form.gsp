<%@ page import="academia.TipoAtividade" %>



<div class="fieldcontain ${hasErrors(bean: tipoAtividadeInstance, field: 'descricao', 'error')} ">
	<label for="descricao">
		<g:message code="tipoAtividade.descricao.label" default="Descricao" />
		
	</label>
	<g:textField name="descricao" value="${tipoAtividadeInstance?.descricao}"/>
</div>

