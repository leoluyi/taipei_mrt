
all: routes.geojson stations.geojson exits.geojson

routes.geojson:
	ogr2ogr -f GeoJSON -t_srs EPSG:4326 $@ data/TpeMRTRoutes_TWD97.shp

stations.geojson:
	ogr2ogr -f GeoJSON -t_srs EPSG:4326 $@ data/TpeMRTStations_TWD97.shp

exits.geojson: exits.csv
	ogr2ogr -s_srs data/TpeMRTRoutes_TWD97.prj -t_srs EPSG:4326 -f "GeoJSON" $@ exits.vrt

exits.csv:
	#echo "id,name,exitno,lon,lat" > $@
	iconv -f BIG5 -t utf-8 data/大臺北地區捷運車站出入口.csv | tail -n +2 >> $@

clean:
	rm -f routes.geojson
	rm -f stations.geojson
	rm -f exits.geojson
