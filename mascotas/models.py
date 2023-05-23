from django.db import models


class Persona(models.Model):
    nombre = models.CharField(max_length=100)
    apellidos = models.CharField(max_length=100)
    edad = models.IntegerField()
    telefono = models.CharField(max_length=12)
    correo = models.EmailField()
    direccion = models.CharField(max_length=100)

    def __str__(self):
        return '{} {}'.format(self.nombre, self.apellidos)


class Vacuna(models.Model):
    nombre = models.CharField(max_length=100)

    def __str__(self):
        return '{}'.format(self.nombre)


class Mascota(models.Model):
    id = models.AutoField(primary_key=True)
    nombre = models.CharField(
        max_length=100, verbose_name='Nombres', null=True)
    edad = models.IntegerField(verbose_name='Edad', null=True)
    foto = models.ImageField(upload_to='imagenes/',
                             verbose_name='Foto', null=True)
    persona = models.ForeignKey(
        Persona, null=True, blank=True, on_delete=models.CASCADE)
    vacuna = models.ManyToManyField(Vacuna, blank=True)

    def __str__(self):
        return '{}'.format(self.nombre)

    def delete(self, using=None, keep_parents=False):
        self.foto.storage.delete(self.foto.name)
        super().delete()
