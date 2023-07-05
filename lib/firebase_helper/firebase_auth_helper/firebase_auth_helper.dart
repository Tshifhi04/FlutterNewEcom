import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_ecom_app/constants/constants.dart';
import 'package:new_ecom_app/constants/routes.dart';
import 'package:new_ecom_app/models/user_model/user_model.dart';
import 'package:new_ecom_app/screens/auth_ui/signup/signup.dart';
import 'package:new_ecom_app/screens/home/home.dart';

class FirebaseAuthHelper{

  static FirebaseAuthHelper instance =FirebaseAuthHelper();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?>get getAuthChange=> _auth.authStateChanges();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future <bool> login(String email,String password,BuildContext context) async {

    try{
      showLoaderDialog(context);
        await  _auth.signInWithEmailAndPassword(email: email, password: password);
            Navigator.of(context).pop();
          return true;
    } on FirebaseAuthException catch (error) {
                  Navigator.of(context).pop();

      showMessage(error.code.toString());
      return false;
    }

  }


    Future <bool> SignUp(String firstName,String lastName,String phoneNumber,String email,String password,BuildContext context) async {

    try{
      showLoaderDialog(context);
       UserCredential? userCredential = await  _auth.createUserWithEmailAndPassword(email: email, password: password);
        UserModel userModel =UserModel(id: userCredential.user!.uid,firstName: firstName,lastName: lastName, email: email, image: null,phoneNumber: phoneNumber);
          

          _firestore.collection("users").doc(userModel.id).set(userModel.toJson());
          
            Navigator.of(context).pop();
          return true;
    } on FirebaseAuthException catch (error) {
                  Navigator.of(context).pop();

      showMessage(error.code.toString());
      return false;
    }

  }





void signOut()async {
  await _auth.signOut();
}



}