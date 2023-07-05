import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
//import 'package:new_ecom_app/firebase_helper/firebase_firestore/firebase_firestore.dart';

class FirebaseStorageHelper{
  static FirebaseStorageHelper instance = FirebaseStorageHelper();
 final FirebaseStorage _storage =FirebaseStorage.instance;



  Future<String> uploadUserImage(File image)async{
    String userId = FirebaseAuth.instance.currentUser!.uid;
    TaskSnapshot taskSnapshot = await _storage.ref(userId).putFile(image).snapshot;
      String imageUrl =await taskSnapshot.ref.getDownloadURL();
      return imageUrl;
  }
}