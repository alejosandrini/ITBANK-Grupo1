from django.shortcuts import render

# Create your views here.
def index(request):
    return render(request, "Base/index.html")
def bank(request):
    return render(request, "Base/bank.html")
def cotizacion(request):
    return render(request, "Base/cotizacion.html")