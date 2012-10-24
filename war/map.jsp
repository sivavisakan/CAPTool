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
                                <!-- TODO: Make the below an input tag instead  -->
                                <button id="map-refresh" type="submit" class="btn btn-primary">
                                    <em class="icon-search icon-white"></em>&nbsp;Search
                                </button>
                            </div>
                        </form>
                        <form id="tools" action="./" method="post" onsubmit="return false">
                            <div class="well">
                                <label for="shape_type"> Shape </label> <select id="toolchoice"
                                    name="toolchoice"
                                    onchange="toolID=parseInt(this.options[this.selectedIndex].value)">
                                    <option selected="selected" value="1">Polygon</option>
                                    <option value="2">Circle</option>
                                </select>
                            </div>
                        </form>
                        <div class="well">
                            <!-- TODO: Make the below a button tag instead  -->
                            <input onclick="deleteOverlays();" type=button value="Clear Map"
                                class="btn btn-primary">
                        </div>

                        <!-- TODO: Remove this div -->
                        <div id="test"></div>
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
                </div>
            </div>
        </div>
    </div>
    <script>
        var map;
        var geocoder; // = new google.maps.Geocoder();
        var markers = [];

        var toolID = 1;

        // Circle variables
        var centerPoint;
        var radiusPoint;
        var circleOptions;
        var circles = [];

        // Polygon variables
        var polygonOptions;
        var polyPoints = [];
        var polygons = [];
        var curPolygon;

        // Setup the map.
        function initialize() {
            geocoder = new google.maps.Geocoder();
            var mapOptions = {
                center : new google.maps.LatLng(37.4106, -122.0596),
                zoom : 8,
                draggableCursor : 'default',
                draggingCursor : 'pointer',
                scaleControl : true,
                mapTypeControl : true,

                mapTypeId : google.maps.MapTypeId.HYBRID
            };
            map = new google.maps.Map(document.getElementById("map_canvas"),
                    mapOptions);

            // Initializethe geocoder.
            geocoder = new google.maps.Geocoder();

            // Initialize the circle options 
            circleOptions = {
                strokeColor : "#FF0000",
                strokeOpacity : 0.8,
                strokeWeight : 2,
                fillColor : "#FF0000",
                fillOpacity : 0.35,
                map : map
            };

            // Initialize the polygon options 
            polygonOptions = {
                strokeColor : "#FF0000",
                strokeOpacity : 0.8,
                strokeWeight : 2,
                fillColor : "#FF0000",
                fillOpacity : 0.35,
                map : map
            };

            // Initialize the click event listener
            google.maps.event.addListener(map, 'click', addLatLng);
        }
        // Add overlays at the cursor position when the map is clicked.
        function addLatLng(event) {
            // Add a marker to the map position and push it to the array of markers.
            marker = new google.maps.Marker({
                position : event.latLng,
                map : map
            });
            markers.push(marker);

            // Add the marker to a shape
            if (toolID == 1) {
                // Polygon is selected
                addToPolygon(event.latLng)
            } else {
                // Circle is selected
                addToCircle(event.latLng);
            }
        }
        // Adds a map position as the vertex of a polygon
        function addToPolygon(position) {
            // Add the position to the array of polygon points
            if (polyPoints.length > 0) {
                closingPoint = polyPoints.pop();
                polyPoints.push(position);
                polyPoints.push(closingPoint);
                // If the array has 3 or more vertices, draw a polygon
                if (polyPoints.length > 3)
                    drawPolygon();
            }
            /* Add the first position in the array of polygon points. It is the first and the
             last element of the array. */
            else {
                polyPoints.push(position);
                polyPoints.push(position);
            }
        }
        // Draws a polygon overlay on the map.
        function drawPolygon() {
            // Change the path of the existing current polygon
            if (curPolygon) {
                curPolygon.setPath(polyPoints);
            } 
            // Create a new current polygon
            else {
                curPolygon = new google.maps.Polygon(polygonOptions);
                curPolygon.setPath(polyPoints);

                polygons.push(curPolygon);
            }
        }
        // Adds a map position as the center or the radius point of a circle
        function addToCircle(position) {
            if (centerPoint) {
                radiusPoint = position;
                drawCircle();
            } else {
                centerPoint = position;
            }
        }
        // Draws a circle overlay on the map.
        function drawCircle() {
            // Get the distance between the center and the radius point
            radius = distance(centerPoint.lat(), centerPoint.lng(), radiusPoint
                    .lat(), radiusPoint.lng());

            circleOptions.center = centerPoint;
            circleOptions.radius = radius;

            circle = new google.maps.Circle(circleOptions);

            circles.push(circle);

            // Reset the center and the radius
            centerPoint = null;
            radiusPoint = null;
        }
        // Calculates the distance between two coordinates.
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
        // Deletes all overlays.
        function deleteOverlays() {
            // Delete all markers in the markers array by removing references to them.
            if (markers) {
                for (i in markers) {
                    markers[i].setMap(null);
                }
                markers = [];
            }
            /* Delete all circles in the circles array by removing references to them,
             and clear all the relevant circles vars. */
            if (circles) {
                for (i in circles) {
                    circles[i].setMap(null);
                }
                circles = [];
                centerPoint = null;
            }
            // Delete all polygons in the polygons array by removing references to them.
            if (polygons) {
                for (i in polygons) {
                    polygons[i].setMap(null);
                }
                polygons = [];
                polyPoints = [];
                curPolygon = null;
            }
        }
        // Centers the map to the address input.
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

        // UTILITY FUNCTIONS

        // Get a JS object or a DOM element object
        function getObject(e) {
            if (typeof (e) == 'object')
                return (e);
            if (document.getElementById)
                return (document.getElementById(e));
            return (eval(e))
        }
    </script>
</body>
</html>