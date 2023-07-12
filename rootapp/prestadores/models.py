from django.core.exceptions import ValidationError
from django.db import models

def validate_estrellas(value):
    if value % 0.5 != 0 or value < 1 or value > 5:
        raise ValidationError('El valor debe ser un múltiplo de 0.5 entre 0.5 y 5.')

class Type(models.Model):
    name = models.CharField(max_length=20)

class Country(models.Model):
    name = models.CharField(max_length=20)

class Region(models.Model):
    name = models.CharField(max_length=30)
    country = models.ForeignKey(Country, on_delete=models.CASCADE)

class City(models.Model):
    name = models.CharField(max_length=30)
    zipcode = models.CharField(max_length=5)
    region = models.ForeignKey(Region, on_delete=models.CASCADE)

class Place(models.Model):
    name = models.CharField(max_length=50)
    address = models.CharField(max_length=80)
    latitude = models.FloatField()
    longitude = models.FloatField()
    rating = models.FloatField()
    users_rating = models.IntegerField()
    reference = models.CharField(max_length=50)
    type = models.ManyToManyField(Type)
    city = models.ForeignKey(City, on_delete=models.CASCADE)
    description = models.TextField()


class Museos(Place):
    horario_apertura = models.TimeField()
    horario_cierre = models.TimeField()

class TipoAlojamiento(models.Model):
    name = models.CharField(max_length=15)

class Alojamiento(Place):
    precio_por_noche = models.FloatField()
    estrellas = models.FloatField(validators=[validate_estrellas])
    tipo = models.ManyToManyField(TipoAlojamiento)


class TiposActividad(models.Model):
    name = models.CharField(max_length=15)
    price = models.FloatField()
    descripcion = models.TextField()
    hora = models.IntegerField()
    disponibilidad = models.BooleanField()

    
class Actividad(models.Model):
    name = models.CharField(max_length=50)
    tipo = models.CharField(max_length=50)
    description = models.TextField()
    precio = models.FloatField()
    estacionalidad = models.CharField(max_length=80)
    place = models.ForeignKey(Place, on_delete=models.CASCADE)
    tipo = models.ManyToManyField(TiposActividad)

class Evento(models.Model):
    name = models.CharField(max_length=80)
    date = models.DateTimeField()
    description = models.TextField()
    precio = models.FloatField()
    place = models.ForeignKey(Place, on_delete=models.CASCADE)
