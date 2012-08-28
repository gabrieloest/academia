
<%@ page import="academia.Formacao" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'formacao.label', default: 'Formacao')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-formacao" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-formacao" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="descricao" title="${message(code: 'formacao.descricao.label', default: 'Descricao')}" />
					
						<g:sortableColumn property="fim" title="${message(code: 'formacao.fim.label', default: 'Fim')}" />
					
						<g:sortableColumn property="inicio" title="${message(code: 'formacao.inicio.label', default: 'Inicio')}" />
					
						<g:sortableColumn property="titulo" title="${message(code: 'formacao.titulo.label', default: 'Titulo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${formacaoInstanceList}" status="i" var="formacaoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${formacaoInstance.id}">${fieldValue(bean: formacaoInstance, field: "descricao")}</g:link></td>
					
						<td><g:formatDate date="${formacaoInstance.fim}" /></td>
					
						<td><g:formatDate date="${formacaoInstance.inicio}" /></td>
					
						<td>${fieldValue(bean: formacaoInstance, field: "titulo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${formacaoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
