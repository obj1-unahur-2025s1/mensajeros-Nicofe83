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
  var destinos = 0
  
  method destino(nuevo) {
    destinos = nuevo
  }
  
  method precio() = destinos * 100
  
  method estaPago() = true
  
  method puedeSerEntregado(mensajero) = true
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
  const mensajeros = []
  
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
}