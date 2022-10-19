

class Persona {
	const property edad
	
	method inteligencia() = if (edad.between(20,40)) 12 else 8
	method potencia() = 20
	method esDestacado() = edad == 25 || edad == 35
	method ofrecerTributo(unPlaneta) {}
	method valor() = self.potencia() + self.inteligencia()
}

class Atleta inherits Persona {
	var property masaMuscular = 4
	var property cantTecnicasQueConoce = 2
	
	override method potencia() = super() + (masaMuscular * cantTecnicasQueConoce)
	override method esDestacado() = super() || cantTecnicasQueConoce > 5
	
	method entrenar(dias) {masaMuscular += (dias.div(5))}	
	method aprenderUnaTecnica() {cantTecnicasQueConoce++}
	override method ofrecerTributo(unPlaneta) {unPlaneta.construirMurallas(2)}
}

class Docente inherits Persona {
	var cantCursos = 0
	
	override method inteligencia() = super() + cantCursos*2	
	override method esDestacado() = cantCursos > 3
	override method ofrecerTributo(unPlaneta) {unPlaneta.fundarUnMuseo()}
	override method valor() =super() + 5
}

class Soldado inherits Persona {
	const property armas = []
	
	method agregarArma(unArma) = armas.add(unArma)
	override method potencia() = super() + armas.sum({a => a.potenciaQueProvee(self)})
	override method ofrecerTributo(unPlaneta) {unPlaneta.construirMurallas(5)}
	
}

class Pislolete {
	var property largo
	
	method potenciaQueProvee(unSoldado) = if (unSoldado.edad() > 30) 3 * largo else 2 * largo
}

class Espadon {
	var property peso
	
	method potenciaQueProvee(unSoldado) = if (unSoldado.edad() < 40) peso/2 else 6
}