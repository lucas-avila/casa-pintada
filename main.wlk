import example.*

class Cliente {
	var ahorros = 0	// Ahorros iniciales
	var suCasa
	var servicios = []
	var porcentajeAhorros // LUCAS: Ver class Plomero
	
	constructor(plata, porcentaje){
		ahorros = plata
		porcentajeAhorros = porcentaje // p debe ser entre 0 y 1.
	}
	
	constructor(plata, porcentaje, casa)
	{
		ahorros = plata
		porcentajeAhorros = porcentaje
		suCasa = casa
	}
	
	method ahorrar(monto)
	{
		ahorros += monto
	}
	
	method casa()
	{
		return suCasa
	}
	
	method superficieAPintar()
	{
		return habitacion.superficieAPintar()+cocina.superficieAPintar()
	}
	
	method calcularPresupuestoMax()
	{
		return (ahorros*porcentajeAhorros)/100
	}
	
	method contratarA(contratista, agencia)
	{
		var costo = contratista.calcularCostoTotal(suCasa)
		
		self.loPuedeContratar(contratista, agencia)
		servicios.add(contratista)
		self.actualizarFinanzas(costo)

	}
	
	method actualizarFinanzas(plataQueVolo)
	{
		ahorros -= plataQueVolo
	}
	
	method getMasCaro()
	{
		var costos = servicios.map({servicio => servicio.calcularCostoTotal(suCasa)})
		return servicios.find({servicio => servicio.calcularCostoTotal(suCasa)==costos.max()})
	}
	
	method loPuedeContratar(contratista, agencia)
	{
		var listaContratistas = agencia.puedeContratarA(self.calcularPresupuestoMax(), suCasa)
		return listaContratistas.contains(contratista)
	}
	
	method serviciosContratados()
	{
		return servicios
	}
	
	method cuantoGasto()
	{
		return servicios.sum({servicio => servicio.calcularCostoTotal(suCasa)})
	}
	
	method fueDescuidado()
	{
		return servicios.any({servicio => servicio.calcularCostoTotal(suCasa)>5000})
	}
	
}

class Agencia {
	const contratistas = []
	var clientes
	
	method puedeContratarA(presupuestoDisp, unaCasa)
	{
		return contratistas.filter {contratista => (contratista.calcularCostoTotal(unaCasa) <= presupuestoDisp)}
	}
	
	method agregarContratista(contratista)
	{
		contratistas.add(contratista)
	}
	method agregarCliente(cliente)
	{
		clientes.add(cliente)
	}
	
	method fueContratadoPor(contratista)
	{
		return clientes.map({x => (x.serviciosContratados()).contains(contratista) })
	}
	
	method tomoDePuntoA(contratista,cliente)
	{
		return ((cliente.serviciosContratados()).map({x=> x == contratista})).size() > 2
	}
	method plataEsteMes(contratista)
	{
		return ((self.fueContratadoPor(contratista)).map({x=> x.cuantoGasto()})).sum()
	}	
}

class Habitacion {
	var largo 
	var ancho
	var profundidad
	
	constructor(l, a, p)
	{
		largo = l
		ancho = a
		profundidad = p
	}
	
	method superficieAPintar()
	{
		return largo*ancho*profundidad
	}
}

class Casa {
	
	var habitaciones = []
	var pisos = 0
	
	constructor(_habitaciones, _pisos)
	{
		habitaciones = _habitaciones
		pisos = _pisos
	}
	
	method pisos()
	{
		return pisos
	}
	
	method esComplicada()
	{
		return habitaciones.size() > 3
	}
	
	method cantAmbientes()
	{
		return habitaciones.size()
	}
	
	method metrosCuadrados()
	{
		var suma = 0
		habitaciones.forEach({ h => suma += h.superficieAPintar() })
		return suma
	}
	
}