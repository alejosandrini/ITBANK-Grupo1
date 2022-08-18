from django.shortcuts import render
from django.views import View


class ClientesView(View):

    def get(self, request, *args, **kwargs):
        context = {}
        return render(request, "Clientes/index.html", context=context)


class CotizacionView(View):
    def get(self, request, *args, **kwargs):
        context = {}
        return render(request, "Clientes/cotizacion.html", context=context)
