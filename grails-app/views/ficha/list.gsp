
<%@ page import="academia.Ficha" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ficha.label', default: 'Ficha')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-ficha" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-ficha" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="abdomem" title="${message(code: 'ficha.abdomem.label', default: 'Abdomem')}" />
					
						<g:sortableColumn property="altura" title="${message(code: 'ficha.altura.label', default: 'Altura')}" />
					
						<th><g:message code="ficha.aluno.label" default="Aluno" /></th>
					
						<g:sortableColumn property="antebracoDireito" title="${message(code: 'ficha.antebracoDireito.label', default: 'Antebraco Direito')}" />
					
						<g:sortableColumn property="antebracoEsquerdo" title="${message(code: 'ficha.antebracoEsquerdo.label', default: 'Antebraco Esquerdo')}" />
					
						<g:sortableColumn property="bicepsDireito" title="${message(code: 'ficha.bicepsDireito.label', default: 'Biceps Direito')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${fichaInstanceList}" status="i" var="fichaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${fichaInstance.id}">${fieldValue(bean: fichaInstance, field: "abdomem")}</g:link></td>
					
						<td>${fieldValue(bean: fichaInstance, field: "altura")}</td>
					
						<td>${fieldValue(bean: fichaInstance, field: "aluno")}</td>
					
						<td>${fieldValue(bean: fichaInstance, field: "antebracoDireito")}</td>
					
						<td>${fieldValue(bean: fichaInstance, field: "antebracoEsquerdo")}</td>
					
						<td>${fieldValue(bean: fichaInstance, field: "bicepsDireito")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${fichaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
