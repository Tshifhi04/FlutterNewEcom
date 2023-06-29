import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_ecom_app/constants/constants.dart';
import 'package:new_ecom_app/models/product_model/product_model.dart';

import '../../models/category_model/category_model.dart';

class FirebaseFirestoreHelper{
  static FirebaseFirestoreHelper instance = FirebaseFirestoreHelper();
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<List<CategoryModel>> getCategories() async {
    try{
      QuerySnapshot<Map<String,dynamic>> querySnapshot = await _firebaseFirestore.collection("categories").get();
     List<CategoryModel> categoriesList = await querySnapshot.docs.map((e) => CategoryModel.fromJson(e.data())).toList();
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

}