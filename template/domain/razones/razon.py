from clientes.cliente import Classic


class Razon():
    def __init__(self, type):
        self.type = type
    def resolver(self, cliente, evento):
        pass

class RazonAltaChequera(Razon):
    def __init__(self, type):
        super().__init__(type)
    def resolver(self, cliente, evento):
        mensaje = "Ya alcanzó máximo de chequeras"
        if(cliente.puede_crear_chequera()):
            mensaje = "Válida"
        elif(isinstance(cliente, Classic)):
            mensaje = "Cliente Classic no puede tener chequeras"
        return mensaje

class RazonAltaTarjetaCredito(Razon):
    def __init__(self, type):
        super().__init__(type)
    def resolver(self, cliente, evento):
        mensaje = "Ya alcanzó máximo de tarjetas de crédito"
        if(cliente.puede_crear_tarjeta_credito()):
            mensaje = "Válida"
        elif(isinstance(cliente, Classic)):
            mensaje = "Cliente Classic no puede tener tarjetas de crédito"
        return mensaje
class RazonComprarDolar(Razon):
    def __init__(self, type):
        super().__init__(type)
    def resolver(self, cliente, evento):
        mensaje = "El cliente no tiene cuenta en dólares"
        if(cliente.puede_comprar_dolar()):
            mensaje = "Válida"
        return mensaje
class RazonRetiroEfectivo(Razon):
    def __init__(self, type):
        super().__init__(type)
        self.monto = 0
    def resolver(self, cliente, evento):
        mensaje = "El monto supera el límite de extracción diario"
        if(cliente.puede_extraer_efectivo(self.monto)):
            mensaje = "Válida"
        return mensaje

class RazonTransferenciaEnviada(Razon):
    def __init__(self, type):
        super().__init__(type)
        self.monto = 0
    def resolver(self, cliente, evento):
        mensaje = "El monto supera el monto de la cuenta"
        if(cliente.puede_extraer_efectivo(self.monto)):
            mensaje = "Válida"
        return mensaje
class RazonTransferenciaRecibida(Razon):
    def __init__(self, type):
        super().__init__(type)
        self.monto = 0
    def resolver(self, cliente, evento):
        mensaje = "El monto supera el límite de recepción"
        if(cliente.puede_recibir_transferencia(self.monto)):
            mensaje = "Válida"
        return mensaje

