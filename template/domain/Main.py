import json

from clientes.Transaccion import *
from razones.Razon import *


def scan_json(path) -> dict:
    with open(f".\\entradas-salidas\\{path}.json", 'r', newline='', encoding='utf-8') as file:
        return json.load(file)


def generar_cliente(json_data: dict) -> Cliente:
    json_direccion = json_data['direccion']
    json_transacciones = json_data['transacciones']

    direccion = Direccion(json_direccion['calle'], json_direccion['numero'], json_direccion['ciudad'],
                          json_direccion['provincia'], json_direccion['pais'])

    transacciones = list(map(lambda data: Transaccion(data['estado'],
                                                      data['tipo'],
                                                      data['cuentaNumero'],
                                                      data['cupoDiarioRestante'],
                                                      data['monto'],
                                                      data['fecha'],
                                                      data['numero'],
                                                      data['saldoEnCuenta'],
                                                      data['totalTarjetasDeCreditoActualmente'],
                                                      data['totalChequerasActualmente']),
                             json_transacciones))

    match json_data['tipo'].upper():
        case 'BLACK':
            return Black(json_data['nombre'], json_data['apellido'], json_data['numero'], json_data['dni'],
                         direccion, transacciones)
        case 'GOLD':
            return Gold(json_data['nombre'], json_data['apellido'], json_data['numero'], json_data['dni'],
                        direccion, transacciones)
        case 'CLASSIC':
            return Classic(json_data['nombre'], json_data['apellido'], json_data['numero'], json_data['dni'],
                           direccion, transacciones)
        case _:
            raise ValueError("Tipo de cuenta invalido")


def imprimir_transacciones(transacciones: list) -> str:
    html = []
    for transaccion in transacciones:
        html.append(f"""              
                                <tr>
                                    <th scope="row">{transaccion.fecha}</th>
                                    <td>{transaccion.tipo}</td>
                                    <td>{transaccion.estado}</td>
                                    <td>{transaccion.monto}</td>
                                    <td>{transaccion.razon}</td>
                                </tr>""")

    return "".join(html)


def generar_reporte(cliente):
    file = open('.\entradas-salidas\\reporte.html', 'w', encoding="utf-8")

    html_template = [f"""
        <!--En el reporte se debe incluir el nombre de cliente, número, DNI, dirección y para
        cada transacción la fecha , el tipo de operación, el estado, el monto y razón por la
        cual se rechazó (vacío en caso de ser aceptada).-->
        <html lang="es">
            <head>
                <meta charset="UTF-8">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
                <title>Reporte transacciones</title>
            </head>
            <body>
                <div class="container">
                    <h2>Reporte</h2>
                    <div class="card bg-secondary my-1">
                        <h4 class="card-title m-2 pt-1 text-light">Cliente {type(cliente).__name__}</h4>
                        <div class="card-body bg-light py-2 m-1">
                            <p class="card-text my-0">Nombre: {cliente.nombre}</p>
                            <p class="card-text my-0">Número: {cliente.numero}</p>
                            <p class="card-text my-0">DNI: {cliente.dni}</p>
                            <p class="card-text my-0">Dirección: {cliente.calle}</p>
                        </div>
                    </div>
                    <div class="card bg-secondary">
                        <h4 class="card-title m-2 pt-1 text-light">Transacciones</h4>
                        <div class="card-body bg-light py-2 m-1 table-responsive-md">
                            <table class="table table-sm table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col">Fecha</th>
                                        <th scope="col">Tipo operación</th>
                                        <th scope="col">Estado</th>
                                        <th scope="col">Monto</th>
                                        <th scope="col">Razón</th>
                                    </tr>
                                </thead>
                                <tbody>""",
                     imprimir_transacciones(cliente.transacciones),
                     """
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </body>
        </html>
        """]

    file.write("".join(html_template))
    file.close()


def main():
    cliente = generar_cliente(scan_json(input("Ingrese el Nombre del Archivo del que se quiere un reporte (Sin "
                                              "Extension): ")))

    razones = [RazonAltaChequera(), RazonAltaTarjetaCredito(),
               RazonComprarDolar(), RazonRetiroEfectivo(),
               RazonTransferenciaEnviada(), RazonTransferenciaRecibida()]

    print("Transacciones:\n---------")

    for transaccion in cliente.transacciones:
        transaccion.obtener_razon(cliente, razones)

    generar_reporte(cliente)

    print(f"Puede encontrar el reporte en la carpeta: entradas-salidas\\reporte.html")


if __name__ == '__main__':
    main()
