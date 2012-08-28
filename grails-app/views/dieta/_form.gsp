<%@ page import="academia.Dieta" %>



<div class="fieldcontain ${hasErrors(bean: dietaInstance, field: 'aluno', 'error')} required">
	<label for="aluno">
		<g:message code="dieta.aluno.label" default="Aluno" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="aluno" name="aluno.id" from="${academia.Aluno.list()}" optionKey="id" required="" value="${dietaInstance?.aluno?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dietaInstance, field: 'conjuntos', 'error')} ">
	<label for="conjuntos">
		<g:message code="dieta.conjuntos.label" default="Conjuntos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${dietaInstance?.conjuntos?}" var="c">
    <li><g:link controller="conjuntoDieta" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="conjuntoDieta" action="create" params="['dieta.id': dietaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'conjuntoDieta.label', default: 'ConjuntoDieta')])}</g:link>
</li>
</ul>

</div>

