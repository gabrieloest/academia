package academia

import org.springframework.dao.DataIntegrityViolationException

class ConjuntoDietaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [conjuntoDietaInstanceList: ConjuntoDieta.list(params), conjuntoDietaInstanceTotal: ConjuntoDieta.count()]
    }

    def create() {
        [conjuntoDietaInstance: new ConjuntoDieta(params)]
    }

    def save() {
        def conjuntoDietaInstance = new ConjuntoDieta(params)
        if (!conjuntoDietaInstance.save(flush: true)) {
            render(view: "create", model: [conjuntoDietaInstance: conjuntoDietaInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'conjuntoDieta.label', default: 'ConjuntoDieta'), conjuntoDietaInstance.id])
        redirect(action: "show", id: conjuntoDietaInstance.id)
    }

    def show() {
        def conjuntoDietaInstance = ConjuntoDieta.get(params.id)
        if (!conjuntoDietaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'conjuntoDieta.label', default: 'ConjuntoDieta'), params.id])
            redirect(action: "list")
            return
        }

        [conjuntoDietaInstance: conjuntoDietaInstance]
    }

    def edit() {
        def conjuntoDietaInstance = ConjuntoDieta.get(params.id)
        if (!conjuntoDietaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'conjuntoDieta.label', default: 'ConjuntoDieta'), params.id])
            redirect(action: "list")
            return
        }

        [conjuntoDietaInstance: conjuntoDietaInstance]
    }

    def update() {
        def conjuntoDietaInstance = ConjuntoDieta.get(params.id)
        if (!conjuntoDietaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'conjuntoDieta.label', default: 'ConjuntoDieta'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (conjuntoDietaInstance.version > version) {
                conjuntoDietaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'conjuntoDieta.label', default: 'ConjuntoDieta')] as Object[],
                          "Another user has updated this ConjuntoDieta while you were editing")
                render(view: "edit", model: [conjuntoDietaInstance: conjuntoDietaInstance])
                return
            }
        }

        conjuntoDietaInstance.properties = params

        if (!conjuntoDietaInstance.save(flush: true)) {
            render(view: "edit", model: [conjuntoDietaInstance: conjuntoDietaInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'conjuntoDieta.label', default: 'ConjuntoDieta'), conjuntoDietaInstance.id])
        redirect(action: "show", id: conjuntoDietaInstance.id)
    }

    def delete() {
        def conjuntoDietaInstance = ConjuntoDieta.get(params.id)
        if (!conjuntoDietaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'conjuntoDieta.label', default: 'ConjuntoDieta'), params.id])
            redirect(action: "list")
            return
        }

        try {
            conjuntoDietaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'conjuntoDieta.label', default: 'ConjuntoDieta'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'conjuntoDieta.label', default: 'ConjuntoDieta'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
