from django.urls import path
from . import views

urlpatterns = [
    path('prueba/', views.prueba, name='prueba'),
    path('about/', views.about, name='about'),
    path('contact/', views.contact, name='contact'),
    path('typography/', views.typography, name='typography')
]

