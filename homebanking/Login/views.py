from django.contrib.auth import logout, login, authenticate
from django.shortcuts import render, redirect
from django.views import View
from Clientes.models import Cliente


class LoginView(View):
    def get(self, request, *args, **kwargs):
        if request.user.is_authenticated:
            return redirect('index')
        else:
            context = request.GET.dict()
            return render(request, 'Login/signup.html', context=context)

    def post(self, request):
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password) 
        if user is not None: 
            login(request, user)
            cliente= Cliente.objects.get(id_usuario=user.id)    
            return render(request, 'Cuentas/bank.html', {"cliente":cliente})       
        else:
            return redirect("signup")



class LogoutView(View):
    def get(self, request, *args, **kwargs):
        logout(request)
        return redirect('index')

