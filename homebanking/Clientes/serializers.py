from rest_framework import serializers
from Clientes.models import Cliente, TiposCliente


class CustomerSerializer(serializers.ModelSerializer):
    tipo_cliente = serializers.ReadOnlyField(source='tipo_cliente_id.tipo')

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
