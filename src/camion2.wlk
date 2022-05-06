import cosas2.*

object camion {
	var cosas = []
	
	method cargar(cosa){
		cosas.add(cosa)
		cosa.consecuenciaDeCarga()
	}
	
	method descargar(cosa) = cosas.remove(cosa)
	
	method todoPesoPar() = cosas.all({e => e.peso().even()})
	
	method hayAlgunoQuePesa(peso) = cosas.any({e => e.peso()==peso})
	
	method elDeNivel(nivel) = cosas.find({e => e.nivelDePeligrosidad()==nivel})
	
	method pesoTotal() = cosas.sum({e => e.peso()}) + self.camionVacio()
	
	method camionVacio(){return 1000}
	
	method excedidoDePeso() {return self.pesoTotal() > 2500}
	
	method objetosQueSuperanPeligrosidad(nivel) = cosas.filter({e => e.nivelDePeligrosidad() > nivel})
	
	method objetosMasPeligrososQue(cosa) = self.objetosQueSuperanPeligrosidad(cosa.nivelDePeligrosidad())
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad){return not self.excedidoDePeso() and self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad).isEmpty()}
	
	method tieneAlgoQuePesaEntre(min, max) = cosas.any({c => c.peso().between(min, max)})
	
	method cosaMasPesada(){return cosas.max({c => c.peso()})}
	
	method pesos() = cosas.map({c => c.peso()})
	
	
}
