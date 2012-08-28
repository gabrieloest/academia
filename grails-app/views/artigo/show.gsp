
<%@ page import="academia.Artigo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'artigo.label', default: 'Artigo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-artigo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-artigo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list artigo">
			
				<g:if test="${artigoInstance?.conteudo}">
				<li class="fieldcontain">
					<span id="conteudo-label" class="property-label"><g:message code="artigo.conteudo.label" default="Conteudo" /></span>
					
						<span class="property-value" aria-labelledby="conteudo-label"><g:fieldValue bean="${artigoInstance}" field="conteudo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${artigoInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="artigo.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${artigoInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${artigoInstance?.emDestaque}">
				<li class="fieldcontain">
					<span id="emDestaque-label" class="property-label"><g:message code="artigo.emDestaque.label" default="Em Destaque" /></span>
					
						<span class="property-value" aria-labelledby="emDestaque-label"><g:formatBoolean boolean="${artigoInstance?.emDestaque}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${artigoInstance?.professor}">
				<li class="fieldcontain">
					<span id="professor-label" class="property-label"><g:message code="artigo.professor.label" default="Professor" /></span>
					
						<span class="property-value" aria-labelledby="professor-label"><g:link controller="professor" action="show" id="${artigoInstance?.professor?.id}">${artigoInstance?.professor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${artigoInstance?.titulo}">
				<li class="fieldcontain">
					<span id="titulo-label" class="property-label"><g:message code="artigo.titulo.label" default="Titulo" /></span>
					
						<span class="property-value" aria-labelledby="titulo-label"><g:fieldValue bean="${artigoInstance}" field="titulo"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${artigoInstance?.id}" />
					<g:link class="edit" action="edit" id="${artigoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
