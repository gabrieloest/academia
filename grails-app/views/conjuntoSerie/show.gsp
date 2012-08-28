
<%@ page import="academia.ConjuntoSerie" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'conjuntoSerie.label', default: 'ConjuntoSerie')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-conjuntoSerie" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-conjuntoSerie" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list conjuntoSerie">
			
				<g:if test="${conjuntoSerieInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="conjuntoSerie.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${conjuntoSerieInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${conjuntoSerieInstance?.exercicio}">
				<li class="fieldcontain">
					<span id="exercicio-label" class="property-label"><g:message code="conjuntoSerie.exercicio.label" default="Exercicio" /></span>
					
						<span class="property-value" aria-labelledby="exercicio-label"><g:link controller="exercicio" action="show" id="${conjuntoSerieInstance?.exercicio?.id}">${conjuntoSerieInstance?.exercicio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${conjuntoSerieInstance?.grupo}">
				<li class="fieldcontain">
					<span id="grupo-label" class="property-label"><g:message code="conjuntoSerie.grupo.label" default="Grupo" /></span>
					
						<span class="property-value" aria-labelledby="grupo-label"><g:fieldValue bean="${conjuntoSerieInstance}" field="grupo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conjuntoSerieInstance?.peso}">
				<li class="fieldcontain">
					<span id="peso-label" class="property-label"><g:message code="conjuntoSerie.peso.label" default="Peso" /></span>
					
						<span class="property-value" aria-labelledby="peso-label"><g:fieldValue bean="${conjuntoSerieInstance}" field="peso"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conjuntoSerieInstance?.repeticoes}">
				<li class="fieldcontain">
					<span id="repeticoes-label" class="property-label"><g:message code="conjuntoSerie.repeticoes.label" default="Repeticoes" /></span>
					
						<span class="property-value" aria-labelledby="repeticoes-label"><g:fieldValue bean="${conjuntoSerieInstance}" field="repeticoes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conjuntoSerieInstance?.serie}">
				<li class="fieldcontain">
					<span id="serie-label" class="property-label"><g:message code="conjuntoSerie.serie.label" default="Serie" /></span>
					
						<span class="property-value" aria-labelledby="serie-label"><g:link controller="serie" action="show" id="${conjuntoSerieInstance?.serie?.id}">${conjuntoSerieInstance?.serie?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${conjuntoSerieInstance?.id}" />
					<g:link class="edit" action="edit" id="${conjuntoSerieInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
