import wollok.game.*
import puma.*
import obstaculo.*

object pantalla{
	
	method iniciar(){
		game.width(5)
		game.height(7)
		game.ground("fondo.png")
		game.title("Buscando comida")
		
		game.addVisual(puma)
		game.addVisual(churrasco)
		
		game.onCollideDo(churrasco,{x => self.ganar()})
		
		self.agregarObstaculos()
		game.addVisual(instrucciones)
		game.start()

	}
	
	method ganar() {
		game.addVisual(ganador)
		game.removeVisual(churrasco)
		game.removeVisual(puma)
		
	}
	method agregarObstaculos(){
		const piedras = [game.center(),game.center().up(1),game.center().right(2),game.origin().right(1),game.origin().up(3)]
		piedras.forEach{pos=>self.nuevoObstaculo(pos,"piedra.png")}
		game.width().times{col=>
			self.nuevoObstaculo(game.at(col-1,game.height()-1),"liso.png")
		}
	}
	method nuevoObstaculo(posicion,imagen){
		const piedra = new Obstaculo(position = posicion,image = imagen)
		game.addVisual(piedra)
		game.onCollideDo(piedra,{personaje=>personaje.rebotar()})
	}
	
}


object churrasco {
	
	method position() = game.at(game.width()-1,game.height()-2) 
	method image() = "churrasco.png"
	
}


object ganador {
	method position() = game.center().down(1).left(1) 
	method image() = "ganador.png"
	
}

object instrucciones{
	method position() = game.at(game.width()/2,game.height()-1) 
	method text() = "puma.arriba() puma.abajo() puma.izquierda() puma.derecha()"
	method rebotar(){}
}

