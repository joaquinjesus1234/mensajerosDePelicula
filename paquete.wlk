import destinos.*


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
        
        return estaPago && destino.puedePasar(mensajero)
    }

    // TO DO : ARREGLAR.
    method cuantoSale() {
      
      return costo
    }
}

object paquetito {

    const estaPago = true  // es gratis siempre esta pago.

    method precio(destino){

        return destino.precioEnvio()
    }

    method estaPago(){

        return estaPago
    }

    method puedeEntregar(mensajero,destino) {
        
        return destino.puedePasar(mensajero)
    }
}

object paqueton{
  
    var property estaPago = false 
    var property costo = 100 
    var pagadoHastaAhora = 0
    const destinos = []

    method pagar(cantidad) {
        
        pagadoHastaAhora = pagadoHastaAhora + cantidad
    }

    method estaTotalmentePago(){

       return if (pagadoHastaAhora >= costo) {

            estaPago = true
        }
    }

    method precio(destino){

        return destino.precioEnvio()
    }

    method configurarDestino(destino) {
        
        destinos.add(destino)
    }

    method costoTotal() {
        
        costo = costo*destinos.size()
    }

    method puedeEntregar(mensajero) {
        
        return estaPago && destinos.all({ destino => destino.puedePasar(mensajero)})
    }
    
}