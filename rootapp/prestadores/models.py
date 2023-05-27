from django.db import models

class Type(models.Model):
    name = models.CharField(max_length=20)

class Place(models.Model):
    name = models.CharField(max_length=50)
    address = models.CharField(max_length=80)
    latitude = models.FloatField()
    longitude = models.FloatField()
    rating = models.FloatField()
    users_rating = models.IntegerField()
    reference = models.CharField(max_length=50)
    type = models.ManyToManyField(Type)

"""
class Prestadores(models.Model):
    nombre = models.CharField(max_length=50)
    email = models.EmailField(max_length=254)
    lat = models.FloatField()
    lon = models.FloatField()
    descripcion = models.CharField(max_length=50)

    def __str__(self):
        return self.nombre


class Hoteles(models.Model):
    nombre_hotel = models.CharField(max_length=50)
    habitaciones = models.IntegerField()
    precio_camapauno = models.FloatField()
    estrellas = models.IntegerField() 
    precio_camapado = models.FloatField()
    wifi = models.BooleanField()
    servicio_al_cuarto = models.BooleanField()
    nombre = models.ForeignKey(Prestadores, on_delete=models.CASCADE)
"""   