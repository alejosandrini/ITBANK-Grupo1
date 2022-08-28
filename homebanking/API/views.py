from datetime import datetime

from rest_framework import status
from rest_framework.exceptions import PermissionDenied
from rest_framework.permissions import *
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.viewsets import ModelViewSet, ReadOnlyModelViewSet

from Clientes.models import Cliente, Sucursal
from Clientes.serializers import CustomerSerializer, BranchSerializer
from Prestamos.models import Prestamo
from Prestamos.serializers import LoanSerializer
from Tarjetas.models import Tarjetas
from Tarjetas.serializers import CardSerializer

from django.http import JsonResponse


class CustomerAPI(ReadOnlyModelViewSet):
    queryset = Cliente.objects.all()
    serializer_class = CustomerSerializer
    permission_classes = [IsAuthenticated]

    def retrieve(self, request, *args, **kwargs):
        instance = self.queryset.filter(usuario_id=request.user.id).get()
        serializer = self.get_serializer(instance)
        return Response(serializer.data, status.HTTP_200_OK)

    def list(self, request, *args, **kwargs):
        if request.user.is_staff:
            return super().list(request, *args, **kwargs)
        else:
            return self.retrieve(request, *args, **kwargs)


class AccountAPI(ModelViewSet):
    queryset = Cliente.objects.all()
    serializer_class = CustomerSerializer
    permission_classes = [IsAuthenticated]


class LoanAPI(ModelViewSet):
    queryset = Prestamo.objects.all()
    serializer_class = LoanSerializer
    permission_classes = [IsAuthenticated]

    def create(self, request, *args, **kwargs):
        print(request)
        print(kwargs)
        print(args)
        if request.user.is_staff:
            return Response(None, status.HTTP_200_OK)
        else:
            raise PermissionDenied()

    def destroy(self, request, *args, **kwargs):
        if request.user.is_staff:

            print("Tamo activo")
            return Response(None, status.HTTP_200_OK)
        else:
            raise PermissionDenied()


class CardAPI(ReadOnlyModelViewSet):
    queryset = Tarjetas.objects.all()
    serializer_class = CardSerializer

    def retrieve(self, request, *args, **kwargs):
        if request.user.is_staff:
            queryset = self.queryset
            pk = kwargs.get("pk", None)
            instance = queryset.filter(customer_id=pk)
            if not instance:
                return Response({'message':"No se encontró un cliente con ese id"}, status.HTTP_204_NO_CONTENT)
            else:
                serializer = self.get_serializer(instance, many=True)
                return Response(serializer.data)
        else:
            raise PermissionDenied()

    def get_permissions(self):
        if self.action == 'list':
            permission_classes = [IsAdminUser]
        else:
            permission_classes = [IsAuthenticated]
        return [permission() for permission in permission_classes]


class AddressAPI(APIView):
    pass


class BranchAPI(ReadOnlyModelViewSet):
    queryset = Sucursal.objects.all()
    serializer_class = BranchSerializer
