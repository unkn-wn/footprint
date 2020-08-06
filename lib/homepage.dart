import 'package:flutter/material.dart';
import 'dart:async';
import 'package:footprint/nearbyalertpage.dart' as alertpage;
import 'package:footprint/global_vars.dart' as global;
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  Geolocator geolocator = Geolocator();

  Position userLocation;
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
    return MaterialApp(
        theme:
            ThemeData(brightness: Brightness.light, primaryColor: Colors.green),
        home: Scaffold(
            backgroundColor: Color(0xffD85358),
            //appBar: AppBar(title: Text("Footprint")),
            body: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child:
                          Image.asset('assets/footprint_logo.png', scale: 2)),
                  Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: Column(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text("footprint",
                                style: TextStyle(
                                    color: Color(0xffD85358),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'FredokaOne',
                                    fontSize: 37.1))),
                        Padding(
                            padding: EdgeInsets.only(
                                right: 10, left: 10, bottom: 10),
                            child: Text("COVID-19 Exposure Tracker",
                                style: TextStyle(
                                    color: Color(0xffEE9B3F),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'FredokaOne',
                                    fontSize: 19.3)))
                      ])),
                  Padding(
                      padding: EdgeInsets.only(top: 100),
                      child: Column(children: <Widget>[
                        SizedBox(
                            width: 300,
                            child: RaisedButton(
                                color: Color(0xffD85358),
                                onPressed: () => {},
                                child: Text("New User? Sign Up Now!",
                                    style: TextStyle(
                                        fontFamily: 'Raleway',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.white)))),
                        SizedBox(
                            width: 300,
                            child: FlatButton(
                                color: Color(0xFFFFFFFF),
                                onPressed: () => {
                                      global.self_lat = userLocation.latitude,
                                      global.self_long = userLocation.longitude,
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  alertpage.NearbyAlertPage())),
                                    },
                                child: Text("Sign In!",
                                    style: TextStyle(
                                        fontFamily: "Raleway",
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ))),
                        FlatButton(
                            child: Text("Forgot Password?",
                                style: TextStyle(
                                    fontFamily: "Raleway",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            onPressed: () => {}),
                      ]))
                ],
              ),
            )));
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
