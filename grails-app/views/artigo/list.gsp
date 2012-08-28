
<%@ page import="academia.Artigo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'artigo.label', default: 'Artigo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-artigo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-artigo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="conteudo" title="${message(code: 'artigo.conteudo.label', default: 'Conteudo')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'artigo.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="emDestaque" title="${message(code: 'artigo.emDestaque.label', default: 'Em Destaque')}" />
					
						<th><g:message code="artigo.professor.label" default="Professor" /></th>
					
						<g:sortableColumn property="titulo" title="${message(code: 'artigo.titulo.label', default: 'Titulo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${artigoInstanceList}" status="i" var="artigoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${artigoInstance.id}">${fieldValue(bean: artigoInstance, field: "conteudo")}</g:link></td>
					
						<td><g:formatDate date="${artigoInstance.dateCreated}" /></td>
					
						<td><g:formatBoolean boolean="${artigoInstance.emDestaque}" /></td>
					
						<td>${fieldValue(bean: artigoInstance, field: "professor")}</td>
					
						<td>${fieldValue(bean: artigoInstance, field: "titulo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${artigoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
