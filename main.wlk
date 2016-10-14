/**
 * Power is an illusion
 */

object raul {
	var costoPorMetro2 = 25
	var trabajaCon = pintura // variable para luego pasar a trabajar con pintura a granel.
	
	method calcularCostoManoDeObra(metrosCuadrados)
	{
		return costoPorMetro2*metrosCuadrados
	}
	
	method calcularCostoTotal(unaCasa)
	{
		var metrosCuadrados = unaCasa.metrosCuadrados()
		return self.calcularCostoManoDeObra(metrosCuadrados)+trabajaCon.calcularCostoPintura(metrosCuadrados)
	}
	
	method trabajarConPinturaGranel()
	{
		trabajaCon = pinturaGranel
	}
	
}

object carlos {
	var costoMinimo = 500
	var costoPorMetro2 = 30 
	
	method calcularCostoTotal(unaCasa)
	{
		var metrosCuadrados = unaCasa.metrosCuadrados()
		if (metrosCuadrados <= 20)
		{
			return costoMinimo
		}
		else
		{
			return (metrosCuadrados - 20)*costoPorMetro2+costoMinimo
		}
	}
	
}

object venancio {
	var trabajaCon = pintura
	
	method calcularCostoManoDeObra(metrosCuadrados)
	{
		var totalMetros2 = 0
		totalMetros2 = self.venancioRoundUp(metrosCuadrados)
		return 220*totalMetros2
		
	}
	
	method venancioRoundUp(metrosCuadrados)
	{
		var auxMetros2
		
		if (metrosCuadrados < 10)
		{
			return 1
		}
		else 
		{
			if(metrosCuadrados < 100)
			{
				auxMetros2 = rounder.roundUp(metrosCuadrados/10.0)
				return auxMetros2
			}
			else
			{
				auxMetros2 = rounder.roundUp(metrosCuadrados/100.0)
				return auxMetros2
			}
		}
	}
	
	method calcularCostoTotal(unaCasa)
	{
		var metrosCuadrados = unaCasa.metrosCuadrados()
		return self.calcularCostoManoDeObra(metrosCuadrados)+trabajaCon.calcularCostoPintura(metrosCuadrados)
	}
	
	method trabajarConPinturaGranel()
	{
		trabajaCon = pinturaGranel
	}
}

object pintura {
		var precioPintura = 200
		var rinde = 50.0
		
		method modificarPrecio (precioNuevo)
		{
			precioPintura = precioNuevo
		}
		
		method precioPintura()
		{
			return precioPintura
		}
		
		method cantLatasNecesarias(metrosCuadrados)
		{
			var auxLatas
			if(metrosCuadrados < rinde) return 1
			else
			{
				auxLatas = metrosCuadrados/rinde
				return rounder.roundUp(auxLatas)	
			}
		}
		
		method calcularCostoPintura(metrosCuadrados)
		{
			return self.cantLatasNecesarias(metrosCuadrados)*precioPintura
		}
}

object pinturaGranel {
	var precioLt = 3.50
	
	method calcularCostoPintura(metrosCuadrados)
	{
		return precioLt*metrosCuadrados
	}
}

object habitacion {
	
	method superficieAPintar() 
	{
		return 20
	}
}

object cocina {
	var ancho = 1
	var largo = 2
	var alto = 3.5
	
	method superficieAPintar() 
	{
		return (ancho + largo) * 2 * alto
	}
}

object rounder {
	method roundUp(nro)
	{
		return -(nro.div(-1)) 
	}
}

////////////////////////////////Parte 2//////////////////////////////////////////////////
object casaPrueba {
		var pisos 
		var ambientes
			
		method pisos()
		{
			return pisos
		}
		
		method setPisos(p)
		{
			pisos = p	
		}
		
		method setAmbientes(a)
		{
			ambientes = a
		}
		
		method cantAmbientes()
		{
			return ambientes
		}
			
		method esComplicada()
		{
			return true
		}
    }


object emanuel {
	
	var costoAmbiente = 100000
	
	method calcularCostoTotal(unaCasa)
	{
		return costoAmbiente*unaCasa.cantAmbientes()*unaCasa.pisos()
	}
	
	
}

object marcos {
	
	var costoAmbiente = 50000
	
	method calcularCostoTotal(unaCasa) 
	{
		var ambientes = unaCasa.cantAmbientes()
		var costoBase = costoAmbiente*ambientes
		if (unaCasa.esComplicada())
		{
			return costoBase+self.recargo(ambientes)
		}
		return costoBase
	}
	
	method recargo(cantAmbientes)
	{
		return costoAmbiente*cantAmbientes*0.20
	}

}

object lito {
	
	var costoHora = 50
	var horasDia = 8
	var tardanza = 2
	
	method calcularCostoTotal(unaCasa)
	{
		return unaCasa.cantAmbientes()*tardanza*horasDia*costoHora
	}

}

object eduardo {
	
	var costoAmbiente = 100
	
	method calcularCostoTotal(unaCasa)
	{
		var costoBase = costoAmbiente*unaCasa.cantAmbientes()
		
		if (unaCasa.esComplicada()) return 2*costoBase
		
		return costoBase
	}
}

object roger {
	
	var costoAmbiente = 100
	
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
		return total*0.10
	}
	
}

object agencia {
	const contratistas = #{raul, carlos, venancio, emanuel, marcos, lito, eduardo, roger}
	
	method puedeContratarA(presupuestoDisp, unaCasa)
	{
		return contratistas.filter {contratista => (contratista.calcularCostoTotal(unaCasa) <= presupuestoDisp)}
	}
	
}

////////////////////////////////////Parte 3////////////////////////////////


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
		var costoBase = costoAmbiente*ambientes
		if (unaCasa.esComplicada())
		{
			return costoBase+self.recargo(ambientes)
		}
		return costoBase
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
	var recargo // Debe ser entre 0 y 1. 
	
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
		return total*recargo
	}
	
	
}

class Cliente {
	var ahorros = 0	// Ahorros iniciales
	var suCasa
	var servicios = []
	var porcentajeAhorros 
	
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
		return ahorros*porcentajeAhorros
	}
	
	method contratarA(contratista)
	{
		var costo = contratista.calcularCostoTotal(suCasa)
		
		self.loPuedeContratar(contratista)
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
	
	method loPuedeContratar(contratista)
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

object damian inherits Cliente(250000, 0.20){
	override method fueDescuidado()
	{
		return servicios.any({servicio => servicio.calcularCostoTotal(suCasa)>5000}) && suCasa.pisos()<3
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


object agenciaNueva {
	var contratistas = [raul, carlos, venancio, emanuel, marcos, lito, eduardo, roger]
	var clientes = []
	
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


object fixture{
	
	method inicializarAgenciaNueva()
	{
		var noelia = new Electricista(250)
		var silvina = new Plomero(0.25)
		var eliana = new Electricista(12000)
		var dodain = new Electricista(3)
		
		agenciaNueva.agregarContratista(noelia)
		agenciaNueva.agregarContratista(silvina)
		agenciaNueva.agregarContratista(eliana)
		agenciaNueva.agregarContratista(dodain)
		
		var casaMilena = new Casa([new Habitacion(4,3,3), new Habitacion(3,2,2)], 2)
		var casaDamian = new Casa([new Habitacion(4,3,3), new Habitacion(3,2,2), new Habitacion(3,2,3), new Habitacion(3,4,2)], 4)
		var casaAldo = new Casa([cocina, habitacion], 2)
		
		var aldo = new Cliente(6000, 0.20, casaAldo)
		var milena = new Cliente(2000, 0.20, casaMilena)
		
		agenciaNueva.agregarCliente(aldo)
		agenciaNueva.agregarCliente(milena)
		agenciaNueva.agregarCliente(damian)
		//damian declarado en el codigo
	}
	
	
}







