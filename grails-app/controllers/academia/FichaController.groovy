package academia

import org.springframework.dao.DataIntegrityViolationException

class FichaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [fichaInstanceList: Ficha.list(params), fichaInstanceTotal: Ficha.count()]
    }

    def create() {
        [fichaInstance: new Ficha(params)]
    }

    def save() {
        def fichaInstance = new Ficha(params)
        if (!fichaInstance.save(flush: true)) {
            render(view: "create", model: [fichaInstance: fichaInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'ficha.label', default: 'Ficha'), fichaInstance.id])
        redirect(action: "show", id: fichaInstance.id)
    }

    def show() {
        def fichaInstance = Ficha.get(params.id)
        if (!fichaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'ficha.label', default: 'Ficha'), params.id])
            redirect(action: "list")
            return
        }

        [fichaInstance: fichaInstance]
    }

    def edit() {
        def fichaInstance = Ficha.get(params.id)
        if (!fichaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ficha.label', default: 'Ficha'), params.id])
            redirect(action: "list")
            return
        }

        [fichaInstance: fichaInstance]
    }

    def update() {
        def fichaInstance = Ficha.get(params.id)
        if (!fichaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ficha.label', default: 'Ficha'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (fichaInstance.version > version) {
                fichaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'ficha.label', default: 'Ficha')] as Object[],
                          "Another user has updated this Ficha while you were editing")
                render(view: "edit", model: [fichaInstance: fichaInstance])
                return
            }
        }

        fichaInstance.properties = params

        if (!fichaInstance.save(flush: true)) {
            render(view: "edit", model: [fichaInstance: fichaInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'ficha.label', default: 'Ficha'), fichaInstance.id])
        redirect(action: "show", id: fichaInstance.id)
    }

    def delete() {
        def fichaInstance = Ficha.get(params.id)
        if (!fichaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'ficha.label', default: 'Ficha'), params.id])
            redirect(action: "list")
            return
        }

        try {
            fichaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'ficha.label', default: 'Ficha'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'ficha.label', default: 'Ficha'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
