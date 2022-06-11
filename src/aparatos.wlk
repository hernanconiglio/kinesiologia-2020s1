import pacientes.*
class Aparato {
	var property color = blanco
	method efectosDelUso(paciente)
	method puedeSerUsado(paciente) = true
}

class Magneto inherits Aparato {
	override method efectosDelUso(paciente) {
		paciente.nivelDeDolor(paciente.nivelDeDolor()*0.9)
	}	
}

class Bicicleta inherits Aparato {
	override method efectosDelUso(paciente) {
		if(paciente.puedeUsar(self)) {
			paciente.nivelDeDolor(0.max(paciente.nivelDeDolor() - 4))
			paciente.fortalezaMuscular(paciente.fortalezaMuscular()+3)
		}
	}
	override method puedeSerUsado(unPaciente) = unPaciente.edad() > 8
}

class Minitramp inherits Aparato {
	override method efectosDelUso(paciente) {
		if(paciente.puedeUsar(self)) {
		paciente.fortalezaMuscular(paciente.fortalezaMuscular() + paciente.edad()*0.1)
		}
	}	
	override method puedeSerUsado(unPaciente) = unPaciente.nivelDeDolor() < 20
}

object blanco {}
object rojo {}
object azul {}
object negro {}
