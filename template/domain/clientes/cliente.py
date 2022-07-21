from cmath import nan
from math import isnan
from .cuenta import Caja_ahorro_dolares, Caja_ahorro_pesos, Cuenta, Cuenta_corriente


class Cliente:
    def __init__(self, nombre, apellido, numero, dni, direccion, transacciones):
        self.nombre = nombre
        self.apellido = apellido
        self.numero = numero
        self.dni = dni
        self.direccion = direccion
        self.transacciones = transacciones
        self.max_chequeras = 0
        self.cantidad_chequeras = 0
        self.max_tarjetas_credito = 0
        self.cantidad_tarjetas_credito = 0
        self.max_tarjetas_debito = 0
        self.cantidad_tarjetas_debito = 0


    def puede_crear_chequera(self):
        return self.cantidad_chequeras < self.max_chequeras
    def puede_crear_tarjeta_credito(self):
        return self.cantidad_tarjetas_credito < self.max_tarjetas_credito
    def puede_crear_tarjeta_debito(self):
        return self.cantidad_tarjetas_debito < self.max_tarjetas_debito
    def puede_comprar_dolar(self):
        return False

class Classic(Cliente):
    def __init__(self, nombre, apellido, numero, dni, direccion, transacciones):
        super().__init__(nombre, apellido, numero, dni, direccion, transacciones)
        self.cuentas = [Caja_ahorro_pesos(10000,150000,0,0.1,0)]
        self.max_tarjetas_debito = 1
        self.max_chequeras = 0
        self.max_tarjetas_credito = 0

    def puede_extraer_efectivo(self, monto):
        cajaAhorroPesos = list(filter(lambda c: isinstance(c,Caja_ahorro_pesos), self.cuentas))[0]
        return int(cajaAhorroPesos.limite_extraccion_diario) > int(monto)
    def puede_recibir_transferencia(self, monto):
        cajaAhorroPesos = list(filter(lambda c: isinstance(c,Caja_ahorro_pesos), self.cuentas))[0]
        return int(cajaAhorroPesos.limite_transferencia_recibida) > int(monto)
    def puede_enviar_transferencia(self, monto):
        cajaAhorroPesos = list(filter(lambda c: isinstance(c,Caja_ahorro_pesos), self.cuentas))[0]
        return int(cajaAhorroPesos.monto) > int(monto) + int(cajaAhorroPesos.costo_transferencias)


class Gold(Cliente):
    def __init__(self, nombre, apellido, numero, dni, direccion, transacciones):
        super().__init__(nombre, apellido, numero, dni, direccion, transacciones)
        self.cuentas = [Caja_ahorro_pesos(20000,500000,0,0.05,10000), Caja_ahorro_dolares(20000,500000,0,0.05,10000), Cuenta_corriente(20000,500000,0,0.05,10000)]
        self.max_tarjetas_debito = 1
        self.max_chequeras = 1
        self.max_tarjetas_credito = 1
        
    def puede_comprar_dolar(self):
        return True
    def puede_extraer_efectivo(self, monto):
            cuentaCorriente = list(filter(lambda c: isinstance(c,Cuenta_corriente), self.cuentas))[0]
            return int(cuentaCorriente.limite_extraccion_diario) > int(monto) and int(monto) > - int(cuentaCorriente.saldo_descubierto_disponible)
    def puede_recibir_transferencia(self, monto):
            cuentaCorriente = list(filter(lambda c: isinstance(c,Cuenta_corriente), self.cuentas))[0]
            return int(cuentaCorriente.limite_transferencia_recibida) > int(monto)
    def puede_enviar_transferencia(self, monto):
            cuentaCorriente = list(filter(lambda c: isinstance(c,Cuenta_corriente), self.cuentas))[0]
            cajaAhorroPesos = list(filter(lambda c: isinstance(c,Caja_ahorro_pesos), self.cuentas))[0]
            return int(cuentaCorriente.monto) + int(cajaAhorroPesos.monto) > int(monto) + int(cuentaCorriente.costo_transferencias)

class Black(Cliente):
    def __init__(self, nombre, apellido, numero, dni, direccion, transacciones):
        super().__init__(nombre, apellido, numero, dni, direccion, transacciones)
        self.cuentas = [Caja_ahorro_pesos(100000,nan,0,0,10000), Caja_ahorro_dolares(100000,nan,0,0,10000), Cuenta_corriente(100000,nan,0,0,10000)]
        self.max_chequeras = 2
        self.max_tarjetas_credito = 5

    def puede_comprar_dolar(self):
        return True
    def puede_extraer_efectivo(self, monto):
            cuentaCorriente = list(filter(lambda c: isinstance(c,Cuenta_corriente), self.cuentas))[0]
            return int(cuentaCorriente.limite_extraccion_diario) > int(monto) and int(monto) > - int(cuentaCorriente.saldo_descubierto_disponible)
    def puede_recibir_transferencia(self, monto):
            return True
    def puede_enviar_transferencia(self, monto):
            cuentaCorriente = list(filter(lambda c: isinstance(c,Cuenta_corriente), self.cuentas))[0]
            cajaAhorroPesos = list(filter(lambda c: isinstance(c,Caja_ahorro_pesos), self.cuentas))[0]
            return int(cuentaCorriente.monto) + int(cajaAhorroPesos.monto) > int(monto) + int(cuentaCorriente.costo_transferencias)