from rest_framework import serializers
from Prestamos.models import Prestamo


class LoanSerializer(serializers.ModelSerializer):
    class Meta:
        model = Prestamo
        fields = ['loan_id',
            'loan_type',
            'loan_date',
            'loan_total',
            'customer_id'
        ]