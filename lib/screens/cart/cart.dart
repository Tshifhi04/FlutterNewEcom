import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_ecom_app/screens/widgets/cart_item.dart';
//import 'package:new_ecom_app/widgets/title_heading.dart';
import 'package:provider/provider.dart';

//import '../../models/product_model/product_model.dart';
import '../../provider/app_provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  
//List<ProductModel> productList= [];

int qty= 1;


  @override
  Widget build(BuildContext context) {
        AppProvider appProvider = Provider.of<AppProvider>(context);


    return 
       Scaffold(
        appBar: AppBar(
           title: Padding(
             padding: const EdgeInsets.only(left:100.0),
             child: const Text("Cart", style: TextStyle(color: Colors.black),),
           ),), 
           body: appProvider.getCartProductList.isEmpty?Center(child: Text("You have nothing on your cart to take with you"),):ListView.builder(  itemCount:appProvider.getCartProductList.length,padding: EdgeInsets.all(2),itemBuilder: ((context, index) {
            //ProductModel singleProduct = productList[it];
             return CartItem(singleProduct: appProvider.getCartProductList[index],);
           })
      ),
      
    );
  }
}