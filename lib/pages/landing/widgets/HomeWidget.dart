import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/carousel.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:flutter_app/utils/firebase.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {

  Map<String, Object> _carousel = new HashMap();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firebase()
        .realTimeDB
        .child(Constants().carousel)
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        print(snapshot.value);
        _carousel = new Map<String, dynamic>.from(snapshot.value);
      });
    });
  }

  carouselUrl() {
    var myCarousel = [];
    var myList = [];
    for (var value in _carousel.values) {
      myList.add(value);
    }

    myList.forEach((v) => myCarousel.add(NetworkImage(v["url"])));

    return myCarousel;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            height: 125.0,
            child: new Carousel(
              images: carouselUrl(),
              boxFit: BoxFit.fill,
              animationCurve: Curves.fastOutSlowIn,
              animationDuration: Duration(milliseconds: 2000),
            )),
      ],
    );
  }
}
