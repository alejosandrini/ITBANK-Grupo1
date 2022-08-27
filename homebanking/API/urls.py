from django.urls import path

from Clientes.views import CustomerAPI
from Cuentas.views import AccountAPI
from Prestamos.views import LoanAPI
from Tarjetas.views import CardAPI
from API.views import AddressAPI, BranchAPI, CardAPI
from rest_framework import routers

router = routers.SimpleRouter()
router.register('branch', BranchAPI)
router.register('card', CardAPI)
# router.register('card', CardAPI)

urlpatterns = router.urls
# urlpatterns += [
#     # API
#     path('customer/', CustomerAPI.as_view()),
#     path('account/', AccountAPI.as_view()),
#     path('loan/', LoanAPI.as_view()),
#     path('card/', CardAPI.as_view()),
#     path('address/', AddressAPI.as_view()),
#     # path('branch/', BranchAPI.as_view())
# ]