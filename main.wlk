/**
 * This is an example wollok hello world
 */
object aldo {
	var ahorros = 6000 	// Ahorros iniciales
	var suCasa = casaAldo
	var gastos = 0
	var descuidado = false
	var masCaro = [0, 0]
	var cantServicios = 0
	
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
		return ahorros*0.20
	}
	
	method contratarA(contratista)
	{
		var costoTotal = contratista.calcularCostoTotal(suCasa)
		var presupuesto = self.calcularPresupuestoMax()
		if(costoTotal > presupuesto) return false
		
		cantServicios++
		if(masCaro.get(1)<costoTotal) masCaro = [contratista, costoTotal]
		ahorros -= costoTotal
		gastos += costoTotal
		descuidado = costoTotal > 5000 
		return costoTotal
	}
	
	method serviciosContratados()
	{
		return cantServicios
	}
	
	method trabajoMasCaro()
	{
		return masCaro
	}
	
	method cuantoGasto()
	{
		return gastos
	}
	
	method fueDescuidado()
	{
		return descuidado
	}
	
}

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

object casaAldo {
	const habitaciones = #{cocina, habitacion}
	var pisos = 2
	
	method pisos()
	{
		return pisos
	}
	
	method esComplicada()
	{
		if (habitaciones.size() > 3) return true
		return false
	}
	
	method cantAmbientes()
	{
		return habitaciones.size()
	}
	
	method metrosCuadrados()
	{
		var suma = 0
		habitaciones.forEach({ h => suma += h.superficieAPintar() })
		return suma;
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
		if (unaCasa.esComplicada())
		{
			return costoAmbiente*unaCasa.cantAmbientes()+self.recargo(unaCasa.cantAmbientes())
		}
		return costoAmbiente *unaCasa.cantAmbientes()
	}
	
	method recargo(cantAmbientes)
	{
		return costoAmbiente *cantAmbientes*0.20
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
		if (unaCasa.esComplicada()) return costoAmbiente*2*unaCasa.cantAmbientes()
		
		return costoAmbiente*unaCasa.cantAmbientes()
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
		if (unaCasa.esComplicada())
		{
			return costoAmbiente*unaCasa.cantAmbientes()+self.recargo(unaCasa.cantAmbientes())
		}
		return costoAmbiente *unaCasa.cantAmbientes()
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
	
	constructor(tarda){
		
		tardanza = tarda
	}
	
	method calcularCostoTotal(unaCasa)
	{
		return unaCasa.cantAmbientes()*tardanza*horasDia*costoHora
	}
}

class Electricista{
	
	var costoAmbiente
	
	constructor(costo){
		
		costoAmbiente = costo
	}
	
	method calcularCostoTotal(unaCasa)
	{
		if (unaCasa.esComplicada()) return costoAmbiente*2*unaCasa.cantAmbientes()
		
		return costoAmbiente*unaCasa.cantAmbientes()
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
	var ahorros 
	var suCasa
	var gastos = 0
	var descuidado = false
	var masCaro = [0, 0]
	var cantServicios = 0
	
	constructor(ahorro, casa){
		
		ahorros = ahorro
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
		return ahorros*0.20
	}
	
	method contratarA(contratista)
	{
		var costoTotal = contratista.calcularCostoTotal(suCasa)
		var presupuesto = self.calcularPresupuestoMax()
		if(costoTotal > presupuesto) return false
		
		cantServicios++
		if(masCaro.get(1)<costoTotal) masCaro = [contratista, costoTotal]
		ahorros -= costoTotal
		gastos += costoTotal
		descuidado = costoTotal > 5000 
		return costoTotal
	}
	
	method serviciosContratados()
	{
		return cantServicios
	}
	
	method trabajoMasCaro()
	{
		return masCaro
	}
	
	method cuantoGasto()
	{
		return gastos
	}
	
	method fueDescuidado()
	{
		return descuidado
	}
	
}

