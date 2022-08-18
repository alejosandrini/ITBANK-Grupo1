from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from django.views import View


class HomeBankingView(View):
    @login_required
    def get(self, request, *args, **kwargs):
        context = {}
        return render(request, "Cuentas/bank.html", context=context)
