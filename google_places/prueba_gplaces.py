import requests
import json

api = 'AIzaSyAl7kuTXJAepiuX25-GR4H2b9vplv_HT9c'

busqueda = 'lugares turisticos en valle grande mendoza'.replace(' ', '+')

url = 'https://maps.googleapis.com/maps/api/place/textsearch/json?query='+busqueda+'&key=' + api
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
