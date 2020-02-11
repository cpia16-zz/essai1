<!DOCTYPE html>
<html>
    <head>
        <title>Carto à nous</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <!-- appelle la librairie javascript Leaflet et le fichier CSS Leaflet -->	
			<link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.3/dist/leaflet.css" 
			integrity="sha512-Rksm5RenBEKSKFjgI3a41vrjkw4EVPlJ3+OiI65vTjIdo9brlAacEuKOiQ5OFh7cOI1bkDwLqdLw3Zg0cRJAAQ==" 
			crossorigin="">
   		<script src="https://unpkg.com/leaflet@1.3.3/dist/leaflet.js" 
   		integrity="sha512-tAGcCfR4Sc5ZP5ZoVz0quoZDYX5aCtEm/eu1KhSLj2c9eFrylXZknQYmxUssFaVJKvvc0dJQixhGjG2yXWiV9Q==" 
   		crossorigin=""></script>	
   		<!-- lien vers mon fichier CSS -->
			<link rel="stylesheet" href="./css/style.css" />
			<link rel="stylesheet" href="./src/leaflet-search.css" />
			<!-- jQuery - indispensable pour utiliser les fichiers geojson -->
			<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
			<script src="./src/leaflet-search.js"></script>

    </head>
	<body onload="initialize()">
		<div class="MainBody">    
        <div class="header" >
            <h3>Carto à Nous</h3>
        </div>
        <div class="center">
            <div id="mapid"></div>
            <script src="./js/maps.js"></script>
        </div>
        <div class="right">
            <h2> </h2>
        </div>
        <div class="footer">
            <h3> </h3>
        </div>
		</div> 
    </body>
</html>
