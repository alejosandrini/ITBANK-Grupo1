import csv
import argparse
from datetime import date, datetime

# ejemplo1: py template\listado_chesques.py test.csv 40998788 Pantalla depositado -ec aprobado
# ejemplo2: py template\listado_chesques.py test.csv 40998788 Pantalla depositado -ec rechazado
# ejemplo3: py template\listado_chesques.py test.csv 40998788 Pantalla emitido
# ejemplo4: py template\listado_chesques.py test.csv 23665789 Csv emitido
# ejemplo5: py template\listado_chesques.py test.csv 23665789 paNtaLLa emitido -rf 2021-04-20:2021-06-01

parser = argparse.ArgumentParser("""Ingresa Nombre del archivo csv, DNI, Salida,
        Tipo de cheque, Estado de cheque(opcional), Rango de fecha(opcional)""")
parser.add_argument('csv',type=str,help='Ingresa nombre del archivo csv')
parser.add_argument('dni',type=int,help='Ingresa el dni que quieres filtrar')
parser.add_argument('salida',type=str,help='Ingresa tipo de salida (pantalla o csv)')
parser.add_argument('tipocheque',type=str,help='Ingresa el tipo de cheque (emitido o depositado)')
parser.add_argument('-ec','--estadocheque',type=str,help='Ingresa el estado del cheque (pendiente, aprobado, rechazado)',default=None)
parser.add_argument('-rf','--rangofecha',type=str,help='Ingresa un rango de fechas con el formato: xxxx-xx-xx:yyyy-yy-yy')

args = parser.parse_args()

def escribir(resultado):
    dt=datetime.now()
    ts=datetime.timestamp(dt)
    with open(f'template\{resultado[0][8]}{ts}.csv', 'w', newline='', encoding='utf-8') as f:
        writer = csv.writer(f)
        for cheque in resultado:
            valor = [cheque [3], cheque[5], cheque[6], cheque[7]]
            writer.writerow(valor)    

def filtrarCheque(resultado, estadoCheque):
    return filter(lambda cheque: cheque[10]== estadoCheque.upper(), resultado)

def filtrarPorFecha(resultado, rangoFecha):
    fechas = rangoFecha.split(':')
    fechaOrigen = date.fromisoformat(fechas[0])
    fechaPago = date.fromisoformat(fechas[1])
    return filter(lambda cheque: date.fromtimestamp(int(cheque[6]))>fechaOrigen and date.fromtimestamp(int(cheque[7]))<fechaPago, resultado)


def leer(archivo, dni, salida, tipoCheque, estadoCheque, rangoFecha="1900-01-01:9999-12-31"):
    diccionario = {}
    with open(f"template\{archivo}",'r', newline='', encoding='utf-8') as f:
        reader = csv.reader(f)
        generarDiccionarioCSV(f,reader, diccionario)
        f.close()
        #print(diccionario)
        resultado = diccionario.get(str(dni))
        if(estadoCheque != None):
            resultado = filtrarCheque(resultado, estadoCheque)
        resultado = filtrarPorFecha(resultado, rangoFecha)
        imprimirResultados(salida,resultado)
        

def generarDiccionarioCSV(f,reader, diccionario):
    for NroCheque,CodBanco,CodiScurusal,NroCuentaOrigen,NroCuentaDestino,Valor,FechaOrigen,FechaPago,DNI,Tipo,Estado in reader:
        datos = [NroCheque,CodBanco,CodiScurusal,NroCuentaOrigen,NroCuentaDestino,Valor,FechaOrigen,FechaPago,DNI,Tipo,Estado]
        if(DNI in diccionario):
            try:
                verificarChequeRepetido(diccionario.get(DNI), NroCheque, NroCuentaOrigen)
            except ValueError:
                print(f"Error-->El cheque con nro:{NroCheque} se encuentra repetido en la cuenta: {NroCuentaOrigen}")
                f.close()
                exit()
            diccionario[DNI].append(datos)
        else:
            diccionario[DNI] = [datos]

def verificarChequeRepetido(datos, NroCheque, NroCuentaOrigen):
    for dato in datos:
        if (NroCheque in dato and NroCuentaOrigen in dato):
            raise ValueError

def imprimirResultados(salida,resultado):
    if(salida.upper() == "PANTALLA"):
   
        for cheque in resultado:
            print(f"""\nNroCheque:{cheque[0]}\nCodBanco:{cheque[1]}\nCodiScurusal:{cheque[2]}
NroCuentaOrigen:{cheque[3]}\nNroCuentaDestino:{cheque[4]}\nValor:{cheque[5]}
FechaOrigen:{date.fromtimestamp(float(cheque[6]))}\nFechaPago:{date.fromtimestamp(float(cheque[7]))}\nDNI:{cheque[8]}
Tipo:{cheque[9]}\nEstado:{cheque[10]}\n=======================""")

    elif(salida.upper() == "CSV"):
        escribir(resultado)
    else :
        print(f"Error-->La salida: {salida} no es valida")
        exit()

if(args.rangofecha):
    leer(args.csv, args.dni, args.salida,args.tipocheque,args.estadocheque,args.rangofecha)
else:
    leer(args.csv, args.dni, args.salida,args.tipocheque,args.estadocheque)
# leer("test.csv","40998788","PantaLla",123)
