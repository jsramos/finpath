package com.finpath.domain

class PagoCompra {

	static belongsTo = [compra:Compra]
	Long id
	MedioPago medioPago
	Date fecha
	Long importePago
    
	static constraints = {
		compra nullable:false
		medioPago nullable:false
		id nullable:false
		fecha nullable:false, blank:false
		importePago nullable:false, blank:false
    }
}
