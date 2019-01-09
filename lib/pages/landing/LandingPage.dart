import 'package:flutter/material.dart';
import 'package:flutter_app/pages/search_medicine/SearchMedicinePage.dart';
import 'package:flutter_app/pages/upload_prescription/UploadPrescriptionPage.dart';
import 'package:flutter_app/pages/landing/widgets/AlterNateWidget.dart';
import 'package:flutter_app/pages/landing/widgets/HomeWidget.dart';
import 'package:flutter_app/pages/landing/widgets/OrdersWidget.dart';
import 'package:flutter_app/pages/landing/widgets/SettingsWidget.dart';

class MyLandingPage extends StatefulWidget {
  @override
  _MyLandingPageState createState() => _MyLandingPageState();
}

class _MyLandingPageState extends State<MyLandingPage> {
  String _location = "Vellore";

  void changeLocation(String value) {
    setState(() {
      _location = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {},
          child: Row(
            children: <Widget>[
              Text(
                _location,
                style: TextStyle(color: Colors.white),
              ),
              Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MySearchMedicinePage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            tooltip: 'Notifications',
            onPressed: () => changeLocation("Notifications"),
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            tooltip: 'Cart',
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: currentWidget,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UploadPrescriptionPage()),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.orange,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: IconButton(
                  icon: currentTabIndex == 0
                      ? Icon(
                    Icons.home,
                    color: Colors.black,
                  )
                      : Icon(
                    Icons.home,
                    color: Colors.black12,
                  ),
                  onPressed: () => changeBottomTab(0)),
            ),
            Expanded(
              child: IconButton(
                  icon: currentTabIndex == 1
                      ? Icon(
                    Icons.show_chart,
                    color: Colors.black,
                  )
                      : Icon(
                    Icons.show_chart,
                    color: Colors.black12,
                  ),
                  onPressed: () => changeBottomTab(1)),
            ),
            Expanded(child: new Text('')),
            Expanded(
              child: IconButton(
                  icon: currentTabIndex == 3
                      ? Icon(
                    Icons.tab,
                    color: Colors.black,
                  )
                      : Icon(
                    Icons.tab,
                    color: Colors.black12,
                  ),
                  onPressed: () => changeBottomTab(3)),
            ),
            Expanded(
              child: IconButton(
                  icon: currentTabIndex == 4
                      ? Icon(
                    Icons.settings,
                    color: Colors.black,
                  )
                      : Icon(
                    Icons.settings,
                    color: Colors.black12,
                  ),
                  onPressed: () => changeBottomTab(4)),
            ),
          ],
        ),
      ),
    );
  }

  @mustCallSuper
  void initState() {
    super.initState();
    currentTabIndex = 0;
    currentWidget = new HomeWidget();
  }

  int currentTabIndex;
  Widget currentWidget;

  void changeBottomTab(int index) {
    setState(() {
      currentTabIndex = index;
      if (index == 0) {
        currentWidget = new HomeWidget();
      } else if (index == 1) {
        currentWidget = new OrdersWidget();
      } else if (index == 3) {
        currentWidget = new AlterNateWidget();
      } else if (index == 4) {
        currentWidget = new SettingsWidget();
      }
    });
  }
}
