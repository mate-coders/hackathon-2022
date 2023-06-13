import json
try:
    with open('google_places/consulta_places.json', 'r') as archivo:
        content = archivo.read()
        data = json.loads(content)
        for result in data['results']:
            print(result['name'])
            print(result['geometry']['location'])
    
        
except Exception as e:
    print(e)
