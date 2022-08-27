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
    # pagination_class = PageNumberPagination al pedir todas dejamos comentado
    serializer_class = CardSerializer
    # def retrieve(self, request, pk):
    #     # do your customization here
    #     instance = self.queryset.filter(customer_id=pk)
    #     serializer = self.get_serializer(instance)
    #     return Response(serializer.data, status.HTTP_200_OK)
    def retrieve(self, request, *args, **kwargs):
        queryset = self.queryset
        pk = self.kwargs["pk"]
        print(pk)
        print(queryset)
        instance = queryset.filter(customer_id=pk)
        print(instance)
        # serializer = self.get_serializer(instance)
        return JsonResponse(list(instance.values()), safe=False)
        # return Response(serializer.data, status.HTTP_200_OK)


class AddressAPI(APIView):
    pass


class BranchAPI(ReadOnlyModelViewSet):
    queryset = Sucursal.objects.all()
    # pagination_class = PageNumberPagination al pedir todas dejamos comentado
    serializer_class = BranchSerializer

