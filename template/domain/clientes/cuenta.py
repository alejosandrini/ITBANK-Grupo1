class Cuenta:
    def __init__(self, limite_extraccion_diario, limite_transferencia_recibida, monto, costo_transferencias, saldo_descubierto_disponible):
        self.limite_extraccion_diario = limite_extraccion_diario
        self.limite_transferencia_recibida = limite_transferencia_recibida
        self.monto = monto
        self.costo_transferencias = costo_transferencias 
        self.saldo_descubierto_disponible = saldo_descubierto_disponible
    def actualizarSaldo(self, saldo):
        self.monto = saldo
    def actualizarLimiteExtraccion(self, monto):
        self.limite_extraccion_diario = monto
class Caja_ahorro_pesos(Cuenta):
    def __init__(self, limite_extraccion_diario, limite_transferencia_recibida, monto, costo_transferencias, saldo_descubierto_disponible):
        super().__init__(limite_extraccion_diario, limite_transferencia_recibida, monto, costo_transferencias, saldo_descubierto_disponible)
class Caja_ahorro_dolares(Cuenta):
   def __init__(self, limite_extraccion_diario, limite_transferencia_recibida, monto, costo_transferencias, saldo_descubierto_disponible):
        super().__init__(limite_extraccion_diario, limite_transferencia_recibida, monto, costo_transferencias, saldo_descubierto_disponible)
class Cuenta_corriente(Cuenta):
    def __init__(self, limite_extraccion_diario, limite_transferencia_recibida, monto, costo_transferencias, saldo_descubierto_disponible):
        super().__init__(limite_extraccion_diario, limite_transferencia_recibida, monto, costo_transferencias, saldo_descubierto_disponible)
    def tieneCupoDiario(self, monto_operacion):
        return int(self.monto) - int(monto_operacion) > -10000