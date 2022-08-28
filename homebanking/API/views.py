from rest_framework.views import APIView
from rest_framework.viewsets import ModelViewSet, ReadOnlyModelViewSet
from rest_framework import status, permissions
from rest_framework.pagination import PageNumberPagination
from rest_framework.response import Response

from Clientes.models import Sucursal
from Clientes.serializers import BranchSerializer
from Tarjetas.models import Tarjetas
from Tarjetas.serializers import CardSerializer

from django.http import JsonResponse

class CustomerAPI(APIView):
    pass


class AccountAPI(APIView):
    pass


class LoanAPI(APIView):
    pass


class CardAPI(ReadOnlyModelViewSet):
    queryset = Tarjetas.objects.all()
    serializer_class = CardSerializer
    def retrieve(self, request, *args, **kwargs):
        queryset = self.queryset
        pk = kwargs.get("pk", None)
        instance = queryset.filter(customer_id=pk)
        if not instance:
            return Response("No se encontró un cliente con ese id", status.HTTP_404_NOT_FOUND)
        else:
            serializer = self.get_serializer(instance, many=True)
            return Response(serializer.data)
            
        
    


class AddressAPI(APIView):
    pass


class BranchAPI(ReadOnlyModelViewSet):
    queryset = Sucursal.objects.all()
    # pagination_class = PageNumberPagination al pedir todas dejamos comentado
    serializer_class = BranchSerializer

