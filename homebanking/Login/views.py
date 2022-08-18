from django.shortcuts import render, redirect
from django.views import View


class LoginView(View):
    def get(self, request, *args, **kwargs):
        if request.user.is_authenticated:
            return redirect('home')
        else:
            context = {}
            return render(request, 'Login/signup.html', context=context)
