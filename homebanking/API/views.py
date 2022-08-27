from rest_framework.views import APIView
from rest_framework.viewsets import ModelViewSet, ReadOnlyModelViewSet
from rest_framework import permissions
from rest_framework.pagination import PageNumberPagination
from Clientes.models import Sucursal
from Clientes.serializers import BranchSerializer


class CustomerAPI(APIView):
    pass


class AccountAPI(APIView):
    pass


class LoanAPI(APIView):
    pass


class CardAPI(APIView):
    pass


class AddressAPI(APIView):
    pass


class BranchAPI(ReadOnlyModelViewSet):
    queryset = Sucursal.objects.all()
    # pagination_class = PageNumberPagination al pedir todas dejamos comentado
    serializer_class = BranchSerializer

