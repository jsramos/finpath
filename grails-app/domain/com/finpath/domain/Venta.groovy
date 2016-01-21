package com.finpath.domain

class Venta {

	Long id
	static hasMany = [empleado:Empleado, productos:Inventario, pagos:PagoVenta]
	Long comision
	TipoOferta tipoOferta
	Date fechaInicio
	Date fechaFin
	Integer cantidad
	Long importeBruto
	Long descuento
	Long importeNeto
	Boolean liquidado
	String tags
	
    static constraints = {
		
    }
}
