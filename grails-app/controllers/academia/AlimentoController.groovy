package academia

import org.springframework.dao.DataIntegrityViolationException

class AlimentoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [alimentoInstanceList: Alimento.list(params), alimentoInstanceTotal: Alimento.count()]
    }

    def create() {
        [alimentoInstance: new Alimento(params)]
    }

    def save() {
        def alimentoInstance = new Alimento(params)
        if (!alimentoInstance.save(flush: true)) {
            render(view: "create", model: [alimentoInstance: alimentoInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'alimento.label', default: 'Alimento'), alimentoInstance.id])
        redirect(action: "show", id: alimentoInstance.id)
    }

    def show() {
        def alimentoInstance = Alimento.get(params.id)
        if (!alimentoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'alimento.label', default: 'Alimento'), params.id])
            redirect(action: "list")
            return
        }

        [alimentoInstance: alimentoInstance]
    }

    def edit() {
        def alimentoInstance = Alimento.get(params.id)
        if (!alimentoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'alimento.label', default: 'Alimento'), params.id])
            redirect(action: "list")
            return
        }

        [alimentoInstance: alimentoInstance]
    }

    def update() {
        def alimentoInstance = Alimento.get(params.id)
        if (!alimentoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'alimento.label', default: 'Alimento'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (alimentoInstance.version > version) {
                alimentoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'alimento.label', default: 'Alimento')] as Object[],
                          "Another user has updated this Alimento while you were editing")
                render(view: "edit", model: [alimentoInstance: alimentoInstance])
                return
            }
        }

        alimentoInstance.properties = params

        if (!alimentoInstance.save(flush: true)) {
            render(view: "edit", model: [alimentoInstance: alimentoInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'alimento.label', default: 'Alimento'), alimentoInstance.id])
        redirect(action: "show", id: alimentoInstance.id)
    }

    def delete() {
        def alimentoInstance = Alimento.get(params.id)
        if (!alimentoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'alimento.label', default: 'Alimento'), params.id])
            redirect(action: "list")
            return
        }

        try {
            alimentoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'alimento.label', default: 'Alimento'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'alimento.label', default: 'Alimento'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
