import json
from clientes.cliente import *
from clientes.direccion import Direccion
from clientes.transaccion import Transaccion
class Parser():
    def generarCliente(path):
        with open(f".\entradas-salidas\{path}",'r', newline='', encoding='utf-8') as f:
            obj = json.load(f)
        obj_dir = obj['direccion']
        direccion = Direccion(obj_dir['calle'],obj_dir['numero'],obj_dir['ciudad'],obj_dir['provincia'],obj_dir['pais'])
        obj_tra = obj['transacciones']
        def generarTransaccion(t):
            return Transaccion(t['estado'], t['tipo'], t['cuentaNumero'], t['cupoDiarioRestante'],
                             t['monto'], t['fecha'], t['numero'], t['saldoEnCuenta'],
                              t['totalTarjetasDeCreditoActualmente'], t['totalChequerasActualmente'])
        transacciones = list(map(generarTransaccion, obj_tra))
        if(obj['tipo'].upper() == "BLACK"):
            cliente = Black(obj['nombre'], obj['apellido'], obj['numero'], obj['dni'], direccion, transacciones)
        elif(obj['tipo'].upper() == "GOLD"):
            cliente = Gold(obj['nombre'], obj['apellido'], obj['numero'], obj['dni'], direccion, transacciones)
        elif(obj['tipo'].upper() == "CLASSIC"):
            cliente = Classic(obj['nombre'], obj['apellido'], obj['numero'], obj['dni'], direccion, transacciones)
        else:
            raise ValueError("Tipo de cuenta invalido")
        return cliente

