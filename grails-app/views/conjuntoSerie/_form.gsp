<%@ page import="academia.ConjuntoSerie" %>



<div class="fieldcontain ${hasErrors(bean: conjuntoSerieInstance, field: 'exercicio', 'error')} required">
	<label for="exercicio">
		<g:message code="conjuntoSerie.exercicio.label" default="Exercicio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="exercicio" name="exercicio.id" from="${academia.Exercicio.list()}" optionKey="id" required="" value="${conjuntoSerieInstance?.exercicio?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: conjuntoSerieInstance, field: 'grupo', 'error')} ">
	<label for="grupo">
		<g:message code="conjuntoSerie.grupo.label" default="Grupo" />
		
	</label>
	<g:textField name="grupo" value="${conjuntoSerieInstance?.grupo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: conjuntoSerieInstance, field: 'peso', 'error')} ">
	<label for="peso">
		<g:message code="conjuntoSerie.peso.label" default="Peso" />
		
	</label>
	<g:textField name="peso" value="${conjuntoSerieInstance?.peso}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: conjuntoSerieInstance, field: 'repeticoes', 'error')} ">
	<label for="repeticoes">
		<g:message code="conjuntoSerie.repeticoes.label" default="Repeticoes" />
		
	</label>
	<g:textField name="repeticoes" value="${conjuntoSerieInstance?.repeticoes}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: conjuntoSerieInstance, field: 'serie', 'error')} required">
	<label for="serie">
		<g:message code="conjuntoSerie.serie.label" default="Serie" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="serie" name="serie.id" from="${academia.Serie.list()}" optionKey="id" required="" value="${conjuntoSerieInstance?.serie?.id}" class="many-to-one"/>
</div>

