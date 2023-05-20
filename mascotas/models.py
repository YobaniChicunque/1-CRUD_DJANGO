from django.db import models

# Create your models here.


class Mascota(models.Model):
    id = models.AutoField(primary_key=True)
    nombre = models.CharField(
        max_length=100, verbose_name='Nombres', null=True)
    edad = models.IntegerField(verbose_name='Edad', null=True)
    foto = models.ImageField(upload_to='imagenes/',
                             verbose_name='Foto', null=True)
    vacuna = models.CharField(max_length=100, verbose_name='vacuna', null=True)

    def __str__(self):
        fila = "Nombre: " + self.nombre
        return fila

    def delete(self, using=None, keep_parents=False):
        self.foto.storage.delete(self.foto.name)
        super().delete()
