import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_ecom_app/firebase_helper/firebase_firestore/firebase_firestore.dart';
import 'package:new_ecom_app/screens/btn_bar/btn_bar.dart';
import 'package:provider/provider.dart';

import '../../constants/routes.dart';
import '../../models/product_model/product_model.dart';
import '../../provider/app_provider.dart';

class CartItemCheckout extends StatefulWidget {
  //final ProductModel singleProduct;

   CartItemCheckout({super.key/*,required this.singleProduct*/});

  @override
  State<CartItemCheckout> createState() => _CartItemCheckoutState();
}

class _CartItemCheckoutState extends State<CartItemCheckout> {
  int groupValue=1;
  @override
  Widget build(BuildContext context) {
         AppProvider appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
    
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Center(
          child:  Text("CartItemCheckout",style:TextStyle(
             color: Colors.black,
            
          )),
        ),
      ),

      body: Padding(
      
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          const SizedBox(height: 40,),
          Container(
            height: 80,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0),
             // color: Colors.amberAccent,
              border: Border.all(width: 2,
                color: Colors.blue,
                            
      
              )
            // width:double.infinity,
            ),
           child:Row(
            children: [
             Radio(groupValue: groupValue, onChanged: (value) {
              setState(() {
                groupValue=value!;
              });
             }, value: 1,),
             SizedBox(height:50),
             Icon(Icons.money_outlined,size: 25,),
                          SizedBox(width:20),
                      const Text("Cash on Delivery",style: TextStyle(fontSize: 18),)
            ],
           ) ,
          ), SizedBox(height: 20,),
          Container(
            height: 80,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0),
             // color: Colors.amberAccent,
              border: Border.all(width: 2,
                color: Colors.blue,
                            
      
              )
            // width:double.infinity,
            ),
           child:Row(
            children: [
             Radio(groupValue: groupValue, onChanged: (value) {
              setState(() {
                groupValue=value!;
              });
             }, value: 2,),
             SizedBox(height:50),
             Icon(Icons.credit_card_outlined,size: 25,),
                          SizedBox(width:20),
                    Text("Pay online",style: TextStyle(fontSize: 18),)
            ],
           ) ,
          ),
          const SizedBox(height: 20,),
          Container(width:380,height: 50,child: ElevatedButton(onPressed: ()async{
             
                
             //   appProvider.addBuyProduct(widget.singleProduct);
             bool value = await FirebaseFirestoreHelper.instance.uploadOrderedProductFirebase(appProvider.getBuyProductList, context,groupValue==1?"cash on delivery":"Paid");
              appProvider.clearBuyProduct();
              if(value){
                  Future.delayed(const Duration(seconds: 2),(){
                    Routes.instance.push(widget: CustomBottomBar(), context: context);
                  }); 
              }




          }, child: const Text("Continue"),style:ButtonStyle(shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder( borderRadius: BorderRadius.circular(15),))))),
        ],),
      )
    );
  }
}