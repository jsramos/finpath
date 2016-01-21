package com.finpath.domain

enum MedioPago {
	TarjetaDebito(1,"TarjetaDebito"),
	TarjetaCredito(2,"TarjetaCredito"),
	Transferencia(3,"Transferencia"),
	Cheque(4,"Cheque"),
	Efectivo(5,"Efectivo")
	
	Long id
	String tipo
	
	MedioPago(Long id, String tipo) {
		this.id = id
		this.tipo = tipo
	}
	
}

