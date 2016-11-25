import contratistas.*
import main.*

object aldo {
	var ahorros = 6000 	// Ahorros iniciales
	var suCasa = casaAldo
	var servicios = []
	
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
	
	method contratarA(contratista, agencia)
	{
		if (!self.loPuedeContratar(contratista, agencia))
			 error.throwWithMessage("No lo puede contratar")
		servicios.add(contratista)
		self.actualizarFinanzas(contratista.calcularCostoTotal(suCasa))
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
		return servicios.size()
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

object casaAldo {
	const habitaciones = #{cocina, habitacion}
	var pisos = 2
	
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

object raul {
	var costoPorMetro2 = 25
	var trabajaCon = pintura 
	
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

object damian inherits Cliente(250000, 0.20){
	override method fueDescuidado()
	{
		return servicios.any({servicio => servicio.calcularCostoTotal(suCasa)>5000}) && suCasa.pisos()<3
	}
}

/*var emanuel = new Arquitecto(100000)
var marcos = new MaestroMayorObra(50000)
var lito = new Albanil(2)
var eduardo = new Electricista(100)
var roger = new Plomero(10)*/ 
