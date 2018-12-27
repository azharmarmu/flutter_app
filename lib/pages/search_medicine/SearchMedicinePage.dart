import 'package:flutter/material.dart';

class MySearchMedicinePage extends StatefulWidget {
  @override
  _MySearchMedicinePageState createState() => _MySearchMedicinePageState();
}

class _MySearchMedicinePageState extends State<MySearchMedicinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new TextField(
          style: new TextStyle(
            fontSize: 18.0,
            color: Colors.white,
          ),
          decoration: new InputDecoration(
              hintText: "Search...",
              hintStyle: new TextStyle(color: Colors.white)),
        ),
        leading: IconButton(
            icon: new Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context, true);
            }),
      ),
    );
  }
}
