import googlemaps
api = 'AIzaSyAl7kuTXJAepiuX25-GR4H2b9vplv_HT9c'

gmaps = googlemaps.Client(key=api)

origen = (-39.94803, -71.06893)
destino = (-39.95470, -71.07796)
for i in range(10):
    resultados = gmaps.distance_matrix(origen, destino, mode='driving')
    distancia = resultados['rows'][0]['elements'][0]['distance']['value'] / 1000
    print(distancia)


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