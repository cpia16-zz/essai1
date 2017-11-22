<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>LeftLet Tuto</title>
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.2.0/dist/leaflet.css"
      integrity="sha512-M2wvCLH6DSRazYeZRIm1JnYyh22purTM+FDB5CsyxtQJYeKq83arPe5wgbNmcFXGqiSH2XR8dT/fJISVA1r/zQ=="
      crossorigin=""/>
    <script src="https://unpkg.com/leaflet@1.2.0/dist/leaflet.js"
      integrity="sha512-lInM/apFSqyy1o6s89K4iQUKg6ppXEgsVxT35HbzUupEVRh2Eu9Wdl4tHj7dZO0s1uvplcYGmt3498TtHq+log=="
      crossorigin=""></script>
    <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
    <style>
    html, body { margin:50px 0; padding:0; }
    #map {
		      height: 800px; width:100%; margin:0 auto;
		      -webkit-box-shadow: 0 2px 3px 3px rgba(0,0,0,0.2);
		      box-shadow: 0 2px 3px 3px rgba(0,0,0,0.2);
		      -webkit-border-radius: 5px;
		      border-radius: 5px;
	       }
</style>
</head>

<body>
	<div id="map"></div>
    <script type="text/javascript">
		var map = L.map('map', { zoomControl:true }).setView([45.776791, 3.082163], 13);
		map.dragging.enable();
		map.touchZoom.enable();
		map.doubleClickZoom.enable();
		map.scrollWheelZoom.enable();

		L.tileLayer('http://{s}.tiles.wmflabs.org/bw-mapnik/{z}/{x}/{y}.png', {
	     maxZoom: 20,
	     attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
		}).addTo(map);
    // Echelle
    L.control.scale().addTo(map);
    //layer
		/*var marker = L.marker([48.804128, 7.776792]).addTo(map).bindPopup("<b>LIJE Creative</b>");*/
    $.getJSON("clermont.geojson", function(Clermont){
      L.geoJson( Clermont ).addTo(map);
    });
    //Contrôles pour les layers contenant les données.
    L.control.layers().addTo(map);
	</script>
</body>
</html>
