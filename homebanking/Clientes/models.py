from django.db import models


# Create your models here.
class Cliente(models.Model):
    customer_id = models.AutoField(primary_key=True)
    customer_name = models.TextField()
    customer_surname = models.TextField()  # This field type is a guess.
    customer_dni = models.TextField(db_column='customer_DNI', unique=True)  # Field name made lowercase.
    dob = models.TextField(blank=True, null=True)
    branch_id = models.IntegerField()
    id_tipo_cliente = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'cliente'


class TiposCliente(models.Model):
    id_tipo_cliente = models.AutoField(primary_key=True)
    tipo = models.TextField()
    max_chequeras = models.IntegerField()
    max_tarjetas_credito = models.IntegerField()
    max_tarjetas_debito = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'tipos_cliente'


class RestriccionesTipoCliente(models.Model):
    id_tipo_cliente = models.IntegerField(unique=True)
    limite_extraccion_diario = models.DecimalField(max_digits=10,
                                                   decimal_places=5)  # max_digits and decimal_places have been guessed, as this database handles decimal fields as float
    limite_transferencia_recibida = models.DecimalField(max_digits=10, decimal_places=5, blank=True,
                                                        null=True)  # max_digits and decimal_places have been guessed, as this database handles decimal fields as float
    monto = models.DecimalField(max_digits=10,
                                decimal_places=5)  # max_digits and decimal_places have been guessed, as this database handles decimal fields as float
    costo_transferencias = models.DecimalField(max_digits=10,
                                               decimal_places=5)  # max_digits and decimal_places have been guessed, as this database handles decimal fields as float
    saldo_descubierto_disponible = models.DecimalField(max_digits=10,
                                                       decimal_places=5)  # max_digits and decimal_places have been guessed, as this database handles decimal fields as float

    class Meta:
        managed = False
        db_table = 'restricciones_tipo_cliente'


class Direcciones(models.Model):
    id_direccion = models.AutoField(primary_key=True)
    calle = models.TextField()
    numero = models.IntegerField()
    ciudad = models.TextField()
    provincia = models.TextField()
    pais = models.TextField()
    id_cliente = models.IntegerField(blank=True, null=True)
    id_empleado = models.IntegerField(blank=True, null=True)
    id_sucursal = models.IntegerField(unique=True, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'direcciones'


class Empleado(models.Model):
    employee_id = models.AutoField(primary_key=True)
    employee_name = models.TextField()
    employee_surname = models.TextField()
    employee_hire_date = models.TextField()
    employee_dni = models.TextField(db_column='employee_DNI')  # Field name made lowercase.
    branch_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'empleado'


class Sucursal(models.Model):
    branch_id = models.AutoField(primary_key=True)
    branch_number = models.BinaryField()
    branch_name = models.TextField()
    branch_address_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'sucursal'


class TipoCombinacion(models.Model):
    texto = models.TextField()
    cantidad = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'tipo_combinacion'
