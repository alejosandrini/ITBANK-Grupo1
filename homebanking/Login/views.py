from django.contrib.auth import logout
from django.shortcuts import render, redirect
from django.views import View


class LoginView(View):
    def get(self, request, *args, **kwargs):
        if request.user.is_authenticated:
            return redirect('index')
        else:
            context = {}
            return render(request, 'Login/signup.html', context=context)


class LogoutView(View):
    def get(self, request, *args, **kwargs):
        logout(request)
        return redirect('index')
