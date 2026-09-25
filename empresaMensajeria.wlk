import paquete.*
import mensajeros.*
import destinos.*
object empresaMensajeria{

    const listaDeMensajeros = []
    const paquetesPendientes = []
    const paquetesEnviados = []


    method paquetesEnviados() {

        return paquetesEnviados
    }

    method paquetesPendientes() {
      
        return paquetesPendientes
    }

    method contratarMensajero(mensajero) {
      
        listaDeMensajeros.add(mensajero)
    }

    method despedirMensajero(mensajero) {
      
        listaDeMensajeros.remove(mensajero)
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


    method entregar(algoParaEnviar) {
        paquetesEnviados.add(algoParaEnviar)
        paquetesPendientes.remove(algoParaEnviar)
        
    }

    //ejercicio 1 hay alguno en la empresa que pueda enviar un paquete
    method hayAlgunMensajeroQuePuedeEntregar(algoParaEnviar, unDestino) {
       return listaDeMensajeros.any({ mensajero => algoParaEnviar.puedeEntregar(mensajero, unDestino)})
    }



    //ejercicio 2 mensajeros que pueden llevar un paquete dado 
    method losQuePuedenEnviar(algoParaEnviar, unDestino){

       return listaDeMensajeros.filter({mensajero=> algoParaEnviar.puedeEntregar (mensajero, unDestino)})
    }


//ejercicio 3 promedio de pesos 

    method pesoTotalDeMensajeros(){

        return listaDeMensajeros.sum({ mensajero => mensajero.peso()} )
    }

    method pesoPromedio() {
      
      return self.pesoTotalDeMensajeros() / listaDeMensajeros.size()
    }

    method tieneSobrepeso() {
        return self.pesoPromedio() > 500
    }



// ejercicio 4 mensajero o una exception



    method elPrimeroQuePuedeEntregar(algoParaEnviar, unDestino){

        listaDeMensajeros.find({mensajero => algoParaEnviar.puedeEntregar(mensajero,unDestino)})
    }

    method enviar( algoParaEnviar ,unDestino){

        if ( self.hayAlgunMensajeroQuePuedeEntregar(algoParaEnviar,unDestino) ){
        self.entregar(algoParaEnviar)
        }else{
            paquetesPendientes.add(algoParaEnviar)
        }
    }


// ejercicio 5


    method facturacion() {
        return paquetesEnviados.sum({paquete => paquete.cuantoSale()})
    }





// ejercicio 6
    method enviarTodos(unaColeccionDePaquetes, unDestino) {
        
        unaColeccionDePaquetes.forEach({unPaquete => self.enviar(unPaquete, unDestino)})
    }



// ejercicio 7
    method elMasCaro() { // obtengo el paquete mas caro
        
        return paquetesPendientes.max({ paquete => paquete.cuantoSale() })
    }

    method enviarElMasCaro( unDestino) {
      
        self.enviar( self.elMasCaro(), unDestino)
    }


}
