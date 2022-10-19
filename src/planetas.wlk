import personas.*

class Planeta {
	const property habitantes = []
	var property cantDeMuseos = 0
	var property longitudTotalDeMurallas
	
	method agregarHabitante(unHabitante) = habitantes.add(unHabitante)
	method delegacionDiplomatica() = habitantes.filter({p=>p.esDestacado()})
	method valorInicialDeDefensa() = self.listaDePotencias().count({p=>p >= 30})
	method listaDePotencias() = habitantes.map({p=>p.potencia()})
	method esCulto() = cantDeMuseos >=2 && habitantes.all({p=>p.inteligencia() >= 10})
	method potenciaReal() = self.listaDePotencias().sum()
	
	method construirMurallas(cantidad) {longitudTotalDeMurallas += cantidad}  
	method fundarUnMuseo() {cantDeMuseos++}
	
	method potenciaAparente() = habitantes.size() * self.potenciaHabitanteMasPotente()
	method potenciaHabitanteMasPotente() = self.listaDePotencias().max()
	
	method necesitaReforzarse() = self.potenciaAparente() >= 2 * self.potenciaReal()
	
	method recibirTributos() {habitantes.forEach({p=> p.ofrecerTributo(self)})}
	
	method habitantesValiosos() = habitantes.filter({p => p.valor() >= 40})
	
	method apaciguar(unPlaneta) {self.habitantesValiosos().forEach ({p=> p.ofrecerTributo(unPlaneta)})}
}
