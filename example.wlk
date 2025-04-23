object roberto {
  var peso = 90
  var vehiculo = bicicleta

  method peso() = peso
  method puedeLlamar() = false
  method paquetePago () = paquete.estaPago()

  method peso(unPeso) { peso = unPeso}
  method vehiculo(unVehiculo) { vehiculo = unVehiculo} 
  method pesoTotal() = peso + vehiculo.peso()  

  method puedePasar(unLugar) {
    unLugar.dejarEntrar(self)
  }
  
}

object chuckNorris{
  method peso() = 80
  method puedeLlamar() = true
}

object neo{
  var credito = false
  method peso() = 0
  method puedeLlamar() = credito
  method cargarCredito() {credito = true}

}

object bicicleta{
  method peso() = 5
}

object camion{
  var acoplados = 1
  method peso() = acoplados * 500
  method cantidadAcoplados(unaCantidad) {acoplados = unaCantidad}
}

object puenteDeBrooklyn{
  method dejarEntrar(unMensajero) {
    unMensajero.peso() < 1000
  }
}

object laMatrix{
  method dejarEntrar(unMensajero) {
    unMensajero.puedeLlamar()

}

object paquete{
  var pago = false
  method pagarPaquete() {pago = true }
  method estaPago() = pago
    method puedeSerEntregadoPor(unMensajero,unLugar) {
  (unLugar.dejarEntrar(unMensajero) && self.estaPago())
  }
  }


