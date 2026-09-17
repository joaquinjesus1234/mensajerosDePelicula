object laMatrix {

    method precioEnvio () {

        return 500
    }
    method puedeRecibirMensajero(mensajero) {
      
      return mensajero.puedeLlamar()
    }
}

object puenteBrooklyn {

    method precioEnvio () {

        return 150
    }

    method puedeRecibirMensajero(mensajero) {
      
        return mensajero.peso() <= 1000          // el peso del mensajero debe ser menor a 1000
    }

}