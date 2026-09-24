object paquete {

    var estaPago = false
    const property costo = 50

    method precio(destino){

        return destino.precioEnvio()
    }

    method pagar(){

        estaPago = true
    }

    method puedeEntregar(mensajero,destino) {
        
        return estaPago && destino.puedeRecibirMensajero(mensajero)
    }

    // TO DO : ARREGLAR.
    method cuantoSale() {
      
      return 100
    }
}

object paquetito {

    const estaPago = true  // es gratis siempre esta pago.

    method precio(destino){

        return destino.precioEnvio()
    }
}

object paqueton {
  
    var estaPago = costo
    var property costo = 100
    const property destinos = []

    method pagar(cantidad) {
        
        estaPago - cantidad
    }

    method estaPago() {
// TODO: ARREGLAR ESTO
        estaPago = 0
        
    }


    method precio(destino){

        return destino.precioEnvio()
    }

    method puedeEntregar(mensajero,destino) {
        
        return estaPago && destinos.All({ destino => destino.puedeRecibirMensajero(mensajero)})
    }
    
}