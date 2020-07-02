import plantas.*

class Parcela {
	const property ancho
	const property largo
	const property horasSol = 0 //inicializo porque wollok tira error sino
	const property plantas = #{}
	
	method superficie()= ancho * largo
	
	method plantasToleradas()=
		if (largo > 3) { largo + 4 }
		else {self.superficie() / 2}
	
	method tieneComplicaciones()=
		plantas.any({p => p.toleranciaSol() < horasSol })
	
	method plantar(planta){
		if (not self.estaCompleta() or horasSol - planta.toleranciaSol() >= 2 ) {
			plantas.add(planta)
		}
		else {console.println("No se puede realizar la plantación")}
	}
	
	method estaCompleta()=
		plantas.size() == self.plantasToleradas()
	
		
}