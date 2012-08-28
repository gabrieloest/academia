
<%@ page import="academia.Professor" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'professor.label', default: 'Professor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-professor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-professor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list professor">
			
				<g:if test="${professorInstance?.artigos}">
				<li class="fieldcontain">
					<span id="artigos-label" class="property-label"><g:message code="professor.artigos.label" default="Artigos" /></span>
					
						<g:each in="${professorInstance.artigos}" var="a">
						<span class="property-value" aria-labelledby="artigos-label"><g:link controller="artigo" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${professorInstance?.avatar}">
				<li class="fieldcontain">
					<span id="avatar-label" class="property-label"><g:message code="professor.avatar.label" default="Avatar" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${professorInstance?.curriculo}">
				<li class="fieldcontain">
					<span id="curriculo-label" class="property-label"><g:message code="professor.curriculo.label" default="Curriculo" /></span>
					
						<span class="property-value" aria-labelledby="curriculo-label"><g:link controller="curriculo" action="show" id="${professorInstance?.curriculo?.id}">${professorInstance?.curriculo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${professorInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="professor.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${professorInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${professorInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="professor.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${professorInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${professorInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="professor.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${professorInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${professorInstance?.patrocinadores}">
				<li class="fieldcontain">
					<span id="patrocinadores-label" class="property-label"><g:message code="professor.patrocinadores.label" default="Patrocinadores" /></span>
					
						<g:each in="${professorInstance.patrocinadores}" var="p">
						<span class="property-value" aria-labelledby="patrocinadores-label"><g:link controller="patrocinador" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${professorInstance?.id}" />
					<g:link class="edit" action="edit" id="${professorInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
