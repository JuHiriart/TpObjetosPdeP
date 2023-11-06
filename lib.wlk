class Persona{
	var property plata = 1000
	var property limiteValoracion 
	var property compra = []
	var property cupon
	var descuento = 1 
	
	method leGusta(libro){
		return libro.precio() < plata && libro.valoracion() < limiteValoracion
	}
	
	method agregarCompra(_libro){
		if(self.leGusta(_libro) && plata >= _libro.precio()){
			const hoy = new Date()
			if(cupon == "RX7FD3S" || cupon == "K20Z3"){
				descuento = descuento - 0.1 
			}
			if(hoy.day() == 5){
				descuento = descuento - 0.2
			}
			
			compra.add(_libro)
			plata = plata - (_libro.precio() * descuento)	
		}
	}
	
	method comprasDelMes(){
		const hoy = new Date()
		return compra.filter{x => x.fecha().month() == hoy.month()}
	}
	
	method tieneCompraCara(){
		return compra.any({lib => lib.precio() > 8000})
	}
	
}

class Compra{
	const property libro
	const property fecha
}

class Libro {
	const property autor
	var property hojas
	var property precio
	var valoracion = 3000
	var property reviews = []
	
	method precio(){
		if(hojas * 5 > 1000){
			return precio + 1000
		} else {
			return precio + hojas*5
		}
	}
	
	method valoracion(){
		if (hojas > 150){
			return valoracion + 4000
		} else {
			return valoracion + 3000
		}
	}
	
	 method agregarReview(_nota, _comentario)
 	{
 		if(_nota < 0)
 			throw new DomainException(message = "Tiene que ser positivo")
 		if(_comentario.length() < 10)
 			throw new DomainException(message="El comentario tiene pocos caracteres")
 		if(!reviews.contains(new Review(nota = _nota,comentario = _comentario)))
 			reviews.add(new Review(nota = _nota, comentario = _comentario))	
 	}
 	
 	method puntajePromedio(){
 		return reviews.sum({review => review.nota()}) / reviews.size()
 	}
 	
 	method reviewsGrosas()
 	{
 		return reviews.filter({review => review.nota() > 9})
 	}
}

class Review {
	const property nota
	const property comentario

}

object fahrenheit451{
	const property nombre = "Fahrenheit 451"
	const property autor = "Ray Bradbury"
	var valoracion = 3500
	var precio = 5000
	
	method valoracion() = valoracion
	
	method precio() = precio
	
	method cambiarVersion(version){
		if (version == "texto"){
			valoracion = 3500
			precio = 5000
		} 
		else if (version == "ilustrada"){
			valoracion = 8000
			precio = 6000
		}
	}
	
}

object cuidadoConElPerro{
	const property nombre = "Cuidado con el Perro"
	const property autor = "Liliana Cinetto"
	var precio = 2900
	var valoracion
	
	method precio(_precio) { precio = _precio }
		
	method valoracion() {
		valoracion = 5000 + precio/2
		return valoracion
	}
	
	method precio(){
				if(precio%2 == 0){
			precio = precio + 500
		} else {
			precio = precio + 600
		}
		return precio
	}
}

object patronesDeDisenio{
	const property nombre = "Patrones de Diseño"
	const property autor = "Erich Gamma"
	var likes = 300
	var property valorImaginario = (likes+8) * 1.5
	
	method likes(_likes) {
		likes = _likes
		valorImaginario = (likes+8) * 1.5
	}
	
	method valoracion() = 4000 + 2*valorImaginario
	
	method precio(){
		if(valorImaginario%2 == 0){
			return 5000
		} else {
			return 6000
		}
	}
}



object cristina{

	method leGusta(libro) {
		return libro.autor() == "Liliana Cinetto" || libro.precio() > 5000
	}
}

object roberto{
	
	method leGusta(libro){
		return libro.autor() == "Erich Gamma" || libro.autor() == "Jorge Bucay"
	}
}

object patricia{
	
	var property humor = true
	
	method leGusta(libro){
		if(humor){
			return true
		} else {
			return libro.precio() > 4000
		}
	}
}


