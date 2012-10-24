<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type="text/css" rel="stylesheet"
	href="/stylesheets/bootstrap/css/bootstrap.css" />
<!-- <link type="text/css" rel="stylesheet" href="/stylesheets/bootstrap/css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="/stylesheets/bootstrap/css/bootstrap-responsive.min.css" /> -->
<style type="text/css">
body { /* TODO: achieve this padding using bootstrap  */
	padding-top: 60px;
	padding-bottom: 20px;
}

#map_canvas img {
	max-width: none;
}
/* TODO: remove the below */
/* html {
	height: 100%
}

body {
	height: 100%;
	margin: 0;
	padding: 0
}

#map_canvas {
	height: 100%
} */
</style>
<script src="/scripts/jquery.js"></script>
<script
	src="http://maps.googleapis.com/maps/api/js?key=AIzaSyB-k6sdgzpXqzTGYPqSm3qWdZFpbvwf3JY&sensor=true"></script>
<title>CAP | Map</title>
</head>
<body onload="initialize()">
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a class="brand" href="#">CAP Tool</a>
				<div class="nav-collapse collapse">
					<ul class="nav">
						<li class="active"><a href="#">Home</a></li>
						<li><a href="#about">About</a></li>
						<li><a href="#contact">Contact</a></li>
						<li><a href="map.jsp">Map</a></li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<div class="row-fluid">
					<div class="span4">
						<div class="row-fluid">
							<div class="span9">
								<h1>The Map</h1>
							</div>
						</div>
						<form onsubmit="showAddress(this.address.value); return false">
							<div class="well">
								<label for="address"> Address </label>
								<div class="input">
									<input class="span10" id="address" name="address"
										placeholder="Manhattan" value="" type="text" />
								</div>
								<button id="map-refresh" type="submit" class="btn btn-primary">
									<em class="icon-search icon-white"></em>&nbsp;Search
								</button>
							</div>
						</form>
						<form id="tools" action="./" method="post" onsubmit="return false">
							<div class="well">
								<label for="shape_type"> Shape </label> <select id="toolchoice"
									name="toolchoice"
									onchange="toolID=parseInt(this.options[this.selectedIndex].value);setTool();">
									<option selected="selected" value="1">Polygon</option>
									<option value="2">Circle</option>
								</select>
							</div>
						</form>
					</div>
					<div class="span8">
						<div
							style="display: inline-block; position: relative; width: 100%">
							<div style="margin-top: 75%">
								<div id="map_canvas"
									style="position: absolute; top: 0; bottom: 0; left: 0; right: 0"></div>
							</div>
						</div>
					</div>
					<!-- <div id="map_canvas"></div> -->
				</div>
			</div>
		</div>
	</div>
	<script>
		function gob(e) {
			if (typeof (e) == 'object')
				return (e);
			if (document.getElementById)
				return (document.getElementById(e));
			return (eval(e))
		}

		var map;
		var polyShape;
		var markerShape;

		var drawnShapes = [];
		var holeShapes = [];
		var startMarker;
		var nemarker;
		var tinyMarker;
		var markers = [];
		var midmarkers = [];

		var rectangle;
		var circle;
		var southWest;
		var northEast;
		var centerPoint;
		var radiusPoint;
		var calc;
		var startpoint;
		var adder = 0;
		var dirpointstart = null;
		var dirline;
		var waypts = [];

		var polyPoints = [];
		var pointsArray = [];
		var markersArray = [];
		var addresssArray = [];
		var pointsArrayKml = [];
		var markersArrayKml = [];
		var toolID = 1;
		var codeID = 1;
		var shapeId = 0;
		var step = 0;
		var plmcur = 0;
		var lcur = 0;
		var pcur = 0;

		var ccur = 0;
		var mcur = 0;
		var outerPoints = [];
		var holePolyArray = [];
		var outerShape;
		var anotherhole = false;

		var outerArray = [];
		var innerArray = [];
		var innerArrays = [];
		var outerArrayKml = [];
		var innerArrayKml = [];
		var innerArraysKml = [];
		var placemarks = [];

		var editing = false;
		var notext = false;
		var textsignal = 0;
		var kmlcode = ""; // Used as signal for have been logged
		var javacode = ""; // Used as signal for have been logged
		var polylineDecColorCur = "255,0,0";
		var polygonDecColorCur = "255,0,0";
		var docuname = "My document";
		var docudesc = "Content";
		var polylinestyles = [];
		var polygonstyles = [];

		var circlestyles = [];
		var markerstyles = [];
		var geocoder; // = new google.maps.Geocoder();

		var endLocation;

		var dircountstart;
		var firstdirclick = 0;
		var dirmarknum = 1;
		var directionsDisplay;
		var directionsService = new google.maps.DirectionsService();
		var directionsYes = 0;
		var destinations = [];
		var removedirectionleg = 0;

		var prevpoint;
		var prevnumber;
		var copyrightNode;
		var infowindow = new google.maps.InfoWindow();//({size: new google.maps.Size(150,50)});
		var tmpPolyLine = new google.maps.Polyline({
			strokeColor : "#00FF00",
			strokeOpacity : 0.8,
			strokeWeight : 2
		});
		var tinyIcon = new google.maps.MarkerImage(
				"assets/icons/marker_20_red.png", new google.maps.Size(12, 20),
				new google.maps.Point(0, 0), new google.maps.Point(6, 16));

		var imageNormal = new google.maps.MarkerImage(
				"assets/images/square.png", new google.maps.Size(11, 11),
				new google.maps.Point(0, 0), new google.maps.Point(6, 6));
		var imageHover = new google.maps.MarkerImage(
				"assets/images/square_over.png", new google.maps.Size(11, 11),
				new google.maps.Point(0, 0), new google.maps.Point(6, 6));
		var imageNormalMidpoint = new google.maps.MarkerImage(
				"assets/images/square_transparent.png", new google.maps.Size(
						11, 11), new google.maps.Point(0, 0),
				new google.maps.Point(6, 6));

		/* function initmap()
	    {
	        geocoder = new google.maps.Geocoder();
	        var latlng = new google.maps.LatLng(37.4106, -122.0596);
	        var mapTypeIds = [];
	        for(var type in google.maps.MapTypeId) {
	            mapTypeIds.push(google.maps.MapTypeId[type]);
	        }
	        mapTypeIds.push("OSM");
	        copyrightNode = document.createElement('div');
	        copyrightNode.id = 'copyright-control';
	        copyrightNode.style.fontSize = '11px';
	        copyrightNode.style.fontFamily = 'Arial, sans-serif';
	        copyrightNode.style.margin = '0 2px 2px 0';
	        copyrightNode.style.whiteSpace = 'nowrap';

	        var myOptions = {
	            zoom: 8,
	            center: latlng,
	            draggableCursor: 'default',
	            draggingCursor: 'pointer',
	            scaleControl: true,
	            mapTypeControl: true,
	            mapTypeControlOptions: {mapTypeIds: mapTypeIds},

	            mapTypeId: google.maps.MapTypeId.ROADMAP,
	            styles: [{featureType: 'poi', stylers: [{visibility: 'off'}]}],
	            streetViewControl: false};

	            map = new google.maps.Map(gob('map_canvas'),myOptions);
	            map.mapTypes.set("OSM", new google.maps.ImageMapType({
	            getTileUrl: function(coord, zoom) {
	                return "http://tile.openstreetmap.org/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
	            },
	            tileSize: new google.maps.Size(256, 256),
	            name: "OpenStreetMap",
	            maxZoom: 18
	        }));
	        google.maps.event.addListener(map, 'maptypeid_changed', updateCopyrights);
	        map.controls[google.maps.ControlPosition.BOTTOM_RIGHT].push(copyrightNode);

	        polyPoints = new google.maps.MVCArray(); // collects coordinates
	        tmpPolyLine.setMap(map);
	        createplacemarkobject();
	        createlinestyleobject();
	        createpolygonstyleobject();
	        createcirclestyleobject();
	        createmarkerstyleobject();
	        preparePolyline(); // create a Polyline object

	        google.maps.event.addListener(map, 'click', addLatLng);
	        google.maps.event.addListener(map,'zoom_changed',mapzoom);
	        cursorposition(map);
	    } */
		
		function initialize() {
			geocoder = new google.maps.Geocoder();
			var mapOptions = {
				center : new google.maps.LatLng(37.4106, -122.0596),
				zoom : 8,
				draggableCursor: 'default',
                draggingCursor: 'pointer',
                scaleControl: true,
                mapTypeControl: true,
                
				mapTypeId : google.maps.MapTypeId.HYBRID
			};
			map = new google.maps.Map(document.getElementById("map_canvas"),
					mapOptions);

	        polyPoints = new google.maps.MVCArray(); // collects coordinates
	        tmpPolyLine.setMap(map);
	        createplacemarkobject();
	        preparePolyline(); // create a Polyline object

	        google.maps.event.addListener(map, 'click', addLatLng);
	        cursorposition(map);
		}

		function showAddress(address) {
			geocoder
					.geocode(
							{
								'address' : address
							},
							function(results, status) {
								if (status == google.maps.GeocoderStatus.OK) {
									var pos = results[0].geometry.location;
									map.setCenter(pos);
								} else {
									alert("Geocode was not successful for the following reason: "
											+ status);
								}
							});
		}

		function setTool() {
			if (polyPoints.length == 0) {
				newstart();
			} else {
				if (toolID == 1) { // polygon
					placemarks[plmcur].style = polygonstyles[polygonstyles.length - 1].name;
					placemarks[plmcur].stylecur = polygonstyles.length - 1;
					if (polyShape)
						polyShape.setMap(null);
					preparePolygon(); //if a polyline exists, it will be redrawn as a polygon
				}
				if (toolID == 2) {
					if (polyShape)
						polyShape.setMap(null);
					circle.setMap(null);
					newstart();
				}
			}
		}

		function newstart() {
			polyPoints = [];
			outerPoints = [];
			pointsArray = [];
			markersArray = [];
			pointsArrayKml = [];
			markersArrayKml = [];
			addresssArray = [];
			outerArray = [];
			innerArray = [];
			outerArrayKml = [];
			innerArrayKml = [];
			holePolyArray = [];
			innerArrays = [];
			innerArraysKml = [];
			waypts = [];
			destinations = [];
			adder = 0;
			dirpointstart = null;
			dirline = null;
			firstdirclick = 0;
			//dirmarknum = 1;
			step = 0;
			if (directionsYes == 1 && toolID != 6)
				directionsYes = 0;
			closethis('polylineoptions');
			closethis('polygonoptions');
			closethis('circleoptions');
			if (toolID != 2)
				closethis('polygonstuff');
			if (directionsDisplay)
				directionsDisplay.setMap(null);
			if (startMarker)
				startMarker.setMap(null);
			if (nemarker)
				nemarker.setMap(null);
			if (tinyMarker)
				tinyMarker.setMap(null);
			if (toolID == 1) {
				showthis('polygonstuff');
				gob('stepdiv').innerHTML = "Step 0";
				placemarks[plmcur].style = polygonstyles[polygonstyles.length - 1].name;
				placemarks[plmcur].stylecur = polygonstyles.length - 1;
				preparePolygon();
			}
			if (toolID == 2) {
				placemarks[plmcur].style = circlestyles[circlestyles.length - 1].name;
				placemarks[plmcur].stylecur = circlestyles.length - 1;
				preparePolyline(); // use Polyline to collect clicked point
				activateCircle();
			}
		}

		function showthis(name) {
			gob(name).style.visibility = 'visible';
		}

		function closethis(name) {
			gob(name).style.visibility = 'hidden';
		}

		function preparePolygon() {
			var polyOptions = {
				path : polyPoints,
				strokeColor : polygonstyles[pcur].color,
				strokeOpacity : polygonstyles[pcur].lineopac,
				strokeWeight : polygonstyles[pcur].width,
				fillColor : polygonstyles[pcur].fill,
				fillOpacity : polygonstyles[pcur].fillopac
			};
			polyShape = new google.maps.Polygon(polyOptions);
			polyShape.setMap(map);
		}

		function preparePolyline() {
			var polyOptions = {
				path : polyPoints,
				strokeColor : polylinestyles[lcur].color,
				strokeOpacity : polylinestyles[lcur].lineopac,
				strokeWeight : polylinestyles[lcur].width
			};
			polyShape = new google.maps.Polyline(polyOptions);
			polyShape.setMap(map);
		}
		function activateCircle() {
			circle = new google.maps.Circle({
				map : map,
				fillColor : circlestyles[ccur].fill,
				fillOpacity : circlestyles[ccur].fillopac,
				strokeColor : circlestyles[ccur].color,
				strokeOpacity : circlestyles[ccur].lineopac,
				strokeWeight : circlestyles[ccur].width
			});
		}

		function drawCircle() {
			centerPoint = startMarker.getPosition();
			radiusPoint = nemarker.getPosition();
			circle.bindTo('center', startMarker, 'position');
			calc = distance(centerPoint.lat(), centerPoint.lng(), radiusPoint
					.lat(), radiusPoint.lng());
			circle.setRadius(calc);
			//Cursor position, when inside circle, is registered with this listener
			cursorposition(circle);
			codeID = gob('codechoice').value = 2;
		}

		// calculate distance between two coordinates
		function distance(lat1, lon1, lat2, lon2) {
			var R = 6371000; // earth's radius in meters
			var dLat = (lat2 - lat1) * Math.PI / 180;
			var dLon = (lon2 - lon1) * Math.PI / 180;
			var a = Math.sin(dLat / 2) * Math.sin(dLat / 2)
					+ Math.cos(lat1 * Math.PI / 180)
					* Math.cos(lat2 * Math.PI / 180) * Math.sin(dLon / 2)
					* Math.sin(dLon / 2);
			var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
			var d = R * c;
			return d;
		}
		
		function cursorposition(mapregion){
	        google.maps.event.addListener(mapregion,'mousemove',function(point){
	            var LnglatStr6 = point.latLng.lng().toFixed(6) + ', ' + point.latLng.lat().toFixed(6);
	            var latLngStr6 = point.latLng.lat().toFixed(6) + ', ' + point.latLng.lng().toFixed(6);
	            gob('over').options[0].text = LnglatStr6;
	            gob('over').options[1].text = latLngStr6;
	        });
	    }
		
		function placemarkobject()
	    {
	        this.name = "NAME";
	        this.desc = "YES";
	        this.style = "Path";
	        this.stylecur = 0;
	        this.tess = 1;
	        this.alt = "clampToGround";
	        this.plmtext = ""; // KLM text from <Placemark> to </Placemark>
	        this.jstext = "";
	        this.jscode = [];
	        this.kmlcode = []; // coordinatepairs lng lat
	        this.kmlholecode = []; // coordinatepairs lng lat
	        this.poly = "pl";
	        this.shape = null;
	        this.point = null;
	        this.toolID = 1;
	        this.hole = 0;
	        this.ID = 0;
	    }
		
		function createplacemarkobject() {
	        var thisplacemark = new placemarkobject();
	        placemarks.push(thisplacemark);
	    }
		
		function addLatLng(point){
	        // In v2 I can give a shape an ID and have that ID revealed, with the map listener, when the shape is clicked on
	        // I can't do that in v3. Instead I put a listener on the shape in addpolyShapelistener

	        // Rectangle and circle can't collect points with getPath. solved by letting Polyline collect the points and then erase Polyline
	        polyPoints = polyShape.getPath();
	        // This codeline does the drawing on the map
	        polyPoints.insertAt(polyPoints.length, point.latLng); // or: polyPoints.push(point.latLng)
	        if(polyPoints.length == 1) {
	            startpoint = point.latLng;
	            placemarks[plmcur].point = startpoint; // stored because it's to be used when the shape is clicked on as a stored shape
	            setstartMarker(startpoint);
	        }
	        if(polyPoints.length == 2 && toolID == 2) createcircle(point);
	        if(toolID == 1) { // if polygon
	            var stringtobesaved = point.latLng.lat().toFixed(6) + ',' + point.latLng.lng().toFixed(6);
	            var kmlstringtobesaved = point.latLng.lng().toFixed(6) + ',' + point.latLng.lat().toFixed(6);
	            //Cursor position, when inside polyShape, is registered with this listener
	            cursorposition(polyShape);
	            if(adder == 0) { //shape with no hole
	                pointsArray.push(stringtobesaved); // collect textstring for presentation in textarea
	                pointsArrayKml.push(kmlstringtobesaved); // collect textstring for presentation in textarea
	                if(polyPoints.length == 1 && toolID == 2) closethis('polygonstuff');
	            }
	            if(adder == 1) { // adder is increased in function holecreator
	                outerArray.push(stringtobesaved);
	                outerArrayKml.push(kmlstringtobesaved);
	            }
	            if(adder == 2) {
	                innerArray.push(stringtobesaved);
	                innerArrayKml.push(kmlstringtobesaved);
	            }
	        }
	    }
		
		function setstartMarker(point){
	        startMarker = new google.maps.Marker({
	            position: point,
	            map: map});
	        startMarker.setTitle("#" + polyPoints.length);
	    }
		
	</script>
</body>
</html>