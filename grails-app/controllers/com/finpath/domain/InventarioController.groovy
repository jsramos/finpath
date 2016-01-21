package com.finpath.domain


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class InventarioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Inventario.list(params), model: [inventarioInstanceCount: Inventario.count()]
    }

    def show(Inventario inventarioInstance) {
        respond inventarioInstance
    }

    def create() {
        respond new Inventario(params)
    }

    @Transactional
    def save(Inventario inventarioInstance) {
        if (inventarioInstance == null) {
            notFound()
            return
        }

        if (inventarioInstance.hasErrors()) {
            respond inventarioInstance.errors, view: 'create'
            return
        }

        inventarioInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'inventario.label', default: 'Inventario'), inventarioInstance.id])
                redirect inventarioInstance
            }
            '*' { respond inventarioInstance, [status: CREATED] }
        }
    }

    def edit(Inventario inventarioInstance) {
        respond inventarioInstance
    }

    @Transactional
    def update(Inventario inventarioInstance) {
        if (inventarioInstance == null) {
            notFound()
            return
        }

        if (inventarioInstance.hasErrors()) {
            respond inventarioInstance.errors, view: 'edit'
            return
        }

        inventarioInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Inventario.label', default: 'Inventario'), inventarioInstance.id])
                redirect inventarioInstance
            }
            '*' { respond inventarioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Inventario inventarioInstance) {

        if (inventarioInstance == null) {
            notFound()
            return
        }

        inventarioInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Inventario.label', default: 'Inventario'), inventarioInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'inventario.label', default: 'Inventario'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
