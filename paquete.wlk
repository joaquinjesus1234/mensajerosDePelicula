object paquete {

    var estaPago = false


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
