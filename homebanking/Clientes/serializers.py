from rest_framework.serializers import ModelSerializer, ReadOnlyField
from Clientes.models import Cliente, Sucursal, Direcciones


class CustomerSerializer(ModelSerializer):
    tipo_cliente = ReadOnlyField(source='tipo_cliente_id.tipo')

    class Meta:
        model = Cliente
        fields = [
            'customer_id',
            'customer_name',
            'customer_surname',
            'customer_dni',
            'dob',
            'branch_id',
            'usuario_id',
            'tipo_cliente'
        ]


class BranchSerializer(ModelSerializer):
    class Meta:
        model = Sucursal
        fields = [
            'branch_id',
            'branch_number',
            'branch_name',
            'branch_address_id'
        ]


class AddressSerializer(ModelSerializer):
    class Meta:
        model = Direcciones
        fields = [
            'id_direccion',
            'calle',
            'numero',
            'ciudad',
            'provincia',
            'pais',
            'id_cliente',
            'id_empleado',
            'id_sucursal'
        ]
