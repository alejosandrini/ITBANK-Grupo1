from rest_framework import status
from rest_framework.mixins import UpdateModelMixin
from rest_framework.exceptions import PermissionDenied
from rest_framework.permissions import *
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.viewsets import ModelViewSet, ReadOnlyModelViewSet, GenericViewSet

from Clientes.models import Cliente, Sucursal, Direcciones
from Clientes.serializers import CustomerSerializer, BranchSerializer, AddressSerializer
from Cuentas.models import Cuenta
from Cuentas.serializers import AccountSerializer
from Prestamos.models import Prestamo
from Prestamos.serializers import LoanSerializer
from Tarjetas.models import Tarjetas
from Tarjetas.serializers import CardSerializer


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
    queryset = Cuenta.objects.all()
    serializer_class = AccountSerializer
    permission_classes = [IsAuthenticated]

    def retrieve(self, request, *args, **kwargs):
        customer = Cliente.objects.filter(usuario_id=request.user.id).get()
        instance = self.queryset.filter(customer_id=customer.customer_id)[int(kwargs.get("pk", None))]
        serializer = self.get_serializer(instance)
        return Response(serializer.data, status.HTTP_200_OK)

    def list(self, request, *args, **kwargs):
        customer = Cliente.objects.filter(usuario_id=request.user.id).get()
        instance = self.queryset.filter(customer_id=customer.customer_id)
        serializer = self.get_serializer(instance, many=True)
        return Response(serializer.data, status.HTTP_200_OK)


class LoanAPI(ModelViewSet):
    queryset = Prestamo.objects.all()
    serializer_class = LoanSerializer
    permission_classes = [IsAuthenticated]

    def retrieve(self, request, *args, **kwargs):
        customer = Cliente.objects.filter(usuario_id=request.user.id).get()
        instance = self.queryset.filter(customer_id=customer.customer_id)[int(kwargs.get("pk", None))]
        serializer = self.get_serializer(instance)

        return Response(serializer.data, status.HTTP_200_OK)

    def list(self, request, *args, **kwargs):
        if request.user.is_staff:
            instance = []
            for customer_id in Cliente.objects.filter(branch_id=request.GET['branch_id']).values_list('customer_id',
                                                                                                      flat=True):
                for loan in Prestamo.objects.filter(customer_id=customer_id):
                    instance.append(loan)

            serializer = self.get_serializer(instance, many=True)
            return Response(serializer.data, status.HTTP_200_OK)
        else:
            raise PermissionDenied()

    def create(self, request, *args, **kwargs):
        if request.user.is_staff:
            customer = Cliente.objects.filter(customer_id=request.data['customer_id']).get()
            super().create(request, *args, **kwargs)
            account = Cuenta.objects.filter(customer_id=customer.customer_id).first()
            account.balance = account.balance + request.data['loan_total']
            account.save()
            return Response({'message': 'El prestamo fue anulado correctamente de la cuenta ' + str(account.account_id)}, status.HTTP_200_OK)
        else:
            raise PermissionDenied()

    def destroy(self, request, *args, **kwargs):
        if request.user.is_staff:
            instance = self.get_object()
            serializer = self.get_serializer(instance)
            super().destroy(request, *args, **kwargs)
            cuenta = Cuenta.objects.filter(customer_id=serializer.data['customer_id']).first()
            cuenta.balance = cuenta.balance - serializer.data['loan_total']
            cuenta.save()
            return Response({'message': 'El prestamo fue anulado correctamente de la cuenta ' + str(cuenta.account_id)},
                            status.HTTP_202_ACCEPTED)
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
                return Response({'message': "No se encontró un cliente con ese id"}, status.HTTP_204_NO_CONTENT)
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


class AddressAPI(GenericViewSet, UpdateModelMixin):
    queryset = Direcciones.objects.all()
    serializer_class = AddressSerializer
    permission_classes = [IsAuthenticated]

    def update(self, request, *args, **kwargs):
        instance = self.get_object()
        instance.name = request.data.get("name")
        instance.save()

        serializer = self.get_serializer(instance, data=request.data)
        if serializer.is_valid():
            self.perform_update(serializer)
            print(serializer.validated_data)
        return Response(serializer.data, status.HTTP_200_OK)


class BranchAPI(ReadOnlyModelViewSet):
    queryset = Sucursal.objects.all()
    serializer_class = BranchSerializer
