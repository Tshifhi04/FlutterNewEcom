import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_ecom_app/constants/routes.dart';
import 'package:new_ecom_app/screens/home/home.dart';

class FirebaseAuthHelper{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?>get getAuthChange=> _auth.authStateChanges();




  Future <bool> login(String email,String password,BuildContext context) async {

    try{
          _auth.signInWithEmailAndPassword(email: email, password: password);

          return true;
    } on FirebaseAuthException catch (e) {

      return false;
    }

  }
}