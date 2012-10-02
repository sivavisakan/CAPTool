<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type="text/css" rel="stylesheet" href="/stylesheets/bootstrap/css/bootstrap.css" />
<style type="text/css">
   html { height: 100% }
   body { height: 100%; margin: 0; padding: 0 }
   #map_canvas { height: 100% }
</style>
<script src="/scripts/jquery.js"></script>
<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyB-k6sdgzpXqzTGYPqSm3qWdZFpbvwf3JY&sensor=false"></script>
<title>CAP | Map</title>
</head>
<body onload="initialize()">
<h1>The Map</h1>
<div id="map_canvas">
</div>
<script>
function initialize() {
    var mapOptions = {
        center: new google.maps.LatLng(37.4106, -122.0596),
        zoom: 18,
        mapTypeId: google.maps.MapTypeId.HYBRID
    };
    var map = new google.maps.Map(document.getElementById("map_canvas"),
            mapOptions);
}
</script>
</body>
</html>