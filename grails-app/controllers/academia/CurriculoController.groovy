package academia

import org.springframework.dao.DataIntegrityViolationException

class CurriculoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [curriculoInstanceList: Curriculo.list(params), curriculoInstanceTotal: Curriculo.count()]
    }

    def create() {
        [curriculoInstance: new Curriculo(params)]
    }

    def save() {
        def curriculoInstance = new Curriculo(params)
        if (!curriculoInstance.save(flush: true)) {
            render(view: "create", model: [curriculoInstance: curriculoInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'curriculo.label', default: 'Curriculo'), curriculoInstance.id])
        redirect(action: "show", id: curriculoInstance.id)
    }

    def show() {
        def curriculoInstance = Curriculo.get(params.id)
        if (!curriculoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'curriculo.label', default: 'Curriculo'), params.id])
            redirect(action: "list")
            return
        }

        [curriculoInstance: curriculoInstance]
    }

    def edit() {
        def curriculoInstance = Curriculo.get(params.id)
        if (!curriculoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'curriculo.label', default: 'Curriculo'), params.id])
            redirect(action: "list")
            return
        }

        [curriculoInstance: curriculoInstance]
    }

    def update() {
        def curriculoInstance = Curriculo.get(params.id)
        if (!curriculoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'curriculo.label', default: 'Curriculo'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (curriculoInstance.version > version) {
                curriculoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'curriculo.label', default: 'Curriculo')] as Object[],
                          "Another user has updated this Curriculo while you were editing")
                render(view: "edit", model: [curriculoInstance: curriculoInstance])
                return
            }
        }

        curriculoInstance.properties = params

        if (!curriculoInstance.save(flush: true)) {
            render(view: "edit", model: [curriculoInstance: curriculoInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'curriculo.label', default: 'Curriculo'), curriculoInstance.id])
        redirect(action: "show", id: curriculoInstance.id)
    }

    def delete() {
        def curriculoInstance = Curriculo.get(params.id)
        if (!curriculoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'curriculo.label', default: 'Curriculo'), params.id])
            redirect(action: "list")
            return
        }

        try {
            curriculoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'curriculo.label', default: 'Curriculo'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'curriculo.label', default: 'Curriculo'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
