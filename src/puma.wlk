import wollok.game.*

object puma	{
	
	var position = game.origin()
	var anterior 
	
	method image() = "puma.png"
	method position() = position 
	method rebotar(){
		position = anterior
	}
	
	
	method arriba() {
		anterior = position
		position = position.up(1)
	}
	method izquierda() {
		anterior = position
		position = position.left(1)
	}
	method derecha() {
		anterior = position
		position = position.right(1)
	}
	method abajo() {
		anterior = position
		position = position.down(1)
	}
	
}
