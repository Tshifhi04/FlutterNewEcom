import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_ecom_app/constants/constants.dart';
import 'package:new_ecom_app/constants/routes.dart';
import 'package:new_ecom_app/screens/home/home.dart';

class FirebaseAuthHelper{

  static FirebaseAuthHelper instance =FirebaseAuthHelper();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?>get getAuthChange=> _auth.authStateChanges();




  Future <bool> login(String email,String password,BuildContext context) async {

    try{
      showLoaderDialog(context);
          _auth.signInWithEmailAndPassword(email: email, password: password);
            Navigator.of(context).pop();
          return true;
    } on FirebaseAuthException catch (e) {
                  Navigator.of(context).pop();

      showMessage(e.code.toString());
      return false;
    }

  }
}