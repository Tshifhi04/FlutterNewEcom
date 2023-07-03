import 'package:flutter/material.dart';
import 'package:new_ecom_app/widgets/title_heading.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Padding(
           padding: const EdgeInsets.only(left:100.0),
           child: const Text("Cart", style: TextStyle(color: Colors.black),),
         ),), 
         body: ListView.builder(  itemCount:5,itemBuilder: ((context, index) {
         
           return Container(
            child: Row(children: [
                  Image.asset(src)
                  ///when i continue i should worke here and go onwards!!!    3:48:41
            ]),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color:Colors.blueAccent),
              ),

           );
         }))
    );
  }
}