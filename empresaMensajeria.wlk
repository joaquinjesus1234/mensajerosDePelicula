import paquete.*
import mensajeros.*
import destinos.*
object empresaMensajeria{

    const listaDeMensajeros = []
    const paquetesPendientes = []
    const paquetesEnviados = []

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

    //promedio de pesos
    //ejercicio 3
    method pesoTotalDeMensajeros(){

        return listaDeMensajeros.sum({ mensajero => mensajero.peso()} )
    }

    method pesoPromedio() {
      
      return self.pesoTotalDeMensajeros() / listaDeMensajeros.size()
    }


    method entregar(algoParaEnviar) {
        paquetesEnviados.add(algoParaEnviar)
        paquetesPendientes.remove(algoParaEnviar)
        
    }

    method enviarSi(algoParaEnviar, unDestino) {

        if( self.hayAlgunMensajeroQuePuedeEntregar(algoParaEnviar, unDestino)){
            self.entregar(algoParaEnviar)
            // este no va. self.losQuePuedenEnviar(algoParaEnviar, unDestino).anyOne()

        }else{
            paquetesPendientes.add(algoParaEnviar)
        }
    }

    //ejercicio 1 hay alguno en la empresa que pueda enviar un paquete
    method hayAlgunMensajeroQuePuedeEntregar(algoParaEnviar, unDestino) {
       return listaDeMensajeros.any({ mensajero => paquete.puedeEntregar(algoParaEnviar, unDestino)})
    }





    //ejercicio 2 mensajeros que pueden llevar un paquete dado 
    method losQuePuedenEnviar(algoParaEnviar, unDestino){

       return listaDeMensajeros.filter({mensajero=> paquete.puedeEntregar (mensajero, unDestino)})
    }





    // mensajero o una exception


    method elPrimeroQuePuedeEntregar(algoParaEnviar, unDestino){

        return listaDeMensajeros.find({mensajero => paquete.puedeEntregar(mensajero,unDestino)})
    }

// ejercicio 5


    method facturacion() {
        return paquetesEnviados.sum({paquete => paquete.precio()})
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

    method enviar( algoParaEnviar ,unDestino){

        if ( self.hayAlgunMensajeroQuePuedeEntregar(algoParaEnviar,unDestino) ){
        self.entregar(algoParaEnviar)
        }else{
            self.error("La mensajeria no puede entregar el paquete!")
        }
    }

}
