from django.contrib.auth import logout, login, authenticate
from django.contrib.auth.models import User
from django.shortcuts import render, redirect
from django.views import View
from django.contrib import messages


class LoginView(View):
    def get(self, request):
        if request.user.is_authenticated:
            return redirect('index')
        else:
            context = request.GET.dict()
            return render(request, 'Login/signup.html', context=context)

    def post(self, request):
        if request.POST['login'] is not None:
            user = authenticate(
                request,
                username=request.POST['username'],
                password=request.POST['password']
            )

            if user is not None:
                login(request, user)

                return redirect('bank')
            else:
                messages.warning(request, "La combinación campo-contraseña no es correcta. Intente nuevamente")
                return redirect("signup")
        elif request.POST['signup'] is not None:
            user = User.objects.create_user(
                username=request.POST['username'],
                password=request.POST['password'],
                email=request.POST['email']
            )
            user.first_name = request.POST['name']
            user.last_name = request.POST['surname']

            user.save()


class LogoutView(View):
    def get(self, request):
        logout(request)
        messages.info(request, "La sesión ha sido cerrada correctamente.")

        return redirect('index')
