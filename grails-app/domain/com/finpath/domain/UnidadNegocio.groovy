package com.finpath.domain

class UnidadNegocio {

	Long id
	String nombre
	static hasMany = [inventario:Inventario]
	
    static constraints = {
		id nullable:false, blank:false
		nombre nullable:false, blank:false
    }
}
