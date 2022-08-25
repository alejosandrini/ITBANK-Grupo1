from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from django.utils.decorators import method_decorator
from django.views import View

from Clientes.models import Cliente
from Clientes.serializers import ClienteSerializer
from Cuentas.models import Cuenta
from Prestamos.models import Prestamo


class HomeBankingView(View):
    @method_decorator(login_required)
    def get(self, request):
        context = request.GET.dict()

        cliente = Cliente.objects.filter(usuario_id=request.user.id).first()
        cliente_serializado = ClienteSerializer(cliente).data

        cuentas = Cuenta.objects.filter(customer_id=cliente.customer_id)

        balances = []
        balance_total = 0

        for index, cuenta in enumerate(cuentas, 1):
            amount = cuenta.balance / 100
            balances.append({'amount': amount, 'id': index})
            balance_total += amount

        prestamos = []

        for index, prestamo in enumerate(Prestamo.objects.filter(customer_id=cliente.customer_id), 1):
            prestamos.append(
                {'type': prestamo.loan_type, 'amount': prestamo.loan_total, 'date': prestamo.loan_date,
                 'id': index})

        request.session['cliente'] = cliente_serializado
        request.session['cuentas'] = {'balanceTotal': round(balance_total, 2), 'balances': balances}
        request.session['prestamos'] = prestamos

        return render(request, "Cuentas/bank.html", context=context)
