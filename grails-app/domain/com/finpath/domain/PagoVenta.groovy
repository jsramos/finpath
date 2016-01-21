package com.finpath.domain

import java.util.Date;

class PagoVenta {

	static belongsTo = [venta:Venta]
	Long id
	MedioPago medioPago
	Date fecha
	Long importePago
	String comprobante

    static constraints = {
    }
}
