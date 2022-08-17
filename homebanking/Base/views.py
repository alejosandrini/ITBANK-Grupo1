from urllib import request
from urllib.request import Request
from django.shortcuts import render
from django.contrib.auth.decorators import login_required

# Create your views here.
def index(request):
    return render(request, "Base/index.html")

@login_required
def bank(request):
    print(request.user)
    return render(request, "Base/bank.html")
@login_required
def cotizacion(request):
    print(request.user)
    return render(request, "Base/cotizacion.html")