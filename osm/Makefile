osm_exits.json:
	curl -X POST http://overpass-api.de/api/interpreter -d @osm_exits.overpass > $@

osm_exits.geojson: osm_exits.json
	python osm_exits.py

clean:
	rm osm_exits.json
	rm osm_exits.geojson
