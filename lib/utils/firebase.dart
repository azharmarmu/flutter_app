import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_app/utils/constants.dart';

class Firebase {
   final realTimeDB = FirebaseDatabase.instance.reference().child(Constants().env);
}