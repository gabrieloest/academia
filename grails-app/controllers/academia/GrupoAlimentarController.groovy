package academia

import org.springframework.dao.DataIntegrityViolationException

class GrupoAlimentarController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [grupoAlimentarInstanceList: GrupoAlimentar.list(params), grupoAlimentarInstanceTotal: GrupoAlimentar.count()]
    }

    def create() {
        [grupoAlimentarInstance: new GrupoAlimentar(params)]
    }

    def save() {
        def grupoAlimentarInstance = new GrupoAlimentar(params)
        if (!grupoAlimentarInstance.save(flush: true)) {
            render(view: "create", model: [grupoAlimentarInstance: grupoAlimentarInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'grupoAlimentar.label', default: 'GrupoAlimentar'), grupoAlimentarInstance.id])
        redirect(action: "show", id: grupoAlimentarInstance.id)
    }

    def show() {
        def grupoAlimentarInstance = GrupoAlimentar.get(params.id)
        if (!grupoAlimentarInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'grupoAlimentar.label', default: 'GrupoAlimentar'), params.id])
            redirect(action: "list")
            return
        }

        [grupoAlimentarInstance: grupoAlimentarInstance]
    }

    def edit() {
        def grupoAlimentarInstance = GrupoAlimentar.get(params.id)
        if (!grupoAlimentarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'grupoAlimentar.label', default: 'GrupoAlimentar'), params.id])
            redirect(action: "list")
            return
        }

        [grupoAlimentarInstance: grupoAlimentarInstance]
    }

    def update() {
        def grupoAlimentarInstance = GrupoAlimentar.get(params.id)
        if (!grupoAlimentarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'grupoAlimentar.label', default: 'GrupoAlimentar'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (grupoAlimentarInstance.version > version) {
                grupoAlimentarInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'grupoAlimentar.label', default: 'GrupoAlimentar')] as Object[],
                          "Another user has updated this GrupoAlimentar while you were editing")
                render(view: "edit", model: [grupoAlimentarInstance: grupoAlimentarInstance])
                return
            }
        }

        grupoAlimentarInstance.properties = params

        if (!grupoAlimentarInstance.save(flush: true)) {
            render(view: "edit", model: [grupoAlimentarInstance: grupoAlimentarInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'grupoAlimentar.label', default: 'GrupoAlimentar'), grupoAlimentarInstance.id])
        redirect(action: "show", id: grupoAlimentarInstance.id)
    }

    def delete() {
        def grupoAlimentarInstance = GrupoAlimentar.get(params.id)
        if (!grupoAlimentarInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'grupoAlimentar.label', default: 'GrupoAlimentar'), params.id])
            redirect(action: "list")
            return
        }

        try {
            grupoAlimentarInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'grupoAlimentar.label', default: 'GrupoAlimentar'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'grupoAlimentar.label', default: 'GrupoAlimentar'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
