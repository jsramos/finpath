package com.finpath.domain

class Empleado {

	Long id
	String rfc
	String curp
	String clabe
	String puesto
	static belongsTo = [superior:Empleado]
	
    static constraints = {
    }
}
