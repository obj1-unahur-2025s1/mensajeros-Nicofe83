object paquete {
  var destino = puente
  var pago = true
  
  method precio() = 50
  
  method estaPago() = pago
  
  method cambiarEstado() {
    pago = !pago
  }
  
  method destino(nuevo) {
    destino = nuevo
  }
  
  method puedeSerEntregado(mensajero) = self.estaPago() && destino.dejarPasar(
    mensajero
  )
}

object paqueton {
  const destinos = [laMatrix, puente]
  var pagado = 300
  
  method precio() = destinos.size() * 100
  
  method estaPago() = pagado >= self.precio()
  
  method puedeSerEntregado(mensajero) = self.estaPago() && self.pasaPorTodos(
    mensajero
  )
  
  method pasaPorTodos(mensajero) = destinos.all(
    { d => d.dejarPasar(mensajero) }
  )
  
  method pagado(importe) {
    pagado += importe
  }
}

object paquetito {
  method precio() = 0
  
  method estaPago() = true
  
  method puedeSerEntregado(mensajero) = true
  
  method destino(nuevo) {
    
  }
}

object puente {
  method dejarPasar(mensajero) = mensajero.peso() < 1000
}

object laMatrix {
  method dejarPasar(mensajero) = mensajero.puedeLlamar()
}

object roberto {
  const peso = 90
  var vehiculo = bicicleta
  
  method puedeLlamar() = false
  
  method vehiculo(unVehiculo) {
    vehiculo = unVehiculo
  }
  
  method peso() = peso + vehiculo.peso()
  
  method puedeLlegar(unLugar) {
    unLugar.dejarEntrar(self)
  }
}

object chuck {
  method peso() = 80
  
  method puedeLlamar() = true
}

object neo {
  var credito = true
  
  method peso() = 0
  
  method puedeLlamar() = credito
  
  method cargarCredito() {
    credito = true
  }
  
  method hablar() {
    credito = false
  }
}

object bicicleta {
  method peso() = 5
}

object camion {
  var acoplados = 1
  
  method peso() = acoplados * 500
  
  method cantidadAcoplados(unaCantidad) {
    acoplados = unaCantidad
  }
}

object mensajeria {
  const mensajeros = [chuck, neo, roberto]
  
  method empleados() = mensajeros
  
  method contratar(mensajero) {
    mensajeros.add(mensajero)
  }
  
  method despedir(mensajero) {
    mensajeros.remove(mensajero)
  }
  
  method despedirTodos() {
    mensajeros.clear()
  }
  
  method esGrande() = mensajeros.size() > 2
  
  method entregarPorPrimerEmpleado() = paquete.puedeSerEntregado(
    mensajeros.first()
  )
  
  method pesoUltimoEmpleado() = mensajeros.last().peso()
  
  method puedeSerEntregado(unPaquete) = mensajeros.any(
    { mensajero => unPaquete.puedeSerEntregado(mensajero) }
  )
  
  method quienesPuedenEntregar(unPaquete) = mensajeros.filter(
    { mensajero => unPaquete.puedeSerEntregado(mensajero) }
  )
  
  method tieneSobrepeso() = if (mensajeros.isEmpty()) false
                            else
                              (self.pesoTotal() / self.cantidadMensajeros()) > 500
  
  method cantidadMensajeros() = mensajeros.size()
  
  method pesoTotal() = mensajeros.sum({ m => m.peso() })
}