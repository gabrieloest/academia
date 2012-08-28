package academia

class Serie {
	
	Date dateCreated
	Professor professor
	
    static constraints = {
		professor(nullable:true)
    }
	
	static belongsTo = [aluno:Aluno]
	
	static hasMany = [conjuntos:ConjuntoSerie]
}
