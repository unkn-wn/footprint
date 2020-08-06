import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:footprint/map.dart' as map;
import 'package:footprint/nearbyalertpage.dart' as nearby;
import 'package:footprint/global_vars.dart' as global;
import 'package:footprint/homepage.dart' as homepage;
import 'package:livemap/livemap.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: homepage.HomePage(),
    );
  }
}

class GeoListenPage extends StatefulWidget {
  @override
  _GeoListenPageState createState() => _GeoListenPageState();
}

class _GeoListenPageState extends State<GeoListenPage> {
  Geolocator geolocator = Geolocator();

  Position userLocation;

  List<dynamic> locations = [
    {'latitude': 37.421998333334400, 'longitude': -122.08400000005100},
    {'latitude': 37.27551887856751, 'longitude': -121.7668262850218},
    {'latitude': 37.304698180332636, 'longitude': -121.81923337114476},
    {'latitude': 37.281501927572998, 'longitude': -122.00058192833887},
    {'latitude': 36.999928471888252, 'longitude': -121.71012395172938},
  ];

  Completer<GoogleMapController> _controller = Completer();
  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getLocation().then((position) {
      userLocation = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            userLocation == null
                ? CircularProgressIndicator()
                : Text("Latitude: " +
                    userLocation.latitude.toString() +
                    "\nLongitude: " +
                    userLocation.longitude.toString()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  _getLocation().then((value) {
                    setState(() {
                      userLocation = value;
                    });
                  });
                  global.self_lat = userLocation.latitude;
                  global.self_long = userLocation.longitude;
                  //Navigator.push(context,
                  //    MaterialPageRoute(builder: (context) => map.MyApp()));
                },
                color: Colors.blue,
                child: Text(
                  "Get Location",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () async {
                  double distance = 0;
                  for (var i = 0; i < locations.length - 1; i++) {
                    distance = await new Geolocator().distanceBetween(
                        locations[i]["latitude"],
                        locations[i]["longitude"],
                        userLocation.latitude,
                        userLocation.longitude);
                    print(distance);
                  }
                },
                color: Colors.blue,
                child: Text(
                  "Find distance",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Position> _getLocation() async {
    var currentLocation;
    try {
      currentLocation = await geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }
}
