object knightRider {
	method peso() = 500
	method nivelDePeligrosidad() = 10
	method totalBultos() = 1
	method consecuenciaDeCarga(){}
}




object bumblebee {
	var estaEnModoAuto = true
	method estaEnModoAuto(){return estaEnModoAuto}
	method peso() = 800
	method nivelDePeligrosidad()= if(estaEnModoAuto){15}else{30}
	method cambiarARobot(){estaEnModoAuto = !estaEnModoAuto}
	method totalBultos() = 2
	method consecuenciaDeCarga(){estaEnModoAuto = false}
}




object paqueteLadrillos{
	var property cantidadDeLadrillos = 0
	method peso() = cantidadDeLadrillos *2
	method nivelDePeligrosidad() = 2
	method totalBultos()= if(self.cantidadDeLadrillos().between(1, 100)){1}
						  else if(self.cantidadDeLadrillos().between(101, 300)){2}
						  else{3}
	method consecuenciaDeCarga() = self.cantidadDeLadrillos(12)
}



object arena {
	var property peso = 0
	method nivelDePeligrosidad() = 1
	method totalBultos() = 1
	method consecuenciaDeCarga()= self.peso(20)
	
}



object bateriaAntiarea {
	var tieneMisilesCargados = false
	method tieneMisilesCargados(){return tieneMisilesCargados}
	method peso() = if(tieneMisilesCargados){300}else{200}
	method nivelDePeligrosidad() = if(tieneMisilesCargados){100}else{0}
	method cambiarEstadoDeMisiles(){tieneMisilesCargados = !tieneMisilesCargados}
	method totalBultos()= if(tieneMisilesCargados){2}else{1}
	method consecuenciaDeCarga(){tieneMisilesCargados = true}
	
}




object contenedor {
	var cosasDentro = []
	method agregarCosasAlContenedor(unaCosa) = cosasDentro.add(unaCosa)
	method sacarCosasAlContenedor(unaCosa) = cosasDentro.remove(unaCosa)
	method peso() = 100 + cosasDentro.sum({c => c.peso()})
	method objetoDentroConMayorPeligrosidad() = cosasDentro.max({c => c.nivelDePeligrosidad()})
	method nivelDePeligrosidad()= if(cosasDentro.isEmpty()){0}else{self.objetoDentroConMayorPeligrosidad().nivelDePeligrosidad()}
	method totalBultos() = 1 + cosasDentro.sum({c => c.totalBultos()})
	method consecuenciaDeCarga() = cosasDentro.forEach({e => e.consecuenciaDeCarga()})
}




object residuosRadioactivos {
	var property peso = 0
	method nivelDePeligrosidad() = 200
	method totalBultos() = 1
	method consecuenciaDeCarga() = self.peso(20)
}




object embalajeSeguridad {
	var property cosa
	method  peso() = cosa.peso()
	method nivelDePeligrosidad() = cosa.nivelDePeligrosidad() / 2
	method totalBultos() = 2
	method consecuenciaDeCarga(){}
	
}




