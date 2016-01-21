package com.finpath.domain

class Compra {

	Long id
	static hasMany = [productos:Inventario, pagos:PagoCompra]
	TipoOferta tipo
	Date fecha
	Integer cantidad
	Long precioUnitario
	Long importeBruto
	Long descuento
	Long importeNeto
	Boolean liquidado

    static constraints = {
		id name:id
		fecha blank:false, nullable:false
		cantidad blank:false, min: 1,nullable:false
		precioUnitario blank:false, nullable:false, min: 0.01
		importeBruto blank:false, nullable:false, min: 0.01
		descuento blank:false, min: 0.01
		importeNeto blank:false,nullable:false, min: 0.01
    }
	
}
