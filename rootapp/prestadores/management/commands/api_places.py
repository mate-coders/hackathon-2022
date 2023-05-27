from django.core.management.base import BaseCommand, CommandParser
import requests, json
from ...models import Place, Type
from datetime import datetime


# Esta función nos las dio chatGPT para nutrir la base de datos con información de lugares turísticos
class Command(BaseCommand):
    help = 'Obtiene lugares turísticos en San Rafael, Mendoza utilizando la API Place Search de Google Maps y los almacena en una base de datos'

    def add_arguments(self, parser):
        parser.add_argument('busqueda', type=str, help='Podes buscar lo que quieras')

    def handle(self, *args, **options):
        self.stdout.write('Iniciando búsqueda de lugares turísticos...')
        
        key = 'AIzaSyAl7kuTXJAepiuX25-GR4H2b9vplv_HT9c'
        busqueda = options['busqueda']
        busqueda_formateada = busqueda.replace(' ', '+')
        url = 'https://maps.googleapis.com/maps/api/place/textsearch/json?query='+ busqueda_formateada +'&key=' + key
        response = requests.get(url)
        data = json.loads(response.text)
        
        for result in data['results']:
            
            ex = Place.objects.filter(reference=result['reference']).exists()
            if ex:                    
                continue
            
            place = Place(name=result['name'], address=result['formatted_address'], latitude=result['geometry']['location']['lat'], longitude=result['geometry']['location']['lng'], rating = result['rating'], users_rating = result['user_ratings_total'], reference = result['reference'])
            place.save()
            
            for tipo in result['types']:
                
                existe = Type.objects.filter(name=tipo).exists()
                if existe:
                    o_type = Type.objects.get(name=tipo)
                    place.type.add(o_type)
                    continue
                
                o_type = Type(name=tipo)
                o_type.save()
                place.type.add(o_type)

            
        
            self.stdout.write('Lugar turístico guardado: ' + place.name)
        try:
            fecha = datetime.now()
            fecha_fromateada = fecha.strftime("%d-%m-%Y %H-%M")
            with open(f'./querys/query_{busqueda}_{fecha_fromateada}.json', 'w') as archivo:
                json.dump(data, archivo, indent=4)
        except Exception as e:
            print(e)
        self.stdout.write('Búsqueda de lugares turísticos finalizada')
