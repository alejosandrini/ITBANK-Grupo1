# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


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


class Cliente(models.Model):
    customer_id = models.AutoField()
    customer_name = models.TextField()
    customer_surname = models.TextField()  # This field type is a guess.
    customer_dni = models.TextField(db_column='customer_DNI', unique=True)  # Field name made lowercase.
    dob = models.TextField(blank=True, null=True)
    branch_id = models.IntegerField()
    id_tipo_cliente = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'cliente'


class Cuenta(models.Model):
    account_id = models.AutoField()
    customer_id = models.IntegerField()
    balance = models.IntegerField()
    iban = models.TextField()
    id_tipo_cuenta = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'cuenta'


class Direcciones(models.Model):
    id_direccion = models.AutoField(primary_key=True, blank=True, null=True)
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
    employee_id = models.AutoField()
    employee_name = models.TextField()
    employee_surname = models.TextField()
    employee_hire_date = models.TextField()
    employee_dni = models.TextField(db_column='employee_DNI')  # Field name made lowercase.
    branch_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'empleado'


class MarcasTarjeta(models.Model):
    id_marca_tarjeta = models.AutoField(primary_key=True, blank=True, null=True)
    marca = models.TextField()

    class Meta:
        managed = False
        db_table = 'marcas_tarjeta'


class Movimientos(models.Model):
    id_movimiento = models.AutoField(primary_key=True, blank=True, null=True)
    id_cuenta = models.IntegerField()
    monto = models.IntegerField()
    tipo_operacion = models.TextField()
    hora = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'movimientos'


class Prestamo(models.Model):
    loan_id = models.AutoField()
    loan_type = models.TextField()
    loan_date = models.TextField()
    loan_total = models.IntegerField()
    customer_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'prestamo'


class RestriccionesTipoCliente(models.Model):
    id_tipo_cliente = models.IntegerField(unique=True)
    limite_extraccion_diario = models.DecimalField(max_digits=10, decimal_places=5)  # max_digits and decimal_places have been guessed, as this database handles decimal fields as float
    limite_transferencia_recibida = models.DecimalField(max_digits=10, decimal_places=5, blank=True, null=True)  # max_digits and decimal_places have been guessed, as this database handles decimal fields as float
    monto = models.DecimalField(max_digits=10, decimal_places=5)  # max_digits and decimal_places have been guessed, as this database handles decimal fields as float
    costo_transferencias = models.DecimalField(max_digits=10, decimal_places=5)  # max_digits and decimal_places have been guessed, as this database handles decimal fields as float
    saldo_descubierto_disponible = models.DecimalField(max_digits=10, decimal_places=5)  # max_digits and decimal_places have been guessed, as this database handles decimal fields as float

    class Meta:
        managed = False
        db_table = 'restricciones_tipo_cliente'


class Sucursal(models.Model):
    branch_id = models.AutoField()
    branch_number = models.BinaryField()
    branch_name = models.TextField()
    branch_address_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'sucursal'


class Tarjetas(models.Model):
    id_tarjeta = models.AutoField(primary_key=True, blank=True, null=True)
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


class TipoCombinacion(models.Model):
    texto = models.TextField()
    cantidad = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'tipo_combinacion'


class TipoTarjeta(models.Model):
    id_tipo_tarjeta = models.AutoField(primary_key=True, blank=True, null=True)
    tipo = models.TextField()

    class Meta:
        managed = False
        db_table = 'tipo_tarjeta'


class TiposCliente(models.Model):
    id_tipo_cliente = models.AutoField(primary_key=True, blank=True, null=True)
    tipo = models.TextField()
    max_chequeras = models.IntegerField()
    max_tarjetas_credito = models.IntegerField()
    max_tarjetas_debito = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'tipos_cliente'


class TiposCuenta(models.Model):
    id_tipo_cuenta = models.AutoField(primary_key=True, blank=True, null=True)
    tipo = models.TextField()

    class Meta:
        managed = False
        db_table = 'tipos_cuenta'
