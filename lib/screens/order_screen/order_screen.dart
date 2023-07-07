//import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_ecom_app/firebase_helper/firebase_firestore/firebase_firestore.dart';

import '../../models/order_model/order_model.dart';
class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.only(left: 88.0),
          child: Text(
            "Your Orders",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: FirebaseFirestoreHelper.instance.getUserOrder(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data == null || snapshot.data!.isEmpty || !snapshot.hasData) {
            return const Center(
              child: Text("No Order found"),
            );
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    OrderModel orderModel = snapshot.data![index];
                    return Padding(
                      padding: const EdgeInsets.all( 10.0),
                      child: ExpansionTile(
                        
                        title: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Image.network(orderModel.products[0].image),
                                height: 100,
                                width: 100,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: SizedBox(
                                height: 100,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                orderModel.products[0].name,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 3,
                                                style: const TextStyle(
                                                  fontSize: 10.5,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Raleway',
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                             
                                             orderModel.products.length>1?
                                             SizedBox.fromSize():
                                              Text(
                                                "Quantity: ${orderModel.products[0].qty.toString()}",
                                                style: const TextStyle(
                                                  fontSize: 12.5,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ),
                                              Text(
                                                "price: ${orderModel.products[0].price.toString()}",
                                                style: const TextStyle(
                                                  fontSize: 11.5,
                                                  fontWeight: FontWeight.w400,
                                                  
                                                ),
                                              ),
                                              const SizedBox(height: 1),
                                              Text(
                                                  "Order Status: ${orderModel.status.toString()}",
                                                  style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400),
                                                  textAlign: TextAlign.start,
                                                ),
                                              const SizedBox(height: 10),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 80.0),
                                                child: Text(
                                                  "Total Price: \R${orderModel.totalPrice.toString()}",
                                                  style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                               
                                            
                                            ],
                                            
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                           
                        ),
                        children: orderModel.products.length>1?
                        
                        orderModel.products.map((singleProduct){
                          return             Column(
                            children: [
                              const Text("Details"),
                               const Divider(color: Colors.blue,thickness: 5.0,),        
                              Row(
                                
                              children: [
                                                                

                                Expanded(
                                  child: Container(
                                    
                                    child: Image.network(singleProduct.image),
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: SizedBox(
                                    height: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Stack(
                                        alignment: Alignment.bottomRight,
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    orderModel.products[0].name,
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 3,
                                                    style: const TextStyle(
                                                      fontSize: 10.5,
                                                      fontWeight: FontWeight.w600,
                                                      fontFamily: 'Raleway',
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                 
                                                // orderModel.products.length>1?
                                               //  SizedBox.fromSize():
                                                  Text(
                                                    "Quantity: ${singleProduct.qty.toString()}",
                                                    style: const TextStyle(
                                                      fontSize: 12.5,
                                                      fontWeight: FontWeight.w400,
                                                      fontFamily: 'Roboto',
                                                    ),
                                                  ),
                                                  Text(
                                                    "price: ${singleProduct.price}",
                                                    style: const TextStyle(
                                                      fontSize: 11.5,
                                                      fontWeight: FontWeight.w400,
                                                      
                                                    ),
                                                  ),
                                                
                                                 /* const SizedBox(height: 10),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 80.0),
                                                    child: Text(
                                                      "Total Price: \R${orderModel.totalPrice.toString()}",
                                                      style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400),
                                                      textAlign: TextAlign.start,
                                                    ),
                                                  ),*/
                                                   
                                                
                                                ],
                                                
                                              ),
                                            ],
                                          ),
                                         ],
                                      ),
                                    ),
                                  ),
                                ),
                               //  const Divider(color: Colors.amber,thickness: 20.0,),
                              ],
                               
                        ),
                            ],
                          );
                        }).toList():
                        [
                          //if not
                          Text("data")
                        ]
                         
                       
                      ),
                      
                    );
                  },
                ),
                  const SizedBox(height: 100),
              ],
               
            ),
             
          );
          
        },
      ),
    );
  }
}
