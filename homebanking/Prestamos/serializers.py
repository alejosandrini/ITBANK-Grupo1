from rest_framework import serializers
from Prestamos.models import Prestamo


class LoanSerializer(serializers.ModelSerializer):
    class Meta:
        model = Prestamo
        fields = "__all__"
