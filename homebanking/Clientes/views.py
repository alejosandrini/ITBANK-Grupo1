from django.shortcuts import render
from django.views import View


class ClientesView(View):

    def get(self, request, *args, **kwargs):
        context = request.GET.dict()
        return render(request, "Clientes/index.html", context=context)

