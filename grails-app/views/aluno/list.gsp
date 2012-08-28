
<%@ page import="academia.Aluno" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'aluno.label', default: 'Aluno')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-aluno" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-aluno" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="aluno.professor.label" default="Professor" /></th>
					
						<g:sortableColumn property="avatar" title="${message(code: 'aluno.avatar.label', default: 'Avatar')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'aluno.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="idade" title="${message(code: 'aluno.idade.label', default: 'Idade')}" />
					
						<g:sortableColumn property="nome" title="${message(code: 'aluno.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'aluno.password.label', default: 'Password')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${alunoInstanceList}" status="i" var="alunoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${alunoInstance.id}">${fieldValue(bean: alunoInstance, field: "id")}</g:link></td>
					
						<td><img src="${createLink(controller:'aluno', action:'imagem', id: alunoInstance.id)}"/></td>
					
						<td>${fieldValue(bean: alunoInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: alunoInstance, field: "idade")}</td>
					
						<td>${fieldValue(bean: alunoInstance, field: "nome")}</td>
					
						<td>${fieldValue(bean: alunoInstance, field: "password")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${alunoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
