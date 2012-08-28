package academia

import org.springframework.dao.DataIntegrityViolationException

class GrupoMuscularController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [grupoMuscularInstanceList: GrupoMuscular.list(params), grupoMuscularInstanceTotal: GrupoMuscular.count()]
    }

    def create() {
        [grupoMuscularInstance: new GrupoMuscular(params)]
    }

    def save() {
        def grupoMuscularInstance = new GrupoMuscular(params)
        if (!grupoMuscularInstance.save(flush: true)) {
            render(view: "create", model: [grupoMuscularInstance: grupoMuscularInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'grupoMuscular.label', default: 'GrupoMuscular'), grupoMuscularInstance.id])
        redirect(action: "show", id: grupoMuscularInstance.id)
    }

    def show() {
        def grupoMuscularInstance = GrupoMuscular.get(params.id)
        if (!grupoMuscularInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'grupoMuscular.label', default: 'GrupoMuscular'), params.id])
            redirect(action: "list")
            return
        }

        [grupoMuscularInstance: grupoMuscularInstance]
    }

    def edit() {
        def grupoMuscularInstance = GrupoMuscular.get(params.id)
        if (!grupoMuscularInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'grupoMuscular.label', default: 'GrupoMuscular'), params.id])
            redirect(action: "list")
            return
        }

        [grupoMuscularInstance: grupoMuscularInstance]
    }

    def update() {
        def grupoMuscularInstance = GrupoMuscular.get(params.id)
        if (!grupoMuscularInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'grupoMuscular.label', default: 'GrupoMuscular'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (grupoMuscularInstance.version > version) {
                grupoMuscularInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'grupoMuscular.label', default: 'GrupoMuscular')] as Object[],
                          "Another user has updated this GrupoMuscular while you were editing")
                render(view: "edit", model: [grupoMuscularInstance: grupoMuscularInstance])
                return
            }
        }

        grupoMuscularInstance.properties = params

        if (!grupoMuscularInstance.save(flush: true)) {
            render(view: "edit", model: [grupoMuscularInstance: grupoMuscularInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'grupoMuscular.label', default: 'GrupoMuscular'), grupoMuscularInstance.id])
        redirect(action: "show", id: grupoMuscularInstance.id)
    }

    def delete() {
        def grupoMuscularInstance = GrupoMuscular.get(params.id)
        if (!grupoMuscularInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'grupoMuscular.label', default: 'GrupoMuscular'), params.id])
            redirect(action: "list")
            return
        }

        try {
            grupoMuscularInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'grupoMuscular.label', default: 'GrupoMuscular'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'grupoMuscular.label', default: 'GrupoMuscular'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
