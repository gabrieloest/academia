<!doctype html>
<html>
<head>
<meta name="layout" content="main" />
<title>Bem Vindo ao Personal OnLine!</title>
<style type="text/css" media="screen">
#status {
	background-color: #eee;
	border: .2em solid #fff;
	margin: 2em 2em 1em;
	padding: 1em;
	width: 12em;
	float: left;
	-moz-box-shadow: 0px 0px 1.25em #ccc;
	-webkit-box-shadow: 0px 0px 1.25em #ccc;
	box-shadow: 0px 0px 1.25em #ccc;
	-moz-border-radius: 0.6em;
	-webkit-border-radius: 0.6em;
	border-radius: 0.6em;
}

.ie6 #status {
	display: inline;
	/* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
}

#status ul {
	font-size: 0.9em;
	list-style-type: none;
	margin-bottom: 0.6em;
	padding: 0;
}

#status li {
	line-height: 1.3;
}

#status h1 {
	text-transform: uppercase;
	font-size: 1.1em;
	margin: 0 0 0.3em;
}

#page-body {
	margin: 2em 1em 1.25em 18em;
}

h2 {
	margin-top: 1em;
	margin-bottom: 0.3em;
	font-size: 1em;
}

p {
	line-height: 1.5;
	margin: 0.25em 0;
}

#controller-list ul {
	list-style-position: inside;
}

#controller-list li {
	line-height: 1.3;
	list-style-position: inside;
	margin: 0.25em 0;
}

@media screen and (max-width: 480px) {
	#status {
		display: none;
	}
	#page-body {
		margin: 0 1em 1em;
	}
	#page-body h1 {
		margin-top: 0;
	}
}
</style>
</head>
<body>
	<a href="#page-body" class="skip"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div id="page-body" role="main">
		<h1>Bem Vindo ao Personal OnLine!</h1>
		<p>O Personal OnLine foi criado para ajudar aqueles que não
			dispensam a academia a obter um maior rendimento, através do
			acompanhamento de um personal trainer e de outras facilidades do
			site, como acompanhamento de séries, acompanhamento de
			desenvolvimento físico e dietas.</p>
		<table>
			<tbody>
				<tr>
					<td>
						<div id="cadastro-aluno">
							<h2>
								<g:link controller="aluno" action="create">Novo Aluno!</g:link>
							</h2>
						</div>
					</td>
					<td>
						<div id="cadastro-professor">
							<h2>
								<g:link controller="professor" action="create">Novo Professor!</g:link>
							</h2>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div id="panel" style="display: block;">
		<table id="news" cellspacing="0" cellpadding="0">
			<tbody>
				<tr>
					<td valign="top" height="180" align="left">
						<h3>Conteúdo Gratuito</h3> <br>
						<div>
							<p>teste</p>
						</div>
					</td>
					<td valign="top" height="180" align="left">
						<h3>Artigos em Destaque</h3> <br>
						<div>
							<p>teste</p>
						</div>
					</td>
					<td valign="top" height="180" align="left">
						<h3>Vídeos em Destaque</h3> <br>
						<div>
							<p>teste</p>
						</div>
					</td>
					<td valign="top" height="180" align="left">
						<h3>Patrocinios</h3> <br>
						<div>
							<p>teste</p>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>
