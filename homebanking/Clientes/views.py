from django.shortcuts import render
from django.views import View

from API.views import CustomerAPI


class CustomerView(View):

    def get(self, request, *args, **kwargs):
        context = request.GET.dict()
        return render(request, "Clientes/index.html", context=context)

