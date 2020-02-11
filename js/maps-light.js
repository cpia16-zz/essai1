// leafletmap //

var map = L.map('map',{
    center: [46.759, 2.362],
    zoom: 7,
    minZoom: 5,
    maxZoom: 18
});

    map.dragging.enable();
    map.touchZoom.enable();
    map.doubleClickZoom.enable();
    map.scrollWheelZoom.enable();
    
L.tileLayer('http://{s}.tiles.wmflabs.org/bw-mapnik/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
}).addTo(map);

// Echelle
L.control.scale().addTo(map);
