import 'package:flutter/material.dart';
import 'package:flutter_app/pages/search_medicine/SearchMedicinePage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UploadPrescriptionPage extends StatefulWidget {
  @override
  _UploadPrescriptionPageState createState() => _UploadPrescriptionPageState();
}

class _UploadPrescriptionPageState extends State<UploadPrescriptionPage> {
  List _prescriptionList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
              child: Text(
            "Upload",
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          )),
          leading: IconButton(
              icon: new Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context, true);
              }),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MySearchMedicinePage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              tooltip: 'Cart',
              onPressed: () {},
            ),
          ],
        ),
        body: Builder(
          builder: (context) => Stack(children: <Widget>[
                cameraGalleyPrescription(context),
              ]),
        ));
  }

  Widget cameraGalleyPrescription(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          cameraGalleyPrescriptionIcons(context),
          prescriptionResultView(context)
        ],
      ),
    );
  }

  Widget cameraGalleyPrescriptionIcons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        FlatButton(
          onPressed: () => openCamera(context),
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset('assets/camera.svg', width: 24, height: 24),
              Text("Camera")
            ],
          ),
        ),
        FlatButton(
          onPressed: () => openGallery(context),
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset('assets/gallery.svg', width: 24, height: 24),
              Text("Gallery")
            ],
          ),
        ),
        FlatButton(
          onPressed: () => openGallery(context),
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset('assets/prescription.svg',
                  width: 24, height: 24),
              Text("My Prescription")
            ],
          ),
        ),
      ],
    );
  }

  Widget prescriptionResultView(BuildContext context) {
    return _prescriptionList.isEmpty
        ? cameraGalleyPrescriptionDescription(context)
        : prescriptionsView(context);
  }

  Widget cameraGalleyPrescriptionDescription(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset('assets/shield.svg', width: 24, height: 24),
            Text(
                "Your atttached prescription will be secure and private. Only our pharmacist will review it.",
                style: TextStyle(color: Colors.black, fontSize: 14.0),
                textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }

  Widget prescriptionsView(BuildContext context) {
    return Expanded(
      child: Container(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(8.0),
          crossAxisSpacing: 10.0,
          crossAxisCount: 2,
          scrollDirection: Axis.vertical,
          children: List.generate(_prescriptionList.length, (index) {
            return imageHolder(index, context);
          }),
        ),
      ),
    );
  }

  Widget imageHolder(index, BuildContext context) {
    return Card(
      elevation: 4.0,
      child: SizedBox(
        child: Image.file(_prescriptionList[index]),
      ),
    );
  }

  void openCamera(BuildContext context) async {
    if (_prescriptionList.length < 2) {
      var picture = await ImagePicker.pickImage(
        source: ImageSource.camera,
      );
      if (picture != null) {
        setState(() {
          _prescriptionList.add(picture);
        });
      }
    } else {
      Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text("Only two prescription you can upload"),
      ));
    }
  }

  void openGallery(BuildContext context) async {
    if (_prescriptionList.length < 2) {
      var gallery = await ImagePicker.pickImage(
        source: ImageSource.gallery,
      );
      if (gallery != null) {
        setState(() {
          _prescriptionList.add(gallery);
        });
      }
    } else {
      Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text("Only two prescription you can upload"),
      ));
    }
  }
}
