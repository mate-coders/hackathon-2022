import requests
import json

api = 'AIzaSyAl7kuTXJAepiuX25-GR4H2b9vplv_HT9c'

url = 'https://maps.googleapis.com/maps/api/place/textsearch/json?query=lugares+turisticos+en+san+rafael+mendoza&key=' + api
try:
    response = requests.get(url)

    response.raise_for_status()  # Comprobamos si hay errores en la respuesta

    data = response.json()
    try:
        with open('consulta_places.json', 'w') as archivo:
            json.dump(data, archivo, indent=4)
        print('Guardado con éxito!')
    except IOError as e:
        print(f'Error al guardar: {e}')

except requests.exceptions.RequestException as e:
    print(f'Error al realizar la solicitud: {e}')

"""
# Esta función nos las dio chatGPT para nutrir la base de datos con información de lugares turisticos
class Command(BaseCommand):
    help = 'Obtiene lugares turísticos en San Rafael, Mendoza utilizando la API Place Search de Google Maps y los almacena en una base de datos'

    def handle(self, *args, **options):
        self.stdout.write('Iniciando búsqueda de lugares turísticos...')
        key = 'TU_CLAVE_DE_API_DE_GOOGLE_MAPS'
        url = 'https://maps.googleapis.com/maps/api/place/textsearch/json?query=lugares+turisticos+en+san+rafael+mendoza&key=' + key
        response = requests.get(url)
        data = json.loads(response.text)
        for result in data['results']:
            place = Place(name=result['name'], address=result['formatted_address'], latitude=result['geometry']['location']['lat'], longitude=result['geometry']['location']['lng'])
            place.save()
            self.stdout.write('Lugar turístico guardado: ' + place.name)
        self.stdout.write('Búsqueda de lugares turísticos finalizada')
"""