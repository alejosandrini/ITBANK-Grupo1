from django.shortcuts import render, redirect
from django.views import View
from django.contrib import messages
from Prestamos.forms import PrestamoForm
from Prestamos.models import Prestamo
from datetime import datetime



class PrestamosView(View):
    def get(self, request, *args, **kwargs):
        return redirect('index')

    def post(self, request):
        # print(request.POST)
        prestamo_form = PrestamoForm(data=request.POST)
        if prestamo_form.is_valid():
            loan_type = request.POST.get("tipo_prestamo", "")
            loan_date = datetime.today().strftime('%Y-%m-%d')
            loan_total = request.POST.get("monto", "")
            customer_id = request.session['cliente']['customer_id']
            print(loan_type)
            print(loan_date)
            print(loan_total)
            print(customer_id)

            prestamo = Prestamo(loan_type=loan_type,loan_date=loan_date, loan_total=loan_total,
            customer_id=customer_id)
            # prestamo.save()
            messages.info(request, "La solicitud de préstamo fue enviada.")
        messages.warning(request, "La solicitud de préstamo no fue enviada.")
        return redirect('bank')
