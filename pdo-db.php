<?php // Connection à la base de données
require_once 'dbconfig.inc.php';

try {
		$dbconn=new PDO("pgsql:host=$host;port=5432;dbname=$db;user=$username;password=$password") or die('Connexion impossible');
		$dbconn->exec("SET CHARACTER SET utf8");
		$dbconn->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
// S'il existe un problème de connection, on obtient le message d'erreur
} catch(PDOException $erreur) {
		$erreur->getMessage(); // Supprimer en production
		echo $erreur;
}
if($dbconn){
	// Exécution de la requête SQL
	$sql="SELECT json_build_object(
		'type', 'FeatureCollection',
		'crs',  json_build_object('type','name','properties', json_build_object('name', 'EPSG:4326')),
		'features', json_agg( json_build_object(
				'type','Feature','id', id, 'geometry',   ST_AsGeoJSON(wkb_geometry)::json,
				'properties', json_build_object(
					'name', name
				)
			)
		)
	) AS objet_geosjon FROM SIG;";
	$req=$dbconn->prepare($sql);
	$req->execute(); 
	$data=$req->fetch();
	if($data){
		$objet_geosjon=$data['objet_geosjon'];
		// Ouverture du fichier en écriture
		$fichier = fopen("geojson/pays.geojson", "w") or die("Problème d\'ouverture de fichier");
		// Ecriture du résultat de la requête
		if(fwrite($fichier, $objet_geosjon)){
			echo "Le fichier GeoJSON a été construit correctement!";
		}else{
			echo "Un problème s\'est déroulé lors de l\'écriture du fichier.";
		}
		// Fermeture du fichier
		fclose($fichier);
	}else{
		echo "Un problème s\'est déroulé lors du chargement de la donnée.";
	}
}
?>