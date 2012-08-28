
<%@ page import="academia.Ficha" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ficha.label', default: 'Ficha')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-ficha" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-ficha" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list ficha">
			
				<g:if test="${fichaInstance?.abdomem}">
				<li class="fieldcontain">
					<span id="abdomem-label" class="property-label"><g:message code="ficha.abdomem.label" default="Abdomem" /></span>
					
						<span class="property-value" aria-labelledby="abdomem-label"><g:fieldValue bean="${fichaInstance}" field="abdomem"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fichaInstance?.altura}">
				<li class="fieldcontain">
					<span id="altura-label" class="property-label"><g:message code="ficha.altura.label" default="Altura" /></span>
					
						<span class="property-value" aria-labelledby="altura-label"><g:fieldValue bean="${fichaInstance}" field="altura"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fichaInstance?.aluno}">
				<li class="fieldcontain">
					<span id="aluno-label" class="property-label"><g:message code="ficha.aluno.label" default="Aluno" /></span>
					
						<span class="property-value" aria-labelledby="aluno-label"><g:link controller="aluno" action="show" id="${fichaInstance?.aluno?.id}">${fichaInstance?.aluno?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${fichaInstance?.antebracoDireito}">
				<li class="fieldcontain">
					<span id="antebracoDireito-label" class="property-label"><g:message code="ficha.antebracoDireito.label" default="Antebraco Direito" /></span>
					
						<span class="property-value" aria-labelledby="antebracoDireito-label"><g:fieldValue bean="${fichaInstance}" field="antebracoDireito"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fichaInstance?.antebracoEsquerdo}">
				<li class="fieldcontain">
					<span id="antebracoEsquerdo-label" class="property-label"><g:message code="ficha.antebracoEsquerdo.label" default="Antebraco Esquerdo" /></span>
					
						<span class="property-value" aria-labelledby="antebracoEsquerdo-label"><g:fieldValue bean="${fichaInstance}" field="antebracoEsquerdo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fichaInstance?.bicepsDireito}">
				<li class="fieldcontain">
					<span id="bicepsDireito-label" class="property-label"><g:message code="ficha.bicepsDireito.label" default="Biceps Direito" /></span>
					
						<span class="property-value" aria-labelledby="bicepsDireito-label"><g:fieldValue bean="${fichaInstance}" field="bicepsDireito"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fichaInstance?.bicepsEsquerdo}">
				<li class="fieldcontain">
					<span id="bicepsEsquerdo-label" class="property-label"><g:message code="ficha.bicepsEsquerdo.label" default="Biceps Esquerdo" /></span>
					
						<span class="property-value" aria-labelledby="bicepsEsquerdo-label"><g:fieldValue bean="${fichaInstance}" field="bicepsEsquerdo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fichaInstance?.cintura}">
				<li class="fieldcontain">
					<span id="cintura-label" class="property-label"><g:message code="ficha.cintura.label" default="Cintura" /></span>
					
						<span class="property-value" aria-labelledby="cintura-label"><g:fieldValue bean="${fichaInstance}" field="cintura"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fichaInstance?.coxaDireitra}">
				<li class="fieldcontain">
					<span id="coxaDireitra-label" class="property-label"><g:message code="ficha.coxaDireitra.label" default="Coxa Direitra" /></span>
					
						<span class="property-value" aria-labelledby="coxaDireitra-label"><g:fieldValue bean="${fichaInstance}" field="coxaDireitra"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fichaInstance?.coxaEsquerda}">
				<li class="fieldcontain">
					<span id="coxaEsquerda-label" class="property-label"><g:message code="ficha.coxaEsquerda.label" default="Coxa Esquerda" /></span>
					
						<span class="property-value" aria-labelledby="coxaEsquerda-label"><g:fieldValue bean="${fichaInstance}" field="coxaEsquerda"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fichaInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="ficha.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${fichaInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${fichaInstance?.dobraCutaneaAbdominal}">
				<li class="fieldcontain">
					<span id="dobraCutaneaAbdominal-label" class="property-label"><g:message code="ficha.dobraCutaneaAbdominal.label" default="Dobra Cutanea Abdominal" /></span>
					
						<span class="property-value" aria-labelledby="dobraCutaneaAbdominal-label"><g:fieldValue bean="${fichaInstance}" field="dobraCutaneaAbdominal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fichaInstance?.dobraCutaneaAxilarMedia}">
				<li class="fieldcontain">
					<span id="dobraCutaneaAxilarMedia-label" class="property-label"><g:message code="ficha.dobraCutaneaAxilarMedia.label" default="Dobra Cutanea Axilar Media" /></span>
					
						<span class="property-value" aria-labelledby="dobraCutaneaAxilarMedia-label"><g:fieldValue bean="${fichaInstance}" field="dobraCutaneaAxilarMedia"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fichaInstance?.dobraCutaneaBiciptal}">
				<li class="fieldcontain">
					<span id="dobraCutaneaBiciptal-label" class="property-label"><g:message code="ficha.dobraCutaneaBiciptal.label" default="Dobra Cutanea Biciptal" /></span>
					
						<span class="property-value" aria-labelledby="dobraCutaneaBiciptal-label"><g:fieldValue bean="${fichaInstance}" field="dobraCutaneaBiciptal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fichaInstance?.dobraCutaneaCoxa}">
				<li class="fieldcontain">
					<span id="dobraCutaneaCoxa-label" class="property-label"><g:message code="ficha.dobraCutaneaCoxa.label" default="Dobra Cutanea Coxa" /></span>
					
						<span class="property-value" aria-labelledby="dobraCutaneaCoxa-label"><g:fieldValue bean="${fichaInstance}" field="dobraCutaneaCoxa"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fichaInstance?.dobraCutaneaPanturrilhaMedial}">
				<li class="fieldcontain">
					<span id="dobraCutaneaPanturrilhaMedial-label" class="property-label"><g:message code="ficha.dobraCutaneaPanturrilhaMedial.label" default="Dobra Cutanea Panturrilha Medial" /></span>
					
						<span class="property-value" aria-labelledby="dobraCutaneaPanturrilhaMedial-label"><g:fieldValue bean="${fichaInstance}" field="dobraCutaneaPanturrilhaMedial"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fichaInstance?.dobraCutaneaSubescapular}">
				<li class="fieldcontain">
					<span id="dobraCutaneaSubescapular-label" class="property-label"><g:message code="ficha.dobraCutaneaSubescapular.label" default="Dobra Cutanea Subescapular" /></span>
					
						<span class="property-value" aria-labelledby="dobraCutaneaSubescapular-label"><g:fieldValue bean="${fichaInstance}" field="dobraCutaneaSubescapular"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fichaInstance?.dobraCutaneaSupraIliaca}">
				<li class="fieldcontain">
					<span id="dobraCutaneaSupraIliaca-label" class="property-label"><g:message code="ficha.dobraCutaneaSupraIliaca.label" default="Dobra Cutanea Supra Iliaca" /></span>
					
						<span class="property-value" aria-labelledby="dobraCutaneaSupraIliaca-label"><g:fieldValue bean="${fichaInstance}" field="dobraCutaneaSupraIliaca"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fichaInstance?.dobraCutaneaToracica}">
				<li class="fieldcontain">
					<span id="dobraCutaneaToracica-label" class="property-label"><g:message code="ficha.dobraCutaneaToracica.label" default="Dobra Cutanea Toracica" /></span>
					
						<span class="property-value" aria-labelledby="dobraCutaneaToracica-label"><g:fieldValue bean="${fichaInstance}" field="dobraCutaneaToracica"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fichaInstance?.dobraCutaneaTriciptal}">
				<li class="fieldcontain">
					<span id="dobraCutaneaTriciptal-label" class="property-label"><g:message code="ficha.dobraCutaneaTriciptal.label" default="Dobra Cutanea Triciptal" /></span>
					
						<span class="property-value" aria-labelledby="dobraCutaneaTriciptal-label"><g:fieldValue bean="${fichaInstance}" field="dobraCutaneaTriciptal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fichaInstance?.fotoCostas}">
				<li class="fieldcontain">
					<span id="fotoCostas-label" class="property-label"><g:message code="ficha.fotoCostas.label" default="Foto Costas" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${fichaInstance?.fotoFrente}">
				<li class="fieldcontain">
					<span id="fotoFrente-label" class="property-label"><g:message code="ficha.fotoFrente.label" default="Foto Frente" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${fichaInstance?.fotoPerfilDireito}">
				<li class="fieldcontain">
					<span id="fotoPerfilDireito-label" class="property-label"><g:message code="ficha.fotoPerfilDireito.label" default="Foto Perfil Direito" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${fichaInstance?.fotoPerfilEsquerdo}">
				<li class="fieldcontain">
					<span id="fotoPerfilEsquerdo-label" class="property-label"><g:message code="ficha.fotoPerfilEsquerdo.label" default="Foto Perfil Esquerdo" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${fichaInstance?.idade}">
				<li class="fieldcontain">
					<span id="idade-label" class="property-label"><g:message code="ficha.idade.label" default="Idade" /></span>
					
						<span class="property-value" aria-labelledby="idade-label"><g:fieldValue bean="${fichaInstance}" field="idade"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fichaInstance?.ombros}">
				<li class="fieldcontain">
					<span id="ombros-label" class="property-label"><g:message code="ficha.ombros.label" default="Ombros" /></span>
					
						<span class="property-value" aria-labelledby="ombros-label"><g:fieldValue bean="${fichaInstance}" field="ombros"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fichaInstance?.panturrilhaDireita}">
				<li class="fieldcontain">
					<span id="panturrilhaDireita-label" class="property-label"><g:message code="ficha.panturrilhaDireita.label" default="Panturrilha Direita" /></span>
					
						<span class="property-value" aria-labelledby="panturrilhaDireita-label"><g:fieldValue bean="${fichaInstance}" field="panturrilhaDireita"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fichaInstance?.panturrilhaEsquerda}">
				<li class="fieldcontain">
					<span id="panturrilhaEsquerda-label" class="property-label"><g:message code="ficha.panturrilhaEsquerda.label" default="Panturrilha Esquerda" /></span>
					
						<span class="property-value" aria-labelledby="panturrilhaEsquerda-label"><g:fieldValue bean="${fichaInstance}" field="panturrilhaEsquerda"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fichaInstance?.percentualGordura}">
				<li class="fieldcontain">
					<span id="percentualGordura-label" class="property-label"><g:message code="ficha.percentualGordura.label" default="Percentual Gordura" /></span>
					
						<span class="property-value" aria-labelledby="percentualGordura-label"><g:fieldValue bean="${fichaInstance}" field="percentualGordura"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fichaInstance?.peso}">
				<li class="fieldcontain">
					<span id="peso-label" class="property-label"><g:message code="ficha.peso.label" default="Peso" /></span>
					
						<span class="property-value" aria-labelledby="peso-label"><g:fieldValue bean="${fichaInstance}" field="peso"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fichaInstance?.punhoDireito}">
				<li class="fieldcontain">
					<span id="punhoDireito-label" class="property-label"><g:message code="ficha.punhoDireito.label" default="Punho Direito" /></span>
					
						<span class="property-value" aria-labelledby="punhoDireito-label"><g:fieldValue bean="${fichaInstance}" field="punhoDireito"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fichaInstance?.punhoEsquerdo}">
				<li class="fieldcontain">
					<span id="punhoEsquerdo-label" class="property-label"><g:message code="ficha.punhoEsquerdo.label" default="Punho Esquerdo" /></span>
					
						<span class="property-value" aria-labelledby="punhoEsquerdo-label"><g:fieldValue bean="${fichaInstance}" field="punhoEsquerdo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fichaInstance?.torax}">
				<li class="fieldcontain">
					<span id="torax-label" class="property-label"><g:message code="ficha.torax.label" default="Torax" /></span>
					
						<span class="property-value" aria-labelledby="torax-label"><g:fieldValue bean="${fichaInstance}" field="torax"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${fichaInstance?.id}" />
					<g:link class="edit" action="edit" id="${fichaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
