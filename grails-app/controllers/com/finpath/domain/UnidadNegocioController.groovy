package com.finpath.domain


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UnidadNegocioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond UnidadNegocio.list(params), model: [unidadNegocioInstanceCount: UnidadNegocio.count()]
    }

    def show(UnidadNegocio unidadNegocioInstance) {
        respond unidadNegocioInstance
    }

    def create() {
        respond new UnidadNegocio(params)
    }

    @Transactional
    def save(UnidadNegocio unidadNegocioInstance) {
        if (unidadNegocioInstance == null) {
            notFound()
            return
        }

        if (unidadNegocioInstance.hasErrors()) {
            respond unidadNegocioInstance.errors, view: 'create'
            return
        }

        unidadNegocioInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'unidadNegocio.label', default: 'UnidadNegocio'), unidadNegocioInstance.id])
                redirect unidadNegocioInstance
            }
            '*' { respond unidadNegocioInstance, [status: CREATED] }
        }
    }

    def edit(UnidadNegocio unidadNegocioInstance) {
        respond unidadNegocioInstance
    }

    @Transactional
    def update(UnidadNegocio unidadNegocioInstance) {
        if (unidadNegocioInstance == null) {
            notFound()
            return
        }

        if (unidadNegocioInstance.hasErrors()) {
            respond unidadNegocioInstance.errors, view: 'edit'
            return
        }

        unidadNegocioInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'UnidadNegocio.label', default: 'UnidadNegocio'), unidadNegocioInstance.id])
                redirect unidadNegocioInstance
            }
            '*' { respond unidadNegocioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(UnidadNegocio unidadNegocioInstance) {

        if (unidadNegocioInstance == null) {
            notFound()
            return
        }

        unidadNegocioInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'UnidadNegocio.label', default: 'UnidadNegocio'), unidadNegocioInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'unidadNegocio.label', default: 'UnidadNegocio'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
