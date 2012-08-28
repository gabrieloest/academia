package academia

class Aluno extends Usuario{
	
	int idade
	String sexo
	Professor professor

    static constraints = {
		professor(nullable:true)
	}
	
	static hasMany = [fichas:Ficha, series:Serie, dietas:Dieta]
}
