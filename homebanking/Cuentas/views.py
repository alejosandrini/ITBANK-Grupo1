from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from django.utils.decorators import method_decorator
from django.views import View


class HomeBankingView(View):
    @method_decorator(login_required)
    def get(self, request, *args, **kwargs):
        context = request.GET.dict()
        return render(request, "Cuentas/bank.html", context=context)
