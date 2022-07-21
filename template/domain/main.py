import sys
from main.parser import Parser
from main.exporter import Exporter
from razones.razon import RazonAltaChequera, RazonAltaTarjetaCredito, RazonComprarDolar, RazonRetiroEfectivo, RazonTransferenciaEnviada, RazonTransferenciaRecibida

def obtenerJson():
    cliente = Parser.generarCliente(sys.argv[1])
    return cliente
def imprimirHtml(cliente):
    exporter = Exporter()
    exporter.generarReporte(cliente)

if __name__ == '__main__':
    cliente = obtenerJson()
    razones = [RazonAltaChequera("ALTA_CHEQUERA"), RazonAltaTarjetaCredito("ALTA_TARJETA_CREDITO"),
                RazonComprarDolar("COMPRA_DOLAR"), RazonRetiroEfectivo("RETIRO_EFECTIVO_CAJERO_AUTOMATICO"), 
                RazonTransferenciaEnviada("TRANSFERENCIA_ENVIADA"), RazonTransferenciaRecibida("TRANSFERENCIA_RECIBIDA")]
    print("Transacciones:\n---------")
    for t in cliente.transacciones:
        t.obtenerRazon(cliente, razones)
    imprimirHtml(cliente)
    print(f"Puede encontrar el reporte en la carpeta: entradas-salidas\\reporte.html")
