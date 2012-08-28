package academia

import org.springframework.dao.DataIntegrityViolationException

class ArtigoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [artigoInstanceList: Artigo.list(params), artigoInstanceTotal: Artigo.count()]
    }

    def create() {
        [artigoInstance: new Artigo(params)]
    }

    def save() {
        def artigoInstance = new Artigo(params)
        if (!artigoInstance.save(flush: true)) {
            render(view: "create", model: [artigoInstance: artigoInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'artigo.label', default: 'Artigo'), artigoInstance.id])
        redirect(action: "show", id: artigoInstance.id)
    }

    def show() {
        def artigoInstance = Artigo.get(params.id)
        if (!artigoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'artigo.label', default: 'Artigo'), params.id])
            redirect(action: "list")
            return
        }

        [artigoInstance: artigoInstance]
    }

    def edit() {
        def artigoInstance = Artigo.get(params.id)
        if (!artigoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'artigo.label', default: 'Artigo'), params.id])
            redirect(action: "list")
            return
        }

        [artigoInstance: artigoInstance]
    }

    def update() {
        def artigoInstance = Artigo.get(params.id)
        if (!artigoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'artigo.label', default: 'Artigo'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (artigoInstance.version > version) {
                artigoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'artigo.label', default: 'Artigo')] as Object[],
                          "Another user has updated this Artigo while you were editing")
                render(view: "edit", model: [artigoInstance: artigoInstance])
                return
            }
        }

        artigoInstance.properties = params

        if (!artigoInstance.save(flush: true)) {
            render(view: "edit", model: [artigoInstance: artigoInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'artigo.label', default: 'Artigo'), artigoInstance.id])
        redirect(action: "show", id: artigoInstance.id)
    }

    def delete() {
        def artigoInstance = Artigo.get(params.id)
        if (!artigoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'artigo.label', default: 'Artigo'), params.id])
            redirect(action: "list")
            return
        }

        try {
            artigoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'artigo.label', default: 'Artigo'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'artigo.label', default: 'Artigo'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
