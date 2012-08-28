package academia

import org.grails.plugins.imagetools.ImageTool
import org.springframework.dao.DataIntegrityViolationException

class AlunoController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index() {
		redirect(action: "list", params: params)
	}

	def list() {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[alunoInstanceList: Aluno.list(params), alunoInstanceTotal: Aluno.count()]
	}
	
	def fichaList() {
		def alunoInstance = Aluno.get(params.id)
		if (!alunoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'aluno.label', default: 'Aluno'),
				params.id
			])
			redirect(action: "list")
			return
		}

		[alunoInstance: alunoInstance]
	}
	
	def serieList() {
		def alunoInstance = Aluno.get(params.id)
		if (!alunoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'aluno.label', default: 'Aluno'),
				params.id
			])
			redirect(action: "list")
			return
		}

		[alunoInstance: alunoInstance]
	}
	
	def dietaList() {
		def alunoInstance = Aluno.get(params.id)
		if (!alunoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'aluno.label', default: 'Aluno'),
				params.id
			])
			redirect(action: "list")
			return
		}

		[alunoInstance: alunoInstance]
	}

	def create() {
		[alunoInstance: new Aluno(params)]
	}

	def save() {
		def alunoInstance = new Aluno(params)
		if (!alunoInstance.save(flush: true)) {
			render(view: "create", model: [alunoInstance: alunoInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'aluno.label', default: 'Aluno'),
			alunoInstance.id
		])
		redirect(action: "login")
	}

	def show() {
		def alunoInstance = Aluno.get(params.id)
		if (!alunoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'aluno.label', default: 'Aluno'),
				params.id
			])
			redirect(action: "list")
			return
		}

		[alunoInstance: alunoInstance]
	}

	def edit() {
		def alunoInstance = Aluno.get(params.id)
		if (!alunoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'aluno.label', default: 'Aluno'),
				params.id
			])
			redirect(action: "list")
			return
		}

		[alunoInstance: alunoInstance]
	}

	def update() {
		def alunoInstance = Aluno.get(params.id)
		if (!alunoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'aluno.label', default: 'Aluno'),
				params.id
			])
			redirect(action: "list")
			return
		}

		if (params.version) {
			def version = params.version.toLong()
			if (alunoInstance.version > version) {
				alunoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'aluno.label', default: 'Aluno')]
						as Object[],
						"Another user has updated this Aluno while you were editing")
				render(view: "edit", model: [alunoInstance: alunoInstance])
				return
			}
		}

		alunoInstance.properties = params

		if (!alunoInstance.save(flush: true)) {
			render(view: "edit", model: [alunoInstance: alunoInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'aluno.label', default: 'Aluno'),
			alunoInstance.id
		])
		redirect(action: "show", id: alunoInstance.id)
	}

	def delete() {
		def alunoInstance = Aluno.get(params.id)
		if (!alunoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'aluno.label', default: 'Aluno'),
				params.id
			])
			redirect(action: "list")
			return
		}

		try {
			alunoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'aluno.label', default: 'Aluno'),
				params.id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'aluno.label', default: 'Aluno'),
				params.id
			])
			redirect(action: "show", id: params.id)
		}
	}

	def indexAluno() {
		def alunoInstance = Aluno.get(params.id)
		if (!alunoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'aluno.label', default: 'Aluno'),
				params.id
			])
			redirect(action: "list")
			return
		}

		[alunoInstance: alunoInstance]
	}

	def imagem = {
		def photo = Aluno.get( params.id )
		byte[] image = photo.avatar 
		response.outputStream << image
	}

	def login = {}

	def logout = {
		flash.message = "Tchau ${session.user.nome}"
		session.user = null
		redirect(action:"login")
	}

	def authenticate = {
		def user = Aluno.findByEmailAndPassword(params.email, params.password.encodeAsSHA())
		if(user){
			session.user = user
			flash.message = "Bem vindo ${user.nome}!"
			redirect(action:"indexAluno", id:user.id)
		}else{
			flash.message = "Desculpa, email ou senha incorreto. Tente novamente."
			redirect(action:"login")
		}
	}
}
