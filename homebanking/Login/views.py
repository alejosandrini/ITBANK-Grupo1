from django.shortcuts import render
from django.views import View


class LoginView(View):
    def get(self, request, *args, **kwargs):
        context={}
        return render(request, 'Login/signup.html', context=context)
