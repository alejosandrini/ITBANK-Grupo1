from django.contrib.auth import logout, login, authenticate
from django.shortcuts import render, redirect
from django.views import View
from Clientes.models import Cliente
from django.contrib import messages

from Clientes.serializers import ClienteSerializer


class LoginView(View):
    def get(self, request, *args, **kwargs):
        if request.user.is_authenticated:
            return redirect('index')
        else:
            context = request.GET.dict()
            return render(request, 'registration/signup.html', context=context)

    def post(self, request):
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password) 
        if user is not None: 
            login(request, user)
            cliente= Cliente.objects.get(usuario_id=user.id)     
            request.session['cliente'] = ClienteSerializer(cliente).data
            print(ClienteSerializer(cliente).data)
            # return render(request, "Cuentas/bank.html", {"cliente":cliente})
            return redirect('bank')  
        else:
            messages.warning(request,"La combinación campo-contraseña no es correcta. Intente nuevamente")
            return redirect("signup")




class LogoutView(View):
    def get(self, request, *args, **kwargs):
        logout(request)
        messages.info(request,"La sesión ha sido cerrada correctamente.")
        return redirect('index') 

