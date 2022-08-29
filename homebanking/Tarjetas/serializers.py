from rest_framework import serializers
from Tarjetas.models import Tarjetas


class CardSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tarjetas
        fields = "__all__"
