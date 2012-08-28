<%@ page import="academia.Aluno" %>



<%--<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'professor', 'error')} ">
	<label for="professor">
		<g:message code="aluno.professor.label" default="Professor" />
		
	</label>
	<g:select id="professor" name="professor.id" from="${academia.Professor.list()}" optionKey="id" value="${alunoInstance?.professor?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

--%><div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'avatar', 'error')} required">
	<label for="avatar">
		<g:message code="aluno.avatar.label" default="Avatar" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="avatar" name="avatar" />
</div>

<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="aluno.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${alunoInstance?.email}"/>
</div>

<%--<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'fichas', 'error')} ">
	<label for="fichas">
		<g:message code="aluno.fichas.label" default="Fichas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${alunoInstance?.fichas?}" var="f">
    <li><g:link controller="ficha" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="ficha" action="create" params="['aluno.id': alunoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'ficha.label', default: 'Ficha')])}</g:link>
</li>
</ul>

</div>

--%><div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'idade', 'error')} required">
	<label for="idade">
		<g:message code="aluno.idade.label" default="Idade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="idade" required="" value="${fieldValue(bean: alunoInstance, field: 'idade')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'nome', 'error')} ">
	<label for="nome">
		<g:message code="aluno.nome.label" default="Nome" />
		
	</label>
	<g:textField name="nome" value="${alunoInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="aluno.password.label" default="Password" />
		
	</label>
	<g:textField name="password" value="${alunoInstance?.password}"/>
</div>

<%--<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'series', 'error')} ">
	<label for="series">
		<g:message code="aluno.series.label" default="Series" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${alunoInstance?.series?}" var="s">
    <li><g:link controller="serie" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="serie" action="create" params="['aluno.id': alunoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'serie.label', default: 'Serie')])}</g:link>
</li>
</ul>

</div>

--%><div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'sexo', 'error')} ">
	<label for="sexo">
		<g:message code="aluno.sexo.label" default="Sexo" />
		
	</label>
	<g:textField name="sexo" value="${alunoInstance?.sexo}"/>
</div>

