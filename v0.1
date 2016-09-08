/**
 * This is an example wollok hello world
 */
object aldo {
	var ahorros = 6000 	// Ahorros iniciales
	var suCasa = casaAldo
	
	method ahorrar(monto)
	{
		ahorros += monto
	}
	
	method superficieAPintar()
	{
		return habitacion.superficieAPintar()+cocina.superficieAPintar()
	}
	
	method calcularPresupuestoMax()
	{
		return ahorros*0.20
	}
	
	method contratarA(pintor)
	{
		return self.calcularPresupuestoMax()>pintor.calcularCostoTotal(self.superficieAPintar())
	}
	
}

object raul {
	var costoPorMetro2 = 25
	var trabajaCon = pintura // variable para luego pasar a trabajar con pintura a granel.
	
	method calcularCostoManoDeObra(metrosCuadrados)
	{
		return costoPorMetro2*metrosCuadrados
	}
	
	method calcularCostoTotal(metrosCuadrados)
	{
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
	
	method calcularCostoTotal(metrosCuadrados)
	{
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
	
	method calcularCostoTotal(metrosCuadrados)
	{
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
	var habitaciones = #{cocina, habitacion}
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
}

object emanuel {
	
	method calcularCostoTotal(unaCasa)
	{
		return 100.000*unaCasa.cantAmbientes()*unaCasa.pisos()
	}
	
	
}

object marcos {
	
	method calcularCostoTotal(unaCasa) 
	{
		if (unaCasa.esComplicada())
		{
			return 50.000*unaCasa.cantAmbientes()+self.recargo(unaCasa.cantAmbientes())
		}
		return 50.000*unaCasa.cantAmbientes()
	}
	
	method recargo(cantAmbientes)
	{
		return 50.000*cantAmbientes*0.20
	}

}

object lito {
	
	method calcularCostoTotal(unaCasa)
	{
		return unaCasa.cantAmbientes()*2*8*50
	}

}

object eduardo {
	
	method calcularCostoTotal(unaCasa)
	{
		if (unaCasa.esComplicada()) return 200*unaCasa.cantAmbientes()
		
		return 100*unaCasa.cantAmbientes()
	}
}

object roger {
	
	method calcularCostoTotal(unaCasa)
	{
		var total = unaCasa.cantAmbientes()*100
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
	var contratistas = #{raul, carlos, venancio, emanuel, marcos, lito, eduardo, roger}
	
	method puedeContratarA(presupuestoDisp)
	{
		return contratistas.filter({contratista => contratista.calcularCostoTotal(unaCasa)}) //FALTA TERMINAR
	}
	
}
