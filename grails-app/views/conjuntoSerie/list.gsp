
<%@ page import="academia.ConjuntoSerie" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'conjuntoSerie.label', default: 'ConjuntoSerie')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-conjuntoSerie" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-conjuntoSerie" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'conjuntoSerie.dateCreated.label', default: 'Date Created')}" />
					
						<th><g:message code="conjuntoSerie.exercicio.label" default="Exercicio" /></th>
					
						<g:sortableColumn property="grupo" title="${message(code: 'conjuntoSerie.grupo.label', default: 'Grupo')}" />
					
						<g:sortableColumn property="peso" title="${message(code: 'conjuntoSerie.peso.label', default: 'Peso')}" />
					
						<g:sortableColumn property="repeticoes" title="${message(code: 'conjuntoSerie.repeticoes.label', default: 'Repeticoes')}" />
					
						<th><g:message code="conjuntoSerie.serie.label" default="Serie" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${conjuntoSerieInstanceList}" status="i" var="conjuntoSerieInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${conjuntoSerieInstance.id}">${fieldValue(bean: conjuntoSerieInstance, field: "dateCreated")}</g:link></td>
					
						<td>${fieldValue(bean: conjuntoSerieInstance, field: "exercicio")}</td>
					
						<td>${fieldValue(bean: conjuntoSerieInstance, field: "grupo")}</td>
					
						<td>${fieldValue(bean: conjuntoSerieInstance, field: "peso")}</td>
					
						<td>${fieldValue(bean: conjuntoSerieInstance, field: "repeticoes")}</td>
					
						<td>${fieldValue(bean: conjuntoSerieInstance, field: "serie")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${conjuntoSerieInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
