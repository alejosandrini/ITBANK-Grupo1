from django.contrib import messages
from django.shortcuts import redirect
from django.utils.decorators import method_decorator
from django.views import View
from django.views.decorators.csrf import requires_csrf_token

from Clientes.models import Cliente
from Cuentas.models import Cuenta
from Prestamos.models import Prestamo
from datetime import datetime

from API.views import LoanAPI


class LoanView(View):
    def get(self, request):
        return redirect('index')

    @method_decorator(requires_csrf_token)
    def post(self, request):
        customer = Cliente.objects.filter(usuario_id=request.user.id).get()
        amount = int(request.POST['amount'])
        date = request.POST['date']
        loan_type = request.POST['type']

        match customer.tipo_cliente_id:
            case 1:
                max_amount = 100000
            case 2:
                max_amount = 300000
            case 3:
                max_amount = 500000
            case _:
                max_amount = 0

        if amount > max_amount:
            error = f"El Prestamo supera el Maximo para la Preaprobacion permitido para su tipo de cliente: ${max_amount}"
        elif datetime.strptime(date, '%Y-%m-%d').date() < datetime.now().date():
            error = f"La fecha ingresada debe ser posterior a hoy: {datetime.now().strftime('%d/%m/%Y')}"
        else:
            prestamo = Prestamo(
                loan_type=loan_type,
                loan_date=date,
                loan_total=amount * 100,
                customer_id=customer.customer_id
            )

            caja_ahorro = Cuenta.objects.filter(customer_id=customer.customer_id).first()  # .get(id_tipo_cuenta=1)
            caja_ahorro.balance += amount * 100
            caja_ahorro.save()

            prestamo.save()


        if error is None:
            messages.info(request, "El prestamo ha sido aprobado correctamente")
        else:
            messages.warning(request, error)

        return redirect('bank')
