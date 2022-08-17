from clientes.Cliente import *


class Razon:
    def __init__(self, tipo: str):
        self._tipo = tipo

    @property
    def tipo(self) -> str:
        return self._tipo

    @abstractmethod
    def resolver(self, cliente, evento) -> str:
        pass


class RazonAltaChequera(Razon):
    def __init__(self):
        super().__init__("ALTA_CHEQUERA")

    def resolver(self, cliente, evento) -> str:
        mensaje = "Ya alcanzó máximo de chequeras"
        if cliente.puede_crear_chequera():
            mensaje = "Válida"
        elif isinstance(cliente, Classic):
            mensaje = "Cliente Classic no puede tener chequeras"
        return mensaje


class RazonAltaTarjetaCredito(Razon):
    def __init__(self):
        super().__init__("ALTA_TARJETA_CREDITO")

    def resolver(self, cliente, evento) -> str:
        mensaje = "Ya alcanzó máximo de tarjetas de crédito"
        if cliente.puede_crear_tarjeta_credito():
            mensaje = "Válida"
        elif isinstance(cliente, Classic):
            mensaje = "Cliente Classic no puede tener tarjetas de crédito"
        return mensaje


class RazonComprarDolar(Razon):
    def __init__(self):
        super().__init__("COMPRA_DOLAR")

    def resolver(self, cliente, evento) -> str:
        mensaje = "El cliente no tiene cuenta en dólares"
        if cliente.puede_comprar_dolar():
            mensaje = "Válida"
        return mensaje


class RazonRetiroEfectivo(Razon):
    def __init__(self):
        super().__init__("RETIRO_EFECTIVO_CAJERO_AUTOMATICO")
        self.monto = 0

    def resolver(self, cliente, evento) -> str:
        mensaje = "El monto supera el límite de extracción diario"
        if cliente.puede_extraer_efectivo(self.monto):
            mensaje = "Válida"
        return mensaje


class RazonTransferenciaEnviada(Razon):
    def __init__(self):
        super().__init__("TRANSFERENCIA_ENVIADA")
        self.monto = 0

    def resolver(self, cliente, evento) -> str:
        mensaje = "El monto supera el monto de la cuenta"
        if cliente.puede_extraer_efectivo(self.monto):
            mensaje = "Válida"
        return mensaje


class RazonTransferenciaRecibida(Razon):
    def __init__(self):
        super().__init__("TRANSFERENCIA_RECIBIDA")
        self.monto = 0

    def resolver(self, cliente, evento) -> str:
        mensaje = "El monto supera el límite de recepción"
        if cliente.puede_recibir_transferencia(self.monto):
            mensaje = "Válida"
        return mensaje
