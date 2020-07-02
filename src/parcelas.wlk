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
	
	method cantPlantas()= plantas.size()
	
	method estaCompleta()=
		self.cantPlantas() == self.plantasToleradas()
	
	method tienePlantaMayorA(num)=
		plantas.any({p => p.altura() > num })
	
	method seAsociaBien(planta)
	
	method cantBienAsociadas()=
		plantas.count({p => self.seAsociaBien(p)})
		
	method porcentajeBienAsociadas()=
		self.cantBienAsociadas() *100 / self.cantPlantas() /*CHECKEAR */
}

class Ecologica inherits Parcela {
	override method seAsociaBien(planta)=
		not self.tieneComplicaciones() and planta.esIdeal(self)
}

class Industrial inherits Parcela {
	override method seAsociaBien(planta)=
		self.cantPlantas() <= 2  and  planta.esFuerte()
}