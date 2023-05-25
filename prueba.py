import googlemaps
api = 'AIzaSyAl7kuTXJAepiuX25-GR4H2b9vplv_HT9c'

gmaps = googlemaps.Client(key=api)

origen = (-39.94803, -71.06893)
destino = (-39.95470, -71.07796)
for i in range(10):
    resultados = gmaps.distance_matrix(origen, destino, mode='driving')
    distancia = resultados['rows'][0]['elements'][0]['distance']['value'] / 1000
    print(distancia)

