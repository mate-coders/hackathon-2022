import json
try:
    with open('consulta_places.json', 'r') as archivo:
        content = archivo.read()
        data = json.loads(content)
        for result in data['results']:
            print(result['name'])
    
        
except Exception as e:
    print(e)
