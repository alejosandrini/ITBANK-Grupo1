import sys
from abc import abstractmethod, ABC

from clientes.Cuenta import *
from clientes.Direccion import Direccion


class Cliente(ABC):
    def __init__(self, nombre: str, apellido: str, numero: int, dni: str, direccion: Direccion, transacciones: list):
        self._nombre = nombre
        self._apellido = apellido
        self._numero = numero
        self._dni = dni
        self._direccion = direccion
        self._transacciones = transacciones
        self.cantidad_chequeras = 0
        self.cantidad_tarjetas_credito = 0

    @abstractmethod
    def puede_extraer_efectivo(self, monto) -> bool:
        pass

    @abstractmethod
    def puede_recibir_transferencia(self, monto) -> bool:
        pass

    @abstractmethod
    def puede_enviar_transferencia(self, monto) -> bool:
        pass

    @abstractmethod
    def puede_crear_chequera(self) -> bool:
        pass

    @abstractmethod
    def puede_crear_tarjeta_credito(self) -> bool:
        pass

    @abstractmethod
    def puede_comprar_dolar(self) -> bool:
        pass

    @property
    def nombre(self):
        return self.nombre

    @property
    def apellido(self):
        return self.apellido

    @property
    def numero(self):
        return self.numero

    @property
    def dni(self):
        return self.dni

    @property
    def transacciones(self):
        return self.transacciones

    @property
    def calle(self):
        return self._direccion.calle + " " + self._direccion.numero

    @property
    def ciudad(self):
        return self._direccion.ciudad

    @property
    def provincia(self):
        return self._direccion.provincia

    @property
    def pais(self):
        return self._direccion.pais


class Classic(Cliente):
    def __init__(self, nombre, apellido, numero, dni, direccion, transacciones):
        super().__init__(nombre, apellido, numero, dni, direccion, transacciones)
        self.cuentas = [CajaAhorroPesos(10000, 150000, 0, 0.1, 0)]
        self.max_chequeras = 0
        self.max_tarjetas_credito = 0

    def puede_extraer_efectivo(self, monto) -> bool:
        caja_ahorro_pesos = list(filter(lambda c: isinstance(c, CajaAhorroPesos), self.cuentas))[0]
        return int(caja_ahorro_pesos.limite_extraccion_diario) > int(monto)

    def puede_recibir_transferencia(self, monto) -> bool:
        caja_ahorro_pesos = list(filter(lambda c: isinstance(c, CajaAhorroPesos), self.cuentas))[0]
        return int(caja_ahorro_pesos.limite_transferencia_recibida) > int(monto)

    def puede_enviar_transferencia(self, monto) -> bool:
        caja_ahorro_pesos = list(filter(lambda c: isinstance(c, CajaAhorroPesos), self.cuentas))[0]
        return int(caja_ahorro_pesos.monto) > int(monto) + int(caja_ahorro_pesos.costo_transferencias)

    def puede_crear_chequera(self) -> bool:
        return False

    def puede_crear_tarjeta_credito(self) -> bool:
        return False

    def puede_comprar_dolar(self) -> bool:
        return False


class Gold(Cliente):
    def __init__(self, nombre, apellido, numero, dni, direccion, transacciones):
        super().__init__(nombre, apellido, numero, dni, direccion, transacciones)
        self.cuentas = [CajaAhorroPesos(20000, 500000, 0, 0.05, 10000),
                        CajaAhorroDolares(20000, 500000, 0, 0.05, 10000),
                        CuentaCorriente(20000, 500000, 0, 0.05, 10000)]
        self.max_chequeras = 1
        self.max_tarjetas_credito = 1

    def puede_extraer_efectivo(self, monto) -> bool:
        cuenta_corriente = list(filter(lambda c: isinstance(c, CuentaCorriente), self.cuentas))[0]
        return int(cuenta_corriente.limite_extraccion_diario) > int(monto) > - int(
            cuenta_corriente.saldo_descubierto_disponible)

    def puede_recibir_transferencia(self, monto) -> bool:
        cuenta_corriente = list(filter(lambda c: isinstance(c, CuentaCorriente), self.cuentas))[0]
        return int(cuenta_corriente.limite_transferencia_recibida) > int(monto)

    def puede_enviar_transferencia(self, monto) -> bool:
        cuenta_corriente = list(filter(lambda c: isinstance(c, CuentaCorriente), self.cuentas))[0]
        caja_ahorro_pesos = list(filter(lambda c: isinstance(c, CajaAhorroPesos), self.cuentas))[0]
        return int(cuenta_corriente.monto) + int(caja_ahorro_pesos.monto) > int(monto) + int(
            cuenta_corriente.costo_transferencias)

    def puede_crear_chequera(self) -> bool:
        return self.cantidad_chequeras < self.max_chequeras

    def puede_crear_tarjeta_credito(self) -> bool:
        return self.cantidad_tarjetas_credito < self.max_tarjetas_credito

    def puede_comprar_dolar(self) -> bool:
        return True


class Black(Cliente):
    def __init__(self, nombre, apellido, numero, dni, direccion, transacciones):
        super().__init__(nombre, apellido, numero, dni, direccion, transacciones)
        self.cuentas = [CajaAhorroPesos(100000, sys.maxsize, 0, 0, 10000),
                        CajaAhorroDolares(100000, sys.maxsize, 0, 0, 10000),
                        CuentaCorriente(100000, sys.maxsize, 0, 0, 10000)]
        self.max_chequeras = 2
        self.max_tarjetas_credito = 5

    def puede_extraer_efectivo(self, monto) -> bool:
        cuenta_corriente = list(filter(lambda c: isinstance(c, CuentaCorriente), self.cuentas))[0]
        return int(cuenta_corriente.limite_extraccion_diario) > int(monto) > - int(
            cuenta_corriente.saldo_descubierto_disponible)

    def puede_recibir_transferencia(self, monto) -> bool:
        return True

    def puede_enviar_transferencia(self, monto) -> bool:
        cuenta_corriente = list(filter(lambda c: isinstance(c, CuentaCorriente), self.cuentas))[0]
        caja_ahorro_pesos = list(filter(lambda c: isinstance(c, CajaAhorroPesos), self.cuentas))[0]
        return int(cuenta_corriente.monto) + int(caja_ahorro_pesos.monto) > int(monto) + int(
            cuenta_corriente.costo_transferencias)

    def puede_crear_chequera(self) -> bool:
        return self.cantidad_chequeras < self.max_chequeras

    def puede_crear_tarjeta_credito(self) -> bool:
        return self.cantidad_tarjetas_credito < self.max_tarjetas_credito

    def puede_comprar_dolar(self) -> bool:
        return True
