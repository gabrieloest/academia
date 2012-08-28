
<%@ page import="academia.Curriculo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'curriculo.label', default: 'Curriculo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-curriculo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-curriculo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list curriculo">
			
				<g:if test="${curriculoInstance?.atividades}">
				<li class="fieldcontain">
					<span id="atividades-label" class="property-label"><g:message code="curriculo.atividades.label" default="Atividades" /></span>
					
						<g:each in="${curriculoInstance.atividades}" var="a">
						<span class="property-value" aria-labelledby="atividades-label"><g:link controller="atividade" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${curriculoInstance?.formacoes}">
				<li class="fieldcontain">
					<span id="formacoes-label" class="property-label"><g:message code="curriculo.formacoes.label" default="Formacoes" /></span>
					
						<g:each in="${curriculoInstance.formacoes}" var="f">
						<span class="property-value" aria-labelledby="formacoes-label"><g:link controller="formacao" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${curriculoInstance?.id}" />
					<g:link class="edit" action="edit" id="${curriculoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
