import 'dart:io';


import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfig{
  static FirebaseOptions get platformOptions {
    if (Platform.isAndroid){
      return const FirebaseOptions(
  apiKey: "AIzaSyC_6ckuowtjf8al1E8H9PdOG25s4Pv__1E", 
        appId: "1:543577510729:android:7842ff64e8045ae98d8098",
        messagingSenderId: "2834466351178", //gots to change it
        projectId: "ecommerceapp-23ae0",
        );
    }
   else {
      return const FirebaseOptions(
        apiKey: "AIzaSyC_6ckuowtjf8al1E8H9PdOG25s4Pv__1E", 
        appId: "1:543577510729:android:7842ff64e8045ae98d8098",
        messagingSenderId: "2834466351178", //gots to change it
        projectId: "ecommerceapp-23ae0",
        );
    }
  
  }
}


