from django.db import models

# Create your models here.
class Cuenta(models.Model):
    account_id = models.AutoField(primary_key=True)
    customer_id = models.IntegerField()
    balance = models.IntegerField()
    iban = models.TextField()
    id_tipo_cuenta = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'cuenta'

class TiposCuenta(models.Model):
    id_tipo_cuenta = models.AutoField(primary_key=True)
    tipo = models.TextField()

    class Meta:
        managed = False
        db_table = 'tipos_cuenta'

class AuditoriaCuenta(models.Model):
    old_id = models.IntegerField()
    new_id = models.IntegerField()
    old_balance = models.IntegerField()
    new_balance = models.IntegerField()
    old_iban = models.TextField()
    new_iban = models.TextField()
    old_type = models.IntegerField()
    new_type = models.IntegerField()
    user_action = models.TextField()
    created_at = models.DateField()

    class Meta:
        managed = False
        db_table = 'auditoria_cuenta'

class Movimientos(models.Model):
    id_movimiento = models.AutoField(primary_key=True)
    id_cuenta = models.IntegerField()
    monto = models.IntegerField()
    tipo_operacion = models.TextField()
    hora = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'movimientos'