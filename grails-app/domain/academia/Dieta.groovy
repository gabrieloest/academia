package academia

class Dieta {
	
	Date dateCreated

    static constraints = {
    }
	
	static belongsTo = [aluno:Aluno]
	
	static hasMany = [conjuntos:ConjuntoDieta]
}
