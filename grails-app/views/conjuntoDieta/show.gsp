
<%@ page import="academia.ConjuntoDieta" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'conjuntoDieta.label', default: 'ConjuntoDieta')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-conjuntoDieta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-conjuntoDieta" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list conjuntoDieta">
			
				<g:if test="${conjuntoDietaInstance?.alimento}">
				<li class="fieldcontain">
					<span id="alimento-label" class="property-label"><g:message code="conjuntoDieta.alimento.label" default="Alimento" /></span>
					
						<span class="property-value" aria-labelledby="alimento-label"><g:link controller="alimento" action="show" id="${conjuntoDietaInstance?.alimento?.id}">${conjuntoDietaInstance?.alimento?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${conjuntoDietaInstance?.dieta}">
				<li class="fieldcontain">
					<span id="dieta-label" class="property-label"><g:message code="conjuntoDieta.dieta.label" default="Dieta" /></span>
					
						<span class="property-value" aria-labelledby="dieta-label"><g:link controller="dieta" action="show" id="${conjuntoDietaInstance?.dieta?.id}">${conjuntoDietaInstance?.dieta?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${conjuntoDietaInstance?.quantidade}">
				<li class="fieldcontain">
					<span id="quantidade-label" class="property-label"><g:message code="conjuntoDieta.quantidade.label" default="Quantidade" /></span>
					
						<span class="property-value" aria-labelledby="quantidade-label"><g:fieldValue bean="${conjuntoDietaInstance}" field="quantidade"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conjuntoDietaInstance?.refeicao}">
				<li class="fieldcontain">
					<span id="refeicao-label" class="property-label"><g:message code="conjuntoDieta.refeicao.label" default="Refeicao" /></span>
					
						<span class="property-value" aria-labelledby="refeicao-label"><g:fieldValue bean="${conjuntoDietaInstance}" field="refeicao"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${conjuntoDietaInstance?.id}" />
					<g:link class="edit" action="edit" id="${conjuntoDietaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
