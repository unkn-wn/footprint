import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'package:footprint/global_vars.dart' as global;
import 'package:geolocator/geolocator.dart';
import 'package:footprint/nearbyalertpage.dart' as nearbyalertpage;

class SendAlert extends StatefulWidget {
  _SendAlert createState() => _SendAlert();
}

class _SendAlert extends State<SendAlert> {
  File _image;
  PickedFile _pickedFile;
  var distance;
  final _picker = ImagePicker();
  Future getImage() async {
    final _pickedFile = await _picker.getImage(source: ImageSource.camera);
    print(_pickedFile.path);
    for (var i = 0; i < global.locations.length - 1; i++) {
      distance = await new Geolocator().distanceBetween(
          global.locations[i]["latitude"],
          global.locations[i]["longitude"],
          global.self_lat,
          global.self_long);
      if (distance < 10.0) {
        global.alerts.add(global.locations[i]);
        print(global.alerts);
      }
    }
  }

  Widget build(BuildContext build) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Color(0xffD85358),
            body: Column(children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Center(
                      child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
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
                          padding:
                              EdgeInsets.only(right: 10, left: 10, bottom: 10),
                          child: Text("COVID-19 Exposure Tracker",
                              style: TextStyle(
                                  color: Color(0xffEE9B3F),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'FredokaOne',
                                  fontSize: 19.3)))
                    ]),
                  ))),
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
                              onPressed: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            nearbyalertpage.NearbyAlertPage()))
                              },
                            )),
                        RaisedButton(
                            color: Color(0xFFFFFFFF),
                            onPressed: () => {},
                            child: Text("Send Alerts",
                                style: TextStyle(
                                    color: Color(0xff000000),
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.bold)))
                      ]),
                  padding: EdgeInsets.only(top: 50)),
              Expanded(
                  child: Container(
                      width: 400,
                      color: Color(0xffffffff),
                      child: Center(
                          child:
                              Text("Upload Covid Positive Photo Evidence")))),
              RaisedButton(
                  child: Text("Select Image"),
                  onPressed: getImage,
                  color: Color(0xffffffff))
            ])));
  }
}
