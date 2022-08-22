from django.shortcuts import render, redirect
from django.views import View


class PrestamosView(View):
    def get(self, request, *args, **kwargs):
        return redirect('index')
