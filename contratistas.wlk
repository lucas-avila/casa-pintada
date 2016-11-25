class Arquitecto{
	
	var costoAmbiente
	
	constructor(costo){
		costoAmbiente = costo
	}
	
	method calcularCostoTotal(unaCasa)
	{
		return costoAmbiente*unaCasa.cantAmbientes()*unaCasa.pisos()
	}
	
}

class MaestroMayorObra{
	
	var costoAmbiente
	
	constructor(costo) {
		costoAmbiente = costo
	}
	
	method calcularCostoTotal(unaCasa) 
	{
		var ambientes = unaCasa.cantAmbientes()
		var costo = costoAmbiente*ambientes
		if (unaCasa.esComplicada())
			costo += self.recargo(ambientes)
		return costo
	}
	
	method recargo(cantAmbientes)
	{
		return costoAmbiente *cantAmbientes*0.20
	}
}

class Albanil{
	
	var costoHora = 50
	var horasDia = 8
	var tardanza 
	
	constructor(tarda)
	{
		tardanza = tarda
	}
	
	method calcularCostoTotal(unaCasa)
	{
		return unaCasa.cantAmbientes()*tardanza*horasDia*costoHora
	}
}

class Electricista{
	
	var costoAmbiente
	
	constructor(costo)
	{
		costoAmbiente = costo
	}
	
	method calcularCostoTotal(unaCasa)
	{
		var costoBase = costoAmbiente*unaCasa.cantAmbientes()
		if (unaCasa.esComplicada()) return 2*costoBase
		
		return costoBase
	}
	
}

class Plomero{
	
	var costoAmbiente = 100
	var recargo
	
	constructor(r){
		
		recargo = r 
	}
	
	method calcularCostoTotal(unaCasa)
	{
		var total = unaCasa.cantAmbientes()*costoAmbiente
		if(unaCasa.pisos() > 2)
		{
			return total+self.recargo(total)
		}
		return total
	}
	
	method recargo(total)
	{
		return (total*recargo)/100
	}
}