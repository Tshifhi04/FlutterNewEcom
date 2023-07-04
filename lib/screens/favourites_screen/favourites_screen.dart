import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_ecom_app/screens/favourites_screen/widgets/favourite_item.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
         AppProvider appProvider = Provider.of<AppProvider>(context);


    return Scaffold(
      appBar: AppBar(
         title: const Padding(
           padding: EdgeInsets.only(left:100.0),
           child: Text("Favourites", style: TextStyle(color: Colors.black),),
         ),), 
         body: appProvider.getFavouriteProductList.isEmpty?Center(child: Text("You have nothing on your cart to take with you"),):ListView.builder(  itemCount:appProvider.getFavouriteProductList.length,padding: EdgeInsets.all(2),itemBuilder: ((ctx, index) {
          //ProductModel singleProduct = productList[it];
           return FavouriteItem(singleProduct: appProvider.getFavouriteProductList[index],);
         }))
    );
  }
}