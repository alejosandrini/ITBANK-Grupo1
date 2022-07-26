from django.db import models


# Create your models here.
class Prestamo(models.Model):
    loan_id = models.AutoField(primary_key=True)
    loan_type = models.TextField()
    loan_date = models.TextField()
    loan_total = models.IntegerField()
    customer_id = models.ForeignKey('Clientes.Cliente',
                                    on_delete=models.DO_NOTHING, db_column='customer_id')

    class Meta:
        managed = False
        db_table = 'prestamo'
