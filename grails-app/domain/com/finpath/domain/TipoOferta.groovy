package com.finpath.domain

enum TipoOferta {
	Producto(1,"Producto"),
	Servicio(2,"Servicio") 
	
	Long id
	String tipo
	
	TipoOferta(Long id, String tipo) {
		this.id = id
		this.tipo = tipo
	}
	
}
