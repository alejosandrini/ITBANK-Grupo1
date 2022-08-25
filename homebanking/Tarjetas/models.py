from django.db import models


# Create your models here.
class Tarjetas(models.Model):
    id_tarjeta = models.AutoField(primary_key=True)
    id_marca_tarjeta = models.IntegerField()
    customer_id = models.IntegerField()
    numero = models.IntegerField(unique=True)
    cvv = models.IntegerField(db_column='CVV')  # Field name made lowercase.
    fecha_otorgamiento = models.TextField()
    fecha_expiracion = models.TextField()
    tipo_tarjeta = models.ForeignKey('TipoTarjeta', models.DO_NOTHING, db_column='tipo_tarjeta')

    class Meta:
        managed = False
        db_table = 'tarjetas'


class MarcasTarjeta(models.Model):
    id_marca_tarjeta = models.AutoField(primary_key=True)
    marca = models.TextField()

    class Meta:
        managed = False
        db_table = 'marcas_tarjeta'


class TipoTarjeta(models.Model):
    id_tipo_tarjeta = models.AutoField(primary_key=True)
    tipo = models.TextField()

    class Meta:
        managed = False
        db_table = 'tipo_tarjeta'
