object inta {
	const property parcelas = #{}
	
	method sumar(parcela){
		parcelas.add(parcela)
	}
	method promedioPlantas()=
		parcelas.sum({p => p.cantPlantas()}) / parcelas.size()
	
	method masAutosustentable()=
		parcelas.filter({ p => p.cantPlantas()>4}).max({p => p.porcentajeBienAsociadas()})
}