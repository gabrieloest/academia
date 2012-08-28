package academia

class Atividade {
	
	String titulo
	String descricao
	Date inicio
	Date fim
	TipoAtividade tipo

    static constraints = {
    }
	
	
	static belongsTo = [professor:Professor]
}
