from django.db import models
from django.contrib.gis.db import models as md


class Prestadores(models.Model):
    nombre = models.CharField(max_length=50)
    email = models.EmailField(max_length=254)
    ubicacion = md.PointField()
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
   