package academia

class Professor extends Usuario{
	
	String nome

    static constraints = {
		artigos(nullable:true)
		patrocinadores(nullable:true)
		curriculo(nullable:true)
    }
	
	static hasMany = [artigos:Artigo, patrocinadores:Patrocinador]
	
	static hasOne = [curriculo:Curriculo]
}
