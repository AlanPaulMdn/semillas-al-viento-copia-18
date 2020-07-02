class Planta {
	const property anio
	const property altura
	
	method toleranciaSol()= 7
	method esFuerte()= self.toleranciaSol() > 9
	method daSemillas()= self.esFuerte()
	
	method espacioOcupado()
	method esIdeal(parcela)
}

class Menta inherits Planta {
	override method daSemillas()=
		super() or self.espacioOcupado() > 1.5
	
	override method espacioOcupado()=
		altura + 1
	
	override method esIdeal(parcela)=
		parcela.superficie() > 6
}

class Hierbabuena inherits Menta{
	override method espacioOcupado()=	super()*2
}

class Soja inherits Planta {
	
	override method toleranciaSol()=
		if (altura < 0.5) {6}
		else if (altura.between(0.5,1)) {8}
		else {12}
	
	override method daSemillas()=
		super() or anio > 2007 and altura.between(0.75,0.9)
	
	override method espacioOcupado()=
		altura / 2
	
	override method esIdeal(parcela)=
		self.toleranciaSol() == parcela.horasSol()
}

class SojaTransgenica inherits Soja	{
	override method daSemillas()= false
	
	override method esIdeal(parcela)=
		parcela.plantasToleradas() == 1
}

class Quinoa inherits Planta{
	const property espacioOcupado
	
	override method toleranciaSol()=
		if (espacioOcupado < 0.3) {10}
		else {super()}
	
	override method daSemillas()=
		super() or anio < 2005
	
	override method esIdeal(parcela)=
		not parcela.tienePlantaMayorA(1.5)
}

