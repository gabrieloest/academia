package academia

class ConjuntoSerie {
	
	String grupo
	String repeticoes
	String peso
	Exercicio exercicio
	Date dateCreated

    static constraints = {
    }
	
	static belongsTo = [serie:Serie]
}
