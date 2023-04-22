object pepita {
	var energia = 100
	
	method comer(comida) {
		energia = energia + comida.energiaQueAporta()
	}
	
	method energiaParaVolar(distancia){
		return 10 + distancia
	}
	
	method puedeVolar(distancia) {
		return energia >= self.energiaParaVolar(distancia)
	}
	
	method validarVolar(distancia) {
		if(not self.puedeVolar(distancia)) {
			self.error("No se puede volvar " + distancia)
		}
		
	}
		
	method volar(distancia) {
		self.validarVolar(distancia)
		energia = energia - self.energiaParaVolar(distancia)
	}
		
	method energia() {
		return energia
	}
}

object alpiste {
	method energiaQueAporta() {
		return 20
	}
}

object manzana {
	var madurez = 1
	const base = 5
	
	method madurez() {
		return madurez
	}
	
	method madurez(_madurez) {
		madurez = _madurez
	}
	
	method madurar() {
		self.madurez(madurez + 1)
	}
	
	method energiaQueAporta() {
		return base * madurez
	}
	
}

object pepon {
	var energia = 30
	
	method energia() {
		return energia
	}
		
	method comer(comida) {
		energia += energia + comida.energiaQueAporta() / 2
	}
	
	method energiaParaVolar(distancia) {
		return 20 + 2*distancia
	}
	
	method puedeVolar(distancia) {
		return energia >= self.energiaParaVolar(distancia)
	}
	
	method validarVolar(distancia) {
		if(not self.puedeVolar(distancia)) {
			self.error("No se puede volvar " + distancia)
		}
	}
		
	method volar(distancia) {
		self.validarVolar(distancia)
		energia = energia - self.energiaParaVolar(distancia)
	}
	
}

object roque {
	var ave = pepita
	var cenas = 0;
	
	method ave(_ave) {
		ave = _ave
		cenas = 0
	}
	
	method alimentar(alimento) {
		ave.comer(alimento)
		cenas = cenas + 1
	}
}

object milena {
	
	const aves = #{}
	
	method agregar(ave) {
		aves.add(ave)	
	}
	
//	method validarMovilizar(distancia) {
//		aves.forEach({ave => ave.validarVolar(distancia)})
//	}

	method validarMovilizar(distancia) {
		if(not self.puedeMovilizar(distancia)) {
			self.error("No se puede movilizar " + distancia )
		}
	}
	
	method puedeMovilizar(distancia) {
		return aves.all({ave => ave.puedeVolar(distancia)})
	}
	
	method movilizar(distancia) {
		self.validarMovilizar(distancia)
		aves.forEach({ave => ave.volar(distancia)})
	}
}
