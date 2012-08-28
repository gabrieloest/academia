package academia

class Curriculo {

    static constraints = {
    }
	
	static belongsTo = [professor:Professor]
	
	static hasMany = [formacoes:Formacao, atividades:Atividade]
}
