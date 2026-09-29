object moto {
    
    method peso() {
        return 100
    }
}

object camion {
    const peso = 500
    var cantAcoplados = 0

    method cantAcoplados(unaCantidad) {
      
      cantAcoplados = unaCantidad
    }

    method peso(){

        return peso + cantAcoplados*500
    }

}