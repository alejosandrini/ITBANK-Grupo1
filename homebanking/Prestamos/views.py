from django.contrib import messages
from django.shortcuts import redirect
from django.utils.decorators import method_decorator
from django.views import View
from django.views.decorators.csrf import requires_csrf_token

from Clientes.models import Cliente
from Cuentas.models import Cuenta
from Prestamos.models import Prestamo
from datetime import timedelta, datetime


class PrestamosView(View):
    def get(self, request):
        return redirect('index')

    @method_decorator(requires_csrf_token)
    def post(self, request):
        amount = int(request.POST['amount'])
        cliente = request.session['cliente']

        match cliente['tipo_cliente']:
            case 'CLASSIC':
                max_amount = 100000
            case 'GOLD':
                max_amount = 300000
            case 'BLACK':
                max_amount = 500000
            case _:
                max_amount = 0

        if amount > max_amount:
            messages.warning(request, f"El Prestamo supera el Maximo para la Preaprobacion permitido para su tipo de cliente: ${max_amount}")
            return redirect('bank')
        else:
            prestamo = Prestamo(
                loan_type=request.POST['type'],
                loan_date=str(datetime.now() + timedelta(days=730))[0:10],
                loan_total=amount,
                customer_id=cliente['customer_id']
            )

            caja_ahorro = Cuenta.objects.filter(customer_id=cliente['customer_id']).first() #.get(id_tipo_cuenta=1)
            caja_ahorro.balance += amount * 100
            caja_ahorro.save()

            prestamo.save()

            messages.info(request, "El prestamo ha sido aprobado correctamente")
            return redirect('bank')
