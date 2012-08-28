package academia

import org.springframework.dao.DataIntegrityViolationException

class DietaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [dietaInstanceList: Dieta.list(params), dietaInstanceTotal: Dieta.count()]
    }

    def create() {
        [dietaInstance: new Dieta(params)]
    }

    def save() {
        def dietaInstance = new Dieta(params)
        if (!dietaInstance.save(flush: true)) {
            render(view: "create", model: [dietaInstance: dietaInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'dieta.label', default: 'Dieta'), dietaInstance.id])
        redirect(action: "show", id: dietaInstance.id)
    }

    def show() {
        def dietaInstance = Dieta.get(params.id)
        if (!dietaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'dieta.label', default: 'Dieta'), params.id])
            redirect(action: "list")
            return
        }

        [dietaInstance: dietaInstance]
    }

    def edit() {
        def dietaInstance = Dieta.get(params.id)
        if (!dietaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dieta.label', default: 'Dieta'), params.id])
            redirect(action: "list")
            return
        }

        [dietaInstance: dietaInstance]
    }

    def update() {
        def dietaInstance = Dieta.get(params.id)
        if (!dietaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dieta.label', default: 'Dieta'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (dietaInstance.version > version) {
                dietaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'dieta.label', default: 'Dieta')] as Object[],
                          "Another user has updated this Dieta while you were editing")
                render(view: "edit", model: [dietaInstance: dietaInstance])
                return
            }
        }

        dietaInstance.properties = params

        if (!dietaInstance.save(flush: true)) {
            render(view: "edit", model: [dietaInstance: dietaInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'dieta.label', default: 'Dieta'), dietaInstance.id])
        redirect(action: "show", id: dietaInstance.id)
    }

    def delete() {
        def dietaInstance = Dieta.get(params.id)
        if (!dietaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'dieta.label', default: 'Dieta'), params.id])
            redirect(action: "list")
            return
        }

        try {
            dietaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'dieta.label', default: 'Dieta'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'dieta.label', default: 'Dieta'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
