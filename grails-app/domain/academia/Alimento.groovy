package academia

class Alimento {
	
	String nome
	int calorias

    static constraints = {
    }
	
	static belongsTo = [grupoAlimentar:GrupoAlimentar]
}
