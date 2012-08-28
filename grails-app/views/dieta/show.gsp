
<%@ page import="academia.Dieta" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'dieta.label', default: 'Dieta')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-dieta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-dieta" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list dieta">
			
				<g:if test="${dietaInstance?.aluno}">
				<li class="fieldcontain">
					<span id="aluno-label" class="property-label"><g:message code="dieta.aluno.label" default="Aluno" /></span>
					
						<span class="property-value" aria-labelledby="aluno-label"><g:link controller="aluno" action="show" id="${dietaInstance?.aluno?.id}">${dietaInstance?.aluno?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${dietaInstance?.conjuntos}">
				<li class="fieldcontain">
					<span id="conjuntos-label" class="property-label"><g:message code="dieta.conjuntos.label" default="Conjuntos" /></span>
					
						<g:each in="${dietaInstance.conjuntos}" var="c">
						<span class="property-value" aria-labelledby="conjuntos-label"><g:link controller="conjuntoDieta" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${dietaInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="dieta.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${dietaInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${dietaInstance?.id}" />
					<g:link class="edit" action="edit" id="${dietaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
