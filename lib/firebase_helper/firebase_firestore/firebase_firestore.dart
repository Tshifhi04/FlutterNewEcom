//import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_ecom_app/constants/constants.dart';
import 'package:new_ecom_app/models/product_model/product_model.dart';
import 'package:new_ecom_app/models/user_model/user_model.dart';

import '../../models/category_model/category_model.dart';

class FirebaseFirestoreHelper{
  static FirebaseFirestoreHelper instance = FirebaseFirestoreHelper();
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<List<CategoryModel>> getCategories() async {
    try{
      QuerySnapshot<Map<String,dynamic>> querySnapshot = await _firebaseFirestore.collection("categories").get();
     List<CategoryModel> categoriesList =  querySnapshot.docs.map((e) => CategoryModel.fromJson(e.data())).toList();
     return categoriesList;
    }
    catch(e){
      showMessage(e.toString());
      return [];
    }
  }


 Future<List<ProductModel>> getWhatWeHaveForYou() async {
    try{
      QuerySnapshot<Map<String,dynamic>> querySnapshot = await _firebaseFirestore.collectionGroup("products").get();
     List<ProductModel> productList = await querySnapshot.docs.map((e) => ProductModel.fromJson(e.data())).toList();
     return productList;
    }
    catch(e){
      showMessage(e.toString());
      return [];
    }
  }

  Future<List<ProductModel>> getCategoryView(String id) async {
    try{
      QuerySnapshot<Map<String,dynamic>> querySnapshot = await _firebaseFirestore.collection("categories").doc(id).collection("products").get();
     List<ProductModel> productList = await querySnapshot.docs.map((e) => ProductModel.fromJson(e.data())).toList();
     return productList;
    }
    catch(e){
      showMessage(e.toString());
      return [];
    }
  }

Future<UserModel> getUserInformation() async {
     DocumentSnapshot<Map<String,dynamic>> querySnapshot = await _firebaseFirestore.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get();
    // List<ProductModel> productList = await querySnapshot.docs.map((e) => ProductModel.fromJson(e.data())).toList();
     return UserModel.fromJson(querySnapshot.data()!);
  
    
  }

}