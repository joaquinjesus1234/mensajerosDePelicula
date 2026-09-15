object empresaMensajeria{

    const listaDeMensajeros = []

    method contratarMensajero(mensajero) {
      
        listaDeMensajeros.add(mensajero)
    }

    method despedirMensajero(mensajero) {
      
        listaDeMensajeros.remove(neo)
    }

    method despedirATodos(){

        listaDeMensajeros.clear()
    }

    method esGrande() {
      
      return listaDeMensajeros.size() > 2
    }

    method listaDeMensajeros(){ // este solo se usa para testear.

        return listaDeMensajeros
    }

    method primeroDeLaEmpresa(){

        return listaDeMensajeros.first()
    }
    
    method ultimoDeLaEmpresa(){

        return listaDeMensajeros.last()
    }

    method pesoDelUltimoMensajero(){

        return self.ultimoDeLaEmpresa().peso()
    }

    method pesoTotalDeMensajeros(){

        return listaDeMensajeros.sum({ mensajero => mensajero.peso()} )
    }

    method pesoPromedio() {
      
      return self.pesoTotalDeMensajeros() / listaDeMensajeros.size()
    }
}

object paquete {

    var paquetePagado = false  // estaPago = false


    method precioPaquete(destino){ // method precio()

        return destino.precioEnvio()
    }

    method paqueteNoFuePagado() { // este es solo para probar. // method noEstaPagado()
      
       paquetePagado = false
    }
    method pagar(){

        paquetePagado = true
    }

    method estaPagadoElPaquete() {  // method estaPagado()
      
      return paquetePagado
    }

    method puedeMensajeroEntregarPaqueteDestino(mensajero,destino) {  // 
        
        return paquetePagado && destino.puedeRecibirMensajero(mensajero)
    }
    

}

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
    const peso = 0
    
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