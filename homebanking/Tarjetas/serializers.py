from rest_framework import serializers
from Tarjetas.models import Tarjetas


class CardSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tarjetas
        # fields = [
        #     'id_tarjeta',
        #     # 'marca_tarjeta_id',
        #     'customer_id',
        #     'numero',
        #     'cvv',
        #     'fecha_otorgamiento',
        #     'fecha_expiracion',
        #     'tipo_tarjeta'
        # ]
        fields = "__all__"