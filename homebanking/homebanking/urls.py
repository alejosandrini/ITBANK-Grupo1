from django.contrib import admin
from django.urls import path, include

from Clientes.views import CustomerView, CustomerAPI
from Cuentas.views import AccountView, AccountAPI
from Login.views import LoginView, LogoutView
from Prestamos.views import LoanView, LoanAPI
from Tarjetas.views import CardAPI
from API.views import AddressAPI, BranchAPI

urlpatterns = [
    # ADMIN
    path('admin/', admin.site.urls),
    # UI
    path('', CustomerView.as_view(), name="index"),
    path('signup/', LoginView.as_view(), name="signup"),
    path('logout/', LogoutView.as_view(), name="logout"),
    path('account/', AccountView.as_view(), name="account"),
    path('loan/', LoanView.as_view(), name="loan"),
    # API
    path('api/',include('API.urls')),
    # AUTH
    path('accounts/', include("django.contrib.auth.urls")),
]
