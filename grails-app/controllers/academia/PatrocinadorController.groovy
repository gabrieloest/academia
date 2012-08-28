package academia

import org.springframework.dao.DataIntegrityViolationException

class PatrocinadorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [patrocinadorInstanceList: Patrocinador.list(params), patrocinadorInstanceTotal: Patrocinador.count()]
    }

    def create() {
        [patrocinadorInstance: new Patrocinador(params)]
    }

    def save() {
        def patrocinadorInstance = new Patrocinador(params)
        if (!patrocinadorInstance.save(flush: true)) {
            render(view: "create", model: [patrocinadorInstance: patrocinadorInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'patrocinador.label', default: 'Patrocinador'), patrocinadorInstance.id])
        redirect(action: "show", id: patrocinadorInstance.id)
    }

    def show() {
        def patrocinadorInstance = Patrocinador.get(params.id)
        if (!patrocinadorInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'patrocinador.label', default: 'Patrocinador'), params.id])
            redirect(action: "list")
            return
        }

        [patrocinadorInstance: patrocinadorInstance]
    }

    def edit() {
        def patrocinadorInstance = Patrocinador.get(params.id)
        if (!patrocinadorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'patrocinador.label', default: 'Patrocinador'), params.id])
            redirect(action: "list")
            return
        }

        [patrocinadorInstance: patrocinadorInstance]
    }

    def update() {
        def patrocinadorInstance = Patrocinador.get(params.id)
        if (!patrocinadorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'patrocinador.label', default: 'Patrocinador'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (patrocinadorInstance.version > version) {
                patrocinadorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'patrocinador.label', default: 'Patrocinador')] as Object[],
                          "Another user has updated this Patrocinador while you were editing")
                render(view: "edit", model: [patrocinadorInstance: patrocinadorInstance])
                return
            }
        }

        patrocinadorInstance.properties = params

        if (!patrocinadorInstance.save(flush: true)) {
            render(view: "edit", model: [patrocinadorInstance: patrocinadorInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'patrocinador.label', default: 'Patrocinador'), patrocinadorInstance.id])
        redirect(action: "show", id: patrocinadorInstance.id)
    }

    def delete() {
        def patrocinadorInstance = Patrocinador.get(params.id)
        if (!patrocinadorInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'patrocinador.label', default: 'Patrocinador'), params.id])
            redirect(action: "list")
            return
        }

        try {
            patrocinadorInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'patrocinador.label', default: 'Patrocinador'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'patrocinador.label', default: 'Patrocinador'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
