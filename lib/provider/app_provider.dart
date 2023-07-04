import 'package:flutter/cupertino.dart';
import 'package:new_ecom_app/models/product_model/product_model.dart';


class AppProvider with ChangeNotifier{
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




}