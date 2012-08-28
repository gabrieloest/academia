package academia

class LoginTagLib {
	def loginControl = {
		if(request.getSession(false) && session.user && session.user.instanceOf(Aluno)){
			out << """${link(action:"indexAluno", id:"${session.user.id}",controller:"aluno"){"Minha Conta"}}"""
			out << """ ${link(action:"logout", controller:"aluno"){"Logout"}}"""
		}
		
		else if(request.getSession(false) && session.user && session.user.instanceOf(Professor)){
			out << """${link(action:"indexProfessor", id:"${session.user.id}",controller:"professor"){"Minha Conta"}}"""
			out << """ ${link(action:"logout", controller:"professor"){"Logout"}}"""
		} 
		
		else {
			out << """${link(action:"login", controller:"usuario"){"Login"}}"""
		}
	}
}
