from django.urls import path

from Clientes.views import CustomerAPI
from Cuentas.views import AccountAPI
from Prestamos.views import LoanAPI
from Tarjetas.views import CardAPI
from API.views import AddressAPI, BranchAPI
from rest_framework import routers

router = routers.SimpleRouter()
router.register('customer', CustomerAPI)
router.register('account', AccountAPI)
router.register('loan', LoanAPI)
router.register('card', CardAPI)
router.register('address', AddressAPI)
router.register('branch', BranchAPI)

urlpatterns = router.urls
