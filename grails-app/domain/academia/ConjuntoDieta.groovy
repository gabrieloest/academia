package academia

class ConjuntoDieta {
	
	String refeicao
	String quantidade
	Alimento alimento

    static constraints = {
    }
	
	static belongsTo = [dieta:Dieta]
}
