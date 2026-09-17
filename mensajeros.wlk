import vehiculo.*

object jeanGray {

    const peso = 65
    const puedeLlamar = true //Posee poderes telepáticos y telequinesicos, es decir que puede comunicarse con cualquier persona en cualquier momento (puede llamar siempre).

    method peso(){
        return peso
    }

    method puedeLlamar(){
        return puedeLlamar
    }
}

object sara {
    
    var peso = 0 
    var vehiculo = moto
    
    method puedeLlamar() {
        return false
    }

    method configurarPeso(unPeso) {
        
        peso = unPeso
    }

    method configurarVehiculo(unVehiculo) {
        
        vehiculo = unVehiculo
    }

    method peso(){

        return peso + vehiculo.peso()
    }
}

object neo {

    var tieneCredito = false // a veces no puede llamar porque se queda sin crédito.
    const peso = 0          // neo vuela, entonces pesa 0
    
    method peso() {
      
      return peso
    }

    method puedeLlamar(){

        return tieneCredito
    }

    method cargarCredito() {
        
        tieneCredito = true
    }
}