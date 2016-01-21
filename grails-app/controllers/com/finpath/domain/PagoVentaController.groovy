package com.finpath.domain


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PagoVentaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PagoVenta.list(params), model: [pagoVentaInstanceCount: PagoVenta.count()]
    }

    def show(PagoVenta pagoVentaInstance) {
        respond pagoVentaInstance
    }

    def create() {
        respond new PagoVenta(params)
    }

    @Transactional
    def save(PagoVenta pagoVentaInstance) {
        if (pagoVentaInstance == null) {
            notFound()
            return
        }

        if (pagoVentaInstance.hasErrors()) {
            respond pagoVentaInstance.errors, view: 'create'
            return
        }

        pagoVentaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'pagoVenta.label', default: 'PagoVenta'), pagoVentaInstance.id])
                redirect pagoVentaInstance
            }
            '*' { respond pagoVentaInstance, [status: CREATED] }
        }
    }

    def edit(PagoVenta pagoVentaInstance) {
        respond pagoVentaInstance
    }

    @Transactional
    def update(PagoVenta pagoVentaInstance) {
        if (pagoVentaInstance == null) {
            notFound()
            return
        }

        if (pagoVentaInstance.hasErrors()) {
            respond pagoVentaInstance.errors, view: 'edit'
            return
        }

        pagoVentaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PagoVenta.label', default: 'PagoVenta'), pagoVentaInstance.id])
                redirect pagoVentaInstance
            }
            '*' { respond pagoVentaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(PagoVenta pagoVentaInstance) {

        if (pagoVentaInstance == null) {
            notFound()
            return
        }

        pagoVentaInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PagoVenta.label', default: 'PagoVenta'), pagoVentaInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'pagoVenta.label', default: 'PagoVenta'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
