<%@ page import="academia.Serie" %>



<div class="fieldcontain ${hasErrors(bean: serieInstance, field: 'professor', 'error')} ">
	<label for="professor">
		<g:message code="serie.professor.label" default="Professor" />
		
	</label>
	<g:select id="professor" name="professor.id" from="${academia.Professor.list()}" optionKey="id" value="${serieInstance?.professor?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: serieInstance, field: 'aluno', 'error')} required">
	<label for="aluno">
		<g:message code="serie.aluno.label" default="Aluno" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="aluno" name="aluno.id" from="${academia.Aluno.list()}" optionKey="id" required="" value="${serieInstance?.aluno?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: serieInstance, field: 'conjuntos', 'error')} ">
	<label for="conjuntos">
		<g:message code="serie.conjuntos.label" default="Conjuntos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${serieInstance?.conjuntos?}" var="c">
    <li><g:link controller="conjuntoSerie" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="conjuntoSerie" action="create" params="['serie.id': serieInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'conjuntoSerie.label', default: 'ConjuntoSerie')])}</g:link>
</li>
</ul>

</div>

