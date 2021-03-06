object knightRider {
	method peso() = 500
	method nivelDePeligrosidad() = 10
	
}

object bumblebee {
	var estaEnModoAuto = true
	method estaEnModoAuto(){return estaEnModoAuto}
	method peso() = 800
	method nivelDePeligrosidad()= if(estaEnModoAuto){15}else{30}
	method cambiarARobot(){estaEnModoAuto = !estaEnModoAuto}
	
}

object paqueteLadrillos{
	var property cantidadDeLadrillos = 0
	method peso() = cantidadDeLadrillos *2
	method nivelDePeligrosidad() = 2
}


object arena {
	var property peso = 0
	method nivelDePeligrosidad() = 1
}

object bateriaAntiarea {
	var tieneMisilesCargados = true
	method tieneMisilesCargados(){return tieneMisilesCargados}
	method peso() = if(tieneMisilesCargados){300}else{200}
	method nivelDePeligrosidad() = if(tieneMisilesCargados){100}else{0}
	method cambiarEstadoDeMisiles(){tieneMisilesCargados = !tieneMisilesCargados}
	
}

object contenedor {
	var cosasDentro = []
	method agregarCosasAlContenedor(unaCosa) = cosasDentro.add(unaCosa)
	method sacarCosasAlContenedor(unaCosa) = cosasDentro.remove(unaCosa)
	method peso() = 100 + cosasDentro.sum({c => c.peso()})
	method objetoDentroConMayorPeligrosidad() = cosasDentro.max({c => c.nivelDePeligrosidad()})
	method nivelDePeligrosidad()= if(cosasDentro.isEmpty()){0}else{self.objetoDentroConMayorPeligrosidad().nivelDePeligrosidad()}
	
}

object residuosRadioactivos {
	var property peso = 0
	method nivelDePeligrosidad() = 200
}

object embalajeSeguridad {
	var property cosa
	method  peso() = cosa.peso()
	method nivelDePeligrosidad() = cosa.nivelDePeligrosidad() / 2
	
}




