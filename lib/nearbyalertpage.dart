import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:footprint/global_vars.dart' as global;
import 'package:footprint/sendalertpage.dart' as sendalertpage;
import 'package:footprint/alertdisplay.dart' as alertdisplay;

void main() => runApp(NearbyAlertPage());

class NearbyAlertPage extends StatefulWidget {
  _NearbyAlertPage createState() => _NearbyAlertPage();
}

class _NearbyAlertPage extends State<NearbyAlertPage> {
  Widget build(BuildContext context) {
    if (global.alerts.length > 0) {
      return MaterialApp(
          home: Scaffold(
              backgroundColor: Color(0xffD85358),
              body: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Center(
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFFFFFFFF),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
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
                                ])))),
                    Padding(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(right: 20),
                                  child: RaisedButton(
                                    color: Color(0xFFFFFFFF),
                                    child: Text("Nearby Alerts",
                                        style: TextStyle(
                                            color: Color(0xff000000),
                                            fontFamily: 'Raleway',
                                            fontWeight: FontWeight.bold)),
                                    onPressed: () => {},
                                  )),
                              RaisedButton(
                                  color: Color(0xFFFFFFFF),
                                  onPressed: () async => {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    sendalertpage.SendAlert()))
                                      },
                                  child: Text("Send Alerts",
                                      style: TextStyle(
                                          color: Color(0xff000000),
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.bold)))
                            ]),
                        padding: EdgeInsets.only(top: 50)),
                    Column(
                        children: global.alerts
                            .map((element) => Card(
                                color: Color(0xffffffff),
                                child: RaisedButton(
                                    onPressed: () async => {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    alertdisplay.AlertDisplay(
                                                        element)),
                                          )
                                        },
                                    child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text("Latitude: " +
                                            element["latitude"].toString() +
                                            "\nLongitude: " +
                                            element["longitude"].toString() +
                                            "\nDate: 8/05/20 \nTime: 9:26:10 PM")))))
                            .toList())
                  ]))));
    } else {
      return MaterialApp(
          home: Scaffold(
              backgroundColor: Color(0xffD85358),
              body: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Center(
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFFFFFFFF),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
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
                                ])))),
                    Padding(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(right: 20),
                                  child: RaisedButton(
                                    color: Color(0xFFFFFFFF),
                                    child: Text("Nearby Alerts",
                                        style: TextStyle(
                                            color: Color(0xff000000),
                                            fontFamily: 'Raleway',
                                            fontWeight: FontWeight.bold)),
                                    onPressed: () => {},
                                  )),
                              RaisedButton(
                                  color: Color(0xFFFFFFFF),
                                  onPressed: () async => {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    sendalertpage.SendAlert()))
                                      },
                                  child: Text("Send Alerts",
                                      style: TextStyle(
                                          color: Color(0xff000000),
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.bold)))
                            ]),
                        padding: EdgeInsets.only(top: 50)),
                  ]))));
    }
  }
}
