"""homebanking URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from Clientes.views import ClientesView, CotizacionView
from Cuentas.views import HomeBankingView
from Login.views import LoginView

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', ClientesView.as_view(), name="index"),
    path('signup/', LoginView.as_view(), name="signup"),
    path('bank/', HomeBankingView.as_view(), name="bank"),
    path('cotizacion/', CotizacionView.as_view(), name="cotizacion"),
    path('accounts/', include("django.contrib.auth.urls")),
]
