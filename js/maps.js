// leafletmap //
function initialize() {
		// création de la carte et paramétrage général : centre et niveau de zoom	
		var map = L.map('mapid').setView([45.7484600, 4.8467100], 12);
		
		// création des couches "osmLayer"
    	var osmLayerB = L.tileLayer('http://{s}.tiles.wmflabs.org/bw-mapnik/{z}/{x}/{y}.png', {
    		attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>',
    		maxZoom: 19
		});
		
		var osmLayer = L.tileLayer('http://{s}.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png', {
		attribution: '&copy; <a href=http://osm.org/copyright »>OpenStreetMap</a> contributors',
		maxZoom: 19
		});

		// layer google
		var googleLayer = L.tileLayer('http://{s}.google.com/vt/lyrs=s&x={x}&y={y}&z={z}',{
    	maxZoom: 20,
    	subdomains:['mt0','mt1','mt2','mt3']
		});

		//wms opendata_Grd-Lyon
		var Lyvia = L.layerGroup();
		var wmsLayer = L.tileLayer.wms('https://download.data.grandlyon.com/wms/grandlyon?', { 
		layers: 'pvo_patrimoine_voirie.pvochantierperturbant',
		format: 'image/png',
		opacity: 0.4
		}).addTo(Lyvia);
		
		//default
		map.addLayer(osmLayerB);
		
		// Échelle cartographique
		L.control.scale().addTo(map);
		
		//Search
		map.addControl( new L.Control.Search({
			url: 'http://nominatim.openstreetmap.org/search?format=json&q={s}',
			jsonpParam: 'json_callback',
			propertyName: 'display_name',
			propertyLoc: ['lat','lon'],
			marker: L.circleMarker([0,0],{radius:20}),
			autoCollapse: true,
			autoType: false,
			minLength: 2
		}) );
		

//---RMT---//
		var RMT = L.layerGroup();
		
		// création d'une couche geoJson RMT_iti
		var RMT_Iti = $.getJSON("./Json/RMT_ITI.geojson",function(data_RMT_Iti)
		{
			L.geoJson( data_RMT_Iti, 
			{
			style: function(feature)
			{	
		// paramétrage de la symbologie de la couche 
			return { color: "#046380", 
						weight: 3, 
						fillColor: '#4BB5C1', 
						fillOpacity: .5 
						};
			},
		 onEachFeature: function( feature, layer )
				{
				// paramétrage de la popup de la couche 	
				layer.bindPopup( '<b><u>Description </u></b><br>'
									+ "<b> Longueur Conduite </b>" + feature.properties.LONGUEUR_C+ '<br>'
									+ "<b> Type infra </b>" + feature.properties.TYPE_INFRA+ '<br>'
									+ "<b> Rue </b>" + feature.properties.RUE+ '<br>'				
									+ "<b> Commune </b>" + feature.properties.COMMUNE+ '<br>'
									+ "<b> Domaine </b>" + feature.properties.DOMANIALIT+ '<br>'				 
									)
				}	
		}).addTo(RMT);
		});
		
		// création d'une couche geoJson RMT_CH
		var RMT_ch = $.getJSON("./Json/RMT_CH.geojson",function(data_RMT_Ch)
		{
			L.geoJson( data_RMT_Ch,
			{
				onEachFeature: function (feature, layer) 
				{
            	layer.bindPopup("<b><u>Description </u></b><br>"
										+ "<b> Identifiant RMT </b>" + feature.properties.NOM_CHAMBR+'<br>'
										+ "<b> Type </b>" + feature.properties.TYPE_FONCT+ '<br>'
										+ "<b> class </b>" + feature.properties.TYPE_STRUC+ '<br>'
										+ "<b> Rue </b>" + feature.properties.RUE+ '<br>'
										+ "<b> Commune </b>" + feature.properties.COMMUNE+ '<br>'
										+ "<b> Domaine </b>" + feature.properties.DOMANIALIT+ '<br>'
										);
            },
            
             pointToLayer: function (feature, latlng) 
             	{
                 return L.circleMarker(latlng, 
                 	{
                   // Stroke properties
                   color: '#5EA4D4',
                   opacity: 0.75,
                   weight: 3,

                    // Fill properties
                    fillColor: '#5EA4D4',
                    fillOpacity: 0.25,

                    radius: 2
                   });
                }
		}).addTo(RMT);
		});
		
//CBM
		var CBM = L.layerGroup();
		// création d'une couche geoJson CBM
		var CBM288 = $.getJSON("./Json/CBM288.geojson",function(data_CBM288)
		{
			L.geoJson( data_CBM288,
		{
			style: function(feature)
			{	
		// paramétrage de la symbologie de la couche 
			return { color: "#BFFF00", 
						weight: 3, 
						fillColor: '#BFFF00', 
						fillOpacity: .5 
						};
			},
		}).addTo(CBM);
		});
		var CBM144 = $.getJSON("./Json/CBM144.geojson",function(data_CBM144)
		{
			L.geoJson( data_CBM144,
		{
			style: function(feature)
			{	
		// paramétrage de la symbologie de la couche 
			return { color: "#BFFF00", 
						weight: 3, 
						fillColor: '#BFFF00', 
						fillOpacity: .5 
						};
			},
		}).addTo(CBM);
		});
		
// création d'un contrôle des couches pour modifier les couches de fond de plan	
		var baseLayers = {
			"OpenStreetMap Black": osmLayerB,
			"OpenStreetMap": osmLayer,
			"google": googleLayer
						
		};
		var overlayMaps = {
			"RMT": RMT,
			"CBM Etude": CBM,
			"Chantier Perturbant": Lyvia
		};
		L.control.layers(baseLayers,overlayMaps).addTo(map);
		


}