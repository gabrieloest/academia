package academia

import java.util.Date;

class Ficha {
	
	Date dateCreated
	
	int idade
	double altura
	byte[] fotoFrente
	byte[] fotoCostas
	byte[] fotoPerfilDireito
	byte[] fotoPerfilEsquerdo
	
	//Medidas
	double peso
	double cintura
	double bicepsDireito
	double bicepsEsquerdo
	double antebracoDireito
	double antebracoEsquerdo
	double punhoDireito
	double punhoEsquerdo
	double coxaDireitra
	double coxaEsquerda
	double panturrilhaDireita
	double panturrilhaEsquerda
	double ombros
	double torax
	double abdomem

	//Dobras
	double dobraCutaneaTriciptal
	double dobraCutaneaSubescapular
	double dobraCutaneaBiciptal
	double dobraCutaneaAxilarMedia
	double dobraCutaneaSupraIliaca
	double dobraCutaneaToracica
	double dobraCutaneaAbdominal
	double dobraCutaneaCoxa
	double dobraCutaneaPanturrilhaMedial
	
	double percentualGordura
	
    static constraints = {
		fotoCostas(nullable:false)
		fotoFrente(nullable:false)
		fotoPerfilDireito(nullable:false)
		fotoPerfilEsquerdo(nullable:false)
    }
	
	static belongsTo = [aluno:Aluno]
}
