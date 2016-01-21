package com.finpath.domain

class Inventario {

	Long id
	String sku
	String nombreProducto
	String descripcionProducto
	static belongsTo = [unidadNegocio:UnidadNegocio]
	String tags
	Integer existencia
	Long costoUnitario
		
    static constraints = {
		unidadNegocio nullable:true
		sku blank: false,nullable:false
		nombreProducto blank:false,nullable:false
		descripcionProducto blank:false,nullable:false
		tags blank:false
		existencia blank:false
		costoUnitario blank:false
    }
}
