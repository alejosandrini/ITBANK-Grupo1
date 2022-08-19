class Cuenta:
    def __init__(self, limite_extraccion_diario: int, limite_transferencia_recibida: int, monto: int,
                 costo_transferencias: float, saldo_descubierto_disponible: int):
        self.limite_extraccion_diario = limite_extraccion_diario
        self.limite_transferencia_recibida = limite_transferencia_recibida
        self.monto = monto
        self.costo_transferencias = costo_transferencias
        self.saldo_descubierto_disponible = saldo_descubierto_disponible

    def actualizar_saldo(self, saldo):
        self.monto = saldo

    def actualizar_limite_extraccion(self, monto):
        self.limite_extraccion_diario = monto


class CajaAhorroPesos(Cuenta):
    def __init__(self, limite_extraccion_diario: int, limite_transferencia_recibida: int, monto: int,
                 costo_transferencias: float, saldo_descubierto_disponible: int):
        super().__init__(limite_extraccion_diario, limite_transferencia_recibida, monto, costo_transferencias,
                         saldo_descubierto_disponible)


class CajaAhorroDolares(Cuenta):
    def __init__(self, limite_extraccion_diario: int, limite_transferencia_recibida: int, monto: int,
                 costo_transferencias: float, saldo_descubierto_disponible: int):
        super().__init__(limite_extraccion_diario, limite_transferencia_recibida, monto, costo_transferencias,
                         saldo_descubierto_disponible)


class CuentaCorriente(Cuenta):
    def __init__(self, limite_extraccion_diario: int, limite_transferencia_recibida: int, monto: int,
                 costo_transferencias: float, saldo_descubierto_disponible: int):
        super().__init__(limite_extraccion_diario, limite_transferencia_recibida, monto, costo_transferencias,
                         saldo_descubierto_disponible)

    def tiene_cupo_diario(self, monto_operacion):
        return int(self.monto) - int(monto_operacion) > -10000
