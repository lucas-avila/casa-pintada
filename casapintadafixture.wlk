import casapintada.*
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
		damian.agregarCasa(self.casaDamian())
		//damian declarado en el codigo
		
		agenciaNueva.agregarCliente(aldo)
		agenciaNueva.agregarCliente(milena)
		agenciaNueva.agregarCliente(damian)
	}
	//contratista
	method noelia()=new Electricista(250)
	method silvina() = new Plomero(0.25) 
	method eliana()=new Electricista(12000)
	method dodain()= new Electricista(3)
	
	//clientes
	method casaAldo() { return new Casa([cocina, habitacion], 2)}
	method casaDamian(){ return new Casa([new Habitacion(4,3,3), new Habitacion(3,2,2), new Habitacion(3,2,3), new Habitacion(3,4,2)], 4)}
	method casaMilena(){ return new Casa([new Habitacion(4,3,3), new Habitacion(3,2,2)], 2)}
	
	method aldo() {	return new Cliente(6000, 0.20, self.casaAldo())}
	method milena(){return new Cliente(2000, 0.20, self.casaMilena())}
	
	
}