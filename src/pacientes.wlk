import aparatos.*

class Paciente {
	var property edad
	var property fortalezaMuscular
	var property nivelDeDolor
	const property rutina = []
	
	method usarAparato(unAparato) {
		unAparato.efectosDelUso(self)
	}
	
	method puedeUsar(unAparato) = unAparato.puedeSerUsado(self)
	
	method puedeHacerRutina() = rutina.all({a=>self.puedeUsar(a)})
	
	method realizarSesion() {
		if(!self.puedeHacerRutina()) {self.error("El paciente no puede hacer la rutina")}
		rutina.forEach{a=>self.usarAparato(a)}
	}
}

class Resistente inherits Paciente {
	
	override method usarAparato(unAparato) {
		super(unAparato)
		fortalezaMuscular ++
	}
}

class Caprichoso inherits Paciente {
	
	method algunAparatoDeColor(unColor) = rutina.any{a=>a.color() == unColor}
	
	override method puedeHacerRutina() = super() && self.algunAparatoDeColor(rojo) 
	
	override method realizarSesion() {
		super()
		super()
	}
}
