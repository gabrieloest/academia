
<%@ page import="academia.Atividade" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'atividade.label', default: 'Atividade')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-atividade" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-atividade" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="descricao" title="${message(code: 'atividade.descricao.label', default: 'Descricao')}" />
					
						<g:sortableColumn property="fim" title="${message(code: 'atividade.fim.label', default: 'Fim')}" />
					
						<g:sortableColumn property="inicio" title="${message(code: 'atividade.inicio.label', default: 'Inicio')}" />
					
						<th><g:message code="atividade.professor.label" default="Professor" /></th>
					
						<th><g:message code="atividade.tipo.label" default="Tipo" /></th>
					
						<g:sortableColumn property="titulo" title="${message(code: 'atividade.titulo.label', default: 'Titulo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${atividadeInstanceList}" status="i" var="atividadeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${atividadeInstance.id}">${fieldValue(bean: atividadeInstance, field: "descricao")}</g:link></td>
					
						<td><g:formatDate date="${atividadeInstance.fim}" /></td>
					
						<td><g:formatDate date="${atividadeInstance.inicio}" /></td>
					
						<td>${fieldValue(bean: atividadeInstance, field: "professor")}</td>
					
						<td>${fieldValue(bean: atividadeInstance, field: "tipo")}</td>
					
						<td>${fieldValue(bean: atividadeInstance, field: "titulo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${atividadeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
