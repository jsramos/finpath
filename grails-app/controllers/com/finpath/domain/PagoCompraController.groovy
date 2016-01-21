package com.finpath.domain


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PagoCompraController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PagoCompra.list(params), model: [pagoCompraInstanceCount: PagoCompra.count()]
    }

    def show(PagoCompra pagoCompraInstance) {
        respond pagoCompraInstance
    }

    def create() {
        respond new PagoCompra(params)
    }

    @Transactional
    def save(PagoCompra pagoCompraInstance) {
        if (pagoCompraInstance == null) {
            notFound()
            return
        }

        if (pagoCompraInstance.hasErrors()) {
            respond pagoCompraInstance.errors, view: 'create'
            return
        }

        pagoCompraInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'pagoCompra.label', default: 'PagoCompra'), pagoCompraInstance.id])
                redirect pagoCompraInstance
            }
            '*' { respond pagoCompraInstance, [status: CREATED] }
        }
    }

    def edit(PagoCompra pagoCompraInstance) {
        respond pagoCompraInstance
    }

    @Transactional
    def update(PagoCompra pagoCompraInstance) {
        if (pagoCompraInstance == null) {
            notFound()
            return
        }

        if (pagoCompraInstance.hasErrors()) {
            respond pagoCompraInstance.errors, view: 'edit'
            return
        }

        pagoCompraInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PagoCompra.label', default: 'PagoCompra'), pagoCompraInstance.id])
                redirect pagoCompraInstance
            }
            '*' { respond pagoCompraInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(PagoCompra pagoCompraInstance) {

        if (pagoCompraInstance == null) {
            notFound()
            return
        }

        pagoCompraInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PagoCompra.label', default: 'PagoCompra'), pagoCompraInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'pagoCompra.label', default: 'PagoCompra'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
