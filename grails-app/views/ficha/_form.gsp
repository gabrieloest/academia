<%@ page import="academia.Ficha" %>



<div class="fieldcontain ${hasErrors(bean: fichaInstance, field: 'abdomem', 'error')} required">
	<label for="abdomem">
		<g:message code="ficha.abdomem.label" default="Abdomem" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="abdomem" required="" value="${fieldValue(bean: fichaInstance, field: 'abdomem')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fichaInstance, field: 'altura', 'error')} required">
	<label for="altura">
		<g:message code="ficha.altura.label" default="Altura" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="altura" required="" value="${fieldValue(bean: fichaInstance, field: 'altura')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fichaInstance, field: 'aluno', 'error')} required">
	<label for="aluno">
		<g:message code="ficha.aluno.label" default="Aluno" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="aluno" name="aluno.id" from="${academia.Aluno.list()}" optionKey="id" required="" value="${fichaInstance?.aluno?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fichaInstance, field: 'antebracoDireito', 'error')} required">
	<label for="antebracoDireito">
		<g:message code="ficha.antebracoDireito.label" default="Antebraco Direito" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="antebracoDireito" required="" value="${fieldValue(bean: fichaInstance, field: 'antebracoDireito')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fichaInstance, field: 'antebracoEsquerdo', 'error')} required">
	<label for="antebracoEsquerdo">
		<g:message code="ficha.antebracoEsquerdo.label" default="Antebraco Esquerdo" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="antebracoEsquerdo" required="" value="${fieldValue(bean: fichaInstance, field: 'antebracoEsquerdo')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fichaInstance, field: 'bicepsDireito', 'error')} required">
	<label for="bicepsDireito">
		<g:message code="ficha.bicepsDireito.label" default="Biceps Direito" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="bicepsDireito" required="" value="${fieldValue(bean: fichaInstance, field: 'bicepsDireito')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fichaInstance, field: 'bicepsEsquerdo', 'error')} required">
	<label for="bicepsEsquerdo">
		<g:message code="ficha.bicepsEsquerdo.label" default="Biceps Esquerdo" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="bicepsEsquerdo" required="" value="${fieldValue(bean: fichaInstance, field: 'bicepsEsquerdo')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fichaInstance, field: 'cintura', 'error')} required">
	<label for="cintura">
		<g:message code="ficha.cintura.label" default="Cintura" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="cintura" required="" value="${fieldValue(bean: fichaInstance, field: 'cintura')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fichaInstance, field: 'coxaDireitra', 'error')} required">
	<label for="coxaDireitra">
		<g:message code="ficha.coxaDireitra.label" default="Coxa Direitra" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="coxaDireitra" required="" value="${fieldValue(bean: fichaInstance, field: 'coxaDireitra')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fichaInstance, field: 'coxaEsquerda', 'error')} required">
	<label for="coxaEsquerda">
		<g:message code="ficha.coxaEsquerda.label" default="Coxa Esquerda" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="coxaEsquerda" required="" value="${fieldValue(bean: fichaInstance, field: 'coxaEsquerda')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fichaInstance, field: 'dobraCutaneaAbdominal', 'error')} required">
	<label for="dobraCutaneaAbdominal">
		<g:message code="ficha.dobraCutaneaAbdominal.label" default="Dobra Cutanea Abdominal" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="dobraCutaneaAbdominal" required="" value="${fieldValue(bean: fichaInstance, field: 'dobraCutaneaAbdominal')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fichaInstance, field: 'dobraCutaneaAxilarMedia', 'error')} required">
	<label for="dobraCutaneaAxilarMedia">
		<g:message code="ficha.dobraCutaneaAxilarMedia.label" default="Dobra Cutanea Axilar Media" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="dobraCutaneaAxilarMedia" required="" value="${fieldValue(bean: fichaInstance, field: 'dobraCutaneaAxilarMedia')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fichaInstance, field: 'dobraCutaneaBiciptal', 'error')} required">
	<label for="dobraCutaneaBiciptal">
		<g:message code="ficha.dobraCutaneaBiciptal.label" default="Dobra Cutanea Biciptal" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="dobraCutaneaBiciptal" required="" value="${fieldValue(bean: fichaInstance, field: 'dobraCutaneaBiciptal')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fichaInstance, field: 'dobraCutaneaCoxa', 'error')} required">
	<label for="dobraCutaneaCoxa">
		<g:message code="ficha.dobraCutaneaCoxa.label" default="Dobra Cutanea Coxa" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="dobraCutaneaCoxa" required="" value="${fieldValue(bean: fichaInstance, field: 'dobraCutaneaCoxa')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fichaInstance, field: 'dobraCutaneaPanturrilhaMedial', 'error')} required">
	<label for="dobraCutaneaPanturrilhaMedial">
		<g:message code="ficha.dobraCutaneaPanturrilhaMedial.label" default="Dobra Cutanea Panturrilha Medial" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="dobraCutaneaPanturrilhaMedial" required="" value="${fieldValue(bean: fichaInstance, field: 'dobraCutaneaPanturrilhaMedial')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fichaInstance, field: 'dobraCutaneaSubescapular', 'error')} required">
	<label for="dobraCutaneaSubescapular">
		<g:message code="ficha.dobraCutaneaSubescapular.label" default="Dobra Cutanea Subescapular" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="dobraCutaneaSubescapular" required="" value="${fieldValue(bean: fichaInstance, field: 'dobraCutaneaSubescapular')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fichaInstance, field: 'dobraCutaneaSupraIliaca', 'error')} required">
	<label for="dobraCutaneaSupraIliaca">
		<g:message code="ficha.dobraCutaneaSupraIliaca.label" default="Dobra Cutanea Supra Iliaca" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="dobraCutaneaSupraIliaca" required="" value="${fieldValue(bean: fichaInstance, field: 'dobraCutaneaSupraIliaca')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fichaInstance, field: 'dobraCutaneaToracica', 'error')} required">
	<label for="dobraCutaneaToracica">
		<g:message code="ficha.dobraCutaneaToracica.label" default="Dobra Cutanea Toracica" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="dobraCutaneaToracica" required="" value="${fieldValue(bean: fichaInstance, field: 'dobraCutaneaToracica')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fichaInstance, field: 'dobraCutaneaTriciptal', 'error')} required">
	<label for="dobraCutaneaTriciptal">
		<g:message code="ficha.dobraCutaneaTriciptal.label" default="Dobra Cutanea Triciptal" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="dobraCutaneaTriciptal" required="" value="${fieldValue(bean: fichaInstance, field: 'dobraCutaneaTriciptal')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fichaInstance, field: 'fotoCostas', 'error')} required">
	<label for="fotoCostas">
		<g:message code="ficha.fotoCostas.label" default="Foto Costas" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="fotoCostas" name="fotoCostas" />
</div>

<div class="fieldcontain ${hasErrors(bean: fichaInstance, field: 'fotoFrente', 'error')} required">
	<label for="fotoFrente">
		<g:message code="ficha.fotoFrente.label" default="Foto Frente" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="fotoFrente" name="fotoFrente" />
</div>

<div class="fieldcontain ${hasErrors(bean: fichaInstance, field: 'fotoPerfilDireito', 'error')} required">
	<label for="fotoPerfilDireito">
		<g:message code="ficha.fotoPerfilDireito.label" default="Foto Perfil Direito" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="fotoPerfilDireito" name="fotoPerfilDireito" />
</div>

<div class="fieldcontain ${hasErrors(bean: fichaInstance, field: 'fotoPerfilEsquerdo', 'error')} required">
	<label for="fotoPerfilEsquerdo">
		<g:message code="ficha.fotoPerfilEsquerdo.label" default="Foto Perfil Esquerdo" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="fotoPerfilEsquerdo" name="fotoPerfilEsquerdo" />
</div>

<div class="fieldcontain ${hasErrors(bean: fichaInstance, field: 'idade', 'error')} required">
	<label for="idade">
		<g:message code="ficha.idade.label" default="Idade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="idade" required="" value="${fieldValue(bean: fichaInstance, field: 'idade')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fichaInstance, field: 'ombros', 'error')} required">
	<label for="ombros">
		<g:message code="ficha.ombros.label" default="Ombros" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="ombros" required="" value="${fieldValue(bean: fichaInstance, field: 'ombros')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fichaInstance, field: 'panturrilhaDireita', 'error')} required">
	<label for="panturrilhaDireita">
		<g:message code="ficha.panturrilhaDireita.label" default="Panturrilha Direita" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="panturrilhaDireita" required="" value="${fieldValue(bean: fichaInstance, field: 'panturrilhaDireita')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fichaInstance, field: 'panturrilhaEsquerda', 'error')} required">
	<label for="panturrilhaEsquerda">
		<g:message code="ficha.panturrilhaEsquerda.label" default="Panturrilha Esquerda" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="panturrilhaEsquerda" required="" value="${fieldValue(bean: fichaInstance, field: 'panturrilhaEsquerda')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fichaInstance, field: 'percentualGordura', 'error')} required">
	<label for="percentualGordura">
		<g:message code="ficha.percentualGordura.label" default="Percentual Gordura" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="percentualGordura" required="" value="${fieldValue(bean: fichaInstance, field: 'percentualGordura')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fichaInstance, field: 'peso', 'error')} required">
	<label for="peso">
		<g:message code="ficha.peso.label" default="Peso" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="peso" required="" value="${fieldValue(bean: fichaInstance, field: 'peso')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fichaInstance, field: 'punhoDireito', 'error')} required">
	<label for="punhoDireito">
		<g:message code="ficha.punhoDireito.label" default="Punho Direito" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="punhoDireito" required="" value="${fieldValue(bean: fichaInstance, field: 'punhoDireito')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fichaInstance, field: 'punhoEsquerdo', 'error')} required">
	<label for="punhoEsquerdo">
		<g:message code="ficha.punhoEsquerdo.label" default="Punho Esquerdo" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="punhoEsquerdo" required="" value="${fieldValue(bean: fichaInstance, field: 'punhoEsquerdo')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fichaInstance, field: 'torax', 'error')} required">
	<label for="torax">
		<g:message code="ficha.torax.label" default="Torax" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="torax" required="" value="${fieldValue(bean: fichaInstance, field: 'torax')}"/>
</div>

