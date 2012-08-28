package academia

import org.springframework.dao.DataIntegrityViolationException

class AtividadeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [atividadeInstanceList: Atividade.list(params), atividadeInstanceTotal: Atividade.count()]
    }

    def create() {
        [atividadeInstance: new Atividade(params)]
    }

    def save() {
        def atividadeInstance = new Atividade(params)
        if (!atividadeInstance.save(flush: true)) {
            render(view: "create", model: [atividadeInstance: atividadeInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'atividade.label', default: 'Atividade'), atividadeInstance.id])
        redirect(action: "show", id: atividadeInstance.id)
    }

    def show() {
        def atividadeInstance = Atividade.get(params.id)
        if (!atividadeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'atividade.label', default: 'Atividade'), params.id])
            redirect(action: "list")
            return
        }

        [atividadeInstance: atividadeInstance]
    }

    def edit() {
        def atividadeInstance = Atividade.get(params.id)
        if (!atividadeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'atividade.label', default: 'Atividade'), params.id])
            redirect(action: "list")
            return
        }

        [atividadeInstance: atividadeInstance]
    }

    def update() {
        def atividadeInstance = Atividade.get(params.id)
        if (!atividadeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'atividade.label', default: 'Atividade'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (atividadeInstance.version > version) {
                atividadeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'atividade.label', default: 'Atividade')] as Object[],
                          "Another user has updated this Atividade while you were editing")
                render(view: "edit", model: [atividadeInstance: atividadeInstance])
                return
            }
        }

        atividadeInstance.properties = params

        if (!atividadeInstance.save(flush: true)) {
            render(view: "edit", model: [atividadeInstance: atividadeInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'atividade.label', default: 'Atividade'), atividadeInstance.id])
        redirect(action: "show", id: atividadeInstance.id)
    }

    def delete() {
        def atividadeInstance = Atividade.get(params.id)
        if (!atividadeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'atividade.label', default: 'Atividade'), params.id])
            redirect(action: "list")
            return
        }

        try {
            atividadeInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'atividade.label', default: 'Atividade'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'atividade.label', default: 'Atividade'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
