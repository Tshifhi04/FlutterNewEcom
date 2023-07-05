import 'package:flutter/cupertino.dart';
import 'package:new_ecom_app/firebase_helper/firebase_firestore/firebase_firestore.dart';
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


}