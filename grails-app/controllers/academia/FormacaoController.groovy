package academia

import org.springframework.dao.DataIntegrityViolationException

class FormacaoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [formacaoInstanceList: Formacao.list(params), formacaoInstanceTotal: Formacao.count()]
    }

    def create() {
        [formacaoInstance: new Formacao(params)]
    }

    def save() {
        def formacaoInstance = new Formacao(params)
        if (!formacaoInstance.save(flush: true)) {
            render(view: "create", model: [formacaoInstance: formacaoInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'formacao.label', default: 'Formacao'), formacaoInstance.id])
        redirect(action: "show", id: formacaoInstance.id)
    }

    def show() {
        def formacaoInstance = Formacao.get(params.id)
        if (!formacaoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'formacao.label', default: 'Formacao'), params.id])
            redirect(action: "list")
            return
        }

        [formacaoInstance: formacaoInstance]
    }

    def edit() {
        def formacaoInstance = Formacao.get(params.id)
        if (!formacaoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'formacao.label', default: 'Formacao'), params.id])
            redirect(action: "list")
            return
        }

        [formacaoInstance: formacaoInstance]
    }

    def update() {
        def formacaoInstance = Formacao.get(params.id)
        if (!formacaoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'formacao.label', default: 'Formacao'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (formacaoInstance.version > version) {
                formacaoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'formacao.label', default: 'Formacao')] as Object[],
                          "Another user has updated this Formacao while you were editing")
                render(view: "edit", model: [formacaoInstance: formacaoInstance])
                return
            }
        }

        formacaoInstance.properties = params

        if (!formacaoInstance.save(flush: true)) {
            render(view: "edit", model: [formacaoInstance: formacaoInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'formacao.label', default: 'Formacao'), formacaoInstance.id])
        redirect(action: "show", id: formacaoInstance.id)
    }

    def delete() {
        def formacaoInstance = Formacao.get(params.id)
        if (!formacaoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'formacao.label', default: 'Formacao'), params.id])
            redirect(action: "list")
            return
        }

        try {
            formacaoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'formacao.label', default: 'Formacao'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'formacao.label', default: 'Formacao'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
