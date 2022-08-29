from rest_framework import serializers
from Cuentas.models import Cuenta


class AccountSerializer(serializers.ModelSerializer):
    tipo_cuenta = serializers.ReadOnlyField(source='id_tipo_cuenta.tipo')

    class Meta:
        model = Cuenta
        fields = [
            'tipo_cuenta',
            'balance'
        ]
