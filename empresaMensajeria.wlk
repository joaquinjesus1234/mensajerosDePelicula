import paquete.*
import mensajeros.*
import destinos.*
object empresaMensajeria{

    const listaDeMensajeros = []
    const paquetesPendientes = []

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

    method enviar(algoParaEnviar, unDestino) {

        if(hayAlgunMensajeroQuePuedeEntregar(algoParaEnviar, unDestino)){
            //entregar
            // este no va. self.losQuePuedenEnviar(algoParaEnviar, unDestino).anyOne()
        }else{
            paquetesPendientes.add(algoParaEnviar)
        }
    }

    //true or false
    method hayAlgunMensajeroQuePuedeEntregar(algoParaEnviar, unDestino) {
       return listaDeMensajeros.any({ mensajero => paquete.puedeEntregar(algoParaEnviar, unDestino)})
    }

    //lista de mensajeros
    method losQuePuedenEnviar(algoParaEnviar, unDestino){

       return listaDeMensajeros.filter({mensajero=> paquete.puedeEntregar (mensajero, unDestino)})
    }

    // mensajero o ua exception
    method elPrimeroQuePuedeEntregar(algoParaEnviar, unDestino){

        return listaDeMensajeros.find({mensajero => paquete.puedeEntregar(mensajero,unDestino)})
    }

    method enviarTodos(unaColeccionDePaquetes, unDestino) {
        
        unaColeccionDePaquetes.forEach({unPaquete => self.enviar(unPaquete, unDestino)})
    }

    method elMasCaro() {
        
        return paquetesPendientes.max({ paquete => paquete.cuantoSale() })
    }
}
