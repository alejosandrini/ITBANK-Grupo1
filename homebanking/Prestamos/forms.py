from django import forms

class PrestamoForm(forms.Form):
    monto = forms.IntegerField(label="monto", required=True)
    tipo_prestamo = forms.CharField(label="tipo_prestamo", required=True)