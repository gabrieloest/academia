package academia

class Artigo {
	
	String titulo
	String conteudo
	Date dateCreated
	boolean emDestaque

    static constraints = {
    }
	
	static belongsTo = [professor:Professor]
}
