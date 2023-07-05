// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_ecom_app/constants/constants.dart';
import 'package:new_ecom_app/firebase_helper/firebase_firestore/firebase_firestore.dart';
import 'package:new_ecom_app/firebase_helper/firebase_storage_helper/firebase_storage_helper.dart';
import 'package:new_ecom_app/models/product_model/product_model.dart';

import '../models/user_model/user_model.dart';


class AppProvider with ChangeNotifier{
  UserModel? _userModel;
  UserModel get getUserInformation => _userModel!;
//cart list
 List<ProductModel> _cartProductList =[];

 void addCartProduct(ProductModel productModel){
  _cartProductList.add(productModel);
  notifyListeners();
 }
  void removeCartProduct(ProductModel productModel){
  _cartProductList.remove(productModel); 
  notifyListeners();
 }

List<ProductModel> get getCartProductList =>_cartProductList;
//Favourite list
 List<ProductModel> _favouriteProductList =[];

 void addFavouriteProduct(ProductModel productModel){
  _favouriteProductList.add(productModel);
  notifyListeners();
 }
  void removeFavouriteProduct(ProductModel productModel){
  _favouriteProductList.remove(productModel);
  notifyListeners();
 }

List<ProductModel> get getFavouriteProductList =>_favouriteProductList;

/// User Information
void getUserInfofirebase()async {
 _userModel = await  FirebaseFirestoreHelper.instance.getUserInformation();
 notifyListeners();
}

void updateUserInformation(BuildContext context, userModel,File? file)async{
  
  if(file== null){

showLoaderDialog(context);


         _userModel =  userModel;

        await FirebaseFirestore.instance.collection("users").doc(_userModel!.id).set(_userModel!.toJson());

        Navigator.of(context,rootNavigator: true).pop();
       Navigator.of(context).pop();

  }
  else{
       String imageUrl = await FirebaseStorageHelper.instance.uploadUserImage(file);
     _userModel =  userModel.copyWith(image: imageUrl);
             await FirebaseFirestore.instance.collection("users").doc(_userModel!.id).set(userModel!.toJson());
                    
                              Navigator.of(context,rootNavigator: true).pop();
                               

                     Navigator.of(context).pop();


  }
   showMessage("Successfully Updated your profile");
          notifyListeners();

}


}