import 'package:flutter/material.dart';
import 'package:footprint/nearbyalertpage.dart' as nearby;
import 'package:footprint/map.dart' as map;

class AlertDisplay extends StatefulWidget {
  final Map<String, Object> data;
  AlertDisplay(this.data, {Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _AlertDisplay();
}

class _AlertDisplay extends State<AlertDisplay> {
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Color(0xffD85358),
            body: Column(children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text("footprint",
                      style: TextStyle(
                          color: Color(0xffD85358),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'FredokaOne',
                          fontSize: 37.1))),
              Padding(
                  padding: EdgeInsets.only(right: 10, left: 10, bottom: 10),
                  child: RaisedButton(
                      color: Color(0xffffffff),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () async => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      nearby.NearbyAlertPage()),
                            )
                          },
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
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text("COVID-19 Exposure Tracker",
                                style: TextStyle(
                                    color: Color(0xffEE9B3F),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'FredokaOne',
                                    fontSize: 19.3)))
                      ]))),
              Card(
                  color: Color(0xffffffff),
                  child: Column(children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text("8/05/20",
                            style: TextStyle(
                                color: Color(0xff000000),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Raleway',
                                fontSize: 30))),
                    Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text("9:26:10 PM",
                            style: TextStyle(
                                color: Color(0xffD85358),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Raleway',
                                fontSize: 20))),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                            "You may have come in contact with someone with Covid-19 at " +
                                widget.data["latitude"].toString() +
                                " " +
                                widget.data["longitude"].toString() +
                                ".",
                            style: TextStyle(
                                color: Color(0xffD85358),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Raleway',
                                fontSize: 13))),
                  ])),
              Container(child: Image.asset("assets/mapmap.png", scale: 1.6))
            ])));
  }
}
