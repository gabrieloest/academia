package academia

import org.springframework.dao.DataIntegrityViolationException

class ConjuntoSerieController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [conjuntoSerieInstanceList: ConjuntoSerie.list(params), conjuntoSerieInstanceTotal: ConjuntoSerie.count()]
    }

    def create() {
        [conjuntoSerieInstance: new ConjuntoSerie(params)]
    }

    def save() {
        def conjuntoSerieInstance = new ConjuntoSerie(params)
        if (!conjuntoSerieInstance.save(flush: true)) {
            render(view: "create", model: [conjuntoSerieInstance: conjuntoSerieInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'conjuntoSerie.label', default: 'ConjuntoSerie'), conjuntoSerieInstance.id])
        redirect(action: "show", id: conjuntoSerieInstance.id)
    }

    def show() {
        def conjuntoSerieInstance = ConjuntoSerie.get(params.id)
        if (!conjuntoSerieInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'conjuntoSerie.label', default: 'ConjuntoSerie'), params.id])
            redirect(action: "list")
            return
        }

        [conjuntoSerieInstance: conjuntoSerieInstance]
    }

    def edit() {
        def conjuntoSerieInstance = ConjuntoSerie.get(params.id)
        if (!conjuntoSerieInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'conjuntoSerie.label', default: 'ConjuntoSerie'), params.id])
            redirect(action: "list")
            return
        }

        [conjuntoSerieInstance: conjuntoSerieInstance]
    }

    def update() {
        def conjuntoSerieInstance = ConjuntoSerie.get(params.id)
        if (!conjuntoSerieInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'conjuntoSerie.label', default: 'ConjuntoSerie'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (conjuntoSerieInstance.version > version) {
                conjuntoSerieInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'conjuntoSerie.label', default: 'ConjuntoSerie')] as Object[],
                          "Another user has updated this ConjuntoSerie while you were editing")
                render(view: "edit", model: [conjuntoSerieInstance: conjuntoSerieInstance])
                return
            }
        }

        conjuntoSerieInstance.properties = params

        if (!conjuntoSerieInstance.save(flush: true)) {
            render(view: "edit", model: [conjuntoSerieInstance: conjuntoSerieInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'conjuntoSerie.label', default: 'ConjuntoSerie'), conjuntoSerieInstance.id])
        redirect(action: "show", id: conjuntoSerieInstance.id)
    }

    def delete() {
        def conjuntoSerieInstance = ConjuntoSerie.get(params.id)
        if (!conjuntoSerieInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'conjuntoSerie.label', default: 'ConjuntoSerie'), params.id])
            redirect(action: "list")
            return
        }

        try {
            conjuntoSerieInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'conjuntoSerie.label', default: 'ConjuntoSerie'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'conjuntoSerie.label', default: 'ConjuntoSerie'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
