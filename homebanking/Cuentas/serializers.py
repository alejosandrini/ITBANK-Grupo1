from rest_framework import serializers
from Cuentas.models import Cuenta

class CuentaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cuenta
        # fields = "__all__"
        fields = ['balance']