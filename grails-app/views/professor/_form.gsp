<%@ page import="academia.Professor" %>



<div class="fieldcontain ${hasErrors(bean: professorInstance, field: 'artigos', 'error')} ">
	<label for="artigos">
		<g:message code="professor.artigos.label" default="Artigos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${professorInstance?.artigos?}" var="a">
    <li><g:link controller="artigo" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="artigo" action="create" params="['professor.id': professorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'artigo.label', default: 'Artigo')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: professorInstance, field: 'avatar', 'error')} required">
	<label for="avatar">
		<g:message code="professor.avatar.label" default="Avatar" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="avatar" name="avatar" />
</div>

<div class="fieldcontain ${hasErrors(bean: professorInstance, field: 'curriculo', 'error')} required">
	<label for="curriculo">
		<g:message code="professor.curriculo.label" default="Curriculo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="curriculo" name="curriculo.id" from="${academia.Curriculo.list()}" optionKey="id" required="" value="${professorInstance?.curriculo?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: professorInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="professor.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${professorInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: professorInstance, field: 'nome', 'error')} ">
	<label for="nome">
		<g:message code="professor.nome.label" default="Nome" />
		
	</label>
	<g:textField name="nome" value="${professorInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: professorInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="professor.password.label" default="Password" />
		
	</label>
	<g:textField name="password" value="${professorInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: professorInstance, field: 'patrocinadores', 'error')} ">
	<label for="patrocinadores">
		<g:message code="professor.patrocinadores.label" default="Patrocinadores" />
		
	</label>
	<g:select name="patrocinadores" from="${academia.Patrocinador.list()}" multiple="multiple" optionKey="id" size="5" value="${professorInstance?.patrocinadores*.id}" class="many-to-many"/>
</div>

