import json

features = []

for e in json.loads(open('osm_exits.json').read())['elements']:
  features.append({'type':'Feature','id':e['id'],'geometry':{'type':'Point','coordinates':[e['lon'],e['lat']]}})

with open('osm_exits.geojson','w') as output:
  output.write(json.dumps({'type':'FeatureCollection','features':features}))
