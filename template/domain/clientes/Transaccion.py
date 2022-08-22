from razones.Razon import *


class Transaccion:
    def __init__(self, estado: str, tipo: str, cuenta_numero: int, cupo_diario_restante: int, monto: int, fecha: str,
                 numero: int, saldo_en_cuenta: int, tarjetas_credito_actualmente: int, chequeras_actualmente: int):
        self.estado = estado
        self.tipo = tipo
        self.cuenta_numero = cuenta_numero
        self.cupo_diario_restante = cupo_diario_restante
        self.monto = monto
        self.fecha = fecha
        self.numero = numero
        self.saldo_en_cuenta = saldo_en_cuenta
        self.tarjetas_credito_actualmente = tarjetas_credito_actualmente
        self.chequeras_actualmente = chequeras_actualmente

    def __str__(self):
        return f"Numero:{self.numero}\nEstado:{self.estado}\nTipo:{self.tipo}\n---------"

    def set_razon(self, razon):
        self.razon = razon

    def obtener_razon(self, cliente, razones):

        def buscar_razon(razon):
            return self.tipo == razon.type

        try:
            razon = list(filter(buscar_razon, razones))[0]
            if (isinstance(razon, RazonRetiroEfectivo) or isinstance(razon, RazonTransferenciaEnviada) or
                    isinstance(razon, RazonTransferenciaRecibida)):
                razon.monto = self.monto
            self.actualizar_cliente(cliente)
            self.set_razon(razon.resolver(cliente, ""))
            print(self)
        except:
            print("No existe razón")

    def actualizar_cliente(self, cliente):
        cliente.cantidad_chequeras = self.chequeras_actualmente
        cliente.cantidad_tarjetas_credito = self.tarjetas_credito_actualmente
        for cuenta in cliente.cuentas:
            cuenta.actualizar_saldo(self.saldo_en_cuenta)
            cuenta.actualizar_limite_extraccion(self.cupo_diario_restante)
