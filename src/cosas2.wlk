/*
 * cosas2: Bien(-). Había problemas con el método consecuenciaDeCarga() en 3 objetos, 
 * te dejé la corrección hecha en el código. Y en bumblebee no quedaba del todo bien
 * definido el método para convertirlo de auto a robot. El resto detalles.
 */

object knightRider {
	/* Bien */
	method peso() = 500
	method nivelDePeligrosidad() = 10
	method totalBultos() = 1
	method consecuenciaDeCarga(){}
}




object bumblebee {
	/* Bien. Acá te convenía usar var property estaEnModoAuto y utilizar
	 * los getter y setter que te provee esa propiedad. El nombre del método cambiarARobot()
	 * no es del todo correcto, ya que si le pasas ese mensaje al objeto teniendo
	 * el valor false en la variable estaEnModoAuto (es robot) , te queda en true y podrías 
	 * asumir que estaEnModoRobot cuando en realidad estaEnModoAuto es true. El método podría
	 * llamarse transformarse()
	 */
	var estaEnModoAuto = true
	method estaEnModoAuto(){return estaEnModoAuto}
	method peso() = 800
	method nivelDePeligrosidad()= if(estaEnModoAuto){15}else{30}
	method cambiarARobot(){estaEnModoAuto = !estaEnModoAuto}
	method totalBultos() = 2
	method consecuenciaDeCarga(){estaEnModoAuto = false}
}




object paqueteLadrillos{
	/* Bien. Habría que pensar que pasa si le pasas el mensaje totalBultos() estando el 
	 * paquete de ladrillos con 0 cantidad de ladrillos. No sería correcto que retorne 3.
	 * Tal vez hubiese pensado que el paquete sin ladrillos retorna 1 bulto, pero es un detalle nomás.
	 * El método consecuenciaDeCarga() no es correcto, ya que realiza un setter sobre la variable cantidadDeLadrillos 
	 * y reemplaza el valor que tenía. La solución correcta era sumarle 12 ladrillos. Te dejo como
	 * sería.
	 */
	var property cantidadDeLadrillos = 0
	method peso() = cantidadDeLadrillos *2
	method nivelDePeligrosidad() = 2
	method totalBultos()= if(self.cantidadDeLadrillos().between(1, 100)){1}
						  else if(self.cantidadDeLadrillos().between(101, 300)){2}
						  else{3}
	method consecuenciaDeCarga() { cantidadDeLadrillos += 12 }
}



object arena {
	/* Regular. El método consecuenciaDeCarga() no está correcto, ya que cada
	 * vez que lo invocás, realiza un setter sobre la variable peso y reemplaza el 
	 * valor que tenía. La solución correcta era sumarle 20 al peso. Te dejo como
	 * sería.
	 */
	var property peso = 0
	method nivelDePeligrosidad() = 1
	method totalBultos() = 1
	method consecuenciaDeCarga() {peso += 20}
	
}



object bateriaAntiarea {
	/* Bien. */
	var tieneMisilesCargados = false
	method tieneMisilesCargados(){return tieneMisilesCargados}
	method peso() = if(tieneMisilesCargados){300}else{200}
	method nivelDePeligrosidad() = if(tieneMisilesCargados){100}else{0}
	method cambiarEstadoDeMisiles(){tieneMisilesCargados = !tieneMisilesCargados}
	method totalBultos()= if(tieneMisilesCargados){2}else{1}
	method consecuenciaDeCarga(){tieneMisilesCargados = true}
	
}




object contenedor {
	/* Bien. La lista de cosasDentro podría ser una constante si siempre va a apuntar
	 * a la misma lista donde se agregarán cosas o removerán cosas. Si en tu solución 
	 * nunca se contemplará reapuntar esa referencia a otra lista, entonces se sugiere
	 *  usar const.
	 */
	const cosasDentro = []
	method agregarCosasAlContenedor(unaCosa) = cosasDentro.add(unaCosa)
	method sacarCosasAlContenedor(unaCosa) = cosasDentro.remove(unaCosa)
	method peso() = 100 + cosasDentro.sum({c => c.peso()})
	method objetoDentroConMayorPeligrosidad() = cosasDentro.max({c => c.nivelDePeligrosidad()})
	method nivelDePeligrosidad()= if(cosasDentro.isEmpty()){0}else{self.objetoDentroConMayorPeligrosidad().nivelDePeligrosidad()}
	method totalBultos() = 1 + cosasDentro.sum({c => c.totalBultos()})
	method consecuenciaDeCarga() = cosasDentro.forEach({e => e.consecuenciaDeCarga()})
}




object residuosRadioactivos {
	/* Regular. El método consecuenciaDeCarga() no está correcto, ya que cada
	 * vez que lo invocás, realiza un setter sobre la variable peso y reemplaza el 
	 * valor que tenía. La solución correcta era sumarle 20 al peso. Te dejo como
	 * sería.
	 */
	var property peso = 0
	method nivelDePeligrosidad() = 200
	method totalBultos() = 1
	method consecuenciaDeCarga() {peso += 15}
}




object embalajeSeguridad {
	/* Bien. Tal vez el nombre de la variable podría haber sido cosaEnvuelta */
	var property cosa
	method  peso() = cosa.peso()
	method nivelDePeligrosidad() = cosa.nivelDePeligrosidad() / 2
	method totalBultos() = 2
	method consecuenciaDeCarga(){}
	
}




