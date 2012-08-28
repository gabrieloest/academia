package academia

import org.springframework.dao.DataIntegrityViolationException

class ExercicioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [exercicioInstanceList: Exercicio.list(params), exercicioInstanceTotal: Exercicio.count()]
    }

    def create() {
        [exercicioInstance: new Exercicio(params)]
    }

    def save() {
        def exercicioInstance = new Exercicio(params)
        if (!exercicioInstance.save(flush: true)) {
            render(view: "create", model: [exercicioInstance: exercicioInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'exercicio.label', default: 'Exercicio'), exercicioInstance.id])
        redirect(action: "show", id: exercicioInstance.id)
    }

    def show() {
        def exercicioInstance = Exercicio.get(params.id)
        if (!exercicioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'exercicio.label', default: 'Exercicio'), params.id])
            redirect(action: "list")
            return
        }

        [exercicioInstance: exercicioInstance]
    }

    def edit() {
        def exercicioInstance = Exercicio.get(params.id)
        if (!exercicioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'exercicio.label', default: 'Exercicio'), params.id])
            redirect(action: "list")
            return
        }

        [exercicioInstance: exercicioInstance]
    }

    def update() {
        def exercicioInstance = Exercicio.get(params.id)
        if (!exercicioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'exercicio.label', default: 'Exercicio'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (exercicioInstance.version > version) {
                exercicioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'exercicio.label', default: 'Exercicio')] as Object[],
                          "Another user has updated this Exercicio while you were editing")
                render(view: "edit", model: [exercicioInstance: exercicioInstance])
                return
            }
        }

        exercicioInstance.properties = params

        if (!exercicioInstance.save(flush: true)) {
            render(view: "edit", model: [exercicioInstance: exercicioInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'exercicio.label', default: 'Exercicio'), exercicioInstance.id])
        redirect(action: "show", id: exercicioInstance.id)
    }

    def delete() {
        def exercicioInstance = Exercicio.get(params.id)
        if (!exercicioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'exercicio.label', default: 'Exercicio'), params.id])
            redirect(action: "list")
            return
        }

        try {
            exercicioInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'exercicio.label', default: 'Exercicio'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'exercicio.label', default: 'Exercicio'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
