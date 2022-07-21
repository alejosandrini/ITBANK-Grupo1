from razones.razon import RazonRetiroEfectivo, RazonTransferenciaEnviada, RazonTransferenciaRecibida

class Transaccion():
    def __init__(self, estado, tipo, cuentaNumero, cupoDiarioRestante, monto, fecha, numero, saldoEnCuenta, totalTarjetasDeCreditoActualmente, totalChequerasActualmente):
        self.estado = estado
        self.tipo = tipo
        self.cuentaNumero = cuentaNumero
        self.cupoDiarioRestante = cupoDiarioRestante
        self.monto = monto
        self.fecha = fecha
        self.numero = numero
        self.saldoEnCuenta = saldoEnCuenta
        self.totalTarjetasDeCreditoActualmente  = totalTarjetasDeCreditoActualmente
        self.totalChequerasActualmente  = totalChequerasActualmente

    def __str__(self):
        return f"Numero:{self.numero}\nEstado:{self.estado}\nTipo:{self.tipo}\n---------"
    def setRazon(self, razon):
        self.razon = razon
    def obtenerRazon(self, cliente, razones):
        def buscarRazon(razon):
            return self.tipo == razon.type
        try:
            r = list(filter(buscarRazon,razones))[0]
            if(isinstance(r,RazonRetiroEfectivo) or isinstance(r,RazonTransferenciaEnviada) or isinstance(r,RazonTransferenciaRecibida)):
                r.monto = self.monto
            self.actualizarCliente(cliente)
            self.setRazon(r.resolver(cliente, ""))
            print(self)
        except: 
            print("No existe razón")

    def actualizarCliente(self, cliente):
        cliente.cantidad_chequeras = self.totalChequerasActualmente
        cliente.cantidad_tarjetas_credito = self.totalTarjetasDeCreditoActualmente
        for cuenta in cliente.cuentas:
            cuenta.actualizarSaldo(self.saldoEnCuenta)
            cuenta.actualizarLimiteExtraccion(self.cupoDiarioRestante)